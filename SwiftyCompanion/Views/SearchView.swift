//
//  SearchView.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 10/11/2023.
//

import Foundation
import SwiftUI

struct SearchView: View {
    @State private var isSubmitted: Bool = false
    @State private var login: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("42background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(minWidth: 0, maxWidth: .infinity)
                VStack(spacing: 20) {
                    VStack {
                        Image("42logo")
                            .resizable()
                            .frame(width: 100, height: 70)
                            .padding([.bottom], 50)
                        TextInput(text: $login, placeholder: "Login")
                        LargeButton(title: "Search", iconName: "magnifyingglass", action: {
                            print(login)
                            isSubmitted.toggle()
                            
                        })
                        .navigationDestination(
                            isPresented: $isSubmitted
                        ) {
                            UserDetailsView()
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
