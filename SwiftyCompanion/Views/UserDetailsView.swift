import Foundation
import SwiftUI

enum ViewType: String {
    case projects = "Projects"
    case achievements = "Achievements"
    case skills = "Skills"
}

struct UserDetailsView: View {
    @State var isLoading: Bool = true
    @State var user: User?
    @State var currentView: ViewType = .projects
    
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
                        VStack(spacing: 7) {
                            UserImage(userImage: user.image.versions.medium)
                            MainInformation(firstName: user.firstName, lastName: user.lastName, login: login)
                            SecondaryInformation(wallet: user.wallet, correctionPoints: user.correctionPoints, campusName: user.campus[0].name, status: user.staff ? "Staff" : "Student")
                            Location(location: user.location)
                            LevelBar(percentage: CGFloat(user.cursusUsers[1].level.truncatingRemainder(dividingBy: 1)), level: user.cursusUsers[1].level)
                            DetailsViewSelector(currentView: $currentView)
//                            ForEach(Array(user.projectsUsers.enumerated()), id: \.offset) { index, singleProject in
//                                if singleProject.cursusIds[0] == 21 && singleProject.validated == true {
//                                    Text("\(singleProject.project.name)")
//                                }
//                            }

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
