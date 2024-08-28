//
//  select_location_via_name.swift
//  PathMark
//
//  Created by Dishant Rajput on 28/08/24.
//

import UIKit
import GoogleMaps
import GooglePlaces

class select_location_via_name: UIViewController,UITextFieldDelegate, CLLocationManagerDelegate {
    
    var userSelectOriginOrDestination:String!
    
    var placesClient: GMSPlacesClient!
    var predictions: [GMSAutocompletePrediction] = []
    
    var db:DBHelper = DBHelper()
    var persons:[Person] = []
    
    
    @IBOutlet weak var btnBack:UIButton! {
        didSet {
            btnBack.tintColor = .black
            btnBack.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var txtSearchGoogleLocation:UITextField!
    
    @IBOutlet weak var btnSearchGoogle:UIButton!
    
    @IBOutlet weak var viewMainSearch:UIView! {
        didSet {
            viewMainSearch.layer.cornerRadius = 20
            viewMainSearch.clipsToBounds = true
            viewMainSearch.backgroundColor = .white
            viewMainSearch.layer.masksToBounds = false
            viewMainSearch.layer.shadowColor = UIColor.black.cgColor
            viewMainSearch.layer.shadowOffset =  CGSize.zero
            viewMainSearch.layer.shadowOpacity = 0.5
            viewMainSearch.layer.shadowRadius = 2
            viewMainSearch.layer.cornerRadius = 30
        }
    }
    
    @IBOutlet weak var tableViewForGoogleSearch:UITableView! {
        didSet {
            tableViewForGoogleSearch.delegate = self
            tableViewForGoogleSearch.dataSource = self
        }
    }
    
    
    var mapView: GMSMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        debugPrint(self.userSelectOriginOrDestination as Any)
        
        // init place client
        placesClient = GMSPlacesClient.shared()
        
        self.txtSearchGoogleLocation.delegate = self
        
        self.initGoogleMap()
    }
    
    @objc func initGoogleMap() {
        // Set up mapView
        let camera = GMSCameraPosition.camera(withLatitude: 0, longitude: 0, zoom: 10.0)
        mapView = GMSMapView(frame: self.view.bounds, camera: camera)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        
        // Set up constraints for mapView
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Set up location manager
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        
        self.view.bringSubviewToFront(self.viewMainSearch)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                                  longitude: location.coordinate.longitude,
                                                  zoom: 15.0)
            mapView.animate(to: camera)
            
            // Add marker at user's location
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                     longitude: location.coordinate.longitude)
            marker.title = "You are here"
            marker.map = mapView
            
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        searchPlaces(query: updatedText)
        return true
    }
    
    func searchPlaces(query: String) {
        if query.isEmpty {
            predictions = []
            // tableViewForGoogleSearch.isHidden = true
            // tableViewForGoogleSearch.reloadData()
            return
        }
        
        let filter = GMSAutocompleteFilter()
        filter.type = .noFilter
        // filter.countries = [countryCodeForGoogleSearch]
        
        placesClient.findAutocompletePredictions(fromQuery: query,
                                                 filter: filter,
                                                 sessionToken: nil) { (results, error) in
            
            if let error = error {
                print("Error finding places: \(error.localizedDescription)")
                return
            }
            
            // self.tableViewForGoogleSearch.isHidden = false
            self.predictions = results ?? []
            self.tableViewForGoogleSearch.isHidden = self.predictions.isEmpty
            self.view.bringSubviewToFront(self.tableViewForGoogleSearch)
            self.tableViewForGoogleSearch.reloadData()
            // self.tableViewForGoogleSearch.reloadData()
        }
    }
    
    
    // import GooglePlaces
    
    func getCoordinates(for placeID: String, completion: @escaping (CLLocationCoordinate2D?, Error?) -> Void) {
        let placesClient = GMSPlacesClient.shared()
        
        placesClient.fetchPlace(fromPlaceID: placeID, placeFields: .coordinate, sessionToken: nil) { (place, error) in
            if let error = error {
                print("Error fetching place details: \(error.localizedDescription)")
                completion(nil, error)
                return
            }
            
            if let place = place {
                let coordinates = place.coordinate
                print("Latitude: \(coordinates.latitude), Longitude: \(coordinates.longitude)")
                completion(coordinates, nil)
            } else {
                completion(nil, NSError(domain: "Place not found", code: 404, userInfo: nil))
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}

extension select_location_via_name: UITableViewDataSource , UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.predictions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:select_location_via_nameTableViewCell = tableView.dequeueReusableCell(withIdentifier: "select_location_via_nameTableViewCell") as! select_location_via_nameTableViewCell
        print(predictions[indexPath.row])
        
        let prediction = predictions[indexPath.row]
        cell.lblLocationName.text = prediction.attributedFullText.string
        // cell.lblLocationName.text = prediction.attributedFullText.string
        
        return cell
      
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        
        let prediction = predictions[indexPath.row]
        // print(prediction.placeID as Any)
        
        let placeID = prediction.placeID
        // print(placeID as Any)
        getCoordinates(for: placeID) { coordinates, error in
            if let error = error {
                // print("Error: \(error.localizedDescription)")
            } else if let coordinates = coordinates {
                // print("Latitude: \(coordinates.latitude), Longitude: \(coordinates.longitude)")
                
                debugPrint("\(coordinates.latitude),\(coordinates.longitude)")
                debugPrint(prediction.attributedFullText.string)
                
                UserDefaults.standard.set("\(coordinates.latitude),\(coordinates.longitude)", forKey: "key_map_view_lat_long")
                UserDefaults.standard.set(prediction.attributedFullText.string, forKey: "key_map_view_address")
                
                let randomCGFloat = Int.random(in: 1...1000)
                // print(randomCGFloat as Any)
                self.db.insert(id: randomCGFloat, name: prediction.attributedFullText.string,
                               lat_long: "\(coordinates.latitude),\(coordinates.longitude)",
                               age: 2)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.navigationController?.popViewController(animated: true)
                }
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

class select_location_via_nameTableViewCell: UITableViewCell {
    @IBOutlet weak var lblLocationName:UILabel!
}
