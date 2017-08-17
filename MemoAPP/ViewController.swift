//
//  ViewController.swift
//  MemoAPP
//
//  Created by Bathanti on 8/17/17.
//  Copyright © 2017 Bathanti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count : Int!
    var label :UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        count = 0
       //Label
         label  = UILabel()
        label.frame = CGRect.init(x: 150, y: 150, width: 60, height: 60)
        label.text = "0"
        self.view.addSubview(label)
        //Button
        
        let Button : UIButton = UIButton()
        Button.frame = CGRect.init(x: 150, y: 250, width: 60, height: 60)
        Button.setTitle("Click", for: .normal)
        Button.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(Button)
        
        Button.addTarget(self, action: #selector(ViewController.changecounter), for: UIControlEvents.touchUpInside)
        
    }
    func changecounter ()
    {
        self.count = count! + 1
        self.label.text = "\(self.count!)"
    }

}

