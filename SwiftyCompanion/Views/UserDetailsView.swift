//
//  UserDetailsView.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 10/11/2023.
//

import Foundation
import SwiftUI

struct UserDetailsView: View {
    @State var isLoading: Bool = true
    let login: String
    
    var body: some View {
        if (isLoading) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
        } else {
            Text(login)
        }
    }
}
