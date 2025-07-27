//
//  AvatarViewModifier.swift
//  GitHubRepos
//
//  Created by iSlam AbdelAziz on 27/07/2025.
//

import SwiftUI

struct AvatarViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .clipShape(Circle())
            .frame(width: 50)
    }
}

