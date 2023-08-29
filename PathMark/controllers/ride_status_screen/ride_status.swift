//
//  ride_status.swift
//  PathMark
//
//  Created by Dishant Rajput on 29/08/23.
//

import UIKit
import MapKit
import Alamofire

// MARK:- LOCATION -
import CoreLocation

class ride_status: UIViewController , CLLocationManagerDelegate , MKMapViewDelegate, UITextFieldDelegate {
    
    var dict_get_all_data_from_notification:NSDictionary!
    
    let locationManager = CLLocationManager()
    
    // MARK:- SAVE LOCATION STRING -
    var strSaveLatitude:String! = ""
    var strSaveLongitude:String! = ""
    var strSaveCountryName:String!
    var strSaveLocalAddress:String!
    var strSaveLocality:String!
    var strSaveLocalAddressMini:String!
    var strSaveStateName:String!
    var strSaveZipcodeName:String!
    
    
    var counter = 2
    var timer:Timer!
    
    var myDeviceTokenIs:String!
    
    var locManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    let annotation = MKPointAnnotation()
    let annotation2 = MKPointAnnotation()
    
    var str_from_location:String!
    var str_to_location:String!
    
    // MARK:- MY LOCATION -
    var my_location_lat:String!
    var my_location_long:String!
    
    // MARK:- PLACE LOCATION -
    var searched_place_location_lat:String!
    var searched_place_location_long:String!
    
    var str_get_category_id:String!
    
    var str_fetch_payment_method:String!
    var str_fetch_duration:String!
    var str_fetch_distance:String!
    var str_fetch_fare_estimated:String!
    
    var str_total_distance:String! = ""
    var str_total_duration:String! = ""
    var str_total_rupees:String! = ""
    
    // ***************************************************************** // nav
    
    @IBOutlet weak var navigationBar:UIView! {
        didSet {
            navigationBar.backgroundColor = navigation_color
        }
    }
    
    @IBOutlet weak var btnBack:UIButton! {
        didSet {
            btnBack.setImage(UIImage(systemName: "arrow.left"), for: .normal)
            btnBack.tintColor = NAVIGATION_BACK_COLOR
            btnBack.isHidden = true
        }
    }
    
    @IBOutlet weak var lblNavigationTitle:UILabel! {
        didSet {
            lblNavigationTitle.text = "Fare distance"
            lblNavigationTitle.textColor = NAVIGATION_TITLE_COLOR
            lblNavigationTitle.backgroundColor = .clear
        }
    }
    
    let cellReuseIdentifier = "dFareDistanceTableViewCell"
    
    @IBOutlet weak var tbleView:UITableView!
    
    @IBOutlet weak var btnConfirmBooking:UIButton! {
        didSet {
            btnConfirmBooking.backgroundColor = .systemGreen
            btnConfirmBooking.setTitle("Confirm booking", for: .normal)
        }
    }
    
//    @IBOutlet weak var mapView:MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        // keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.btnBack.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        
        // self.btnConfirmBooking.addTarget(self, action: #selector(validation_before_confirm_booking), for: .touchUpInside)
        
        self.show_loading_UI()
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

        self.tbleView.delegate = self
        self.tbleView.dataSource = self
        
        self.tbleView.reloadData()
        // self.iAmHereForLocationPermission()
        
        /*
         DriverImage = "";
         RequestDropAddress = "Modinagar Modinagar";
         RequestDropLatLong = "28.835619,77.569403";
         RequestPickupAddress = "Sector 10 Dwarka South West Delhi New Delhi,New Delhi,India";
         RequestPickupLatLong = "28.587152917200502,77.06061415697155";
         VehicleColor = red;
         aps =     {
             alert = "iDriver5 has confirmed your booling.";
         };
         bookingId = 87;
         driverContact = 8287632345;
         driverId = 13;
         driverLatitude = "28.587238814653944";
         driverName = iDriver5;
         driverlongitude = "77.06062328401764";
         "gcm.message_id" = 1693292390930120;
         "google.c.a.e" = 1;
         "google.c.fid" = cwFMTZl0K0fpkfcPMinYSO;
         "google.c.sender.id" = 750959835757;
         message = "iDriver5 has confirmed your booling.";
         rating = 0;
         type = confirm;
         vehicleNumber = dl007;
         */
        
