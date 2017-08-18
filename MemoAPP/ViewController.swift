//
//  ViewController.swift
//  MemoAPP
//
//  Created by Bathanti on 8/17/17.
//  Copyright © 2017 Bathanti. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate ,UINavigationControllerDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var ShareVar: UIBarButtonItem!
    @IBOutlet weak var NavBar: UINavigationBar!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var BottomTxtField: UITextField!
    
    @IBOutlet weak var TopTxtField: UITextField!
    
    @IBOutlet weak var ImagePickerView: UIImageView!
    @IBOutlet weak var CamerBTN: UIBarButtonItem!
    
    
    struct MeMe {
        
       var Toptxt : String?
       var Btmtxt : String?
       var OriginalImage : UIImage!
       var MemeImage : UIImage!
        init(tptxt : String , btmtxt : String , Oimg : UIImage , Mimg : UIImage ) {
            Toptxt = tptxt
            Btmtxt = btmtxt
            OriginalImage = Oimg
            MemeImage = Mimg
        }
        
    }
    
    
    
    let memetextatt : [String : Any ]
        = [NSStrokeColorAttributeName : UIColor.black ,
           NSForegroundColorAttributeName : UIColor.white ,
           NSFontAttributeName : UIFont(name : "HelveticaNeue-CondensedBlack" , size : 40) as Any ,
           NSBackgroundColorAttributeName : UIColor.clear ,
           NSStrokeWidthAttributeName : -3.0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BottomTxtField.delegate = self
        TopTxtField.delegate = self
        CamerBTN.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        TopTxtField.defaultTextAttributes = memetextatt
        BottomTxtField.defaultTextAttributes = memetextatt
        TopTxtField.textAlignment = .center
        BottomTxtField.textAlignment = .center
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if ImagePickerView.image == nil {
            ShareVar.isEnabled = false
        }
        else{
            ShareVar.isEnabled = true
        }
        subscribeToKeyNotif()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UnsubscribeToKeyNotif()
    }
    func save ()
    {
        let memeimage = generateMemeImage()
        let meme = MeMe(tptxt: TopTxtField.text!, btmtxt: BottomTxtField.text!, Oimg: ImagePickerView.image!, Mimg: memeimage)
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
    @IBAction func ShareBtn(_ sender: Any) {
        
        let meme = generateMemeImage()
        let act = UIActivityViewController(activityItems: [meme], applicationActivities: nil)
        self.present(act, animated: true, completion: {
            self.save()
        })
        
        
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
    func generateMemeImage () ->UIImage
    {
        toolbar.isHidden = true
        NavBar.isHidden = true
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        toolbar.isHidden = false
        NavBar.isHidden = false
        return memedImage
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

