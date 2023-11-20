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
    
    func getSanitizedAchievements(fullAchievementList: [Achievement]) -> [String] {
        var achievementsOccurences: [String: Int] = [:]
        
        for singleAchievement in fullAchievementList {
            if let count = achievementsOccurences[singleAchievement.name] {
                achievementsOccurences[singleAchievement.name] = count + 1
            } else {
                achievementsOccurences[singleAchievement.name] = 1
            }
        }
        var sanitizedAchievementList: [String] = []
        for (key, value) in achievementsOccurences {
            sanitizedAchievementList.append(value == 1 ? key : "\(key) \(value)")
        }
        return sanitizedAchievementList
    }
    
    
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
                            ScrollView() {
                                VStack(spacing: 15) {
                                    switch currentView {
                                    case .projects:
                                        ForEach(Array(user.projectsUsers.enumerated()), id: \.offset) { index, singleProject in
                                            if singleProject.cursusIds[0] == 21 && singleProject.finalMark != nil {
                                                SingleProject(project: singleProject)
                                            }
                                        }
                                    case .achievements:
                                        ForEach(getSanitizedAchievements(fullAchievementList: user.achievements), id: \.self) { achievementName in
                                            SingleAchievement(text: achievementName)
                                        }
                                        
                                    case .skills:
                                        ForEach(Array(user.cursusUsers[1].skills.enumerated()), id: \.offset) {index, singleSkill in
                                            SingleSkill(skill: singleSkill)
                                        }
                                    }
                                }
                                .padding()
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 400)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.6)))
                            .padding(.horizontal)
                            .padding(.bottom, 7)
                        }
                        .frame(maxWidth: .infinity)
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
            } else {
                print("No user info")
            }
        } catch {
            print("Error in loadUserInformation")
        }
    }
}
