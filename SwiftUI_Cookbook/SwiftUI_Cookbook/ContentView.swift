//
//  ContentView.swift
//  SwiftUI_Cookbook
//
//  Created by Christopher Hicks on 4/18/22.
//

import SwiftUI


struct ContentView: View {
    
    @State private var title: String = "Default Title"
    @State private var titleInput: String = ""
    
    var body: some View {
        VStack {
            HeaderView(title: $title)
            TextField("Insert Title", text: $titleInput)
                .textFieldStyle(.roundedBorder)
            
            Button  {
                title = titleInput
                titleInput = ""
            } label: { Text("Change title") }
            Spacer()
        }.padding()
    }
}


struct HeaderView: View {
    
    @Binding var title: String
    
    var body: some View {
        Text(title)
            .padding(10)
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

