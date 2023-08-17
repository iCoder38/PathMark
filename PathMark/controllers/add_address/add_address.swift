//
//  add_address.swift
//  PathMark
//
//  Created by Dishant Rajput on 16/08/23.
//

import UIKit

// MARK:- LOCATION -
import CoreLocation
import Alamofire

class add_address: UIViewController , CLLocationManagerDelegate {

    var dict_address:NSDictionary!
    var str_address_id:String!
    
    let locationManager = CLLocationManager()
    
    // MARK:- SAVE LOCATION STRING -
    var strSaveLatitude:String!
    var strSaveLongitude:String!
    var strSaveCountryName:String!
    var strSaveLocalAddress:String!
    var strSaveLocality:String!
    var strSaveLocalAddressMini:String!
    var strSaveStateName:String!
    var strSaveZipcodeName:String!
    
    
    @IBOutlet weak var btn_back:UIButton! {
        didSet {
            btn_back.tintColor = .white
        }
    }
    
    @IBOutlet weak var view_navigation_bar:UIView! {
        didSet {
            view_navigation_bar.backgroundColor = navigation_color
        }
    }
    
    @IBOutlet weak var view_navigation_title:UILabel! {
        didSet {
            view_navigation_title.text = "ADD ADDRESS"
            view_navigation_title.textColor = .white
        }
    }
    
    @IBOutlet weak var lbl_current_address:UILabel!
    
