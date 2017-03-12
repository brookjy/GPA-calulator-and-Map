//
//  ThirdViewController.swift
//  thinkingcat
//
//  Created by Yi Jin on 2017-03-12.
//  Copyright © 2017 Yi Jin. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps;

class ThirdViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*-----------Set camera------------*/
        let camera = GMSCameraPosition.cameraWithLatitude(48.461162,
            longitude: -123.310794, zoom: 16)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        self.view = mapView
        
        /*-----------Set Marker------------*/
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(48.461162, -123.310794)
        marker.title = "CSC110 Final"
        marker.snippet = "Room: ECS 124 \nStart time: 1:15pm"
        marker.map = mapView
    }
    
}