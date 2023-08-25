//
//  UPDOFareDistance.swift
//  GoFourService
//
//  Created by Dishant Rajput on 29/10/21.
//

import UIKit
import MapKit
import Alamofire

// MARK:- LOCATION -
import CoreLocation

class total_fare_distance_mpa_route: UIViewController , CLLocationManagerDelegate , MKMapViewDelegate, UITextFieldDelegate {
    
     
    
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
    
    @IBOutlet weak var tbleView:UITableView! {
        didSet {
            
        }
    }
    
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
        
        self.btnConfirmBooking.addTarget(self, action: #selector(validation_before_confirm_booking), for: .touchUpInside)
        
        self.show_loading_UI()
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

        // self.iAmHereForLocationPermission()
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
            self.get_fare_WB()
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
        let cell = self.tbleView.cellForRow(at: indexPath) as! total_fare_distance_mpa_route_table_cell
        
        cell.lblStartingLocation.text = String(self.str_from_location)
        cell.lblEndLocation.text = String(self.str_to_location)
        cell.viewCellbg.isHidden = true
        
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
            cell.lbl_distance.text = (String(format: "%.0f", distanceFloat/1000))
            
            print(String(format: "Distance : %.0f KM away", distanceFloat/1000))
            print(String(format: "Distance : %.0f Miles away", distanceFloat/1609.344))
            
            /************************************************************************************/
            
            /***************** GENERATE NEW POLYLINE *******************************/
            let route = directionResonse.routes[0]
            cell.mapView.addOverlay(route.polyline, level: .aboveRoads)
            let rect = route.polyline.boundingMapRect
            cell.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            /************************************************************************************/
            
        }
        cell.mapView.delegate = self
        
        // self.locManager.stopUpdatingLocation()
        
        self.locManager.startUpdatingLocation()
        
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
    
    
    
    @objc func payment_method_click_method() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tbleView.cellForRow(at: indexPath) as! total_fare_distance_mpa_route_table_cell
        
        let dummyList = ["Please select payment method", "Cash", "Card"]
        
        RPicker.selectOption(title: "Select", cancelText: "Cancel", dataArray: dummyList, selectedIndex: 0) { (selctedText, atIndex) in
            // TODO: Your implementation for selection
            cell.btnSelectPaymentMethod.setTitleColor(.black, for: .normal)
            // cell.btnSelectPaymentMethod.setTitle(" Payment method : "+String(selctedText), for: .normal)
            
            cell.lbl_payment_type.textColor = .black
            cell.lbl_payment_type.text = String(selctedText)
            
        }
        
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

