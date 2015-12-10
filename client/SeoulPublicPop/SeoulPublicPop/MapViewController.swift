//
//  MapViewController.swift
//  SeoulPublicPop
//
//  Created by 최윤호 on 2015. 10. 27..
//  Copyright © 2015년 DAYEONSSI. All rights reserved.
//

import UIKit
import MapKit

class MapViewController : UIViewController, CLLocationManagerDelegate{
    var locationManager:CLLocationManager!
    var annotationDic : [String:PPMapAnnotation] = [:]
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mid = CGPointFromString("{37.57005053895507,126.96868562891434}")
        let circle = CLLocationCoordinate2DMake(CLLocationDegrees(mid.x),CLLocationDegrees(mid.y))
       // let mid2 = CGPointFromString("{34.4194,-118.6012}")
      //  let circle2 = CLLocationCoordinate2DMake(CLLocationDegrees(mid2.x),CLLocationDegrees(mid2.y))
       // let latDelta = circle2.latitude - circle.latitude

        //print(fabs(latDelta))
        let span = MKCoordinateSpanMake(0.005, 0)
        
        let region = MKCoordinateRegionMake(circle, span)
        
        mapView.showsUserLocation = true
        mapView.region = region

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
*/
extension MapViewController: MKMapViewDelegate {
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = PPMapAnnotationView(annotation: annotation, reuseIdentifier: "Attraction")
        annotationView.canShowCallout = true
        
        let calloutButton = UIButton(type: UIButtonType.DetailDisclosure)
        annotationView.rightCalloutAccessoryView = calloutButton
        
        (annotation as! PPMapAnnotation).myview = annotationView
        
        return annotationView
    }
    
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        //파라미터를 준비한다.ß
        let param = DataCenter.DataRequest("다목적실", local_pos: "중랑구", data_range: (limits: 30, offset: 60))
        
        //로드할 객체를 생성한다.
        let loader = DataLoader()
        //로드를 시작한다. 로드 완료 후 콜백 메소드를 호출한다. 현재 이는 클로저로 호출되고 있음
        loader.Start(param.req, resParam: param.res, startend: "info",callBack: { (output : [[String : AnyObject?]]?) -> () in
            for a in output!
            {
                if self.annotationDic[a["id"] as! String] == nil
                {
                    let point = CGPointFromString(a["pos"]as! String)
                    let coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(point.x), CLLocationDegrees(point.y))
                    let title = a["name"] as! String
                    let category = a["category"] as! String
                    let subtitle = a["category"] as! String
                    let annotation = PPMapAnnotation(coordinate: coordinate, title: title, subtitle: subtitle,category : category, id: a["id"] as! String)
                    self.annotationDic[a["id"] as! String] = annotation
                    mapView.addAnnotation(annotation)
                }
            }
        })
        for anno in mapView.annotations
        {
            if anno is PPMapAnnotation
            {
                let a = anno as! PPMapAnnotation
                if a.ischild == false
                {
              //      var tempArr = [MKAnnotation]()
                    for c in mapView.annotations
                    {
                        if c is PPMapAnnotation
                        {
                            if a != c as! PPMapAnnotation
                            {
                                let child = c as! PPMapAnnotation
                                if a.canBeChild(child, _span: mapView.region.span)
                                {
                                    a.addChildAnnotation(child)
                                    mapView.removeAnnotation(c)
                                }
                            }
                        }
                    }
                }
            }
        }
        
        for anno in mapView.annotations
        {
            let a  = anno as! PPMapAnnotation
            
            a.releaseAnnotation(mapView, span: mapView.region.span)
        }
    }
    func mapView(mapView: MKMapView, annotationView: MKAnnotationView, calloutAccessoryControlTapped control: UIControl)
    {
        //get tag here
        /*  if(annotationView.tag == 0){
        //Do for 0 pin
        }
        */
        if control == annotationView.rightCalloutAccessoryView {
          let alert  = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.Alert)
          alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
          self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
   //     mapView.region.
    }
}
