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
                ZStack {
                    Image("42background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .frame(minWidth: 0, maxWidth: .infinity)
                    ScrollView(.vertical) {
                        VStack {
                            AsyncImage(url: URL(string: user.image.versions.medium)) { image in
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
                            
                            Text("\(user.firstName) \(user.lastName)")
                                .font(.system(size: 24, weight: .bold, design: .default))
                                .foregroundColor(.white)
                            Text(login)
                                .font(.system(size: 18, weight: .semibold, design: .default))
                                .foregroundColor(.white)
                            HStack(spacing: 0) {
                                Text("\(user.wallet)")
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 10)
                                
                                Text("\(user.correctionPoint)")
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 10)
                                
                                Text("\(user.campus[0].name)")
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 10)
                                
                                
                                Text("\(user.staff ? "Staff" : "Student")")
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 10)
                            }
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.6)))
                            .padding()
                        }
                    }
                }
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
