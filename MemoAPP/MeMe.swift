//
//  MeMe.swift
//  MemoAPP
//
//  Created by Bathanti on 8/23/17.
//  Copyright © 2017 Bathanti. All rights reserved.
//

import UIKit

class MeMe: NSObject {
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
