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
            LargeTitle(isUppercase: false, color: .white, text: "\(location != nil ? "Available" : "Unavailable")")
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 15)
                .padding(.top, 20)
            MediumTitle(isUppercase: false, color: .white, text: "\(location ?? "-")")
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 15)
                .padding(.bottom, 20)
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.6)))
        .padding(.horizontal)
        .padding(.bottom, 7)
    }
}
