//
//  Title.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 21/11/2023.
//

import Foundation
import SwiftUI

struct LargeTitle: View {
    let isUppercase: Bool
    let color: Color
    let text: String
    
    var body: some View {
        Text(isUppercase == true ? text.uppercased() : text)
            .font(.system(size: 26, weight: .bold, design: .default))
            .foregroundColor(color)
    }
}
