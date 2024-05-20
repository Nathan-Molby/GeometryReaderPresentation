//
//  StarView.swift
//  TestingGeometryReader
//
//  Created by Nathan Molby on 5/17/24.
//

import SwiftUI

struct RatingView: View {
    @State var selection: Float = 0
    
    var body: some View {
        
        VStack {
            GeometryReader { proxy in
                Rectangle()
                    .foregroundStyle(Color.green)
                
                Image(systemName: "star")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(height: 60)
                    .offset(x: proxy.size.width * CGFloat(selection))
            }
                        
            Slider(
                value: $selection,
                in: 0...1
            )
        }

        
    }
}

#Preview {
//    ScrollView {
        VStack {
            Text("Rate it!")
            
            RatingView()
//                .frame(height: 60)
        }
//    }

}
