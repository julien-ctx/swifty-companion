//
//  Button.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 10/11/2023.
//

import SwiftUI

struct LargeButton: View {
    let title: String
    let iconName: String
    let action: () -> Void
    
    var body: some View {
        HStack {
            Button {
                action()
            } label: {
                HStack {
                    LargeTitle(isUppercase: true, color: .white, text: "Search")
                        .frame(maxWidth: .infinity)

                    Image(systemName: iconName)
                        .font(.system(size: 26, weight: .semibold))
                }
                .padding()
                .foregroundStyle(.white)
                .background(Color.accentColor)
                .cornerRadius(10)
            }
        }
    }
}
