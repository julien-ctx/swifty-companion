//
//  ContentView.swift
//  SwiftyCompanion
//
//  Created by Julien Caucheteux on 09/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("42background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity)
            VStack {
                Image("42logo")
                    .resizable()
                    .frame(width: 90.0, height: 63.0)
                    .padding()
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
