//
//  ViewController.swift
//  MemoAPP
//
//  Created by Bathanti on 8/17/17.
//  Copyright © 2017 Bathanti. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate ,UINavigationControllerDelegate{
        override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
   
    @IBAction func Exp(_ sender: Any) {
        
        //this will diplay Images in your Library
        let nextcont = UIImagePickerController()
        //this will display View Activity
        let image = UIImage()
        let cont =  UIActivityViewController(activityItems: [image] , applicationActivities : nil )
        //this will show ALert
        let alertcont = UIAlertController()
        alertcont.title = "tHIS IS an ALert"
        alertcont.message = "Hey u :D "
        self.present(alertcont, animated: true, completion: nil)
    }
    

}

