//
//  dashboard.swift
//  PathMark
//
//  Created by Dishant Rajput on 10/07/23.
//

import UIKit
import MapKit

// MARK:- LOCATION -
import CoreLocation

class dashboard: UIViewController , CLLocationManagerDelegate {

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
    
    @IBOutlet weak var view_navigation_bar:UIView! {
        didSet {
            view_navigation_bar.backgroundColor = navigation_color
        }
    }
    
    @IBOutlet weak var btn_back:UIButton!
    
    @IBOutlet weak var view_navigation_title:UILabel! {
        didSet {
            view_navigation_title.text = "Home"
            view_navigation_title.textColor = .white
        }
    }
    
    @IBOutlet weak var tbleView:UITableView! {
        didSet {
            tbleView.delegate = self
            tbleView.dataSource = self
            tbleView.backgroundColor = .clear
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // location
        self.iAmHereForLocationPermission()
        
        self.sideBarMenuClick()
    }

    @objc func please_select_atleast_one_vehicle() {
        
        let alert = NewYorkAlertController(title: String("Alert").uppercased(), message: String("Please select one vehicle type."), style: .alert)
        let cancel = NewYorkButton(title: "dismiss", style: .cancel)
        alert.addButtons([cancel])
        self.present(alert, animated: true)
        
    }
    @objc func push_to_car_map_click_method() {
        
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "map_view_id") as? map_view
        push!.str_user_select_vehicle = "CAR"
        self.navigationController?.pushViewController(push!, animated: true)
        
    }
    
    @objc func push_to_bike_map_click_method() {
        
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "map_view_id") as? map_view
        push!.str_user_select_vehicle = "BIKE"
        self.navigationController?.pushViewController(push!, animated: true)
        
    }
    
    @objc func push_to_intercity_map_click_method() {
        
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "map_view_id") as? map_view
        push!.str_user_select_vehicle = "INTERCITY"
        self.navigationController?.pushViewController(push!, animated: true)
        
    }
    
    
    @objc func sideBarMenuClick() {
        
        self.view.endEditing(true)
        if revealViewController() != nil {
            btn_back.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            revealViewController().rearViewRevealWidth = 300
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
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
            
            print("local address ==> "+localAddress as Any) // south west delhi
            print("local address mini ==> "+localAddressMini as Any) // new delhi
            print("locality ==> "+locality as Any) // sector 10 dwarka
            
            print(self.strSaveCountryName as Any) // india
            print(self.strSaveStateName as Any) // new delhi
            print(self.strSaveZipcodeName as Any) // 110075
            
            //MARK:- STOP LOCATION -
            self.locationManager.stopUpdatingLocation()
            
            let indexPath = IndexPath.init(row: 0, section: 0)
            let cell = self.tbleView.cellForRow(at: indexPath) as! dashboard_table_cell
            
            cell.lbl_my_full_address.text = String(self.strSaveLocality)+" "+String(self.strSaveLocalAddress)+" "+String(self.strSaveLocalAddressMini)+","+String(self.strSaveStateName)+","+String(self.strSaveCountryName)
//
            print(self.strSaveLatitude as Any)
            print(self.strSaveLongitude as Any)

        }
    }
    
}


