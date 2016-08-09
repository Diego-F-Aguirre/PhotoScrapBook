//
//  PhotoScrap+CoreData.swift
//  PhotoScrapBook
//
//  Created by Diego Aguirre on 8/8/16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

extension PhotoScrap {
    
    static var recordType: String { return "PhotoScrap" }
    static var titleKey: String { return "Title" }
    static var imageKey: String { return "Image" }
    
    init?(cloudKitRecord: CKRecord) {
        guard let title = cloudKitRecord[PhotoScrap.titleKey] as? String,
            let image = cloudKitRecord[PhotoScrap.imageKey] as? NSData
            where cloudKitRecord.recordType == PhotoScrap.recordType else {
                print("Failable init failed")
                return nil
        }
        
        self.init(title: title, photoData: image)
    }
    
    var cloudKitRecord: CKRecord {
        let record = CKRecord(recordType: PhotoScrap.recordType)
        
        record[PhotoScrap.titleKey] = title
        record[PhotoScrap.imageKey] = photoData
        
        return record
    }
}