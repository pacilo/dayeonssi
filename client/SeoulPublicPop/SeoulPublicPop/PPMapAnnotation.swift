//
//  PPMapIcon.swift
//  SeoulPublicPop
//
//  Created by 최윤호 on 2015. 10. 30..
//  Copyright © 2015년 DAYEONSSI. All rights reserved.
//

import UIKit
import MapKit


class PPMapAnnotation : NSObject, MKAnnotation {
    var coordinate : CLLocationCoordinate2D
    var title : String?
    var subtitle : String?
    var category : String?
    
    init(coordinate : CLLocationCoordinate2D, title:String, subtitle:String, category : String)
    {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.category = category
    }
    
    
}