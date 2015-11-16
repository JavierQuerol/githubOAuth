//
//  Owner.swift
//  GoGoGithub
//
//  Created by Matthew Weintrub on 11/13/15.
//  Copyright © 2015 Matthew Weintrub. All rights reserved.
//


import Foundation


class Owner {
    
    // MARK: Types
    
    let name: String
    let login: String
    let url: String
    let imageURL: String
    let followers: Int
    let following: Int
    let email: String
    
    // MARK: Initialization
    
    init(name: String, login: String, url: String, imageURL: String, followers: Int, following: Int, email: String) {
        
        self.name = name
        self.login = login
        self.url = url
        self.imageURL = imageURL
        self.followers = followers
        self.following = following
        self.email = email
        
    }
    
}

