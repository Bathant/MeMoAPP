//
//  MeMeTableViewController.swift
//  MemoAPP
///Users/bathanti/Desktop/MemoAPP/MemoAPP/AppDelegate.swift
//  Created by Bathanti on 8/23/17.
//  Copyright © 2017 Bathanti. All rights reserved.
//

import UIKit

class MeMeTableViewController: UITableViewController {
var memes = [MeMe]()
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    @IBOutlet var viewtable: UITableView!

    override func viewWillAppear(_ animated: Bool) {
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
             memes = appdelegate.memes
        viewtable.reloadData()
        print(memes.count)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("iam inside numberOfRowsInSection")
        print(memes.count)
        return memes.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        print("iam at cellForRowAt ")
        cell.imageView?.image = memes[indexPath.row].MemeImage
        cell.textLabel?.text = "\(memes[indexPath.row].Toptxt!)...........\(memes[indexPath.row].Btmtxt!) "
        print(memes[indexPath.row].Toptxt)
        print(memes[indexPath.row].Btmtxt)
      
        return cell
    }
 

    

}
