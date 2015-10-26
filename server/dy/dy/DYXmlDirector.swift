//
//  DYXmlDirector.swift
//  dy
//
//  Created by 최윤호 on 2015. 10. 25..
//  Copyright © 2015년 dytdy. All rights reserved.
//

import Foundation

class DYXmlDirector : NSObject , NSXMLParserDelegate {
    
    var server_url = "http://54.64.30.51"
    var completeCallBack : ([XmlFormat]?)->()
    var parser = NSXMLParser()
    
    var cur_element : String?
    var result : [XmlFormat]?
    var info : XmlFormat?
    var title1 : String!
    var date : String!
    
    
    override init() {
        completeCallBack = { (output :[XmlFormat]?)->() in }    }
    
    convenience init(url : String)
    {
        self.init()
        server_url = url
    }
    
    func GetServerData(category : String, local_pos : String, data_range : (limits : Int,offset :Int), callback : ([XmlFormat]?)->Void) -> [XmlFormat]?
    {

        var param = server_url;
        param+="/?category="
        param+=category
        param+="&type=gu&local_pos="
        param+=local_pos
        param+="&limits="
        param+=String(data_range.limits)
        param+="&offset="
        param+=String(data_range.offset)
        
        completeCallBack = callback
        
        let ns = NSURL(string : param.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
        let request1 = NSMutableURLRequest(URL: ns!)
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request1, completionHandler: {data, response, error -> Void in
            //  println("Response: \(response)")
            self.result = []
            print(param)
            self.parser = NSXMLParser(data: data!)
            self.parser.delegate = self
            self.parser.parse()
            self.completeCallBack(self.result)
        })
        
        task.resume()
        
        
        return result
    }
    func parser(parser: NSXMLParser, foundCharacters string: String)
    {
        if let e = cur_element
        {
            if info == nil || string == "\n" || string == "" {
                return
            }
            
            switch(e)
            {
            case "category":
                info!.category = string
                break;
            case "loca":
                info!.location = string
                break;
            case "name":
                info!.name = string
                break;
            case "posx":
                info!.position.x = Double(string)!
                break;
            case "posy":
                info!.position.y = Double(string)!
                break;
            case "website":
                info!.website = string
                break;
            case "realaddr":
                info!.realaddr = string
                break;
            case "phone":
                info!.phone = string
                break;
            default:
                break;
            }
        }
    }
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        cur_element = elementName
        if cur_element == "info"
        {
            info = XmlFormat()
        }
    }
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if elementName == "info" && result != nil && info != nil
        {
            result!.append(info!)
        }
    }
    override func isEqual(anObject: AnyObject?) -> Bool {
        return super.isEqual(anObject)
    }
}
public struct XmlFormat
{
    static let CATEGORY_NMS = ["NONE","체육시설","다목적실","세미나실","실습실","문화공연전시","화장실"]
    init(){
        category = ""
        location = ""
        name = ""
        position = (0,0)
        website = ""
        realaddr = ""
        phone = ""
    }
    var category    : String
    var location    : String
    var name        : String
    var position    : (x : Double, y : Double)
    var website     : String
    var realaddr    : String
    var phone       : String
}
