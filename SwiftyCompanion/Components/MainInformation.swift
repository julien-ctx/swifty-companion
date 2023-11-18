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
        Text("\(firstName) \(lastName)")
            .font(.system(size: 24, weight: .bold, design: .default))
            .foregroundColor(.white)
        Text(login)
            .font(.system(size: 18, weight: .semibold, design: .default))
            .foregroundColor(.white)
    }
}
