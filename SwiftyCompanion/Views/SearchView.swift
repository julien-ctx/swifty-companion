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
                        Button {
                            self.isSubmitted.toggle()
                        } label: {
                            HStack {
                                Text("Search")
                                    .textCase(.uppercase)
                                    .font(.system(size: 22, weight: .semibold, design: .default))
                                    .frame(maxWidth: .infinity)
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 22, weight: .semibold))
                            }
                            .padding()
                            .foregroundStyle(.white)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                        }
                        .navigationDestination(
                            isPresented: $isSubmitted) {
                                UserDetailsView()
                            }
                        
                    }
                }
                .padding(.horizontal)
                
            }
        }
    }
}
