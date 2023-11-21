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
            SmallTitle(isUppercase: false, color: project.validated == true ? .green : .red, text: "\(project.project.name)")
                .lineLimit(1)
                .truncationMode(.tail)
                .padding(.trailing)
            Spacer()
            Image(systemName: project.validated == true ? "checkmark" : "xmark")
                .foregroundColor(project.validated == true ? .green : .red)
            if let finalMark = project.finalMark {
                SmallTitle(isUppercase: false, color: project.validated == true ? .green : .red, text: "\(finalMark)")
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
        }
    }
}
