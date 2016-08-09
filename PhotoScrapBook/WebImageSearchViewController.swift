//
//  WebImageSearchViewController.swift
//  PhotoScrapBook
//
//  Created by Diego Aguirre on 8/8/16.
//  Copyright © 2016 home. All rights reserved.
//

import UIKit
import SafariServices

class WebImageSearchViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var webImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func imageTapped(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        
        let actionSheet = UIAlertController(title: "Choose an Image", message: nil, preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .Default) { (_) in
            imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        
        let savedPhotosAction = UIAlertAction(title: "Saved Photos", style: .Default) { (_) in
            imagePicker.sourceType = .SavedPhotosAlbum
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        
        actionSheet.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            actionSheet.addAction(photoLibraryAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.SavedPhotosAlbum) {
            actionSheet.addAction(savedPhotosAction)
        }
        
        presentViewController(actionSheet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }

        webImageView.image = image
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return titleTextField.resignFirstResponder()
    }
    
    @IBAction func getImageFromWeb(sender: AnyObject) {
        guard let url = NSURL(string: "https://www.google.com/imghp?hl=en&tab=wi&ei=_4ynV_zUN6HYjwSyrK2oCw&ved=0EKouCBYoAQ") else { return }
        
        let safariViewController = SFSafariViewController(URL: url)
        presentViewController(safariViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func savePhotoScrapButtonPressed(sender: AnyObject) {
        if let text = titleTextField.text,
            image = webImageView.image,
            photoData = UIImageJPEGRepresentation(image, 0.4) {
            
            let newScrap = PhotoScrap(title: text, photoData: photoData)
            PhotoScrapController.sharedController.postNewScrap(newScrap, completion: { (_) in
                print("PhotoScrap successfully saved to CloudKit")
            })
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}


















