//
//  UploadTweetViewModel.swift
//  TwitterClone
//
//  Created by chirag arora on 30/12/23.
//

import UIKit

enum UplaodTweetConfiguration {
    case tweet
    case reply(Tweet)
}

struct UploadTweetViewModel {
    
    let actionButtonTitle: String
    let placeholderText: String
    let shouldShowReplyLabel: Bool
    var replyText: String?
    
    
    init(config: UplaodTweetConfiguration) {
        switch config {
        case .tweet:
            actionButtonTitle = "Tweet"
            placeholderText = "What's happening?"
            shouldShowReplyLabel = false
        case .reply(let tweet):
            actionButtonTitle = "Reply"
            placeholderText = "Tweet your reply"
            shouldShowReplyLabel = true
            replyText = "replying to @\(tweet.user.username)"
        }
    }
}
