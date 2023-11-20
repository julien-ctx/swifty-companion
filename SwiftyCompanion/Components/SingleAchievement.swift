//
//  SingleAchievement.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 19/11/2023.
//

import Foundation
import SwiftUI

struct SingleAchievement: View {
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(.white)
                .lineLimit(1)
                .truncationMode(.tail)
            Spacer()
            Image(systemName: "medal")
                .foregroundColor(.yellow)
        }
    }
}
