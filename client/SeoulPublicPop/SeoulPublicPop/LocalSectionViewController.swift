//
//  LocalSectionViewController.swift
//  SeoulPublicPop
//
//  Created by pacilo on 2015. 10. 28..
//  Copyright © 2015년 DAYEONSSI. All rights reserved.
//

import UIKit

class LocalSectionViewController: UIViewController {

    @IBOutlet weak var seoulMapImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        seoulMapImage.image = UIImage(named: "SeoulMap")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}