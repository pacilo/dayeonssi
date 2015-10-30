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
        frame
        super.init(frame: frame)
    }
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
     //   if self.annotation is PPMapAnnotation
    //   {
            let ppano = self.annotation as! PPMapAnnotation
            image = UIImage(named : "testAnnotationIcon")
            layer.cornerRadius = frame.size.width / 2
            backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0)
        
        let label = UILabel(frame: frame)
        label.text = "1"
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor(red: CGFloat(0xff)/255, green: CGFloat(0xd7)/255, blue: CGFloat(0x00)/255, alpha: 1)
        label.center = CGPointMake(frame.size.width  / 2, frame.size.height / 2);
        //label.sizeToFit()
        addSubview(label)
        //   }
    }
}
