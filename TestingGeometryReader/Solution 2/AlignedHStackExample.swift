//
//  AlignedHStackExample.swift
//  TestingGeometryReader
//
//  Created by Nathan Molby on 5/20/24.
//

import SwiftUI

struct AlignedHStackExample: View {
    var body: some View {
        AlignedHStack {
            Text("Here is my first text!")
            Rectangle()
                .frame(height: 2)
                .foregroundStyle(Color.red)

            Text("Text 2")
            Rectangle()
                .frame(height: 2)
                .foregroundStyle(Color.blue)

            Text("Another text!")
            Rectangle()
                .frame(height: 2)
                .foregroundStyle(Color.yellow)
        }
    }
}

#Preview {
    AlignedHStackExample()
}
