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
    let user: User
    
    var body: some View {
        HStack() {
            DetailsViewSelectorButton(currentView: $currentView, buttonViewType: .projects, text: "Projects")
            Spacer()
            DetailsViewSelectorButton(currentView: $currentView, buttonViewType: .achievements, text: "Achievements")
            Spacer()
            DetailsViewSelectorButton(currentView: $currentView, buttonViewType: .skills, text: "Skills")
        }
        .padding()
    }
}
