//
//  TextInput.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 10/11/2023.
//

import SwiftUI

struct TextInput: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        TextField("", text: $text, prompt: Text("Placeholder").foregroundColor(Color.gray))
            .font(.system(size: 22, weight: .semibold, design: .default))
            .padding()
            .foregroundColor(.black)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            .disableAutocorrection(true)
            .autocapitalization(.none)
    }
}
