//
//  ViewController.swift
//  dy
//
//  Created by 최윤호 on 2015. 10. 25..
//  Copyright © 2015년 dytdy. All rights reserved.
//

import UIKit

class ViewController: UITableViewController{
    
    
    var vec : [XmlFormat]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dyx = DYXmlDirector();
        dyx.GetServerData(XmlFormat.CATEGORY_NMS[1], local_pos: "", data_range: (limits: 20, offset: 20), callback:
            { (output : [XmlFormat]?) -> Void in
                self.vec = output
                self.tableView.performSelectorOnMainThread(Selector("reloadData"), withObject: nil, waitUntilDone: true)
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let valueLoad = vec
        {
            return valueLoad.count
        }
        else{
            return 0
        }
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : CustomTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! CustomTableViewCell
        if(cell.isEqual(NSNull)) {
            cell = NSBundle.mainBundle().loadNibNamed("Cell", owner: self, options: nil)[0] as! CustomTableViewCell;
        }
        if let vauleLoad = self.vec
        {
            cell.nameLabel?.text = vauleLoad[indexPath.row].category
            cell.locationLabel?.text = vauleLoad[indexPath.row].name
        }
        return cell as CustomTableViewCell
    }
   }

