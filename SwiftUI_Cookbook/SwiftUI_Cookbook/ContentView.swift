//
//  ContentView.swift
//  SwiftUI_Cookbook
//
//  Created by Christopher Hicks on 4/18/22.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
       getView()
    }
    
    @ViewBuilder
    func getView() -> some View {
        let valid = false
        
        if valid {
            EmptyView()
        } else {
           Text("The state is not valid")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
