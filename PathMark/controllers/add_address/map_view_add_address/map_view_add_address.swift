//
//  map_view_add_address.swift
//  PathMark
//
//  Created by Dishant Rajput on 21/11/23.
//

import UIKit
import CoreLocation
import MapKit
import Alamofire
import SDWebImage

// MARK:- LOCATION -
import CoreLocation
import CryptoKit
import JWTDecode

class map_view_add_address: UIViewController , UITextFieldDelegate, CLLocationManagerDelegate , MKMapViewDelegate {
    
    var str_user_select_vehicle:String!
    var str_user_option:String!
    
    var arr_mut_list_of_category:NSMutableArray! = []
    
    let locationManager = CLLocationManager()
    
    // MARK:- SAVE LOCATION STRING -
    var strSaveLatitude:String! = "0.0"
    var strSaveLongitude:String! = "0.0"
    var strSaveCountryName:String!
    var strSaveLocalAddress:String!
    var strSaveLocality:String!
    var strSaveLocalAddressMini:String!
    var strSaveStateName:String!
    var strSaveZipcodeName:String!
    
    // apple maps
    var searchCompleter = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()
    
    var locManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    var countryName:String!
    var stateAndCountry:String!
    var fullAddress:String!
    
    var searchLat:String!
    var searchLong:String!
    
    var str_category_id:String! = "0"
    
    var ar : NSArray!
    var arr_list_of_all_Drivers : NSArray!
    
    var arr_all_locations_pin:NSMutableArray! = []
    
    @IBOutlet weak var view_navigation_bar:UIView! {
        didSet {
            view_navigation_bar.backgroundColor = navigation_color
        }
    }
    
    @IBOutlet weak var view_navigation_title:UILabel! {
        didSet {
            view_navigation_title.text = "Search"
            view_navigation_title.textColor = .white
        }
    }
    
    @IBOutlet weak var searchResultsTableView: UITableView! {
        didSet {
            searchResultsTableView.delegate = self
            searchResultsTableView.dataSource = self
        }
    }
    
    @IBOutlet weak var mapView:MKMapView!
    
