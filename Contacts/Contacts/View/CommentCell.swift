//
//  CommentCell.swift
//  Contacts
//
//  Created by Svetlana Safonova on 23.01.2021.
//

import UIKit

class CommentCell: UITableViewCell {

    var comment: Comment? {
        didSet {
            username.text = comment?.username
            commentText.text = comment?.text
            verticalLine.isHidden = comment?.parent == nil
        }
    }
    func calcOffset() -> Int {
        if let comment = comment {
            return 10 * commentDepth(comment)
        }
        return 0
    }
    
    @IBOutlet private var username: UILabel!
    @IBOutlet private var commentText: UILabel!
    @IBOutlet private var verticalLine: UIView!
    @IBOutlet private var contentStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        let offset = calcOffset()
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            contentStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: CGFloat(offset))
//        ])
        contentStackView.layoutMargins = UIEdgeInsets(top: 0, left: CGFloat(offset), bottom: 0, right: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commentDepth(_ comment: Comment) -> Int {
        if let parent = comment.parent {
            return 1 + commentDepth(parent)
        }
        return 0
    }
}
