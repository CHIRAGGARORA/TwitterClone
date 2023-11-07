//
//  ProfileHeaderViewModel.swift
//  TwitterClone
//
//  Created by chirag arora on 08/11/23.
//

import Foundation


enum ProfileFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var description: String {
        switch self {
        case .tweets: return "Tweets"
        case .likes: return "Likes"
        case .replies: return "Tweets & Replies"
        }
    }
}
