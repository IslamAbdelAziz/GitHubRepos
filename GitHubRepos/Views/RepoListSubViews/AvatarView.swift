//
//  AvatarView.swift
//  GitHubRepos
//
//  Created by iSlam AbdelAziz on 27/07/2025.
//

import SwiftUI

struct AvatarView: View {
    @State var imgUrl: String?
    
    var body: some View {
        if let avatar = imgUrl, let url = URL(string: avatar) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .modifier(AvatarViewModifier())
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50)
        } else {
            Image(.avatar)
                .resizable()
                .modifier(AvatarViewModifier())
        }

    }
}

#Preview {
    AvatarView()
}
