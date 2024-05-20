//
//  SizeOverlay.swift
//  TestingGeometryReader
//
//  Created by Nathan Molby on 5/17/24.
//

import SwiftUI

struct SizeOverlay: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { proxy in
                    Text(
                        "\(Int(proxy.size.width)) x \(Int(proxy.size.height))"
                    )
                    .padding(4)
                    .background { Color.purple }
                }
            }
    }
}

extension View {
    func addSizeOverlay() -> some View {
        modifier(SizeOverlay())
    }
}
#Preview {
    Text("Check out the size of this!")
        .addSizeOverlay()
}
