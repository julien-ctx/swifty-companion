//
//  LevelBar.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 18/11/2023.
//

import Foundation
import SwiftUI

struct LevelBar: View {
    var percentage: CGFloat
    var level: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.6)
                    .foregroundColor(.black)
                
                Rectangle()
                    .frame(width: min(percentage * geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(.accentColor)
                    .animation(.linear, value: percentage)
                Text("Level \(level)")
                    .foregroundColor(.white)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .fontWeight(.bold)
            }
            .cornerRadius(10)
        }
        .frame(height: 26)
        .padding(.horizontal)
        .padding(.bottom, 7)
    }
}
