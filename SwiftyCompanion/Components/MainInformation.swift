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
    let login: String
    
    var body: some View {
        LargeTitle(isUppercase: false, color: .white, text: "\(firstName) \(lastName)")
        MediumTitle(isUppercase: false, color: .white, text: login)
    }
}
