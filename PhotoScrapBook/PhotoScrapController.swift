//
//  PhotoScrapController.swift
//  PhotoScrapBook
//
//  Created by Diego Aguirre on 8/8/16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

public let ScrapControllerDidRefreshNotification = "PhotoScrapControllerDidRefreshNotification"

class PhotoScrapController {
    
    static let sharedController = PhotoScrapController()
    private let cloudKitManager = CloudKitManager()
    
    init() {
        refresh()
    }
    
    private(set) var photoScraps: [PhotoScrap] = [] {
        didSet {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let nc = NSNotificationCenter.defaultCenter()
                nc.postNotificationName(ScrapControllerDidRefreshNotification, object: self)
            })
        }
    }
    
    func refresh(completion: ((NSError?) -> Void)? = nil) {
        
        let sortDescriptors = [NSSortDescriptor(key: PhotoScrap.titleKey, ascending: false)]
        cloudKitManager.fetchRecordsWithType(PhotoScrap.recordType, sortDescriptors: sortDescriptors) { (records, error) in
        
            defer {
                completion?(error)
            }
            
            if let error = error {
                print("Error fetching messages: \(error)")
                return
            }
            
            guard let records = records else { return }
            
            self.photoScraps = records.flatMap { PhotoScrap(cloudKitRecord: $0) }
            print("Successfully  created Entry CKRecord")
        }
    }
}
