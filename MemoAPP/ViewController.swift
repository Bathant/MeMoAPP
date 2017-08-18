//
//  ViewController.swift
//  MemoAPP
//
//  Created by Bathanti on 8/17/17.
//  Copyright © 2017 Bathanti. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate ,UINavigationControllerDelegate,UITextFieldDelegate{
    
    @IBOutlet weak var BottomTxtField: UITextField!
    
    @IBOutlet weak var TopTxtField: UITextField!
    
    @IBOutlet weak var ImagePickerView: UIImageView!
    @IBOutlet weak var CamerBTN: UIBarButtonItem!
    let memetextatt : [String : Any ]
        = [NSStrokeColorAttributeName : UIColor.black ,
           NSForegroundColorAttributeName : UIColor.white ,
           NSFontAttributeName : UIFont(name : "HelveticaNeue-CondensedBlack" , size : 40) as Any ,
           
           NSStrokeWidthAttributeName : -1.0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BottomTxtField.delegate = self
        TopTxtField.delegate = self
        CamerBTN.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        TopTxtField.defaultTextAttributes = memetextatt
        BottomTxtField.defaultTextAttributes = memetextatt
        TopTxtField.textAlignment = .center
        BottomTxtField.textAlignment = .center
        TopTxtField.backgroundColor = .clear
        BottomTxtField.backgroundColor = UIColor.clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyNotif()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UnsubscribeToKeyNotif()
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        
        if textField.text == "top" || textField.text == "Bottom"
        {
            textField.text = ""
        }
    }
    
    //dismess keyboard on return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func ToolPick(_ sender: Any) {
        
        let pickerImage = UIImagePickerController()
        pickerImage.delegate = self
        pickerImage.sourceType = .photoLibrary
        self.present(pickerImage, animated: true, completion: nil)
        
    }
    //move the view up when keyboard appears
    func KeyboardwilShow(notification : Notification)
    {
        print("this is the height of the view \(self.view.frame.origin.y)")
        if self.view.frame.origin.y == 0 {
        self.view.frame.origin.y -=  getKeyboardHeight(notification: notification)
        }
        
        print("this is the new !!!!  height of the view \(self.view.frame.origin.y)")
    }
    func KeyboardwilHide(notification : Notification)
    {
        self.view.frame.origin.y =  0
    }
    func subscribeToKeyNotif()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(self.KeyboardwilShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.KeyboardwilHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    func UnsubscribeToKeyNotif()
    {
        NotificationCenter.default.removeObserver(self,  name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self,  name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func getKeyboardHeight(notification : Notification) -> CGFloat
    {
        let usrInfo = notification.userInfo
        let keySize = usrInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        print("This is the keyboard Size :: \(keySize)")
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

