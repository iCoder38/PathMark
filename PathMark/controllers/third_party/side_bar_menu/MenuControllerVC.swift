//
//  MenuControllerVC.swift
//  SidebarMenu
//
//  Created by Apple  on 16/10/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class MenuControllerVC: UIViewController {

    let cellReuseIdentifier = "menuControllerVCTableCell"
    
    var bgImage: UIImageView?
    
    var roleIs:String!
    
    @IBOutlet weak var navigationBar:UIView! {
        didSet {
            navigationBar.backgroundColor = navigation_color
        }
    }
    
    @IBOutlet weak var viewUnderNavigation:UIView! {
        didSet {
            viewUnderNavigation.backgroundColor = navigation_color
        }
    }
    
    @IBOutlet weak var lblNavigationTitle:UILabel! {
        didSet {
            lblNavigationTitle.text = "MENU"
            lblNavigationTitle.textColor = .white
        }
    }
    
    @IBOutlet weak var imgSidebarMenuImage:UIImageView! {
        didSet {
            imgSidebarMenuImage.backgroundColor = .clear
            imgSidebarMenuImage.layer.cornerRadius = 14
            imgSidebarMenuImage.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var btn_panic:UIButton! {
        didSet {
            btn_panic.setTitle("PANIC SOS", for: .normal)
            btn_panic.setTitleColor(.white, for: .normal)
            btn_panic.layer.cornerRadius = 6
            btn_panic.clipsToBounds = true
        }
    }
    
    // Member
    var arr_customer_title = ["Dashboard",
                              "Edit profile",
                              "Bookings",
                              "Emergency Contacts",
                              "Address",
                              "Change Password",
                              "Help",
                              "Logout"]
    
    var arr_customer_image = ["home",
                              "home",
                              "booking",
                              "emergency_contacts",
                              "trip",
                              "lock_24",
                              "help",
                              "logout"]
    
    // driver
    var arr_driver_title = ["Dashboard", "Edit profile","Order History", "New Orders" , "Go4Card" , "Review & Rating" , "Earnings" , "Cashout" , "Invite Friends($5)" ,"Change password" , "Logout" ]
    var arr_driver_image = ["home","edit2","trip","lock","help","logout"]
    
    
    @IBOutlet weak var lblUserName:UILabel! {
        didSet {
            lblUserName.text = "JOHN SMITH"
            lblUserName.textColor = .white
        }
    }
    @IBOutlet weak var lblPhoneNumber:UILabel! {
        didSet {
            lblPhoneNumber.textColor = .white
        }
    }
    
    @IBOutlet var menuButton:UIButton!
    
    @IBOutlet weak var tbleView: UITableView! {
        didSet {
            tbleView.delegate = self
            tbleView.dataSource = self
            tbleView.tableFooterView = UIView.init()
            tbleView.backgroundColor = navigation_color
            // tbleView.separatorInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
            tbleView.separatorColor = .white
        }
    }
    @IBOutlet weak var lblMainTitle:UILabel!
    @IBOutlet weak var lblAddress:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideBarMenuClick()
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        self.tbleView.separatorColor = .white

        self.view.backgroundColor = .white
        
        self.sideBarMenuClick()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.view.backgroundColor = navigation_color
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            
             if person["role"] as! String == "Member" {
                
                 self.lblUserName.text = (person["fullName"] as! String)
                 // self.lblAddress.text = (person["address"] as! String)
                 
                 self.imgSidebarMenuImage.sd_setImage(with: URL(string: (person["image"] as! String)), placeholderImage: UIImage(named: "logo"))
                 
             } else {
                
                self.lblUserName.text = (person["fullName"] as! String)
                self.lblPhoneNumber.text = (person["contactNumber"] as! String)
                
                 
            }
             
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    @objc func sideBarMenuClick() {
        
        if revealViewController() != nil {
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
            revealViewController().rearViewRevealWidth = 300
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
          }
    }
}

extension MenuControllerVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
        
            if person["role"] as! String == "Member" {
                return arr_customer_title.count
            } else {
                return self.arr_driver_title.count
            }
            
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MenuControllerVCTableCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! MenuControllerVCTableCell
        
        cell.backgroundColor = .clear
      
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
        
            if person["role"] as! String == "Member" {
            
         cell.lblName.text = self.arr_customer_title[indexPath.row]
         cell.lblName.textColor = .white
         
         cell.imgProfile.image = UIImage(named: self.arr_customer_image[indexPath.row])
         cell.imgProfile.backgroundColor = .clear
         
            } else {
                
                cell.lblName.text = self.arr_driver_title[indexPath.row]
                cell.lblName.textColor = .white
                
                // cell.imgProfile.image = UIImage(named: self.arr_customer_image[indexPath.row])
                // cell.imgProfile.backgroundColor = .clear
 
            }
            
        } else {
        
            // temp
        
        
         }
        
        
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            if person["role"] as! String == "Member" {
                
                if self.arr_customer_title[indexPath.row] == "Emergency Contacts" {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let sw = storyboard.instantiateViewController(withIdentifier: "sw") as! SWRevealViewController
                    self.view.window?.rootViewController = sw
                    let destinationController = self.storyboard?.instantiateViewController(withIdentifier: "emergency_contacts_id")
                    let navigationController = UINavigationController(rootViewController: destinationController!)
                    sw.setFront(navigationController, animated: true)
                    
                } else if self.arr_customer_title[indexPath.row] == "Dashboard" {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let sw = storyboard.instantiateViewController(withIdentifier: "sw") as! SWRevealViewController
                    self.view.window?.rootViewController = sw
                    let destinationController = self.storyboard?.instantiateViewController(withIdentifier: "dashboard_id")
                    let navigationController = UINavigationController(rootViewController: destinationController!)
                    sw.setFront(navigationController, animated: true)
                    
                } else if self.arr_customer_title[indexPath.row] == "Address" {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let sw = storyboard.instantiateViewController(withIdentifier: "sw") as! SWRevealViewController
                    self.view.window?.rootViewController = sw
                    let destinationController = self.storyboard?.instantiateViewController(withIdentifier: "address_list_id")
                    let navigationController = UINavigationController(rootViewController: destinationController!)
                    sw.setFront(navigationController, animated: true)
                    
                }  else if self.arr_customer_title[indexPath.row] == "Help" {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let sw = storyboard.instantiateViewController(withIdentifier: "sw") as! SWRevealViewController
                    self.view.window?.rootViewController = sw
                    let destinationController = self.storyboard?.instantiateViewController(withIdentifier: "help_id")
                    let navigationController = UINavigationController(rootViewController: destinationController!)
                    sw.setFront(navigationController, animated: true)
                    
                } else if self.arr_customer_title [indexPath.row] == "Bookings" {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let sw = storyboard.instantiateViewController(withIdentifier: "sw") as! SWRevealViewController
                    self.view.window?.rootViewController = sw
                    let destinationController = self.storyboard?.instantiateViewController(withIdentifier: "ride_history_id")
                    let navigationController = UINavigationController(rootViewController: destinationController!)
                    sw.setFront(navigationController, animated: true)
                    
                } else if self.arr_customer_title [indexPath.row] == "Logout" {
                    
                    self.validation_before_logout()
                }
            }
        }
    }
    
    
    @objc func validation_before_logout() {
        self.logoutWB(str_show_loader: "yes")
    }
    
    @objc func logoutWB(str_show_loader:String) {
        
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
                    "action"    : "logout",
                    "userId"    : String(myString),
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
                            
                            let defaults = UserDefaults.standard
                            defaults.setValue("", forKey: str_save_login_user_data)
                            defaults.setValue("", forKey: str_save_last_api_token)
                            
                            ERProgressHud.sharedInstance.hide()
                            self.dismiss(animated: true)
                            
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let sw = storyboard.instantiateViewController(withIdentifier: "sw") as! SWRevealViewController
                            self.view.window?.rootViewController = sw
                            let destinationController = self.storyboard?.instantiateViewController(withIdentifier: "login_id")
                            let navigationController = UINavigationController(rootViewController: destinationController!)
                            sw.setFront(navigationController, animated: true)
                            
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
                            
                            self.logoutWB(str_show_loader: "no")
                            
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
    
//    @objc func logoutWB() {
//        self.view.endEditing(true)
//
//        ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: "Please wait...")
//
//        if Login.IsInternetAvailable() == false {
//            self.please_check_your_internet_connection()
//            return
//        }
//
//        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
//            // let str:String = person["role"] as! String
//
//            let x : Int = person["userId"] as! Int
//            let myString = String(x)
//
//            let parameters = [
//                "action"    : "logout",
//                "userId"    : String(myString),
//            ]
//
//            AF.request(application_base_url, method: .post, parameters: parameters)
//
//                .response { response in
//
//                    do {
//                        if response.error != nil{
//                            print(response.error as Any, terminator: "")
//                        }
//
//                        if let jsonDict = try JSONSerialization.jsonObject(with: (response.data as Data?)!, options: []) as? [String: AnyObject]{
//
//                            print(jsonDict as Any, terminator: "")
//
//                            // for status alert
//                            var status_alert : String!
//                            status_alert = (jsonDict["status"] as? String)
//
//                            // for message alert
//                            var str_data_message : String!
//                            str_data_message = jsonDict["msg"] as? String
//
//                            if status_alert.lowercased() == "success" {
//
//                                print("=====> yes")
//                                ERProgressHud.sharedInstance.hide()
//
//                                let defaults = UserDefaults.standard
//                                defaults.setValue("", forKey: str_save_login_user_data)
//                                defaults.setValue(nil, forKey: str_save_login_user_data)
//
//                                let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginId")
//                                self.navigationController?.pushViewController(push, animated: true)
//
//                            } else {
//
//                                print("=====> no")
//                                ERProgressHud.sharedInstance.hide()
//
//                                let alert = NewYorkAlertController(title: String(status_alert), message: String(str_data_message), style: .alert)
//                                let cancel = NewYorkButton(title: "dismiss", style: .cancel)
//                                alert.addButtons([cancel])
//                                self.present(alert, animated: true)
//
//                            }
//
//                        } else {
//
//                            self.please_check_your_internet_connection()
//
//                            return
//                        }
//
//                    } catch _ {
//                        print("Exception!")
//                    }
//                }
//        }
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension MenuControllerVC: UITableViewDelegate {
    
}
