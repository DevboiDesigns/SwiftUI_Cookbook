//
//  ContentView.swift
//  SwiftUI_Cookbook
//
//  Created by Christopher Hicks on 4/18/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName: "cloud")
                VStack(alignment: .leading) {
                    Text("City")
                        .foregroundColor(Color.gray)
                    Text("New York")
                        .font(.title)
                }
                Spacer()
            }
        }
        .safeAreaInset(edge: VerticalEdge, content: <#T##() -> View#>)
        .safeAreaInset(edge: .bottom) {
            HStack {
                Spacer()
                Text("Important")
                    .padding()
                Spacer()
            }.background(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
