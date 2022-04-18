//
//  SwiftUI_CookbookApp.swift
//  SwiftUI_Cookbook
//
//  Created by Christopher Hicks on 4/18/22.
//

import SwiftUI

@main
struct SwiftUI_CookbookApp: App {
    
    @StateObject private var appData = ApplicationData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appData)
        }
    }
}
