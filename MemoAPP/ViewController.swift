//
//  ViewController.swift
//  MemoAPP
//
//  Created by Bathanti on 8/17/17.
//  Copyright © 2017 Bathanti. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate ,UINavigationControllerDelegate,UITextFieldDelegate{
    
    
    @IBOutlet weak var BotmTxtF: UITextField!
    @IBOutlet weak var TopTxtF: UITextField!
    @IBOutlet weak var ImagePickerView: UIImageView!
    @IBOutlet weak var CamerBTN: UIBarButtonItem!
    let memetextatt : [String : Any ]
        = [NSStrokeColorAttributeName : UIColor.black ,
           NSForegroundColorAttributeName : UIColor.white ,
           NSFontAttributeName : UIFont(name : "HelveticaNeue-CondensedBlack" , size : 40) as Any ,
            NSStrokeWidthAttributeName : -1.0]
        override func viewDidLoad() {
        super.viewDidLoad()
        
        CamerBTN.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
            BotmTxtF.defaultTextAttributes = memetextatt
            TopTxtF.defaultTextAttributes = memetextatt
    }
    
    override func viewWillAppear(_ animated: Bool) {
        subscribeToKeyNotif()
    }
   
   
    func textFieldDidBeginEditing(_ textField: UITextField) {
        TopTxtF.text = ""
        BotmTxtF.text = ""
    }
 /*
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        BotmTxtF.resignFirstResponder()
        TopTxtF.resignFirstResponder()
        return true
    }*/
    @IBAction func ToolPick(_ sender: Any) {
        
        let pickerImage = UIImagePickerController()
        pickerImage.delegate = self
        pickerImage.sourceType = .photoLibrary
        self.present(pickerImage, animated: true, completion: nil)
        
    }
    //move the view up when keyboard appears
    func KeyboardwilShow(notification : Notification)
    {
        self.view.frame.origin.y = self.view.frame.origin.y - getKeyboardHeight(notification: notification)
    }
    
    func subscribeToKeyNotif()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardwilShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
    }
    func getKeyboardHeight(notification : Notification) -> CGFloat
    {
        let usrInfo = notification.userInfo
        let keySize = usrInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        
        return keySize.cgRectValue.height
        
        
    }
    
    
    @IBAction func CameraPicker(_ sender: Any) {
        
        let pickerImage = UIImagePickerController()
        pickerImage.delegate = self
        pickerImage.sourceType = .camera
        self.present(pickerImage, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard  let Img = info[UIImagePickerControllerOriginalImage] as? UIImage else { return}
        ImagePickerView.image = Img
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true
            , completion: nil)
    }

}

