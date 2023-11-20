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
            Text(skill.name)
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(.white)
                .lineLimit(1)
                .truncationMode(.tail)
                .padding(.trailing)
            Spacer()
            Text("\(String(format: "%.2f", skill.level))")
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(.accentColor)
        }
    }
}
