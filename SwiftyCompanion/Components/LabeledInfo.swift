//
//  LabeledInfo.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 18/11/2023.
//

import Foundation
import SwiftUI

struct LabeledInfo:  View {
    let label: String?
    let text: String?
        
    var body: some View {
        VStack(spacing: 3) {
            Text(label ?? "Unknown")
                .frame(maxWidth: .infinity)
                .font(.system(size: 16, weight: .bold, design: .default))
                .foregroundColor(.accentColor)
                .padding(.horizontal, 15)
                .padding(.top, 10)
            Text(text ?? "Unknown")
            .frame(maxWidth: .infinity)
            .font(.system(size: 16, weight: .semibold, design: .default))
            .foregroundColor(.white)
            .padding(.horizontal, 15)
            .padding(.bottom, 10)
        }
    }
}
