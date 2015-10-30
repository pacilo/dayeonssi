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
        addCategoryPins()
        
            

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
    func addCategoryPins() {
        
        let point = CGPointFromString("{37.57005053895507,126.96868562891434}")
        let coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(point.x), CLLocationDegrees(point.y))
        let title = "test"
        let category = "test"
        let subtitle = "test"
        let annotation = PPMapAnnotation(coordinate: coordinate, title: title, subtitle: subtitle,category : category)
        mapView.addAnnotation(annotation)
        
    }
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = PPMapAnnotationView(annotation: annotation, reuseIdentifier: "Attraction")
        annotationView.canShowCallout = true
        
        
        let calloutButton = UIButton(type: UIButtonType.DetailDisclosure)
        annotationView.rightCalloutAccessoryView = calloutButton
        return annotationView
    }
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("change \(mapView.region.span) chnage = \(mapView.region.center) ")
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
