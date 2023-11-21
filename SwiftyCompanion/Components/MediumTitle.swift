//
//  MediumTitle.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 21/11/2023.
//

import Foundation
import SwiftUI

struct MediumTitle: View {
    let isUppercase: Bool
    let color: Color
    let text: String
    
    var body: some View {
        Text(isUppercase == true ? text.uppercased() : text)
            .font(.system(size: 22, weight: .semibold, design: .default))
            .foregroundColor(color)
    }
}
