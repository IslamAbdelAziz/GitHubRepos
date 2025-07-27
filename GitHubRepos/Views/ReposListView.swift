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
                        Text(repo.name ?? "")
                            .navigationTransition(.zoom(sourceID: repo.id, in: namespace))

                    } label: {
                        HStack {
                            //Owner
                            VStack{
                                // Owner Image
                                AvatarView(imgUrl: repo.owner?.avatarUrl)
                                // Owner Name
                                Text(repo.owner?.login ?? "")
                                    .font(.title2)
                                    .multilineTextAlignment(.center)
                            }
                            .frame(width: 100)
                            .padding(.top, 8)
                            
                            // Info
                            VStack(alignment: .leading) {
                                Spacer()
                                // Repo name
                                Text(repo.name ?? "")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                // Repo Date
                                
                                DateView(date: repo.creationDate)
                                    .font(.caption)
                                Spacer()
                                
                            }
                            .padding(.vertical, 8)
                            .padding(.leading, 16)
                            
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
