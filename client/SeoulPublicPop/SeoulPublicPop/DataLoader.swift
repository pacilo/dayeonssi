//
//  DataLoader.swift
//  SeoulPublicPop
//
//  Created by 최윤호 on 2015. 10. 27..
//  Copyright © 2015년 DAYEONSSI. All rights reserved.
//

import Foundation
import UIKit
class DataLoader : NSObject, NSXMLParserDelegate {
    
    var server_url = "http://52.68.68.177:8080"
    var completeMethod : (([[String:AnyObject?]]?) ->())?
    var specialParseMethod : ((String,String) -> AnyObject?)?
    var startEnd : String?
    var resParam : [String]?
    var parser = NSXMLParser()
    
    var cur_result : [String:AnyObject?]?
    var cur_element : String?
    var result : [[String:AnyObject?]]?
    
    override init() {
        completeMethod = { (output :[[String:AnyObject?]]?)->() in }
    }
    
    convenience init(url : String)
    {
        self.init()
        server_url = url
    }
    func Start(reqParam : [String:String], resParam : [String], startend : String,
                        callBack :([[String:AnyObject?]]?) ->(),
                        specialParser : ((String,String) -> AnyObject?)? = nil)
    {
        var paramString = "\(server_url)/?"
        //var paramString = ""
        var first = 0
        for key in reqParam.keys
        {
            if first != 0
            {
                paramString += "&"
            }
            first += 1
            
            paramString += "\(key)=\(reqParam[key]!)"
        }
        print(paramString)
        startEnd = startend
        completeMethod = callBack
        specialParseMethod = specialParser
        self.resParam = resParam
        
        let ns = NSURL(string : paramString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
        let request1 = NSMutableURLRequest(URL: ns!)
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request1, completionHandler: {data, response, error -> Void in
            //  println("Response: \(response)")
            self.result = []
            
            self.parser = NSXMLParser(data: data!)
            self.parser.delegate = self
            self.parser.parse()
            self.completeMethod!(self.result)
        })
        
        task.resume()
    }
    
    //텍스트 데이터를 가져오는 섹션
    func parser(parser: NSXMLParser, foundCharacters text: String)
    {
        if let e_name = cur_element     //현재 엘리멘트가 할당되어 있으며
        {
            if resParam!.contains(e_name)   //resParam에 e_name이 존재하면
            {
                if let spm = specialParseMethod
                {
                    if let specialObject = spm(e_name,text)
                    {
                        cur_result![e_name] = specialObject  //해당 결과를 저장함
                    }
                    else
                    {
                        cur_result![e_name] = text  //아닐경우 그냥 텍스트 저장

                    }
                }
                else
                {
                    cur_result![e_name] = text  //아닐경우 그냥 텍스트 저장
                }
            }
        }
    }
    
    //엘리멘트의 시작시 호출된다.
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        if startEnd == elementName      //시작하는 엘리먼트일 경우 초기화
        {
            cur_result = [:]
        }
        if resParam!.contains(elementName)  //해당 엘리먼트 네임이 존재할 경우
        {
            cur_element = elementName       //현재 엘리먼트를 초기화
        }
    }
    //엘리멘트의 끝이 발견될 시 호출된다.
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if startEnd == elementName      //끝나는 엘리먼트일 경우 결과값을 더해준다.
        {
            result?.append(cur_result!)
        }
        if resParam!.contains(elementName)  //리스폰 파라미터에 존재하는 경우는 cur을 초기화해줌
        {
            cur_element = nil       //해당 엘리먼트를 초기화
        }
    }
}