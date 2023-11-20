//
//  SingleProject.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 19/11/2023.
//

import Foundation
import SwiftUI

struct SingleProject: View {
    let project: ProjectsUser
    
    var body: some View {
        HStack() {
            Text("\(project.project.name)")
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(project.validated == true ? .green : .red)
                .lineLimit(1)
                .truncationMode(.tail)
                .padding(.trailing)
            Spacer()
            Image(systemName: project.validated == true ? "checkmark" : "xmark")
                .foregroundColor(project.validated == true ? .green : .red)
            if let finalMark = project.finalMark {
                Text("\(finalMark)")
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(project.validated == true ? .green : .red)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
        }
    }
}
