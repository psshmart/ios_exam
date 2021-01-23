//
//  Comment.swift
//  Contacts
//
//  Created by Svetlana Safonova on 23.01.2021.
//

import Foundation

class Comment {
    
    var username: String
    var text: String
    var childs: [Comment]?
    var parent: Comment?
    
    
    init(username: String, text: String, childs: [Comment]?)
    {
        self.username = username
        self.text = text
        if let childs = childs {
            self.childs = childs
        }
    }
}
