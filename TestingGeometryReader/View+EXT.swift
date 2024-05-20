//
//  View+EXT.swift
//  TestingGeometryReader
//
//  Created by Nathan Molby on 5/17/24.
//

import Foundation
import SwiftUI

extension View {
    @inlinable public func onAppear(perform action: (() -> Void)? = nil) -> some View {
        return self
            .onAppear(perform: action)
    }
}
