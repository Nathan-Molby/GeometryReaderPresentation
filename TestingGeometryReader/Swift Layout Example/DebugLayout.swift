//
//  DebugLayout.swift
//  TestingGeometryReader
//
//  Created by Nathan Molby on 5/17/24.
//

import Foundation
import SwiftUI

struct DebugLayout: Layout {
    let name: String
    func sizeThatFits(proposal: ProposedViewSize,
                      subviews: Subviews,
                      cache: inout ()) -> CGSize {
        let result = subviews[0].sizeThatFits(proposal)
        print(name, proposal, result, separator: "\n")
        return result
    }
    
    func placeSubviews(in bounds: CGRect,
                       proposal: ProposedViewSize,
                       subviews: Subviews,
                       cache: inout ()) {
        subviews[0].place(at: bounds.origin, proposal: proposal)
    }
}
extension View {
    func debugLog(_ name: String) -> some View {
        DebugLayout(name: name) { self }
    }
}
