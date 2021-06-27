//
//  AccountTableViewCell.swift
//  Veryable Sample
//
//  Created by LMNTrix on 6/26/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet weak var accountView: UIView!
    @IBOutlet weak var imgAccount: UIImageView!
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        accountView.backgroundColor = ViewColor.surface.color
        accountView.layer.cornerRadius = 3
        
        
        accountView.layer.masksToBounds = false
        accountView.layer.shadowOpacity = 0.23
        accountView.layer.shadowRadius = 4
        accountView.layer.shadowOffset = CGSize(width: 0, height: 0)
        accountView.layer.shadowColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
