//
//  SFCymbolAppWithSwiftUIApp.swift
//  SFCymbolAppWithSwiftUI
//
//  Created by 滝野翔平 on 2023/04/02.
//

import SwiftUI
import SFUserFriendlySymbols

@main
struct SFCymbolAppWithSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            SymbolsCatalogView()
        }
    }
}
