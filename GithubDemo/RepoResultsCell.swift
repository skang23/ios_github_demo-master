//
//  RepoResultsCell.swift
//  GithubDemo
//
//  Created by Suyeon Kang on 2/11/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class RepoResultsCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var starsView: UIImageView!
    @IBOutlet weak var forksView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        discriptionLabel.preferredMaxLayoutWidth = discriptionLabel.frame.size.width
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        discriptionLabel.preferredMaxLayoutWidth = discriptionLabel.frame.size.width

        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
