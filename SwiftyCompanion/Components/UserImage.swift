//
//  UserImage.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 18/11/2023.
//

import Foundation
import SwiftUI

struct UserImage: View {
    let userImage: String
    var body: some View {
        AsyncImage(url: URL(string: userImage)) { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
        }
        placeholder: {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
        }
        .frame(width: UIScreen.main.bounds.width / 1.5)
        .aspectRatio(1, contentMode: .fit)
    }
}
