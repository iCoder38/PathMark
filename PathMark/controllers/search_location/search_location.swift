//
//  search_location.swift
//  PathMark
//
//  Created by Dishant Rajput on 14/12/23.
//

import UIKit
import Alamofire

class search_location: UIViewController {

    var arr_address_list:NSMutableArray! = []
    
    var db:DBHelper = DBHelper()
    var persons:[Person] = []
    
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
            
            if let language = UserDefaults.standard.string(forKey: str_language_convert) {
                print(language as Any)
                
                if (language == "en") {
                    lblNavigationTitle.text = "Saved location"
                } else {
                    lblNavigationTitle.text = "সেইভ করা স্থানসমূহ"
                }
                    
            }
            lblNavigationTitle.textColor = .white
        }
    }
    
    // ***************************************************************** // nav
    
    @IBOutlet weak var tbleView:UITableView!
    
    @IBOutlet weak var btn_add:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnBack.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        self.tbleView.separatorColor = .clear
        
        /*let kUserDefault = UserDefaults.standard
        let data = kUserDefault.array(forKey: "nameArray")! as? [String] ?? [String]()
        print(data)*/
        
        if let language = UserDefaults.standard.string(forKey: str_language_convert) {
            print(language as Any)
            
            if (language == "en") {
                self.btn_add.setTitle("+ add", for: .normal)
            } else {
                self.btn_add.setTitle("+ যোগ করুন", for: .normal)
            }
                
        }
        
        self.btn_add.addTarget(self, action: #selector(add_contacts_click_method), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.arr_address_list.removeAllObjects()
        self.address_list_wb(str_show_loader: "yes")
    }
    
    //
    @objc func address_list_wb(str_show_loader:String) {

        var parameters:Dictionary<AnyHashable, Any>!
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            
            if (str_show_loader == "yes") {
                if let language = UserDefaults.standard.string(forKey: str_language_convert) {
                    print(language as Any)
                    
                    if (language == "en") {
                        ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: "Please wait...")
                    } else {
                        ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: "ড্রাইভার খোঁজা হচ্ছে")
                    }
                    
                    
                }
            }
            
            let x : Int = person["userId"] as! Int
            let myString = String(x)
            
            if let token_id_is = UserDefaults.standard.string(forKey: str_save_last_api_token) {
                print(token_id_is as Any)
                
                let headers: HTTPHeaders = [
                     "token":String(token_id_is),
                ]
    
                parameters = [
                    "action"    : "addresslist",
                    "userId"     : String(myString),
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
                            
                            if strSuccess.lowercased() == "success" {
                                ERProgressHud.sharedInstance.hide()
                                
                                var ar : NSArray!
                                ar = (JSON["data"] as! Array<Any>) as NSArray
                                // self.arr_address_list.addObjects(from: ar as! [Any])

                                let str_token = (JSON["AuthToken"] as! String)
                                UserDefaults.standard.set("", forKey: str_save_last_api_token)
                                UserDefaults.standard.set(str_token, forKey: str_save_last_api_token)
                                
                                let custom = [
                                    "type":"0"
                                 ]
                                
                                self.arr_address_list.add(custom)
                                
                                
                                for indexx in 0..<ar.count {
                                    print(ar[indexx])
                                    
                                    let item = ar[indexx] as? [String:Any]
                                    
                                    let custom = [
                                        "address_type":"\(item!["addressType"]!)",
                                        "address":(item!["address"] as! String),
                                        "lat_long":(item!["coordinate"] as! String),
                                        "type":"1"
                                     ]
                                    self.arr_address_list.add(custom)
                                }
                                
                                // recent address
                                let custom_recent = [
                                    "type":"2"
                                 ]
                                
                                self.arr_address_list.add(custom_recent)
                                
                                let defaults = UserDefaults.standard
                                let myarray = defaults.stringArray(forKey: "key_saved_address_and_lat") ?? [String]()
                                print(myarray as Any)
                                
                                self.persons = self.db.read()
                                print(self.persons.count as Any)
                                
                                for indexxx in 0..<self.persons.count {
                                    print(self.persons[indexxx].name)
                                    
                                    let custom = [
                                        "address_type":self.persons[indexxx].name,
                                        "address":self.persons[indexxx].name,
                                        "lat_long":self.persons[indexxx].lat_long,
                                        "type":"3"
                                     ]
                                    self.arr_address_list.add(custom)
                                    
                                }
                                
                                print(self.arr_address_list as Any)
                                self.tbleView.delegate = self
                                self.tbleView.dataSource = self
                                self.tbleView.reloadData()
                            }
                            else {
                                self.login_refresh_token_wb()
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
    
    @objc func login_refresh_token_wb() {

        var parameters:Dictionary<AnyHashable, Any>!
        if let get_login_details = UserDefaults.standard.value(forKey: str_save_email_password) as? [String:Any] {
            print(get_login_details as Any)
            
            if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
                
                let x : Int = person["userId"] as! Int
                let myString = String(x)
                
                parameters = [
                    "action"    : "gettoken",
                    "userId"    : String(myString),
                    "email"     : (get_login_details["email"] as! String),
                    "role"      : "Member"
                ]
            }
            
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
                                                        
                            self.address_list_wb(str_show_loader: "no")
 
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
    
    @objc func add_contacts_click_method() {
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "add_address_id")
        self.navigationController?.pushViewController(push, animated: true)
    }
    
}



extension search_location: UITableViewDataSource , UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.arr_address_list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = self.arr_address_list[indexPath.row] as? [String:Any]
        print(item as Any)
        
        if (item!["type"] as! String) == "0" {
            let cell:search_location_table_cell = tableView.dequeueReusableCell(withIdentifier: "one") as! search_location_table_cell
                
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = backgroundView
            
            cell.backgroundColor = .clear
            
            if let language = UserDefaults.standard.string(forKey: str_language_convert) {
                print(language as Any)
                
                if (language == "en") {
                    cell.lbl_added_address.text = "Added Address"
                } else {
                    cell.lbl_added_address.text = "যোগ করা ঠিকানা"
                }
                    
            }
            
            
            
            return cell
        } else if (item!["type"] as! String) == "2" {
            let cell:search_location_table_cell = tableView.dequeueReusableCell(withIdentifier: "two") as! search_location_table_cell
                
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = backgroundView
            
            cell.backgroundColor = .clear
            
            if let language = UserDefaults.standard.string(forKey: str_language_convert) {
                print(language as Any)
                
                if (language == "en") {
                    cell.lbl_recent_address.text = "Recent Address"
                } else {
                    cell.lbl_recent_address.text = "সাম্প্রতিক ঠিকানা"
                }
                    
            }
            
            
            
            return cell
        } else if (item!["type"] as! String) == "1" {
            let cell:search_location_table_cell = tableView.dequeueReusableCell(withIdentifier: "search_location_table_cell") as! search_location_table_cell
                
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = backgroundView
            
            cell.backgroundColor = .clear
             
            let item = self.arr_address_list[indexPath.row] as? [String:Any]
            print(item as Any)
            
            if "\(item!["address_type"]!)" == "0" {
                
                
                if let language = UserDefaults.standard.string(forKey: str_language_convert) {
                    print(language as Any)
                    
                    if (language == "en") {
                        cell.lbl_title.text = "Home"
                    } else {
                        cell.lbl_title.text = "বাড়ি"
                    }
                        
                }
                
            } else if "\(item!["address_type"]!)" == "1" {
                cell.lbl_title.text = "Work"
                
                if let language = UserDefaults.standard.string(forKey: str_language_convert) {
                    print(language as Any)
                    
                    if (language == "en") {
                        cell.lbl_title.text = "Work"
                    } else {
                        cell.lbl_title.text = "কাজ"
                    }
                        
                }
                
            } else {
                cell.lbl_title.text = "Other"
                
                if let language = UserDefaults.standard.string(forKey: str_language_convert) {
                    print(language as Any)
                    
                    if (language == "en") {
                        cell.lbl_title.text = "Other"
                    } else {
                        cell.lbl_title.text = "অন্যান্য"
                    }
                        
                }
                
            }
            
            cell.lbl_sub_title.text = (item!["address"] as! String)
            
            return cell
        } else {
            let cell:search_location_table_cell = tableView.dequeueReusableCell(withIdentifier: "three") as! search_location_table_cell
                
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = backgroundView
            
            cell.backgroundColor = .clear
             
            let item = self.arr_address_list[indexPath.row] as? [String:Any]
            print(item as Any)
            
            cell.lbl_recent_address2.text = (item!["address"] as! String)
             
            
            return cell
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        
        let item = self.arr_address_list[indexPath.row] as? [String:Any]
        print(item as Any)
        
        if (item!["type"] as! String) == "1" {
            UserDefaults.standard.set((item!["lat_long"] as! String), forKey: "key_map_view_lat_long")
            UserDefaults.standard.set((item!["address"] as! String), forKey: "key_map_view_address")
            self.navigationController?.popViewController(animated: true)
        }
        else if (item!["type"] as! String) == "3" {
            UserDefaults.standard.set((item!["lat_long"] as! String), forKey: "key_map_view_lat_long")
            UserDefaults.standard.set((item!["address"] as! String), forKey: "key_map_view_address")
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = self.arr_address_list[indexPath.row] as? [String:Any]
        print(item as Any)
        
        if (item!["type"] as! String) == "1"  {
            return UITableView.automaticDimension
        } else  if (item!["type"] as! String) == "3"  {
            return UITableView.automaticDimension
        } else {
            return 70
        }
        
    }
    
}

class search_location_table_cell: UITableViewCell {
    
    @IBOutlet weak var view_bg:UIView! {
        didSet {
            // shadow
            view_bg.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            view_bg.layer.shadowOffset = CGSize(width: 0, height: 3)
            view_bg.layer.shadowOpacity = 1.0
            view_bg.layer.shadowRadius = 10.0
            view_bg.layer.masksToBounds = false
            view_bg.layer.cornerRadius = 12
            view_bg.backgroundColor = .white
            
        }
    }
    
    @IBOutlet weak var lbl_recent_address:UILabel!
    @IBOutlet weak var lbl_added_address:UILabel!
    
    @IBOutlet weak var lbl_title:UILabel!
    @IBOutlet weak var lbl_sub_title:UILabel!
    
    @IBOutlet weak var btn_setting:UIButton!
    
    @IBOutlet weak var view_bg2:UIView! {
        didSet {
            // shadow
            view_bg2.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            view_bg2.layer.shadowOffset = CGSize(width: 0, height: 3)
            view_bg2.layer.shadowOpacity = 1.0
            view_bg2.layer.shadowRadius = 10.0
            view_bg2.layer.masksToBounds = false
            view_bg2.layer.cornerRadius = 12
            view_bg2.backgroundColor = .white
            
        }
    }
    
    @IBOutlet weak var lbl_recent_address2:UILabel!
}

