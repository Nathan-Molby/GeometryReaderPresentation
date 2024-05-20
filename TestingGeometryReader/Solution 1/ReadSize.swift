//
//  ReadSize.swift
//  TestingGeometryReader
//
//  Created by Nathan Molby on 5/20/24.
//

import Foundation
import SwiftUI

struct FrameSizeModifier: ViewModifier {
    let size: (CGSize) -> Void

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .preference(key: CGSizePreferenceKey.self, value: geometry.size)
                }
            )
            .onPreferenceChange(CGSizePreferenceKey.self, perform: size)
    }
}

extension View {
    @ViewBuilder
    func readSize(size: @escaping (CGSize) -> Void) -> some View {
        modifier(
            FrameSizeModifier(size: size)
        )
    }
}

private struct CGSizePreferenceKey: PreferenceKey {
    static var defaultValue = CGSize.zero

    // swiftformat:disable:next unusedArguments
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

#Preview {
    VStack {
        Text("Hello!")
            .readSize { size in
                print(size)
            }
    }
}
