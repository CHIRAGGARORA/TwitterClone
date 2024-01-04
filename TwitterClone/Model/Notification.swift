//
//  Notification.swift
//  TwitterClone
//
//  Created by chirag arora on 04/01/24.
//

import Foundation


enum NotificationType: Int {

    case follow // rawValue return 0
    case like // rawValue return 1
    case reply // rawValue return 2
    case retweet // rawValue return 3
    case mention // rawValue return 4
}


struct Notification {
    let tweetId: String?
    var timestamp: Date!
    let user: User
    var tweet: Tweet?
    var type: NotificationType!
    
    
    init(user: User, tweet: Tweet?, dictionary: [String: AnyObject]) {
        self.user = user
        self.tweet = tweet
        
        self.tweetId = dictionary["tweetId"] as? String ?? ""
        
        if let timestamp = dictionary["timestamp"] as? Double {
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        }
        
        if let type = dictionary["type"] as? Int {
            self.type = NotificationType(rawValue: type)
        }
    }
    
}
