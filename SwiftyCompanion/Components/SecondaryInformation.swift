//
//  SecondaryInformation.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 18/11/2023.
//

import Foundation
import SwiftUI

struct SecondaryInformation: View {
    let wallet: Int
    let correctionPoints: Int
    let campusName: String
    let status: String
    
    var body: some View {
        VStack {
            HStack {
                LabeledInfo(label: "Wallet", text: "\(wallet) ₳")
                LabeledInfo(label: "Evaluation points", text: "\(correctionPoints)")
            }
            HStack {
                LabeledInfo(label: "Campus", text: "\(campusName)")
                LabeledInfo(label: "Status", text: "\(status)")
            }
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.6)))
        .padding(.horizontal)
        .padding(.bottom, 7)
    }
}
