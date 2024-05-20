//
//  AlignedLayout.swift
//  TestingGeometryReader
//
//  Created by Nathan Molby on 5/20/24.
//

import Foundation
import SwiftUI

struct AlignedHStack: Layout {
    let verticalSpacing: CGFloat
    let horizontalSpacing: CGFloat
    
    init(verticalSpacing: CGFloat = 4, horizontalSpacing: CGFloat = 8) {
        self.verticalSpacing = verticalSpacing
        self.horizontalSpacing = horizontalSpacing
    }
    
    struct LayoutInformation {
        let width: CGFloat
        let rowOneHeight: CGFloat
        let rowTwoHeight: CGFloat
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let layoutInformation = calculateLayoutInformation(subviews: subviews)
        
        let finalHorizontalSpacing = (CGFloat(subviews.count) / 2 - 1) * horizontalSpacing
        
        return .init(width: layoutInformation.width + finalHorizontalSpacing, height: layoutInformation.rowOneHeight + layoutInformation.rowTwoHeight + verticalSpacing)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let layoutInformation = calculateLayoutInformation(subviews: subviews)

        var currentX: CGFloat = bounds.minX
        var lastWidth: CGFloat!
        for (index, view) in subviews.enumerated() {
            if index % 2 == 0 {
                view.place(at: .init(x: currentX, y: bounds.minY), proposal: .unspecified)
                lastWidth = view.sizeThatFits(.unspecified).width
            } else {
                view.place(at: .init(x: currentX, y: bounds.minY + layoutInformation.rowOneHeight + verticalSpacing), proposal: .init(width: lastWidth, height: layoutInformation.rowTwoHeight))
                currentX += lastWidth + horizontalSpacing
            }
        }
    }
    
    private func calculateLayoutInformation(subviews: Subviews) -> LayoutInformation {
        var horizontalSpaceNeeded: CGFloat = 0
        var maxHeightInRowOne: CGFloat = 0
        var maxHeightInRowTwo: CGFloat = 0

        for (index, view) in subviews.enumerated() {
            if index % 2 == 0 {
                horizontalSpaceNeeded += view.sizeThatFits(.unspecified).width
                maxHeightInRowOne = max(maxHeightInRowOne, view.sizeThatFits(.unspecified).height)
            } else {
                maxHeightInRowTwo = max(maxHeightInRowTwo, view.sizeThatFits(.unspecified).height)
            }
        }
        
        return .init(width: horizontalSpaceNeeded, rowOneHeight: maxHeightInRowOne, rowTwoHeight: maxHeightInRowTwo)
    }
    
    
}
