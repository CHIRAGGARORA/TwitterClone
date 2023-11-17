//
//  User.swift
//  TwitterClone
//
//  Created by chirag arora on 28/10/23.
//

import Foundation
import Firebase


struct User {
    let fullname: String
    let email: String
    let username: String
    var ProfileImageUrl: URL?
    let uid: String
    var isFollowed = false
    var stats: userRelationStats?
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == uid }
    
    
    init(uid: String, dictionary: [String: AnyObject]) {
        self.uid = uid
        
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        if let ProfileImageUrlString = dictionary["ProfileImageUrl"] as? String {
            guard let url = URL(string: ProfileImageUrlString) else { return }
            self.ProfileImageUrl = url
        }
        
        
    }
    
}

struct userRelationStats {
    var followers: Int
    var following: Int
}
