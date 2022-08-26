//
//  DividerRectangle.swift
//  Moonshot
//
//  Created by Wesley Patterson on 8/24/22.
//

import SwiftUI

struct DividerRectangle: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.top)
    }
}

struct DividerRectangle_Previews: PreviewProvider {
    static var previews: some View {
        DividerRectangle()
    }
}
