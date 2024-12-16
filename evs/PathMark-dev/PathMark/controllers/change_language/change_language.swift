//
//  change_language.swift
//  PathMark
//
//  Created by Dishant Rajput on 23/01/24.
//

import UIKit
import GoogleMaps
import MapKit

class change_language: UIViewController, MKMapViewDelegate {

    var str_start_screens:String!
    
    var mapView: GMSMapView!
    @IBOutlet weak var customView:UIView! {
        didSet {
            customView.backgroundColor = .white
        }
    }
    
    @IBOutlet weak var navigationBar:UIView! {
        didSet {
            navigationBar.backgroundColor = navigation_color
        }
    }
    
    @IBOutlet weak var btnBack:UIButton! {
        didSet {
            btnBack.tintColor = NAVIGATION_BACK_COLOR
        }
    }
    
    @IBOutlet weak var lblNavigationTitle:UILabel! {
        didSet {
            lblNavigationTitle.text = "Change language"
            lblNavigationTitle.textColor = NAVIGATION_TITLE_COLOR
            lblNavigationTitle.backgroundColor = .clear
        }
    }
    
    // ***************************************************************** // nav
    
    @IBOutlet weak var btn_english:UIButton!
    @IBOutlet weak var btn_bangla:UIButton!
    
    var str_select_language:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btn_english.addTarget(self, action: #selector(english_click_method), for: .touchUpInside)
        self.btn_bangla.addTarget(self, action: #selector(bangla_click_method), for: .touchUpInside)
        
        if let language = UserDefaults.standard.string(forKey: str_language_convert) {
            print(language as Any)
            
            if (language == "en") {
                self.str_select_language = "en"
                self.btn_english.setImage(UIImage(named: "check"), for: .normal)
            } else {
                self.str_select_language = "bn"
                self.btn_bangla.setImage(UIImage(named: "check"), for: .normal)
            }
            
        } else {
            print("=============================")
            print("LOGIN : Select language error")
            print("=============================")
            UserDefaults.standard.set("en", forKey: str_language_convert)
        }
        
        if (self.str_start_screens != nil) {
            self.btnBack.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        } else {
            self.sideBarMenuClick()
        }
        
        
    }
    
    @objc func sideBarMenuClick() {
        
        if revealViewController() != nil {
            
            self.btnBack.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            
            revealViewController().rearViewRevealWidth = 300
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }
    
    @objc func english_click_method() {
        self.btn_english.setImage(UIImage(named: "check"), for: .normal)
        self.btn_bangla.setImage(UIImage(named: "un_check"), for: .normal)
        UserDefaults.standard.set("en", forKey: str_language_convert)
    }
    
    @objc func bangla_click_method() {
        self.btn_english.setImage(UIImage(named: "un_check"), for: .normal)
        self.btn_bangla.setImage(UIImage(named: "check"), for: .normal)
        UserDefaults.standard.set("bn", forKey: str_language_convert)
    }
    
    
    
    
    /*@objc func handleEveythingFromGoogleMapInit() {
        
        self.initializeMap()
    }
    
    func initializeMap() {
        
        let camera = GMSCameraPosition.camera(withLatitude: 13.7150, longitude: 100.5335, zoom: 10.0)
        mapView = GMSMapView(frame: .zero)
        mapView.camera = camera
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: self.customView.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.customView.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: self.customView.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.customView.bottomAnchor)
        ])
        
        self.customView.bringSubviewToFront(navigationBar)
//        self.customView.bringSubviewToFront(cell.view_big)
        
        let placeACoordinate = CLLocationCoordinate2D(latitude: 13.7150, longitude: 100.5335)
        let placeBCoordinate = CLLocationCoordinate2D(latitude: 13.7210, longitude: 100.5141)
        
        addMarker(at: placeACoordinate, title: "Origin", snippet: "Pickup", color: .green)
        addMarker(at: placeBCoordinate, title: "Destination", snippet: "Drop", color: .yellow)
        
        fetchRoute(from: placeACoordinate, to: placeBCoordinate)
        
    }
    
    
    func addMarker(at position: CLLocationCoordinate2D, title: String, snippet: String,color: UIColor) {
        let marker = GMSMarker()
        marker.position = position
        marker.title = title
        marker.snippet = snippet
        
        // Set marker icon color
        marker.icon = GMSMarker.markerImage(with: color)
        
        marker.map = mapView
    }
    
    func fetchRoute(from start: CLLocationCoordinate2D, to end: CLLocationCoordinate2D) {
//        let origin = "\(self.doublePlaceStartLat!),\(self.doublePlaceStartLong!)"
//        let destination = "\(self.doublePlaceFinalLat!),\(self.doublePlaceFinalLong!)"
        let apiKey = GOOGLE_MAP_API
        
        debugPrint(origin)
        debugPrint(destination)
        
        ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: "please wait...")
        
        let urlString = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&key=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Network error")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let routes = json["routes"] as? [[String: Any]],
                   let route = routes.first,
                   let overviewPolyline = route["overview_polyline"] as? [String: Any],
                   let points = overviewPolyline["points"] as? String {
                    
                    DispatchQueue.main.async {
                        self.drawPath(fromEncodedPath: points)
                    }
                }
            } catch {
                print("JSON parsing error")
            }
        }
        
        task.resume()
    }
    
    func drawPath(fromEncodedPath encodedPath: String) {
        guard let path = GMSPath(fromEncodedPath: encodedPath) else {
            print("Failed to decode path")
            return
        }
        
        let polyline = GMSPolyline(path: path)
        polyline.strokeColor = .blue
        polyline.strokeWidth = 5.0
        polyline.map = mapView
        
        // Call zoom function
        zoomToFitRoute(withPath: path)
    }
    
    func zoomToFitRoute(withPath path: GMSPath) {
        let bounds = GMSCoordinateBounds(path: path)
        let update = GMSCameraUpdate.fit(bounds, withPadding: 100.0)
        mapView.animate(with: update)
        
        ERProgressHud.sharedInstance.hide()
        
    }*/
}
