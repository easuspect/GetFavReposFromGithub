//
//  GetReposResponse.swift
//  GetFavReposFromGithub
//
//  Created by NewMac on 11/20/22.
//

import Foundation

struct GetReposResponse: Decodable {
    
    let items: [GithubRepo]
}

struct GithubRepo: Decodable {
    
    let name: String
    let owner: GithubOwner
}

struct GithubOwner: Decodable {
    
    let avatar_url: String
}
