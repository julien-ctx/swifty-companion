//
//  LabeledInfo.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 18/11/2023.
//

import Foundation
import SwiftUI

struct LabeledInfo:  View {
    let label: String
    let text: String
        
    var body: some View {
        VStack(spacing: 3) {
            SmallTitle(isUppercase: false, color: .accentColor, text: label)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 15)
                .padding(.top, 10)
            SmallTitle(isUppercase: false, color: .white, text: text)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 15)
            .padding(.bottom, 10)
        }
    }
}
