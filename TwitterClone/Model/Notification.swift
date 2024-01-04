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
    var tweetID: String?
    var timestamp: Date!
    let user: User
    var tweet: Tweet?
    var type: NotificationType!
    
    
    init(user: User, dictionary: [String: AnyObject]) {
        self.user = user
        
        
        if let tweetID = dictionary["tweetId"] as? String {
            self.tweetID = tweetID
        }
        
        if let timestamp = dictionary["timestamp"] as? Double {
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        }
        
        if let type = dictionary["type"] as? Int {
            self.type = NotificationType(rawValue: type)
        }
    }
    
}
