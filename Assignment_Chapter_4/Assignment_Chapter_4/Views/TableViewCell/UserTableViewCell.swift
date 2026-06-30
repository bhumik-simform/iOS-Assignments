//
//  UserTableViewCell.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet private weak var userProfileImage: UIImageView!
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var userNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configure(user: UserModel) {
        
        userProfileImage.downLoadImage(url: user.imageURL)
        userProfileImage.makeImageCircular()
    
        fullNameLabel.text = "\(user.firstName) \(user.lastName)"
        emailLabel.text = "Email: \(user.email)"
        userNameLabel.text = "User Name: \(user.userName)"
    }
}
