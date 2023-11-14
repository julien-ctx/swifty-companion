import Foundation
import SwiftUI

struct UserDetailsView: View {
    @State var isLoading: Bool = true
    @State var user: User?
    let login: String
    
    var body: some View {
        Group {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
            } else if let user = user {
                VStack {
                    AsyncImage(url: URL(string: user.image.versions.large), scale: 4) {image in
                        image.resizable().aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(2)
                    }
                    Text("\(user.firstName) \(user.lastName)")
                    Text("\(String(format: "%.2f", user.cursusUsers[1].level))")
                }
                Spacer()
            }
        }
        .onAppear {
            Task {
                await loadUserInformation()
            }
        }
    }
    
    private func loadUserInformation() async {
        do {
            let userInfo = try await NetworkContext.shared.getUserInformation(login: login)
            if let info = userInfo {
                user = info
                isLoading = false
            }
        } catch {
            print("Error in loadUserInformation")
        }
    }
}
