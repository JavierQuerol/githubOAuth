//
//  User.swift
//  GoGoGithub
//
//  Created by Matthew Weintrub on 11/13/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import Foundation

class User {
    
    let userLogin: String
    let userName: String
    let userUrl: String
    let userFollowers: String
    let userFollowing: String
    
    init(userLogin: String, userName: String, userUrl: String, userFollowers: String, userFollowing: String) {
        self.userLogin = userLogin
        self.userName = userName
        self.userUrl = userUrl
        self.userFollowers = userFollowers
        self.userFollowing = userFollowing
    }
    
}

