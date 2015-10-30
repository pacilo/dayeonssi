//
//  PPMapAnnotationView.swift
//  SeoulPublicPop
//
//  Created by 최윤호 on 2015. 10. 30..
//  Copyright © 2015년 DAYEONSSI. All rights reserved.
//

import UIKit
import MapKit

class PPMapAnnotationView: MKAnnotationView {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // Called when drawing the AttractionAnnotationView
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        
   //     if self.annotation is PPMapAnnotation
     //   {
            //let ppano = self.annotation as! PPMapAnnotation
            //image = UIImage(named : "testAnnotationIcon")
        
       // }
    }
}
