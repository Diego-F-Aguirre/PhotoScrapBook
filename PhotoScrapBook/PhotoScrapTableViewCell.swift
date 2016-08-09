//
//  PhotoScrapTableViewCell.swift
//  PhotoScrapBook
//
//  Created by Diego Aguirre on 8/8/16.
//  Copyright © 2016 home. All rights reserved.
//

import UIKit

class PhotoScrapTableViewCell: UITableViewCell {

    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func updateCell(photoScrap: PhotoScrap) {
        titleLabel.text = photoScrap.title
        photoImageView.image = photoScrap.photo
    }
}
