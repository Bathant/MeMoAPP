//
//  MeMeCollectionViewController.swift
//  MemoAPP
//
//  Created by Bathanti on 8/23/17.
//  Copyright © 2017 Bathanti. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MeMeCollectionViewController: UICollectionViewController {

    var memes = [MeMe]()
    @IBOutlet var collectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
       
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        collectionview.reloadData()
        memes = appdelegate.memes
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        print("Iam here in collection view")
        cell.BotmTxt.text = memes[indexPath.row].Btmtxt!
        cell.Toptxt.text = memes[indexPath.row].Toptxt!
        cell.Imageview.image = memes[indexPath.row].MemeImage
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate
 

}