        if (self.dict_get_all_data_from_notification == nil) {
            
        } else {
            if (self.dict_get_all_data_from_notification["type"] as! String) == "confirm" {
                
                self.lblNavigationTitle.text = "Confirmed"
                self.navigationBar.backgroundColor = UIColor.init(red: 104.0/255.0, green: 218.0/255.0, blue: 134.0/255.0, alpha: 1)
                
            } else if (self.dict_get_all_data_from_notification["type"] as! String) == "arrived" {
                
                self.lblNavigationTitle.text = "Driver is arrived at your location"
                self.navigationBar.backgroundColor = .systemOrange
                
            }  else if (self.dict_get_all_data_from_notification["type"] as! String) == "ridestart" {
                
                self.lblNavigationTitle.text = "On Trip"
                self.navigationBar.backgroundColor = .systemPurple
                
            }   else if (self.dict_get_all_data_from_notification["type"] as! String) == "rideend" {
                
                self.lblNavigationTitle.text = "Ride Complete - Please pay"
                self.navigationBar.backgroundColor = .systemPurple
                
            }
            
            print("=========================================")
            print("=========================================")
            print(self.dict_get_all_data_from_notification as Any)
            print("=========================================")
            print("=========================================")
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @objc func updateCounter() {
        
        if (counter == 2) {
            counter -= 1
        } else if (counter == 1) {
            counter -= 1
            self.hide_loading_UI()
        } else if (counter == 0) {
            timer.invalidate()
        }

    }
    
    
    @objc func iAmHereForLocationPermission() {
        // Ask for Authorisation from the User.
        self.locManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                print("No access")
                // self.strSaveLatitude = "0"
                // self.strSaveLongitude = "0"
                
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
                
                locManager.delegate = self
                locManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locManager.startUpdatingLocation()
                
            @unknown default:
                break
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        let location = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
         print(location)
        
        self.strSaveLatitude = "\(locValue.latitude)"
        self.strSaveLongitude = "\(locValue.longitude)"
        
        self.tbleView.delegate = self
        self.tbleView.dataSource = self
        self.tbleView.reloadData()
        
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tbleView.cellForRow(at: indexPath) as! ride_status_table_cell
        
        // cell.lblStartingLocation.text = String(self.str_from_location)
        // cell.lblEndLocation.text = String(self.str_to_location)
        cell.viewCellbg.isHidden = false
        
        // print(self.str_from_location as Any)
        // print(self.str_to_location as Any)
        
        cell.lbl_from.text = String(self.str_from_location)
        cell.lbl_to.text = String(self.str_to_location)
        
        print("**********************")
        
        let restaurantLatitudeDouble    = Double(self.searched_place_location_lat)
        let restaurantLongitudeDouble   = Double(self.searched_place_location_long)
        let driverLatitudeDouble        = Double(self.my_location_lat)
        let driverLongitudeDouble       = Double(self.my_location_long)
        
        let coordinate₀ = CLLocation(latitude: restaurantLatitudeDouble!, longitude: restaurantLongitudeDouble!)
        let coordinate₁ = CLLocation(latitude: driverLatitudeDouble!, longitude: driverLongitudeDouble!)
        
        /************************************** RESTAURANT LATITUTDE AND LINGITUDE  ********************************/
        // first location
        let sourceLocation = CLLocationCoordinate2D(latitude: restaurantLatitudeDouble!, longitude: restaurantLongitudeDouble!)
        /********************************************************************************************************************/
        
        
        /************************************* DRIVER LATITUTDE AND LINGITUDE ******************************************/
        // second location
        let destinationLocation = CLLocationCoordinate2D(latitude: driverLatitudeDouble!, longitude: driverLongitudeDouble!)
        /********************************************************************************************************************/
        
        //print(sourceLocation)
        //print(destinationLocation)
        
        let sourcePin = customPin(pinTitle: "Drop Location", pinSubTitle: "", location: sourceLocation)
         
        let destinationPin = customPin(pinTitle: "Pick Location", pinSubTitle: "", location: destinationLocation)
        
        /***************** REMOVE PREVIUOS ANNOTATION TO GENERATE NEW ANNOTATION *******************************************/
        cell.mapView.removeAnnotations(cell.mapView.annotations)
        /********************************************************************************************************************/
        
        cell.mapView.addAnnotation(sourcePin)
        cell.mapView.addAnnotation(destinationPin)
        
        let sourcePlaceMark = MKPlacemark(coordinate: sourceLocation)
        let destinationPlaceMark = MKPlacemark(coordinate: destinationLocation)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: sourcePlaceMark)
        directionRequest.destination = MKMapItem(placemark: destinationPlaceMark)
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate { (response, error) in
            guard let directionResonse = response else {
                if let error = error {
                    print("we have error getting directions==\(error.localizedDescription)")
                }
                return
            }
            
            /***************** REMOVE PREVIUOS POLYLINE TO GENERATE NEW POLYLINE *******************************/
            let overlays = cell.mapView.overlays
            cell.mapView.removeOverlays(overlays)
            /************************************************************************************/
            
            
            /***************** GET DISTANCE BETWEEN TWO CORDINATES *******************************/
            
            let distanceInMeters = coordinate₀.distance(from: coordinate₁)
            // print(distanceInMeters as Any)
            
            // remove decimal
            let distanceFloat: Double = (distanceInMeters as Any as! Double)
            
//            cell.lbl_distance.text = (String(format: "%.0f Miles away", distanceFloat/1609.344))
            // cell.lbl_distance.text = (String(format: "%.0f", distanceFloat/1000))
            
            print(String(format: "Distance : %.0f KM away", distanceFloat/1000))
            print(String(format: "Distance : %.0f Miles away", distanceFloat/1609.344))
            
            /************************************************************************/
            
            /***************** GENERATE NEW POLYLINE *******************************/
            
            let route = directionResonse.routes[0]
            cell.mapView.addOverlay(route.polyline, level: .aboveRoads)
            let rect = route.polyline.boundingMapRect
            cell.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            
            /***********************************************************************/
            
        }
        
        cell.mapView.delegate = self
        
        // self.locManager.stopUpdatingLocation()
        
        // self.locManager.startUpdatingLocation()
        
        self.locManager.stopUpdatingLocation()
        
        print("=================================")
        print("LOCATION UPDATE")
        print("=================================")
        
        self.tbleView.reloadData()
        
        // speed = distance / time
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        return renderer
    }
    
     
    
