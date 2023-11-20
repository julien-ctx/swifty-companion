//
//  SecondaryInformation.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 18/11/2023.
//

import Foundation
import SwiftUI

struct SecondaryInformation: View {
    
    let user: User
    
    var body: some View {
        VStack {
            HStack {
                LabeledInfo(label: "Wallet", text: "\(user.wallet) ₳")
                LabeledInfo(label: "Evaluation points", text: "\(user.correctionPoints)")
            }
            HStack {
                LabeledInfo(label: "Campus", text: "\(user.campus[0].name)")
                LabeledInfo(label: "Status", text: "\(user.staff == true ? "Staff" : "Student")")
            }
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.6)))
        .padding(.horizontal)
        .padding(.bottom, 7)
    }
}
