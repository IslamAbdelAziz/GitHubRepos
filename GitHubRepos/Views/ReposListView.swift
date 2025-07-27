//
//  ReposListView.swift
//  GitHubRepos
//
//  Created by iSlam AbdelAziz on 27/07/2025.
//

import SwiftUI

struct ReposListView: View {
    @Environment(RepoDataStore.self) private var repoDataStore
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(repoDataStore.reposList) { repo in
                    NavigationLink {
                        Text(repo.name ?? "")
                        
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
                            VStack {
                                // Repo name
                                Text(repo.name ?? "")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                // Repo Date
                                
                                Spacer()
                                
                            }
                            .padding(.vertical, 8)
                            .padding(.leading, 16)
                            
                        }
                    }
                }
            }
            .navigationTitle("GitHub Repos")
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
