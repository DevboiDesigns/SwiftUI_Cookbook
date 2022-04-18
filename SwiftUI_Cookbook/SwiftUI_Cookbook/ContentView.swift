//
//  ContentView.swift
//  SwiftUI_Cookbook
//
//  Created by Christopher Hicks on 4/18/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appData: ApplicationData
    
    var body: some View {
        Text(appData.title)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ApplicationData())
    }
}