    // ***************************************************************** // nav
    
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
            lblNavigationTitle.text = ORDER_FOOD_PAGE_NAVIGATION_TITLE
            lblNavigationTitle.textColor = NAVIGATION_TITLE_COLOR
            lblNavigationTitle.backgroundColor = .clear
        }
    }
    
    // ***************************************************************** // nav
    
    @IBOutlet weak var lbl_location_from:UILabel! {
        didSet {
//            txt_location_from.delegate = self
            /*txt_location_from.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            txt_location_from.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            txt_location_from.layer.shadowOpacity = 1.0
            txt_location_from.layer.shadowRadius = 15.0
            txt_location_from.layer.masksToBounds = false
            txt_location_from.layer.cornerRadius = 15
            txt_location_from.backgroundColor = .white*/
        }
    }
    
    @IBOutlet weak var txt_location_to:UITextField! {
        didSet {
            txt_location_to.delegate = self
            /*txt_location_to.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            txt_location_to.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            txt_location_to.layer.shadowOpacity = 1.0
            txt_location_to.layer.shadowRadius = 15.0
            txt_location_to.layer.masksToBounds = false
            txt_location_to.layer.cornerRadius = 15
            txt_location_to.backgroundColor = .white*/
        }
    }
    
    @IBOutlet weak var viewCellbg:UIView! {
        didSet {
            viewCellbg.layer.cornerRadius = 8
            viewCellbg.clipsToBounds = true
            viewCellbg.backgroundColor = UIColor.init(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1)
            
            viewCellbg.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            viewCellbg.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            viewCellbg.layer.shadowOpacity = 1.0
            viewCellbg.layer.shadowRadius = 15.0
            viewCellbg.layer.masksToBounds = false
            viewCellbg.backgroundColor = .white
            
            
        }
    }
    
   
    
    @IBOutlet weak var btn_get_current_location:UIButton! {
        didSet {
            
        }
    }
    
    var counter = 2
    var timer:Timer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.btnBack.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        
         self.current_location_click_method()
        
        // apple maps
        self.mapView.delegate = self
        self.searchCompleter.delegate = self
        self.searchResultsTableView.isHidden = true
        
        self.annotationsOnMap()
        
        self.stateAndCountry = "0"
        self.fullAddress = "0"
        
        self.searchLat = "0"
        self.searchLong = "0"
        
    }
    
   
    
    @objc func current_location_click_method() {
        
         self.iAmHereForLocationPermission()
    }
    
    @objc func iAmHereForLocationPermission() {
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
              
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                print("No access")
                self.strSaveLatitude = "0"
                self.strSaveLongitude = "0"
                
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
                          
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.startUpdatingLocation()
                      
            @unknown default:
                break
            }
        }
    }
    
    
    
    /// **************************************************************
    /// ************* ALL ANNOTATIONS ON MAP *********************************
    /// **************************************************************
    func annotationsOnMap() {
        
        for location in 0..<arr_all_locations_pin.count {
            let item = self.arr_all_locations_pin[location] as? [String:Any]
            
            let annotation = MKPointAnnotation()
            annotation.title = (item!["fullName"] as! String)
            annotation.coordinate = CLLocationCoordinate2D(latitude: Double(item!["latitude"] as! String)! ,
                                                           longitude: Double(item!["longitude"] as! String)!)
            
            self.mapView.addAnnotation(annotation)
        }
        
        
        let my_lat = String(self.strSaveLatitude)
        let my_long = String(self.strSaveLongitude)
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Double(my_lat)! ,
                                                                       longitude: Double(my_long)!)
                                                                       , span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        self.mapView.setRegion(region, animated: true)
        
        
        self.hide_loading_UI()
        
    }
    
    /// **************************************************************
    /// ************* RIDE NOW CLICK *********************************
    /// **************************************************************
    @objc func ride_now_click_method() {
        
        if self.str_category_id == "0" {
            
            let alert = NewYorkAlertController(title: String("Alert"), message: String("Please select atleast one vehicle"), style: .alert)
            let cancel = NewYorkButton(title: "dismiss", style: .cancel)
            alert.addButtons([cancel])
            present(alert, animated: true)
            
        } else {
        
            if (self.str_user_option == "schedule") {
                
                let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "schedule_a_ride_id") as? schedule_a_ride
 
                push!.str_get_category_id = String(self.str_category_id)
                push!.str_from_location = String(self.lbl_location_from.text!)
                push!.str_to_location = String(self.stateAndCountry)+" "+String(self.stateAndCountry)

                push!.my_location_lat = String(self.strSaveLatitude)
                push!.my_location_long = String(self.strSaveLongitude)

                push!.searched_place_location_lat = String(self.searchLat)
                push!.searched_place_location_long = String(self.searchLong)

                self.navigationController?.pushViewController(push!, animated: true)
                
            } else {
                
                let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "total_fare_distance_mpa_route_id") as? total_fare_distance_mpa_route

                push!.str_get_category_id = String(self.str_category_id)
                push!.str_from_location = String(self.lbl_location_from.text!)
                push!.str_to_location = String(self.stateAndCountry)+" "+String(self.stateAndCountry)

                push!.my_location_lat = String(self.strSaveLatitude)
                push!.my_location_long = String(self.strSaveLongitude)

                push!.searched_place_location_lat = String(self.searchLat)
                push!.searched_place_location_long = String(self.searchLong)

                self.navigationController?.pushViewController(push!, animated: true)
                
            }
            
        }
        
        
    }
    
    
    /// **************************************************************
    /// ************* API - LIST OF ALL CAR CATEGORY *****************
    /// **************************************************************
    
    @objc func list_of_all_category_WB() {
        //        if let token_id_is = UserDefaults.standard.string(forKey: str_save_last_api_token) {
        // let str:String = person["role"] as! String
        //            print(token_id_is)
        
        /*let headers: HTTPHeaders = [
         "token":String(token_id_is),
         // "Content-Type":"Application/json"
         ]*/
        
        self.view.endEditing(true)
        
        
        // ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: "Please wait...")
        
        // let params = main_token(body: get_encrpyt_token)
        let params = payload_vehicle_list(action: "category",
                                          TYPE: String(self.str_user_select_vehicle))
        
        print(params as Any)
        
        AF.request(application_base_url,
                   method: .post,
                   parameters: params,
                   encoder: JSONParameterEncoder.default
                   /*headers: headers*/).responseJSON {  response in
            
            debugPrint(params)
            
            switch(response.result) {
            case .success(_):
                if let data = response.value {
                    
                    let JSON = data as! NSDictionary
                    print(JSON)
                    
                    var strSuccess : String!
                    strSuccess = JSON["status"] as? String
                    
                    //                        var dict: Dictionary<AnyHashable, Any>
                    //                        dict = JSON["data"] as! Dictionary<AnyHashable, Any>
                    
                    if strSuccess.lowercased() == "success" {
                        
                        self.ar = (JSON["data"] as! Array<Any>) as NSArray
                        
                        for indexx in 0..<self.ar.count {
                            
                            let item = self.ar[indexx] as? [String:Any]
                            
                            let custom_dict = ["id":"\(item!["id"]!)",
                                               "name":(item!["name"] as! String),
                                               "image":(item!["image"] as! String),
                                               "status":"no",
                                               "perMile":"\(item!["perMile"]!)",
                                               "TYPE":(item!["TYPE"] as! String)]
                            
                            self.arr_mut_list_of_category.add(custom_dict)
                            
                        }
                        
                        self.hide_loading_UI()
                        
                    }
                    else {
                        self.hide_loading_UI()
                    }
                    
                }
                
            case .failure(_):
                print("Error message:\(String(describing: response.error))")
                self.hide_loading_UI()
                self.please_check_your_internet_connection()
                
                break
            }
            
        }
        //        } else {
        //            print("TOKEN NOT SAVED.")
        //        }
    }
    
    func postAction() {
        let Url = String(format: application_base_url)
        guard let serviceUrl = URL(string: Url) else { return }
        let parameterDictionary = ["username" : "Test", "password" : "123456"]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func decode(jwtToken jwt: String) -> [String: Any] {
      let segments = jwt.components(separatedBy: ".")
      return decodeJWTPart(segments[1]) ?? [:]
    }

    func base64UrlDecode(_ value: String) -> Data? {
      var base64 = value
        .replacingOccurrences(of: "-", with: "+")
        .replacingOccurrences(of: "_", with: "/")

      let length = Double(base64.lengthOfBytes(using: String.Encoding.utf8))
      let requiredLength = 4 * ceil(length / 4.0)
      let paddingLength = requiredLength - length
      if paddingLength > 0 {
        let padding = "".padding(toLength: Int(paddingLength), withPad: "=", startingAt: 0)
        base64 = base64 + padding
      }
      return Data(base64Encoded: base64, options: .ignoreUnknownCharacters)
    }

    func decodeJWTPart(_ value: String) -> [String: Any]? {
      guard let bodyData = base64UrlDecode(value),
        let json = try? JSONSerialization.jsonObject(with: bodyData, options: []), let payload = json as? [String: Any] else {
          return nil
      }

      return payload
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    // apple maps
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        // let indexPath = IndexPath.init(row: 0, section: 0)
        // let cell = self.tbleView.cellForRow(at: indexPath) as! PDBagPurchaseTableCell
        
        let location = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
        location.fetchCityAndCountry { city, country, zipcode,localAddress,localAddressMini,locality, error in
            guard let city = city, let country = country,let zipcode = zipcode,let localAddress = localAddress,let localAddressMini = localAddressMini,let locality = locality, error == nil else { return }
            
            self.strSaveCountryName     = country
            self.strSaveStateName       = city
            self.strSaveZipcodeName     = zipcode
            
            self.strSaveLocalAddress     = localAddress
            self.strSaveLocality         = locality
            self.strSaveLocalAddressMini = localAddressMini

            let doubleLat = locValue.latitude
            let doubleStringLat = String(doubleLat)
            
            let doubleLong = locValue.longitude
            let doubleStringLong = String(doubleLong)
            
            self.strSaveLatitude = String(doubleStringLat)
            self.strSaveLongitude = String(doubleStringLong)
            
            // print("local address ==> "+localAddress as Any) // south west delhi
            // print("local address mini ==> "+localAddressMini as Any) // new delhi
            // print("locality ==> "+locality as Any) // sector 10 dwarka
            
            // print(self.strSaveCountryName as Any) // india
            // print(self.strSaveStateName as Any) // new delhi
            // print(self.strSaveZipcodeName as Any) // 110075
            
            var str_locality = String(self.strSaveLocality)
            var str_local_address = String(self.strSaveLocalAddress)
            var str_local_state = String(self.strSaveStateName)
            var str_local_country = String(self.strSaveCountryName)
            let str_local_zipcode = String(self.strSaveZipcodeName)
            
            self.lbl_location_from.text = String(self.strSaveLocality)+", "+String(self.strSaveLocalAddress)+" "+String(self.strSaveStateName)+", "+String(self.strSaveCountryName)+" - "+String(self.strSaveZipcodeName)
            
//            self.lbl_location_from.text = String(self.strSaveLocality)+", "+String(self.strSaveLocalAddress)+" "+String(self.strSaveStateName)+", "+String(self.strSaveCountryName)
            
//            self.lbl_location_from.text = String(self.strSaveLocality)+" "+String(self.strSaveLocalAddress)+" "+String(self.strSaveLocalAddressMini)+","+String(self.strSaveStateName)+","+String(self.strSaveCountryName)
            
            
            /*print(manager.location?.coordinate.latitude as Any)
            print(manager.location?.coordinate.longitude as Any)
            
            let sourceLocation = CLLocationCoordinate2D(latitude: Double((manager.location?.coordinate.latitude)!), longitude: Double((manager.location?.coordinate.longitude)!))*/
            
            /*
             AVGRating = 0;
             address = "";
             contactNumber = 8287632345;
             distance = 0;
             fullName = iDriver5;
             id = 13;
             latitude = "28.587238814653944";
             longitude = "77.06062328401764";
             "profile_picture" = "";
             */
            
            let my_current_location = ["title":"You are here",
                                       "id":"",
                                       "distance":"",
                                       "fullName":"",
                                       "latitude":String(self.strSaveLatitude),
                                       "longitude":String(self.strSaveLongitude)]
            
            self.arr_all_locations_pin.add(my_current_location)
            // print(self.arr_all_locations_pin)
            
            
            /*let sourcePin = customPin(pinTitle: "You", pinSubTitle: "", location: sourceLocation)
            
            self.mapView.removeAnnotations(self.mapView.annotations)
            
            self.mapView.addAnnotation(sourcePin)*/
            
            //MARK:- STOP LOCATION -
            self.locationManager.stopUpdatingLocation()

            

        }
        
    }
    
    @nonobjc func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
            // annotationView?.removeFromSuperview()
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }
    
    @nonobjc func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = MKCoordinateRegion(center: userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        self.mapView.setRegion(region, animated: true)
    }
    
    
}




