//
//  MainInformation.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 18/11/2023.
//

import Foundation
import SwiftUI

struct MainInformation: View {
    let firstName: String
    let lastName: String
    let email: String
    let login: String
    
    var body: some View {
        VStack(spacing: 3) {
            LargeTitle(isUppercase: false, color: .white, text: "\(firstName) \(lastName)")
                .lineLimit(1)
            MediumTitle(isUppercase: false, color: .white, text: login)
                .lineLimit(1)
            MediumTitle(isUppercase: false, color: .accentColor, text: email)
                .lineLimit(1)
        }
        .padding(.horizontal)
    }
}