        self.find_driver_WB(str_show_loader: "yes")
    }
    
    
    @objc func find_driver_WB(str_show_loader:String) {

        if (str_show_loader == "yes") {
            self.show_loading_UI()
        }
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            print(person)
            
            let x : Int = person["userId"] as! Int
            let myString = String(x)
            
            if let token_id_is = UserDefaults.standard.string(forKey: str_save_last_api_token) {
                
                let headers: HTTPHeaders = [
                    "token":String(token_id_is),
                ]
                
                var parameters:Dictionary<AnyHashable, Any>!
                
                
                let request_lat = String(self.strSaveLatitude)
                let request_long = String(self.strSaveLongitude)
                
                let drop_lat = String(self.searched_place_location_lat)
                let drop_long = String(self.searched_place_location_long)

                parameters = [
                    
                    "action"            : "addbooking",
                    "userId"            : String(myString),
                    "categoryId"        : String(self.str_get_category_id),
                    "RequestPickupAddress" : String(self.str_from_location),
                    "RequestPickupLatLong" : String(request_lat)+","+String(request_long),
                    "RequestDropAddress" : String(self.str_to_location),
                    "RequestDropLatLong" : String(drop_lat)+","+String(drop_long),
                    
                    "duration" : String(self.str_total_duration),
                    "distance" : String(self.str_total_distance),
                    "estimateAmount": String(self.str_total_rupees)
                    
                ]
                
                print("parameters-------\(String(describing: parameters))")
                
                AF.request(application_base_url, method: .post, parameters: parameters as? Parameters,headers: headers).responseJSON {
                    response in
                    
                    switch(response.result) {
                    case .success(_):
                        if let data = response.value {
                            
                            let JSON = data as! NSDictionary
                            print(JSON)
                            
                            var strSuccess : String!
                            strSuccess = JSON["status"] as? String
                            
                            var message : String!
                            message = (JSON["msg"] as? String)
                            
                            if strSuccess.lowercased() == "success" {
                                
                                self.hide_loading_UI()
                                
                                let str_token = (JSON["AuthToken"] as! String)
                                UserDefaults.standard.set("", forKey: str_save_last_api_token)
                                UserDefaults.standard.set(str_token, forKey: str_save_last_api_token)
                                
                                /*var dict: Dictionary<AnyHashable, Any>
                                dict = JSON["data"] as! Dictionary<AnyHashable, Any>
                                
                                self.hide_loading_UI()
                                self.tbleView.separatorColor = .clear
                                self.iAmHereForLocationPermission()
                                
                                self.str_total_distance = (dict["distance"] as! String)
                                self.str_total_rupees = "\(dict["total"]!)"
                                self.str_total_duration = (dict["duration"] as! String)*/
                                
                            } else if message == String(not_authorize_api) {
                                self.login_refresh_token_wb()
                                
                            }
                            else {
                                self.hide_loading_UI()
                                
                                let alert = NewYorkAlertController(title: String("Alert"), message: String(message), style: .alert)
                                let cancel = NewYorkButton(title: "dismiss", style: .cancel)
                                alert.addButtons([cancel])
                                self.present(alert, animated: true)
                                
                            }
                            
                        }
                        
                    case .failure(_):
                        print("Error message:\(String(describing: response.error))")
                        self.hide_loading_UI()
                        self.please_check_your_internet_connection()
                        
                        break
                    }
                }
            }
        }
    }
    
    @objc func login_refresh_token_wb() {
        
        var parameters:Dictionary<AnyHashable, Any>!
        if let get_login_details = UserDefaults.standard.value(forKey: str_save_email_password) as? [String:Any] {
            print(get_login_details as Any)
            
            parameters = [
                "action"    : "login",
                "email"     : (get_login_details["email"] as! String),
                "password"  : (get_login_details["password"] as! String),
            ]
            
            print("parameters-------\(String(describing: parameters))")
            
            AF.request(application_base_url, method: .post, parameters: parameters as? Parameters).responseJSON {
                response in
                
                switch(response.result) {
                case .success(_):
                    if let data = response.value {
                        
                        let JSON = data as! NSDictionary
                        print(JSON)
                        
                        var strSuccess : String!
                        strSuccess = JSON["status"] as? String
                        
                        if strSuccess.lowercased() == "success" {
                            
                            let str_token = (JSON["AuthToken"] as! String)
                            UserDefaults.standard.set("", forKey: str_save_last_api_token)
                            UserDefaults.standard.set(str_token, forKey: str_save_last_api_token)
                            
                            self.find_driver_WB(str_show_loader: "no")
                            
                        } else {
                            ERProgressHud.sharedInstance.hide()
                        }
                        
                    }
                    
                case .failure(_):
                    print("Error message:\(String(describing: response.error))")
                    ERProgressHud.sharedInstance.hide()
                    self.please_check_your_internet_connection()
                    
                    break
                }
            }
        }
        
    }
    
    
    
    
    
    
    
    
    
    // MARK:- GET TOTAL DISTANCE FARE -
    @objc func get_fare_WB() {
        
        if let token_id_is = UserDefaults.standard.string(forKey: str_save_last_api_token) {
            
            let headers: HTTPHeaders = [
                "token":String(token_id_is),
            ]

            var parameters:Dictionary<AnyHashable, Any>!
            
            parameters = [
                "action"        : "getprice",
                "pickuplatLong" : String(self.my_location_lat)+","+String(self.my_location_long),
                "droplatLong"   : String(self.searched_place_location_lat)+","+String(self.searched_place_location_long),
                "categoryId"    : String(self.str_get_category_id),
            ]
            
            print("parameters-------\(String(describing: parameters))")
            
            AF.request(application_base_url, method: .post, parameters: parameters as? Parameters,headers: headers).responseJSON {
                response in
                
                switch(response.result) {
                case .success(_):
                    if let data = response.value {
                        
                        let JSON = data as! NSDictionary
                        print(JSON)
                        
                        var strSuccess : String!
                        strSuccess = JSON["status"] as? String
                        
                        if strSuccess.lowercased() == "success" {
                            
                            var dict: Dictionary<AnyHashable, Any>
                            dict = JSON["data"] as! Dictionary<AnyHashable, Any>
                            
                            self.hide_loading_UI()
                            self.tbleView.separatorColor = .clear
                            self.iAmHereForLocationPermission()
                            
                            self.str_total_distance = (dict["distance"] as! String)
                            self.str_total_rupees = "\(dict["total"]!)"
                            self.str_total_duration = (dict["duration"] as! String)
                            
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
        }
    }
}

//MARK:- TABLE VIEW -
extension total_fare_distance_mpa_route: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:total_fare_distance_mpa_route_table_cell = tableView.dequeueReusableCell(withIdentifier: "total_fare_distance_mpa_route_table_cell") as! total_fare_distance_mpa_route_table_cell
        
        cell.backgroundColor = .white
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        cell.lblTotalPayableAmount.text = String(self.str_total_rupees)
        cell.lbl_duration.text = "Duration : "+String(self.str_total_duration)
        
        cell.txt_field.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 800
    }
    
}
 
class total_fare_distance_mpa_route_table_cell: UITableViewCell {
    
    @IBOutlet weak var txt_field:UITextField! {
        didSet {
            txt_field.backgroundColor = UIColor.init(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1)
            
            txt_field.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            txt_field.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            txt_field.layer.shadowOpacity = 1.0
            txt_field.layer.shadowRadius = 15.0
            txt_field.layer.masksToBounds = false
            txt_field.backgroundColor = .white
            txt_field.layer.cornerRadius = 8
            txt_field.placeholder = "Promo Code"
            txt_field.setLeftPaddingPoints(60)
            // txt_field.clipsToBounds = true
    
        }
    }
    
    @IBOutlet weak var mapView:MKMapView!
    
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
    
    @IBOutlet weak var btnStarting:UIButton!{
        didSet{
            btnStarting.setTitle("", for: .normal)
        }
    }
    @IBOutlet weak var btnEnding:UIButton!{
        didSet{
            btnEnding.setTitle("", for: .normal)
        }
    }
    
    @IBOutlet weak var lblStartingLocation:UILabel!
    @IBOutlet weak var lblEndLocation:UILabel!
    
    @IBOutlet weak var lbl_duration:UILabel! {
        didSet {
            lbl_duration.textColor = .black
        }
    }
    @IBOutlet weak var lbl_distance:UILabel! {
        didSet {
            lbl_distance.textColor = .black
        }
    }
    
    @IBOutlet weak var viewCellbgDown:UIView! {
        didSet {
            viewCellbgDown.layer.cornerRadius = 8
            viewCellbgDown.clipsToBounds = true
            viewCellbgDown.backgroundColor = UIColor.init(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1)
            
            viewCellbgDown.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            viewCellbgDown.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            viewCellbgDown.layer.shadowOpacity = 1.0
            viewCellbgDown.layer.shadowRadius = 15.0
            viewCellbgDown.layer.masksToBounds = false
            viewCellbgDown.backgroundColor = .white
            
        }
    }
    
    @IBOutlet weak var lblTotalPayableAmount:UILabel!
     
    @IBOutlet weak var btnFareEstimate:UIButton!
    @IBOutlet weak var btnPromocode:UIButton!
    @IBOutlet weak var btnSelectPaymentMethod:UIButton!

    @IBOutlet weak var lbl_payment_type:UILabel! {
        didSet {
            lbl_payment_type.text = "Card"
            lbl_payment_type.textColor = .black
        }
    }
    
    //
    @IBOutlet weak var view_big:UIView! {
        didSet {
            view_big.backgroundColor = .white
        }
    }
    
    @IBOutlet weak var btn_distance:UIButton! {
        didSet {
            btn_distance.setTitleColor(.white, for: .normal)
            btn_distance.layer.cornerRadius = 14
            btn_distance.clipsToBounds = true
            btn_distance.backgroundColor = UIColor.init(red: 227.0/255.0, green: 230.0/255.0, blue: 244.0/255.0, alpha: 1)
        }
    }
    @IBOutlet weak var btn_est_earn:UIButton! {
        didSet {
            btn_est_earn.setTitleColor(.white, for: .normal)
            btn_est_earn.layer.cornerRadius = 14
            btn_est_earn.clipsToBounds = true
            btn_est_earn.backgroundColor = UIColor.init(red: 227.0/255.0, green: 230.0/255.0, blue: 244.0/255.0, alpha: 1)
        }
    }
    
    @IBOutlet weak var lbl_from:UILabel!
    @IBOutlet weak var lbl_to:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
