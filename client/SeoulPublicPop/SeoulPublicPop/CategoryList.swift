//
//  CategoryModelReader.swift
//  SeoulPublicPop
//
//  Created by pacilo on 2015. 10. 27..
//  Copyright © 2015년 DAYEONSSI. All rights reserved.
//

import UIKit

class CategoryList: CategoryModel {
    
    class func allCategory() -> [CategoryList] {
        var categoryList = [CategoryList]()
        if let URL = NSBundle.mainBundle().URLForResource("Category", withExtension: "plist") {
            if let tutorialsFromPlist = NSArray(contentsOfURL: URL) {
                for dictionary in tutorialsFromPlist {
                    let getDictionary = CategoryList(dictionary: dictionary as! NSDictionary)
                    categoryList.append(getDictionary)
                }
            }
        }
        return categoryList
    }
    
}
