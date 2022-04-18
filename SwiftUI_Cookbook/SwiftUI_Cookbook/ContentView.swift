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
            .environment(\.locale, .current)
        
    }
}


@propertyWrapper
struct ClampedValue {
    var storedValue: Int = 0
    var min: Int = 0
    var max: Int = 255
    
    var wrappedValue: Int {
        get {
            return storedValue
        }
        set {
            if newValue < min {
                storedValue = min
            } else if newValue > max {
                storedValue = newValue
            } else {
                storedValue = newValue
            }
        }
    }
    
    init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
    }
}

struct Price {
    @ClampedValue var firstPrice: Int
    @ClampedValue var secondPrice: Int
    
    func printMessage() {
        print("First price: \(firstPrice)")
        print("Second price: \(secondPrice)")
    }
}

var purchase = Price(firstPrice: -42, secondPrice: 350)
purchase.printMessage()