extension dashboard: UITableViewDataSource  , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:dashboard_table_cell = tableView.dequeueReusableCell(withIdentifier: "dashboard_table_cell") as! dashboard_table_cell
        
        cell.backgroundColor = .clear
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
 
        let btn_car = UIButton()
        btn_car.tag = 0
        btn_car.frame = CGRect(x: 0, y: 0, width: cell.view_select_vehicle.frame.size.width/3, height: 100)
        btn_car .setBackgroundImage(UIImage(named: "car_image_name"), for: .normal)
        btn_car.setImage(UIImage(named: "car_image_name"), for: .normal)
        btn_car.titleLabel!.font = UIFont(name: "Poppins-Regular", size: 14.0)!
        btn_car.backgroundColor = .systemPurple
        btn_car.layer.cornerRadius = 14
        btn_car.clipsToBounds = true
        
        btn_car.layer.masksToBounds = false
        btn_car.layer.shadowColor = UIColor.black.cgColor
        btn_car.layer.shadowOffset =  CGSize.zero
        btn_car.layer.shadowOpacity = 0.5
        btn_car.layer.shadowRadius = 2
        btn_car.layer.cornerRadius = 12
        cell.view_select_vehicle.addSubview(btn_car)
        
        let btn_bike = UIButton()
        btn_bike.tag = 0
        btn_bike.frame = CGRect(x: btn_car.frame.size.width+20, y: 0, width: cell.view_select_vehicle.frame.size.width/3, height: 100)
        btn_bike .setBackgroundImage(UIImage(named: "bike_with_name"), for: .normal)
        btn_bike.setImage(UIImage(named: "bike_with_name"), for: .normal)
        btn_bike.titleLabel!.font = UIFont(name: "Poppins-Regular", size: 14.0)!
        btn_bike.backgroundColor = .systemPurple
        btn_bike.layer.cornerRadius = 14
        btn_bike.clipsToBounds = true
        
        btn_bike.layer.masksToBounds = false
        btn_bike.layer.shadowColor = UIColor.black.cgColor
        btn_bike.layer.shadowOffset =  CGSize.zero
        btn_bike.layer.shadowOpacity = 0.5
        btn_bike.layer.shadowRadius = 2
        btn_bike.layer.cornerRadius = 12
        cell.view_select_vehicle.addSubview(btn_bike)
        
        let btn_intercity = UIButton()
        btn_intercity.tag = 0
        btn_intercity.frame = CGRect(x: btn_car.frame.size.width+20+btn_bike.frame.size.width+20, y: 0, width: cell.view_select_vehicle.frame.size.width/3, height: 100)
        btn_intercity .setBackgroundImage(UIImage(named: "intercity_with_name"), for: .normal)
        btn_intercity.setImage(UIImage(named: "intercity_with_name"), for: .normal)
        btn_intercity.titleLabel!.font = UIFont(name: "Poppins-Regular", size: 14.0)!
        btn_intercity.backgroundColor = .systemPurple
        btn_intercity.layer.cornerRadius = 14
        btn_intercity.clipsToBounds = true
        
        btn_intercity.layer.masksToBounds = false
        btn_intercity.layer.shadowColor = UIColor.black.cgColor
        btn_intercity.layer.shadowOffset =  CGSize.zero
        btn_intercity.layer.shadowOpacity = 0.5
        btn_intercity.layer.shadowRadius = 2
        btn_intercity.layer.cornerRadius = 12
        cell.view_select_vehicle.addSubview(btn_intercity)
        
        btn_car.addTarget(self, action: #selector(push_to_car_map_click_method), for: .touchUpInside)
        
        btn_bike.addTarget(self, action: #selector(push_to_bike_map_click_method), for: .touchUpInside)
        btn_intercity.addTarget(self, action: #selector(push_to_intercity_map_click_method), for: .touchUpInside)
        
        cell.btn_book_a_ride_now.addTarget(self, action: #selector(please_select_atleast_one_vehicle), for: .touchUpInside)
        cell.btn_push_to_map.addTarget(self, action: #selector(please_select_atleast_one_vehicle), for: .touchUpInside)
        
        return cell
    }
   
    @objc func sign_up_click_method() {
        
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "verify_phone_number_id") as? verify_phone_number
        self.navigationController?.pushViewController(push!, animated: true)
        
    }
    
    @objc func btnForgotPasswordPress() {
        
//        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ForgotPassword") as? ForgotPassword
//        self.navigationController?.pushViewController(push!, animated: true)
        
    }
    
    @objc func signInClickMethod() {
        
//        self.login_WB()
        
        /*let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UPDSAddressId")
         self.navigationController?.pushViewController(push, animated: true)*/
    }
    
    @objc func dontHaveAntAccountClickMethod() {
        
//        let settingsVCId = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RegistraitonId") as? Registraiton
//        self.navigationController?.pushViewController(settingsVCId!, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 900
    }
    
}


class dashboard_table_cell: UITableViewCell {

    @IBOutlet weak var btn_push_to_map:UIButton!
    
    @IBOutlet weak var view_set_name:UIView! {
        didSet {
            view_set_name.backgroundColor = .white
            view_set_name.layer.masksToBounds = false
            view_set_name.layer.shadowColor = UIColor.black.cgColor
            view_set_name.layer.shadowOffset =  CGSize.zero
            view_set_name.layer.shadowOpacity = 0.5
            view_set_name.layer.shadowRadius = 2
            view_set_name.layer.cornerRadius = 12
        }
    }
    
    @IBOutlet weak var lbl_my_full_address:UILabel! {
        didSet {
            lbl_my_full_address.text = ""
        }
    }
    
    @IBOutlet weak var view_select_vehicle:UIView! {
        didSet {
            view_select_vehicle.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var btn_book_a_ride_now:UIButton! {
        didSet {
            Utils.buttonStyle(button: btn_book_a_ride_now,
                              bCornerRadius: 12,
                              bBackgroundColor: navigation_color,
                              bTitle: "BOOK A RIDE NOW",
                              bTitleColor: .white)
            
            btn_book_a_ride_now.layer.masksToBounds = false
            btn_book_a_ride_now.layer.shadowColor = UIColor.black.cgColor
            btn_book_a_ride_now.layer.shadowOffset =  CGSize.zero
            btn_book_a_ride_now.layer.shadowOpacity = 0.5
            btn_book_a_ride_now.layer.shadowRadius = 2
            
        }
    }
    
    @IBOutlet weak var btn_schedule_a_ride_now:UIButton! {
        didSet {
            Utils.buttonStyle(button: btn_schedule_a_ride_now,
                              bCornerRadius: 12,
                              bBackgroundColor: UIColor(red: 246.0/255.0, green: 200.0/255.0, blue: 68.0/255.0, alpha: 1),
                              bTitle: "SCHEDULE A RIDE",
                              bTitleColor: .black)
            
            btn_schedule_a_ride_now.layer.masksToBounds = false
            btn_schedule_a_ride_now.layer.shadowColor = UIColor.black.cgColor
            btn_schedule_a_ride_now.layer.shadowOffset =  CGSize.zero
            btn_schedule_a_ride_now.layer.shadowOpacity = 0.5
            btn_schedule_a_ride_now.layer.shadowRadius = 2
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
