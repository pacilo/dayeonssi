//
//  CategoryModel.swift
//  SeoulPublicPop
//
//  Created by pacilo on 2015. 10. 27..
//  Copyright © 2015년 DAYEONSSI. All rights reserved.
//

import UIKit

class Model {

    var title: String
    var backgroundImage: UIImage
    
    init(title: String, backgroundImage: UIImage) {
        self.title = title
        self.backgroundImage = backgroundImage
    }
    
    convenience init(dictionary: NSDictionary) {
        let title = dictionary["Title"] as? String
        let backgroundName = dictionary["Background"] as? String
        let backgroundImage = UIImage(named: backgroundName!)
        self.init(title: title!, backgroundImage: backgroundImage!.decompressedImage)
    }

}
