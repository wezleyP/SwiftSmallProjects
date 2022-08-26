//
//  GridLayout.swift
//  Moonshot
//
//  Created by Wesley Patterson on 8/24/22.
//

import SwiftUI

struct GridLayout: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    
    var body: some View {
     Text("hello")
    }
}


struct GridLayout_Previews: PreviewProvider {
    static var previews: some View {
        GridLayout()
    }
}
