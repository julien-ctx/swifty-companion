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
    var level: CGFloat
    
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
                Text("Level \(String(format: "%.2f", level))")
                    .foregroundColor(.white)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .fontWeight(.bold)
            }
            .cornerRadius(10)
        }
        .frame(height: 26)
        .padding(.horizontal)
        .padding(.bottom, 7)
    }
}