    @IBOutlet weak var txt_house_number:UITextField! {
        didSet {
            // shadow
            txt_house_number.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            txt_house_number.layer.shadowOffset = CGSize(width: 0, height: 3)
            txt_house_number.layer.shadowOpacity = 1.0
            txt_house_number.layer.shadowRadius = 10.0
            txt_house_number.layer.masksToBounds = false
            txt_house_number.layer.cornerRadius = 12
            txt_house_number.backgroundColor = .white
            
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20 , height: txt_house_number.frame.height))
            txt_house_number.leftView = paddingView
            txt_house_number.leftViewMode = UITextField.ViewMode.always
        }
    }
    
    @IBOutlet weak var txt_save_as:UITextField! {
        didSet {
            // shadow
            txt_save_as.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            txt_save_as.layer.shadowOffset = CGSize(width: 0, height: 3)
            txt_save_as.layer.shadowOpacity = 1.0
            txt_save_as.layer.shadowRadius = 10.0
            txt_save_as.layer.masksToBounds = false
            txt_save_as.layer.cornerRadius = 12
            txt_save_as.backgroundColor = .white
            
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20 , height: txt_save_as.frame.height))
            txt_save_as.leftView = paddingView
            txt_save_as.leftViewMode = UITextField.ViewMode.always
        }
    }
    
    @IBOutlet weak var txt_enter_name:UITextField! {
        didSet {
            // shadow
            txt_enter_name.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            txt_enter_name.layer.shadowOffset = CGSize(width: 0, height: 3)
            txt_enter_name.layer.shadowOpacity = 1.0
            txt_enter_name.layer.shadowRadius = 10.0
            txt_enter_name.layer.masksToBounds = false
            txt_enter_name.layer.cornerRadius = 12
            txt_enter_name.backgroundColor = .white
            
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20 , height: txt_enter_name.frame.height))
            txt_enter_name.leftView = paddingView
            txt_enter_name.leftViewMode = UITextField.ViewMode.always
        }
    }
    
    @IBOutlet weak var btn_save:UIButton!
    
    @IBOutlet weak var btn_submit:UIButton! {
        didSet {
            btn_submit.setTitle("SAVE ADDRESS", for: .normal)
            btn_submit.setTitleColor(.white, for: .normal)
            btn_submit.layer.cornerRadius = 6
            btn_submit.clipsToBounds = true
            btn_submit.backgroundColor = UIColor.init(red: 104.0/255.0, green: 218.0/255.0, blue: 134.0/255.0, alpha: 1)
            
            // shadow
            btn_submit.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            btn_submit.layer.shadowOffset = CGSize(width: 0, height: 3)
            btn_submit.layer.shadowOpacity = 1.0
            btn_submit.layer.shadowRadius = 10.0
            btn_submit.layer.masksToBounds = false
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.btn_save.addTarget(self, action: #selector(save_as_click_method), for: .touchUpInside)
        self.iAmHereForLocationPermission()
        
        self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        
        self.btn_submit.addTarget(self, action: #selector(validate_before_submit), for: .touchUpInside)
        
        if (self.dict_address == nil) {
            print("add contact")
            self.view_navigation_title.text = "NEW ADDRESS"
            
        } else {
            print("edit contact")
            self.view_navigation_title.text = "EDIT ADDRESS"
            
            self.txt_house_number.text = (self.dict_address["address"] as! String)
            self.txt_save_as.text = (self.dict_address["addressType"] as! String)
            
            self.str_address_id = "\(self.dict_address["addressId"]!)"
        }
    }
    
    @objc func save_as_click_method() {
         
        let alertController = UIAlertController(title: "Save as", message: "", preferredStyle: .actionSheet)
         
        let home = UIAlertAction(title: "Home", style: .default) {
            UIAlertAction in
            NSLog("OK Pressed")
            self.txt_save_as.text = "Home"
        }
        
        let work = UIAlertAction(title: "Work", style: .default) {
            UIAlertAction in
            NSLog("OK Pressed")
            self.txt_save_as.text = "Work"
            
        }
        
        let other = UIAlertAction(title: "Other", style: .default) {
            UIAlertAction in
            NSLog("OK Pressed")
            self.txt_save_as.text = "Other"
            
        }
        
        let dismiss = UIAlertAction(title: "Dismiss", style: .cancel) {
            UIAlertAction in
            NSLog("OK Pressed")
        }

        alertController.addAction(home)
        alertController.addAction(work)
        alertController.addAction(other)
        alertController.addAction(dismiss)
        
        self.present(alertController, animated: true, completion: nil)

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
                
                DispatchQueue.global().async {
                    if CLLocationManager.locationServicesEnabled() {
                        // your code here
                        self.locationManager.delegate = self
                        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                        self.locationManager.startUpdatingLocation()
                    }
                }
                
            @unknown default:
                break
            }
        }
    }
     
    // MARK:- GET CUSTOMER LOCATION -
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
            
            //MARK:- STOP LOCATION -
            self.locationManager.stopUpdatingLocation()
            
            self.lbl_current_address.text = String(self.strSaveLocality)+" "+String(self.strSaveLocalAddress)+" "+String(self.strSaveLocalAddressMini)+","+String(self.strSaveStateName)+","+String(self.strSaveCountryName)
            
            if (self.dict_address == nil) {
                
                print("add contact")
                self.txt_house_number.text = String(self.strSaveLocality)+" "+String(self.strSaveLocalAddress)+" "+String(self.strSaveLocalAddressMini)+","+String(self.strSaveStateName)+","+String(self.strSaveCountryName)
                
            }
            
//
            // print(self.strSaveLatitude as Any)
            // print(self.strSaveLongitude as Any)

        }
    }
    
    @objc func  validate_before_submit() {
        
        if (self.dict_address == nil) {
            print("add contact")
            self.add_address_WB(str_show_loader: "yes")
            
        } else {
            print("edit contact")
            self.view_navigation_title.text = "EDIT ADDRESS"
            
            self.edit_address_WB(str_show_loader: "yes")
        }
    }
    
    @objc func edit_address_WB(str_show_loader:String) {
        
        // self.show_loading_UI()
        
        if (str_show_loader == "yes") {
            ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: "editing...")
        }
        
        
        var parameters:Dictionary<AnyHashable, Any>!
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            
            let x : Int = person["userId"] as! Int
            let myString = String(x)
            
            if let token_id_is = UserDefaults.standard.string(forKey: str_save_last_api_token) {
                print(token_id_is as Any)
                
                let headers: HTTPHeaders = [
                    "token":String(token_id_is),
                ]

                parameters = [
                    "action"        : "addressadd",
                    "userId"        : String(myString),
                    "addressId"     : String(self.str_address_id),
                    "address"       : String(self.txt_house_number.text!),
                    "addressType"   : String(self.txt_save_as.text!),
                    "coordinate"    : String(self.strSaveLatitude)+","+String(self.strSaveLongitude),
                ]
                
                print(headers)
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
                            // self.hide_loading_UI()
                            
                            if strSuccess.lowercased() == "success" {
                                
                                let str_token = (JSON["AuthToken"] as! String)
                                UserDefaults.standard.set("", forKey: str_save_last_api_token)
                                UserDefaults.standard.set(str_token, forKey: str_save_last_api_token)
                                
                                ERProgressHud.sharedInstance.hide()
                                self.back_click_method()
                                
                            } else {
                                self.login_refresh_token_wb()
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
    
    @objc func login_refresh_edit_token_wb() {
        
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
                               
                            self.edit_address_WB(str_show_loader: "no")
                           
                        }
                        else {
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
    
    
    
    @objc func add_address_WB(str_show_loader:String) {
        
        // self.show_loading_UI()
        
        if (str_show_loader == "yes") {
            ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: "adding...")
        }
        
        
        var parameters:Dictionary<AnyHashable, Any>!
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            
            let x : Int = person["userId"] as! Int
            let myString = String(x)
            
            if let token_id_is = UserDefaults.standard.string(forKey: str_save_last_api_token) {
                print(token_id_is as Any)
                
                let headers: HTTPHeaders = [
                    "token":String(token_id_is),
                ]

                parameters = [
                    "action"        : "addressadd",
                    "userId"        : String(myString),
                    "address"       : String(self.txt_house_number.text!),
                    "addressType"   : String(self.txt_save_as.text!),
                    "coordinate"    : String(self.strSaveLatitude)+","+String(self.strSaveLongitude),
                ]
                
                print(headers)
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
                            // self.hide_loading_UI()
                            
                            if strSuccess.lowercased() == "success" {
                                
                                let str_token = (JSON["AuthToken"] as! String)
                                UserDefaults.standard.set("", forKey: str_save_last_api_token)
                                UserDefaults.standard.set(str_token, forKey: str_save_last_api_token)
                                
                                ERProgressHud.sharedInstance.hide()
                                self.back_click_method()
                                
                            } else {
                                self.login_refresh_token_wb()
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
                               
                            self.add_address_WB(str_show_loader: "no")
                           
                        }
                        else {
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
    
}
