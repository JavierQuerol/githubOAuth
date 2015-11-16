//
//  User.swift
//  GoGoGithub
//
//  Created by Matthew Weintrub on 11/13/15.
//  Copyright © 2015 Matthew Weintrub. All rights reserved.
//

import Foundation


class User {
    
    // MARK: Types
    
    var name: String
    var profileImageUrl: String
    
    // MARK: Initialization
    
    init(name: String, profileImageUrl: String) {
        self.name = name
        self.profileImageUrl = profileImageUrl
    }
    
}

