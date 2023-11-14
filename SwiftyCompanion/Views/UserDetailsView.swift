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
                Text(user.firstName)
                Text(user.lastName)
                Text("\(String(format: "%.2f", user.cursusUsers[1].level))")
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
