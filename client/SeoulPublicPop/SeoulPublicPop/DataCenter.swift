//
//  DataCenter.swift
//  SeoulPublicPop
//
//  Created by 최윤호 on 2015. 10. 27..
//  Copyright © 2015년 DAYEONSSI. All rights reserved.
//

import Foundation

class DataCenter
{
    static func DataRequest(category : String, local_pos : String, data_range : (limits : Int,offset :Int)) ->(req : [String:String], res : [String])
    {
        var reqList = [String:String]()
        var resList = [String]()
        
        reqList["category"] = category
        reqList["type"] = "gu"
        reqList["local_pos"] = local_pos
        reqList["limits"] = String(data_range.limits)
        reqList["offset"] = String(data_range.offset)
        
        
        if let URL = NSBundle.mainBundle().URLForResource("RespondList", withExtension: "plist") {
            if let respondDic = NSDictionary(contentsOfURL: URL) {
                resList = respondDic["Category-location"] as! Array
            }
        }
        
        return (reqList,resList)
    }
}