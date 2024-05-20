//
//  ProposalView.swift
//  TestingGeometryReader
//
//  Created by Nathan Molby on 5/17/24.
//

import SwiftUI

struct ProposalView: View {
    var body: some View {
//        ScrollView {
            VStack(spacing: 0) {
                Text("I'm a text view!")
                    .debugLog("Text view")
                
                Color.blue
                    .frame(height: 20)
                    .debugLog("Blue")
                
                GeometryReader { _ in
                    Color.red
                        .overlay {
                            Text("I'm a geometry reader!")
                        }
                }
                .debugLog("Geometry reader")
                
                Image(systemName: "star")
                    .debugLog("Image")
            }
        
            .debugLog("VStack")
//        }
    }
}

#Preview {
    ProposalView()
}
