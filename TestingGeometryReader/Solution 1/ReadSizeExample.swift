//
//  BreakReadSize.swift
//  TestingGeometryReader
//
//  Created by Nathan Molby on 5/20/24.
//

import SwiftUI

struct ReadSizeExample: View {
    @State var view1Size: CGSize = .zero
    @State var view2Size: CGSize = .zero
    @State var view3Size: CGSize = .zero

    var body: some View {
        VStack(spacing: 2) {
            HStack {
                Text("Here is my first text!")
                    .readSize { size in
                        view1Size = size
                    }
                Text("Text 2")
                    .readSize { size in
                        view2Size = size
                    }
                Text("Another text!")
                    .readSize { size in
                        view3Size = size
                    }
            }
            HStack {
                Rectangle()
                    .frame(width: view1Size.width, height: 2)
                    .foregroundStyle(Color.red)

                Rectangle()
                    .frame(width: view2Size.width, height: 2)
                    .foregroundStyle(Color.blue)

                Rectangle()
                    .frame(width: view3Size.width, height: 2)
                    .foregroundStyle(Color.yellow)
            }
        }
    }
}

#Preview {
    ReadSizeExample()
}
