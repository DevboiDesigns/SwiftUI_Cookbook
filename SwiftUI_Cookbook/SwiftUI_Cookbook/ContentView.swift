//
//  ContentView.swift
//  SwiftUI_Cookbook
//
//  Created by Christopher Hicks on 4/18/22.
//

import SwiftUI

struct ContentView: View {
    
    @ScaledMetric var customSize: CGFloat = 100
    
    let number: Float = 30.897897
    let today: Date = Date() + 100
    
    var body: some View {
       
       Image("matrix")
            .resizable()
            .frame(width: customSize, height: customSize)

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
    }
}
