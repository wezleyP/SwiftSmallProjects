//
//  ContentView.swift
//  UnitConversion
//
//  Created by Wesley Patterson on 5/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var meters = 0
    @State private var feet = 0
    @State private var conversion = 3.281
    
    var conversionOutput : Double {
        let a = Double(meters)
        let b = Double(conversion)
        
        let answer = a * b
        return answer
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("enter length in meters", value: $meters, format: .number)
                } header: {
                    Text("meters")
                }
                
                Section {
                    Text(conversionOutput, format: .number)
                } header: {
                    Text("Answer")
                }
                
        }
            .navigationTitle("Meters to Feet")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
