//
//  DetailsViewSelector.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 18/11/2023.
//

import Foundation
import SwiftUI

struct DetailsViewSelector: View {
    @Binding var currentView: ViewType
        
    var body: some View {
        HStack() {
            Button(action: {
                currentView = .projects
                
            }) {
                Text("Projects")
                    .padding(.vertical, 5)
                    .padding(.horizontal, 8)
            }
            .background(currentView == .projects ? Color.accentColor : .black.opacity(0))
            .foregroundColor(.white)
            .fontWeight(.bold)
            .cornerRadius(10)
            Spacer()


            Button(action: {
                currentView = .achievements
                
            }) {
                Text("Achievements")
                    .padding(.vertical, 5)
                    .padding(.horizontal, 8)
            }
            .background(currentView == .achievements ? Color.accentColor : .black.opacity(0))
            .foregroundColor(.white)
            .fontWeight(.bold)
            .cornerRadius(10)
            Spacer()


            Button(action: {
                currentView = .skills
                
            }) {
                Text("Skills")
                    .padding(.vertical, 5)
                    .padding(.horizontal, 8)
            }
            .background(currentView == .skills ? Color.accentColor : .black.opacity(0))
            .foregroundColor(.white)
            .fontWeight(.bold)
            .cornerRadius(10)
        }
        .padding()
    }
}
