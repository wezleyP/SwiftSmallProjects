//
//  ContentView.swift
//  iExpense
//
//  Created by Wesley Patterson on 8/11/22.
//

import SwiftUI

struct ContentView: View {

    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var currentCurrencyCode = "USD"
    @State private var currencyCode = ["USD", "JPY", "CNY", "CAD", "UAH", "KRW", "ZAR", "CHF"]
    
    
    var body: some View {
        
        NavigationView {
           
            List {
                VStack {
                    Picker("Change Preffered Currency", selection: $currentCurrencyCode)  {
                        ForEach(currencyCode, id: \.self) {
                            Text($0)
                        }
                    }
                }
                ForEach(expenses.items) { item in
                    HStack {
                        if item.type == "Personal" {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                        .foregroundColor(.indigo)
                            }
                        } else {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                        .foregroundColor(.pink)
                                }
                        }
                        
                        
                        Spacer()
                        
                        if item.amount < 10 {
                            Text(item.amount, format: .currency(code: currentCurrencyCode))
                                .foregroundColor(.yellow)
                        } else if item.amount > 10 && item.amount < 100 {
                            Text(item.amount, format: .currency(code: currentCurrencyCode))
                                .foregroundColor(.orange)
                        } else {
                            Text(item.amount, format: .currency(code: currentCurrencyCode))
                                .foregroundColor(.red)
                        }
                        
                            
                    }
                }.onDelete(perform: removeItems)
            }
            .navigationTitle("IExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 /*
  1
  NavigationView {
      VStack {
          List {
              ForEach(numbers, id: \.self) {
                  Text("Row \($0)")
              }
              .onDelete(perform: removeRows)
          }
          Button("add") {
              numbers.append(currentNumber)
              currentNumber += 1
          }
          
      }
      .navigationTitle("row")
  }
  
}

func removeRows(at offsets: IndexSet) {
  numbers.remove(atOffsets: offsets)
}
  
  
2
  @AppStorage("currentNumber") private var currentNumber = 0
  
3
  struct User : Codable {
      let firstName : String
      let lastName : String
  }
  
  
  
  @State private var user = User(firstName: "Taylor", lastName: "Swift")
   
   var body: some View {
       Button("hi") {
           let encoder = JSONEncoder()
           if let data = try? encoder.encode(user) {
               UserDefaults.standard.set(data, forKey: "UserData")
           }
       }
   }
  */
