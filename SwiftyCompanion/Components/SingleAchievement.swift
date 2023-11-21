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
            SmallTitle(isUppercase: false, color: .white, text: text)
                .lineLimit(1)
                .truncationMode(.tail)
                .padding(.trailing)
            Spacer()
            Image(systemName: "medal")
                .foregroundColor(.yellow)
        }
    }
}
