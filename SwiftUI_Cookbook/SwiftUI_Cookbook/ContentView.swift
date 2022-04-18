//
//  ContentView.swift
//  SwiftUI_Cookbook
//
//  Created by Christopher Hicks on 4/18/22.
//

import SwiftUI


struct HeaderView: View {
    
    @Binding var title: String
    
    var body: some View {
        Text(title)
            .padding(10)
    }
}

struct ContentView: View {
    
    @State private var title: String = "Default Title"
    @State private var titleInput: String = ""
    
    init() {
        _titleInput = State(initialValue: "Hello World")
    }
    
    var body: some View {
        VStack {
            HeaderView(title: _title.projectedValue)
            TextField("Insert Title", text: _titleInput.projectedValue)
                .textFieldStyle(.roundedBorder)
            
            Button  {
                _title.wrappedValue = _titleInput.wrappedValue
                _titleInput.wrappedValue = ""
            } label: { Text("Change title") }
            Spacer()
        }.padding()
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

