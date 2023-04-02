//
//  SymbolsCatalogView.swift
//  SFCymbolAppWithSwiftUI
//
//  Created by 滝野翔平 on 2023/04/02.
//

import SwiftUI
import SFUserFriendlySymbols
import Combine

struct SymbolsCatalogView: View {

    @State private var selectedColor = Color.black
    @State private var backgroundColor = Color.white
    @State private var SFCymbolName = ""
    @FocusState private var isActive: Bool
//    @ObservedObject private var viewModel = ViewModel()

    var body: some View {

        let columns: [GridItem] = Array(repeating: .init(.flexible()),
                                        count: 3)
        TextField("Symbol名", text: $SFCymbolName)
            .onReceive(Just(SFCymbolName)){ _ in
                CatalogItem(symbol: SFSymbols(rawValue: SFCymbolName) ?? SFSymbols.function,
                            color: selectedColor,
                            backgroundColor: backgroundColor)
                print(SFCymbolName)
            }
            .focused($isActive)
            .padding()
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(SFSymbols.allCases, id: \.self) {

                    CatalogItem(symbol: $0,
                                color: selectedColor,
                                backgroundColor: backgroundColor)
                }
            }
            .padding(.top)
            .padding(.horizontal)
        }
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                ColorPicker("背景", selection: $backgroundColor)
            }

            ToolbarItem(placement: .bottomBar) {
                ColorPicker("カラー", selection: $selectedColor)
            }
        }
    }
    /// 検索でシンボル調べられたらいいな
//    static func setupSymbol() -> CatalogItem {
//
//    }
//
//    static func setupSymbolBySearch(name: String) -> CatalogItem {
//        return CatalogItem(symbol: SFSymbols(rawValue), color: .black, backgroundColor: .white)
//    }
}

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
