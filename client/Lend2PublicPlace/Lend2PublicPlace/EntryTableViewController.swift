//
//  EntryTableViewController.swift
//  Lend2PublicPlace
//
//  Created by pacilo on 2015. 10. 23..
//  Copyright © 2015년 DAYEONSSI. All rights reserved.
//

import UIKit

class EntryTableViewController: UITableViewController {

    let categoryNames = ["도서관", "체육시설", "공공시설 대관", "체험행사", "교육행사", "진료시설", "화장실"]
    let categoryImageNames = ["library.jpg", "gymnasium.jpg", "public_center.jpg", "public_event.jpg", "education_event.jpg", "medical_service.jpg", "toilet.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.categoryNames.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EntryTableViewCell
        cell.categoryNameLabel?.text = categoryNames[indexPath.row]

//        cell.backgroundImageView?.image = convertBlurImage(UIImage(named: categoryImageNames[indexPath.row])!)
        cell.backgroundImageView?.image = UIImage(named: categoryImageNames[indexPath.row])
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
/*
    func convertBlurImage(image: UIImage) -> UIImage {
        let imageToBlur = CIImage(image: image)
        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter!.setValue("1", forKey: kCIInputRadiusKey)
        blurFilter!.setValue(imageToBlur, forKey: "inputImage")
        let resultImage = blurFilter?.valueForKey("outputImage") as! CIImage
        let blurredImage = UIImage(CIImage: resultImage)
        return blurredImage
    }
*/
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
