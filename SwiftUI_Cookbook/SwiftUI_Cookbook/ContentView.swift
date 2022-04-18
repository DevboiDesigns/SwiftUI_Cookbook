//
//  ContentView.swift
//  SwiftUI_Cookbook
//
//  Created by Christopher Hicks on 4/18/22.
//

import SwiftUI

struct ContentView: View {
    
    let number: Float = 30.897897
    let today: Date = Date() + 100
    
    var body: some View {
       
       Text("Hello World")
            .background(alignment: Alignment, content: <#T##() -> View#>)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
    }
}
