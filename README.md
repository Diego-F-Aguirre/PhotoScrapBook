## **PhotoScrap Book**
![img_2232](https://cloud.githubusercontent.com/assets/6709516/17530657/c2386a2e-5e35-11e6-8f88-a041d4c3d7ae.PNG)
![img_2233](https://cloud.githubusercontent.com/assets/6709516/17530658/c250ec70-5e35-11e6-9878-49e6b9ce5854.PNG)
![img_2237](https://cloud.githubusercontent.com/assets/6709516/17530660/c25240ac-5e35-11e6-88ce-758bc41230ca.PNG)
![img_2238](https://cloud.githubusercontent.com/assets/6709516/17530659/c2513586-5e35-11e6-82a3-7516f144f218.PNG)


-  Start this project from scratch at this point you should be well versed in the types of views and classes needed to construct a project.

-	Your goal (based on the images above) is to create a photo scrap book app of images you download from the web. 

- Note that there is also a video included in the master solution of the final product if you wish to download it for additional reference.

- These images and the titles you give them should auto populate the main view which has a table view with a list of your favorite images from the web as well as your comment of them

-	Use the following code as your starting point for your CloudKitManager:
	
    import UIKit
    import CloudKit
    
    class CloudKitManager {
        
        let database = CKContainer.defaultContainer().publicCloudDatabase
        
        func fetchRecordsWithType(type: String, sortDescriptors: [NSSortDescriptor]? = nil, completion: ([CKRecord]?, NSError?) -> Void) {
            
            let query = CKQuery(recordType: type, predicate: NSPredicate(value: true))
            query.sortDescriptors = sortDescriptors
            
            database.performQuery(query, inZoneWithID: nil, completionHandler: completion)
        }
        
        func saveRecord(record: CKRecord, completion: ((NSError?) -> Void) = {_ in }) {
    
            database.saveRecord(record) { (_, error) in
                completion(error)
            }
        }
    }

- Note that this project is completely CloudKit based/network dependent and does not use local persistence to save your data, all data will be save from the cloud and should automatically populate your table view upon loading your app every time.

**Hint** Pay attention to the particular segue of the plus button on the main view. This is not your standard show segue.
**Hint** The solution does not use CKAsset to retrieve the image

> Written with [StackEdit](https://stackedit.io/).
