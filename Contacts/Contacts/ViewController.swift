//
//  ViewController.swift
//  Contacts
//
//  Created by Svetlana Safonova on 23.01.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var commentsFirstLevel: [Comment]?
    
    var comments = [
        Comment(username: "Naruto", text: "Sasuke come back",
                childs: [
                    Comment(username: "Sasuke", text: "no",
                            childs: [
                                Comment(username: "Naruto", text: "why not",
                                        childs: [
                                            Comment(username: "Sasuke", text: "i'm tired", childs: nil),
                                            Comment(username: "Kakashi", text: "u r dumb", childs: nil),
                                        ]),
                                Comment(username: "Sasuke", text: "I won't come back", childs: nil),
                                Comment(username: "Naruto", text: "I'm begging",
                                        childs: [
                                            Comment(username: "Sakura", text: "I'm begging too", childs: nil),
                                            Comment(username: "Shikamaru", text: "I'm not", childs: nil),
                                            Comment(username: "Itachi", text: "Sasuke **********", childs: nil)
                                        ]),
                                Comment(username: "Sasuke", text: "god damn", childs: nil),
                                Comment(username: "Shikamaru", text: "Never come back!!", childs: nil),
                            ]),
                    Comment(username: "Sakura", text: "yesssss please", childs: nil),
                    Comment(username: "Shikamaru", text: "omg no", childs: nil)
                ]),
        Comment(username: "Shikamaru", text: "You all are idiots",
                childs: [
                    Comment(username: "Naruto", text: "what whu", childs: nil),
                    Comment(username: "Sasuke", text: "No u are", childs: nil)
                ]),
        Comment(username: "Naruto", text: "I'm the best",
                childs: [
                    Comment(username: "Sasuke", text: "no lol", childs: nil),
                    Comment(username: "Hinata", text: "yeeaap", childs: nil),
                    Comment(username: "Itachi", text: "Ok", childs: nil),
                ]),
        Comment(username: "Asuma", text: "luv u goodbye",
                childs: [
                    Comment(username: "Shikamaru", text: "ASUMAAAAAA", childs: nil),
                    Comment(username: "Naruto", text: "🥺🥺", childs: nil)
                ]),
        Comment(username: "Orochimaru", text: "sAsUkE ComE BaCK", childs: nil),
        Comment(username: "Obito", text: "What's going on here lol", childs: nil),
        Comment(username: "Madara", text: "hi)))", childs: nil),
        ]
    
    var allComments: [Comment] = []
    
    func getAllComments() -> [Comment] {
        let getComments = Comments()
        for comment in comments {
        getComments.nlr(comment: comment)
        }
        print(getComments.comments)
        return getComments.comments
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allComments = getAllComments()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allComments.count
    }
    
    private func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "comment"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CommentCell
        cell?.comment = allComments[indexPath.row]
        
        return cell ?? UITableViewCell()
    }
    
}

