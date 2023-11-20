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
                            SecondaryInformation(user: user)
                            if user.staff != true {
                                Location(location: user.location)
                                LevelBar(percentage: CGFloat(user.cursusUsers[1].level.truncatingRemainder(dividingBy: 1)), level: user.cursusUsers[1].level)
                            }
                            DetailsViewSelector(currentView: $currentView, user: user)
                            ScrollView() {
                                VStack(spacing: 15) {
                                    switch currentView {
                                    case .projects:
                                        if hasMatchingProjects() {
                                            ForEach(Array(user.projectsUsers.enumerated()), id: \.offset) { index, singleProject in
                                                if isMatchingProject(project: singleProject) {
                                                    SingleProject(project: singleProject)
                                                }
                                            }
                                        } else {
                                            Text("No projects!")
                                                .font(.system(size: 18, weight: .bold, design: .default))
                                                .foregroundColor(.white)
                                        }
                                    case .achievements:
                                        if user.achievements.count != 0 {
                                            ForEach(getSanitizedAchievements(fullAchievementList: user.achievements), id: \.self) { achievementName in
                                                SingleAchievement(text: achievementName)
                                            }
                                        } else {
                                            Text("No achievements!")
                                                .font(.system(size: 18, weight: .bold, design: .default))
                                                .foregroundColor(.white)
                                        }
                                    case .skills:
                                        if user.cursusUsers.count > 1 && user.cursusUsers[1].skills.count != 0 {
                                            ForEach(Array(user.cursusUsers[1].skills.enumerated()), id: \.offset) {index, singleSkill in
                                                SingleSkill(skill: singleSkill)
                                            }
                                        } else {
                                            Text("No skills!")
                                                .font(.system(size: 18, weight: .bold, design: .default))
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                                .padding()
                            }
                            .frame(maxWidth: .infinity, maxHeight: 400)
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
    
    private func hasMatchingProjects() -> Bool {
        user?.projectsUsers.contains {
            isMatchingProject(project: $0)
        } ?? false
    }
    
    private func isMatchingProject(project: ProjectsUser) -> Bool {
        !project.cursusIds.isEmpty && project.cursusIds[0] == 21 && project.finalMark != nil
    }
    
    private func getSanitizedAchievements(fullAchievementList: [Achievement]) -> [String] {
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
}