    @objc func validation_before_confirm_booking() {
        
        let alert = NewYorkAlertController(title: String("Alert"), message: String("Are you sure you want to confirm this booking?"), style: .alert)
        
        let yes_confirm = NewYorkButton(title: "yes, confirm", style: .default) {
            _ in

            self.confirm_booking_WB()
        }
        
        let cancel = NewYorkButton(title: "dismiss", style: .destructive) {
            _ in
        }
        
        alert.addButtons([yes_confirm,cancel])
        self.present(alert, animated: true)
        
    }
    
    // MARK:- GET TOTAL DISTANCE FARE -
    @objc func confirm_booking_WB() {
        
        self.view.endEditing(true)

    }
    
}


//MARK:- TABLE VIEW -
extension ride_status: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ride_status_table_cell = tableView.dequeueReusableCell(withIdentifier: "ride_status_table_cell") as! ride_status_table_cell
        
        cell.backgroundColor = .white
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        /*
         DriverImage = "";
         RequestDropAddress = "Modinagar Modinagar";
         RequestDropLatLong = "28.835619,77.569403";
         RequestPickupAddress = "Sector 10 Dwarka South West Delhi New Delhi,New Delhi,India";
         RequestPickupLatLong = "28.587152917200502,77.06061415697155";
         VehicleColor = red;
         aps =     {
             alert = "iDriver5 has confirmed your booling.";
         };
         bookingId = 87;
         driverContact = 8287632345;
         driverId = 13;
         driverLatitude = "28.587238814653944";
         driverName = iDriver5;
         driverlongitude = "77.06062328401764";
         "gcm.message_id" = 1693292390930120;
         "google.c.a.e" = 1;
         "google.c.fid" = cwFMTZl0K0fpkfcPMinYSO;
         "google.c.sender.id" = 750959835757;
         message = "iDriver5 has confirmed your booling.";
         rating = 0;
         type = confirm;
         vehicleNumber = dl007;
         */
        
        if (self.dict_get_all_data_from_notification != nil) {
            
            cell.lbl_car_details.text = (self.dict_get_all_data_from_notification["vehicleNumber"] as! String)+" ("+(self.dict_get_all_data_from_notification["VehicleColor"] as! String)+" )"
            
            cell.lbl_driver_name.text = (self.dict_get_all_data_from_notification["driverName"] as! String)
            cell.lbl_driver_name.text = "\(self.dict_get_all_data_from_notification["rating"]!)"

            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 800
    }
    
}
 
class ride_status_table_cell: UITableViewCell {
    
    @IBOutlet weak var view_bg:UIView! {
        didSet {
            view_bg.layer.masksToBounds = false
            view_bg.layer.shadowColor = UIColor.black.cgColor
            view_bg.layer.shadowOffset =  CGSize.zero
            view_bg.layer.shadowOpacity = 0.5
            view_bg.layer.shadowRadius = 2
        }
    }
    
    @IBOutlet weak var  mapView:MKMapView!
    
    @IBOutlet weak var lbl_driver_name:UILabel!
    @IBOutlet weak var lbl_driver_rating:UILabel!
    
    @IBOutlet weak var lbl_from:UILabel!
    @IBOutlet weak var lbl_to:UILabel!
    
    @IBOutlet weak var lbl_car_details:UILabel!
    
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
    
    @IBOutlet weak var btn_call_driver:UIButton! {
        didSet {
            btn_call_driver.backgroundColor = .white
        }
    }
    
    @IBOutlet weak var btn_cancel_ride:UIButton! {
        didSet {
            btn_cancel_ride.backgroundColor = .white
        }
    }
    
}