extension map_view_add_address: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchCompleter.queryFragment = searchText
        
        self.searchResultsTableView.isHidden = false
    }
}

extension map_view_add_address: MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        searchResultsTableView.reloadData()
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        // handle error
    }
}

extension map_view_add_address: UITableViewDataSource , UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let searchResult = searchResults[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = searchResult.title
        cell.detailTextLabel?.text = searchResult.subtitle
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.view.endEditing(true)
        
        self.searchResultsTableView.isHidden = true
        // mapView.removeOverlay(T##overlay: MKOverlay##MKOverlay)
        
        // let overlays = self.mapView.overlays
        // self.mapView.removeOverlays(overlays)
        
        // self.mapView.removeAnnotation:self.mapView.annotations.lastObject
        
        if self.mapView.annotations.isEmpty != true {
            self.mapView.removeAnnotation(self.mapView.annotations.last!)
        }
        
        
        // here all prevoius annotations removed before insert new
        self.mapView.removeAnnotations(self.mapView.annotations)
        
        
        
        let completion = searchResults[indexPath.row]
        
        print(completion.title as Any)
        print(completion.subtitle as Any)
        
        UserDefaults.standard.synchronize()
        
        let searchRequest = MKLocalSearch.Request(completion: completion)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start { [self] (response, error) in
            let coordinate = response?.mapItems[0].placemark.coordinate
            // print(String(describing: coordinate?.latitude))
            // print(String(describing: coordinate?.longitude))
            
            print(Double(coordinate!.latitude))
            print(Double(coordinate!.longitude))
            
            // let fullAddress = completion.title+" "+completion.subtitle
            
            self.stateAndCountry = String(completion.title)
            self.fullAddress = String(completion.subtitle)
            
            self.searchLat = String(coordinate!.latitude)
            self.searchLong = String(coordinate!.longitude)
            
            UserDefaults.standard.set(String(self.searchLat), forKey: "key_save_lat_for_address")
            UserDefaults.standard.set(String(self.searchLong), forKey: "key_save_long_for_address")
            UserDefaults.standard.set(completion.title+","+completion.subtitle, forKey: "key_save_full_address_for_address")
            
            /*UserDefaults.standard.set(completion.title, forKey: "keySaveLocation")
            UserDefaults.standard.set(fullAddress, forKey: "keySaveFullAddress")
            UserDefaults.standard.set(Double(coordinate!.latitude), forKey: "keySaveLatitude")
            UserDefaults.standard.set(Double(coordinate!.longitude), forKey: "keySaveLongitude")*/
            
            let london = MKPointAnnotation()
            london.title = completion.title
            london.subtitle = completion.subtitle
            mapView.delegate = self
            london.coordinate = CLLocationCoordinate2D(latitude: coordinate!.latitude, longitude: coordinate!.longitude)
            mapView.removeAnnotation(london)
            mapView.addAnnotation(london)
            
            
            var zoomRect: MKMapRect = MKMapRect.null
            for annotation in mapView.annotations {
                    let annotationPoint = MKMapPoint(annotation.coordinate)
                    let pointRect = MKMapRect(x: annotationPoint.x, y: annotationPoint.y, width: 0.1, height: 0.1)
                    zoomRect = zoomRect.union(pointRect)
            }
            // mapView.setVisibleMapRect(zoomRect, animated: true)
            
            self.mapView.setVisibleMapRect(zoomRect, edgePadding: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50), animated: true)
            
            
            self.locManager.stopUpdatingLocation()
            //
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}

