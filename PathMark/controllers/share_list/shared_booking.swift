//
//  shared_booking.swift
//  PathMark
//
//  Created by Dishant Rajput on 23/11/23.
//

import UIKit
import Alamofire
import SDWebImage

class shared_booking: UIViewController {

    var arr_shared_booking:NSMutableArray! = []
    
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
            view_navigation_title.text = "Schedule ride details"
            view_navigation_title.textColor = .white
        }
    }
    
    @IBOutlet weak var tbleView:UITableView! {
        didSet {
            tbleView.backgroundColor = .clear
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideBarMenuClick()
        self.share_booking_list_WB(str_show_loader: "yes")
        
    }

    @objc func sideBarMenuClick() {
        
        self.view.endEditing(true)
        if revealViewController() != nil {
            btn_back.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            revealViewController().rearViewRevealWidth = 300
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    @objc func share_booking_list_WB(str_show_loader:String) {
        
        if (str_show_loader == "yes") {
            ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: "Please wait...")
        }
        
        
        self.view.endEditing(true)
        
        var parameters:Dictionary<AnyHashable, Any>!
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            print(person)
            
            let x : Int = person["userId"] as! Int
            let myString = String(x)
            
            var ar : NSArray!
            ar = (person["carinfromation"] as! Array<Any>) as NSArray
            
            let arr_mut_order_history:NSMutableArray! = []
            arr_mut_order_history.addObjects(from: ar as! [Any])
            
            if let token_id_is = UserDefaults.standard.string(forKey: str_save_last_api_token) {
                print(token_id_is as Any)
                
                let headers: HTTPHeaders = [
                    "token":String(token_id_is),
                ]
                
                parameters = [
                    "action"        : "sharelist",
                    // "userId"        : String(myString),
                    "userId"        : String("111"),
                    
                ]
                
                print(parameters as Any)
                
                AF.request(application_base_url, method: .post, parameters: parameters as? Parameters,headers: headers).responseJSON {
                    response in
                    // debugPrint(response.result)
                    
                    switch response.result {
                    case let .success(value):
                        
                        let JSON = value as! NSDictionary
                        print(JSON as Any)
                        
                        var strSuccess : String!
                        strSuccess = (JSON["status"]as Any as? String)?.lowercased()
                        
                        var message : String!
                        message = (JSON["msg"] as? String)
                        
                        print(strSuccess as Any)
                        if strSuccess == String("success") {
                            print("yes")
                            
                            let str_token = (JSON["AuthToken"] as! String)
                            UserDefaults.standard.set("", forKey: str_save_last_api_token)
                            UserDefaults.standard.set(str_token, forKey: str_save_last_api_token)
                            
                            var ar : NSArray!
                            ar = (JSON["data"] as! Array<Any>) as NSArray
                            self.arr_shared_booking.addObjects(from: ar as! [Any])
                            
                            print(self.arr_shared_booking.count as Any)
                            ERProgressHud.sharedInstance.hide()
                            
                            self.tbleView.delegate = self
                            self.tbleView.dataSource = self
                            self.tbleView.reloadData()
                            
                        } else if message == String(not_authorize_api) {
                            self.login_refresh_token_wb()
                            
                        } else {
                            
                            print("no")
                            ERProgressHud.sharedInstance.hide()
                            
                            var strSuccess2 : String!
                            strSuccess2 = JSON["msg"]as Any as? String
                            
                            let alert = NewYorkAlertController(title: String("Alert").uppercased(), message: String(strSuccess2), style: .alert)
                            let cancel = NewYorkButton(title: "dismiss", style: .cancel)
                            alert.addButtons([cancel])
                            self.present(alert, animated: true)
                            
                        }
                        
                    case let .failure(error):
                        print(error)
                        ERProgressHud.sharedInstance.hide()
                        
                        self.please_check_your_internet_connection()
                        
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
                            
                            self.share_booking_list_WB(str_show_loader: "no")
                            
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
    
}



//MARK:- TABLE VIEW -
extension shared_booking: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr_shared_booking.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:shared_booking_table_cell = tableView.dequeueReusableCell(withIdentifier: "shared_booking_table_cell") as! shared_booking_table_cell
        
        cell.backgroundColor = .white
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        /*
         "Drivber_userId" = 107;
         FinalFare = 1;
         RequestDropAddress = "Morena, Madhya Pradesh 476001, India";
         RequestDropLatLong = "26.4947172,77.9940222";
         RequestPickupAddress = "65P6+J6P, Sheel Nagar, Gwalior, Madhya Pradesh 474008, India ";
         RequestPickupLatLong = "26.2363658,78.1608951";
         VehicleColor = red;
         bookingDate = "2023-11-09";
         bookingId = 59;
         bookingTime = "";
         "car_image" = "https://demo4.evirtualservices.net/pathmark/img/uploads/cars/1690351421_bike.png";
         "car_name" = "BIKE RIDE";
         contactNumber = 9999999999;
         device = Android;
         deviceToken = "";
         "driver_AVGRating" = 5;
         "driver_contactNumber" = 9966696666;
         "driver_email" = "driver@gmail.com";
         "driver_fullName" = ffgg;
         "driver_image" = "https://demo4.evirtualservices.net/pathmark/img/uploads/users/1699486400PLUDIN_1699454004466.png";
         "driver_zipCode" = "";
         email = "nik222@mailinator.com";
         estimatedPrice = "";
         fullName = nik;
         image = "https://demo4.evirtualservices.net/pathmark/img/uploads/users/1699486114PLUDIN_1699453804676.png";
         paymentMethod = Cash;
         paymentStatus = 1;
         rideStatus = 5;
         shareTo = 111;
         shreFrom = 106;
         totalAmount = 1;
         totalDistance = 1;
         transactionId = "Cash_1699884464892";
         vehicleNumber = hjjjj;
         vehicleType = 2;
         */
        
        let item = self.arr_shared_booking[indexPath.row] as? [String:Any]
        print(item as Any)
        
        cell.lbl_address_name.text = (item!["fullName"] as! String)
        
        cell.lbl_from.text = (item!["RequestPickupAddress"] as! String)
        cell.lbl_to.text = (item!["RequestDropAddress"] as! String)
        
        cell.lbl_vehicle_type.text = (item!["car_name"] as! String)
        cell.lbl_vehicle_number.text = (item!["vehicleNumber"] as! String)+"("+(item!["VehicleColor"] as! String)+")"
        
        cell.lbl_type.text = "Driver's name : \(item!["driver_fullName"] as! String) - \(item!["driver_AVGRating"]!)"
        
        cell.img_profile.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
        cell.img_profile.sd_setImage(with: URL(string: (item!["car_image"] as! String)), placeholderImage: UIImage(named: "1024"))
        
        cell.img_car_profile.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
        cell.img_car_profile.sd_setImage(with: URL(string: (item!["driver_image"] as! String)), placeholderImage: UIImage(named: "1024"))
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    
}


class shared_booking_table_cell: UITableViewCell {
    
    @IBOutlet weak var btn_call:UIButton!
    @IBOutlet weak var btn_chat:UIButton!
    
    @IBOutlet weak var lbl_address_name:UILabel!
    
    @IBOutlet weak var lbl_to:UILabel! {
        didSet {
            lbl_to.textColor = .black
        }
    }
    @IBOutlet weak var lbl_from:UILabel! {
        didSet {
            lbl_from.textColor = .black
        }
    }
    
    @IBOutlet weak var lbl_vehicle_type:UILabel!
    @IBOutlet weak var lbl_vehicle_number:UILabel!
    
    @IBOutlet weak var lbl_type:UILabel!
    @IBOutlet weak var img_profile:UIImageView! {
        didSet {
            img_profile.layer.cornerRadius = 25
            img_profile.clipsToBounds = true
        }
    }
    @IBOutlet weak var img_car_profile:UIImageView! {
        didSet {
            img_car_profile.layer.cornerRadius = 25
            img_car_profile.clipsToBounds = true
        }
    }
}
