//
//  CategoryCell.swift
//  ECommerce
//
//  Created by aditya sharma on 13/08/23.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView! {
        didSet {
            bgView.layer.cornerRadius = 30
            bgView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageVIew: UIImageView!
    @IBOutlet weak var totalProductLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

