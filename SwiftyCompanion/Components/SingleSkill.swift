//
//  SingleSkill.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 20/11/2023.
//

import Foundation
import SwiftUI

struct SingleSkill: View {
    let skill: Skill
    
    var body: some View {
        HStack {
            SmallTitle(isUppercase: false, color: .white, text: skill.name)
                .lineLimit(1)
                .truncationMode(.tail)
                .padding(.trailing)
            Spacer()
            SmallTitle(isUppercase: false, color: .accentColor, text: "\(String(format: "%.2f", skill.level))")
        }
    }
}
