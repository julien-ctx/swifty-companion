//
//  DetailsViewSelectorButton.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 19/11/2023.
//

import Foundation
import SwiftUI

struct DetailsViewSelectorButton: View {
    @Binding var currentView: ViewType
    let buttonViewType: ViewType
    let text: String
    
    var body: some View {
        Button(action: {
            currentView = buttonViewType
        }) {
            SmallTitle(isUppercase: false, color: .white, text: text)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
        }
        .background(currentView == buttonViewType ? Color.accentColor : .black.opacity(0))
        .foregroundColor(.white)
        .fontWeight(.bold)
        .cornerRadius(10)
    }
}
