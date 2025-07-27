//
//  ReposListView.swift
//  GitHubRepos
//
//  Created by iSlam AbdelAziz on 27/07/2025.
//

import SwiftUI

struct ReposListView: View {
    @Environment(RepoDataStore.self) private var repoDataStore
    @Namespace var namespace
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(repoDataStore.reposList) { repo in
                    NavigationLink {
                        RepoDetailsView(repo: repo)
                            .navigationTransition(.zoom(sourceID: repo.id, in: namespace))
                    } label: {
                        VStack(alignment: .leading) {
                            // Repo name
                            Text(repo.name ?? "")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundStyle(.black.opacity(0.8))
                            
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundStyle(.gray)
                                DateView(date: repo.creationDate)
                            }
                            Spacer()
                            HStack {
                                // Owner Image
                                AvatarView(imgUrl: repo.owner?.avatarUrl)
                                // Owner Name
                                Text(repo.owner?.login ?? "")
                                    .font(.title2)
                                    .multilineTextAlignment(.center)
                            }
                            .padding(.bottom)
                        }
                    }
                    .matchedTransitionSource(id: repo.id, in: namespace)
                }
            }
            .navigationTitle(Text("GitHub Repos"))
        }
        .onAppear {
            Task {
                try await repoDataStore.loadRepos()
            }
        }
    }
}


#Preview {
    ReposListView()
        .environment(RepoDataStore(httpClient: HTTPClient()))
//        .preferredColorScheme(.dark)
}
