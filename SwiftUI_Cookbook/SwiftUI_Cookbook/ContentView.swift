//
//  ContentView.swift
//  SwiftUI_Cookbook
//
//  Created by Christopher Hicks on 4/18/22.
//

import SwiftUI


struct HeaderView: View {
    
    @Binding var title: String
    let counter: Int
    
    init(title: Binding<String>) {
        _title = title
        
        let sentence = title.wrappedValue
        counter = sentence.count
    }
    
    var body: some View {
        Text("\(title) (\(counter))")
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
        let constantValue = Binding<String>(
            get: { return "My preview title"},
            set: { value in
                print(value)
            }
        )
        return HeaderView(title: constantValue)
    }
}

