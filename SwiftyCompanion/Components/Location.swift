//
//  Location.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 18/11/2023.
//

import Foundation
import SwiftUI

struct Location: View {
    let location: String?
    
    var body: some View {
        VStack(spacing: 0) {
            Text("\(location != nil ? "Available" : "Unavailable")")
                .frame(maxWidth: .infinity)
                .font(.system(size: 26, weight: .bold, design: .default))
                .foregroundColor(.white)
                .padding(.horizontal, 15)
                .padding(.top, 20)
            Text("\(location ?? "-")")
                .frame(maxWidth: .infinity)
                .font(.system(size: 22, weight: .bold, design: .default))
                .foregroundColor(.white)
                .padding(.horizontal, 15)
                .padding(.bottom, 20)
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.6)))
        .padding(.horizontal)
        .padding(.bottom, 7)
    }
}
