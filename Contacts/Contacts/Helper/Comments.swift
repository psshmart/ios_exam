//
//  Comments.swift
//  Contacts
//
//  Created by Svetlana Safonova on 23.01.2021.
//

import Foundation

class Comments {
    
    var comments: [Comment] = []
    
    
    func nlr(comment: Comment) {
        comments.append(comment)
        if let childs = comment.childs {
            for child in childs {
                nlr(comment: child)
                child.parent = comment
            }
        }
    }

}

