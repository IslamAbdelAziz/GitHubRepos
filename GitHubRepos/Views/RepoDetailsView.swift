//
//  RepoDetailsView.swift
//  GitHubRepos
//
//  Created by iSlam AbdelAziz on 28/07/2025.
//

import SwiftUI

struct RepoDetailsView: View {
    @State var repo: ModelRepo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(repo.fullName ?? "")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Image(systemName: "calendar")
                DateView(date: repo.creationDate)
            }
            Text("Description")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 20)
            
            Text(repo.description ?? "")
                .multilineTextAlignment(.leading)
                .padding(.vertical, 8)
            
            Text("Owner")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 20)
            
            Text("\(repo.owner?.login ?? "")")
                .font(.headline)
                .foregroundColor(.secondary)
            
            AvatarView(imgUrl: repo.owner?.avatarUrl)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
    }
}

#Preview {
    RepoDetailsView(repo: ModelRepo.createSample())
}
