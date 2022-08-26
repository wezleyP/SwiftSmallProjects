//
//  ContentView.swift
//  Moonshot
//
//  Created by Wesley Patterson on 8/16/22.
//

import SwiftUI


struct ContentView: View {
    @State private var showingGrid = true
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    
    var body: some View {
        Group {
            if showingGrid {
                NavigationView {
                    ScrollView {
                        Toggle(isOn: $showingGrid){
                           Text("Grid or List")
                              .foregroundColor(Color.white)
                              .padding()
                        }
                        .padding()
                        LazyVGrid(columns: columns) {
                        ForEach(missions){ mission in
                            NavigationLink {
                                MissionView(mission: mission, astronauts: astronauts)
                            } label: {
                                VStack {
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()
                                    
                                    VStack {
                                        Text(mission.displayName)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        
                                        Text(mission.formattedLaunchDate)
                                            .font(.caption)
                                            .foregroundColor(.white.opacity(0.7))
                                    }
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .background(.lightBackground)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground))
                            }
                           
                        }
                    }
                        .padding([.horizontal, .bottom])
                    }
                    .navigationTitle("Moonshot")
                    .background(.darkBackground)
                    .preferredColorScheme(.dark)
               }
            } else {
                NavigationView {
                    
                        List {
                            Toggle(isOn: $showingGrid){
                               Text("Grid or List")
                                  .foregroundColor(Color.white)
                            }
                        ForEach(missions){ mission in
                            NavigationLink {
                                MissionView(mission: mission, astronauts: astronauts)
                            } label: {
                                VStack {
                                    Text(mission.displayName)
                            }
                           
                        }
                     }
                     
                    }
                    .navigationTitle("Moonshot")
                    .background(.darkBackground)
                    .preferredColorScheme(.dark)
            
                }
            }
        }
    }
}

        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
 1
 GeometryReader { geo in
     Image("Example")
         .resizable()
         .scaledToFit()
         .frame(width: geo.size.width * 0.8)
         .frame(width: geo.size.width, height: geo.size.width)
 }
 
 2
 struct CustomText: View {
     let text: String
     
     var body: some View {
         Text(text)
     }
     init(_ text: String) {
         print("Creating")
         self.text = text
     }
     
 }
 
 ScrollView {
     LazyVStack(spacing: 10) {
         ForEach(0..<100) {
             CustomText("item \($0)")
                 .font(.title)
         }
     }
     .frame(maxWidth: .infinity)
 }
 
 3
 NavigationView {
     List(1..<100) { row in
         NavigationLink {
             Text("Detail \(row)")
                 
         } label: {
             Text("Row \(row)")
                 .font(.headline)
         }
     .navigationTitle("Swift")
     }
 }
 
 4
 
 struct User: Codable {
     let name: String
     let address: Address
 }

 struct Address: Codable {
     let street: String
     let city: String
 }
 
 
 
 5
 Button("huh") {
     let input = """
     {
         "name": "Taylor Swift"
         "address": {
             "street": "555, Taylor Swift Ave"
             "city": "Nashville"
     }
"""
     let data = Data(input.utf8)
     
     if let user = try? JSONDecoder().decode(User.self, from: data) {
         print(user.address.street)
     }
     
 }
 
 6
 let layout = [
     GridItem(.adaptive(minimum: 80)),
 ]
 
 ScrollView {
     LazyVGrid(columns: layout) {
         ForEach(0..<100) {
             Text("Item \($0)")
         }
     }
 }
 */
