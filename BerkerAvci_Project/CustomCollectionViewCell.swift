//
//  CustomCollectionViewCell.swift
//  BerkerAvci_Project
//
//  Created by Berker Avcı on 10.06.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mLabel2: UILabel!
    @IBOutlet weak var mImageView: UIImageView!
    override func awakeFromNib() {
            super.awakeFromNib()
            
            // Set the corner radius of the cell's content view
        contentView.layer.masksToBounds = true
                mImageView.layer.cornerRadius = mImageView.frame.size.width / 5
                mImageView.layer.masksToBounds = true
        }
}
