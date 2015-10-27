//
//  ViewController.swift
//  Map
//
//  Created by 최윤호 on 2015. 10. 26..
//  Copyright © 2015년 dytdy. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{
    var locationManager:CLLocationManager!
    @IBOutlet weak var mapView: MKMapView!
    var circle = PPCircle(filename: "MagicMountain")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let latDelta = circle.overlayTopLeftCoordinate.latitude -
            circle.overlayBottomRightCoordinate.latitude
        
        // think of a span as a tv size, measure from one corner to another
        let span = MKCoordinateSpanMake(fabs(latDelta), 0.0)
        
        let region = MKCoordinateRegionMake(circle.midCoordinate, span)
        
        mapView.region = region
        
        addAttractionPins()
        
        // Do any additional setup after loading the view, typically from a nib.
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //let span = MKCoordinateSpanMake(fabs(latDelta), 0.0)
        let latDelta = circle.overlayTopLeftCoordinate.latitude -
            circle.overlayBottomRightCoordinate.latitude
        
        // think of a span as a tv size, measure from one corner to another
        let span = MKCoordinateSpanMake(fabs(latDelta), 0.0)

//        mapView.region =
        mapView.setRegion(MKCoordinateRegionMake(locations[0].coordinate,span), animated: true)
        print("locations = \(locations)")
    //    gpsResult.text = "success"
    }
}

extension ViewController: MKMapViewDelegate {
    func addAttractionPins() {
   //     let filePath = NSBundle.mainBundle().pathForResource("MagicMountainAttractions", ofType: "plist")
   //     let attractions = NSArray(contentsOfFile: filePath!)
       /* for attraction in attractions! {
            let point = CGPointFromString(attraction["location"] as! String)
            let coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(point.x), CLLocationDegrees(point.y))
            let title = attraction["name"] as! String
            let typeRawValue = (attraction["type"] as! String)
            let type = AttractionType(rawValue: typeRawValue)!
            let subtitle = attraction["subtitle"] as! String
        */
        let point = CGPointFromString("{37.494892, 126.956437}")
        let coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(point.x), CLLocationDegrees(point.y))
        let title = "test"
      //  let typeRawValue = "test"
      //  let type : AttractionType
        let subtitle = "test"
        
        let annotation = AttractionAnnotation(coordinate: coordinate, title: title, subtitle: subtitle/*, type: type*/)
        mapView.addAnnotation(annotation)
        
    }
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = AttractionAnnotationView(annotation: annotation, reuseIdentifier: "Attraction")
        annotationView.canShowCallout = true
        let calloutButton = UIButton(type: UIButtonType.DetailDisclosure)
        annotationView.rightCalloutAccessoryView = calloutButton
        return annotationView
    }
    func mapView(mapView: MKMapView, annotationView: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
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
}