//
//  ContentView.swift
//  SwiftUI_Cookbook
//
//  Created by Christopher Hicks on 4/18/22.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        let valid = true
        
        return Group {
            if valid {
                Image(systemName: "keyboard")
            } else {
                Text("The state is not valid")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
