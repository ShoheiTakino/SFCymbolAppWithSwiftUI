//
//  ContentView.swift
//  SFCymbolAppWithSwiftUI
//
//  Created by 滝野翔平 on 2023/04/02.
//

import SwiftUI
import SFUserFriendlySymbols

struct CatalogItem: View {
    
    private let symbol: SFSymbols
    private let color: Color
    private let backgroundColor: Color
    private let baseLength: CGFloat
    private let imageWidth: CGFloat
    
    init(symbol: SFSymbols, color: Color, backgroundColor: Color) {
        self.symbol = symbol
        self.color = color
        self.backgroundColor = backgroundColor
        baseLength = UIScreen.main.bounds.width * 0.25
        imageWidth = baseLength * 0.5
    }
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(backgroundColor)
                
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray, lineWidth: 0.5)
                
                Image(symbol: symbol)
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageWidth)
                    .foregroundColor(color)
            }
            .frame(width: baseLength, height: baseLength)
            
            HStack {
                Spacer()
                
                Text(symbol.rawValue)
                    .frame(height: 35, alignment: .top)
                    .multilineTextAlignment(.center)
                    .font(.caption)
                    .textSelection(.enabled)
                Spacer()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogItem(symbol: SFSymbols.bold, color: .black, backgroundColor: .white)
    }
}
