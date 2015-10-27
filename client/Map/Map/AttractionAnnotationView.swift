//
//  AttractionAnnotationView.swift
//  Map
//
//  Created by 최윤호 on 2015. 10. 27..
//  Copyright © 2015년 dytdy. All rights reserved.
//
import UIKit
import MapKit

class AttractionAnnotationView: MKAnnotationView {
    // Required for MKAnnotationView
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // Called when drawing the AttractionAnnotationView
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        image = UIImage(named : "test")
        /*
        let attractionAnnotation = self.annotation as! AttractionAnnotation
        switch (attractionAnnotation.type) {
        case .AttractionFirstAid:
            image = UIImage(named: "firstaid")
        case .AttractionFood:
            image = UIImage(named: "food")
        case .AttractionRide:
            image = UIImage(named: "ride")
        default:
            image = UIImage(named: "star")
        }*/
    }
}