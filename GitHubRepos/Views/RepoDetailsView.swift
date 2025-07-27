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
                    .foregroundStyle(.gray)
                DateView(date: repo.creationDate)
            }
            Text("Description")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.top, 20)
                .foregroundColor(.secondary)
            
            Text(repo.description ?? "")
                .multilineTextAlignment(.leading)
                .padding(.vertical, 8)
            
            Text("Owner")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.top, 20)
                .foregroundColor(.secondary)
            
            HStack {
                AvatarView(imgUrl: repo.owner?.avatarUrl)
                Text("\(repo.owner?.login ?? "")")
                    .font(.headline)
            }
            

            Spacer()
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
    }
}

#Preview {
    RepoDetailsView(repo: ModelRepo.createSample())
}
