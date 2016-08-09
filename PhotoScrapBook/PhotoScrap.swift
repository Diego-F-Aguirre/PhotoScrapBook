//
//  PhotoScrap.swift
//  PhotoScrapBook
//
//  Created by Diego Aguirre on 8/8/16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation
import UIKit

struct PhotoScrap {
    let title: String
    var photoData: NSData?
    var photo: UIImage? {
        guard let photoData = photoData else { return nil }
        return UIImage(data: photoData)
    }
}