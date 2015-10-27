//
//  MapViewController.swift
//  SeoulPublicPop
//
//  Created by 최윤호 on 2015. 10. 27..
//  Copyright © 2015년 DAYEONSSI. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{
    var locationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // addCategoryPins()
        
        // Do any additional setup after loading the view, typically from a nib.
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
}

/*
    MapView의 기능을 정의하는 부분
    해당 정보에 대해서 모든 정보가 로딩 됐을 때 이 함수를 콜벡으로 호출하게 된다.

extension ViewController: MKMapViewDelegate {
    func addCategoryPins() {
        
        let point = CGPointFromString("{37.494892, 126.956437}")
        let coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(point.x), CLLocationDegrees(point.y))
        let title = "test"
        //  let typeRawValue = "test"
        //  let type : AttractionType
        let subtitle = "test"
        /*
        let annotation = AttractionAnnotation(coordinate: coordinate, title: title, subtitle: subtitle/*, type: type*/)
        mapView.addAnnotation(annotation)
        */
    }
}*/