//
//  before_payment.swift
//  PathMark
//
//  Created by Dishant Rajput on 17/11/23.
//

import UIKit
import Alamofire
import AudioToolbox

class before_payment: UIViewController {
    
    var str_get_total_amount:String!

    
    var arr_coupon_list:NSMutableArray! = []
    
    @IBOutlet weak var view_navigation_bar:UIView! {
        didSet {
            view_navigation_bar.backgroundColor = navigation_color
        }
    }
    
    @IBOutlet weak var btn_back:UIButton!
    
    @IBOutlet weak var view_navigation_title:UILabel! {
        didSet {
            view_navigation_title.text = "Payment Method"
            view_navigation_title.textColor = .white
        }
    }
    
    @IBOutlet weak var lbl_total_payable:UILabel!
    
    @IBOutlet weak var btn_cash:UIButton! {
        didSet {
            btn_cash.layer.masksToBounds = false
            btn_cash.layer.shadowColor = UIColor.black.cgColor
            btn_cash.layer.shadowOffset =  CGSize.zero
            btn_cash.layer.shadowOpacity = 0.5
            btn_cash.layer.shadowRadius = 2
            btn_cash.backgroundColor = .white
        }
    }
    @IBOutlet weak var btn_bkash:UIButton! {
        didSet {
            btn_bkash.layer.masksToBounds = false
            btn_bkash.layer.shadowColor = UIColor.black.cgColor
            btn_bkash.layer.shadowOffset =  CGSize.zero
            btn_bkash.layer.shadowOpacity = 0.5
            btn_bkash.layer.shadowRadius = 2
            btn_bkash.backgroundColor = .white
        }
    }
    
    @IBOutlet weak var btn_cash_tick:UIButton! {
        didSet {
            btn_cash_tick.isHidden = true
        }
    }
    @IBOutlet weak var btn_bkash_tick:UIButton! {
        didSet {
            btn_bkash_tick.isHidden = true
        }
    }
    
    @IBOutlet weak var tbleView:UITableView! {
        didSet {
            /*tbleView.delegate = self
            tbleView.dataSource = self
            tbleView.reloadData()*/
            
            tbleView.backgroundColor = .clear
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.btn_cash.addTarget(self, action: #selector(cash_click_method), for: .touchUpInside)
        self.btn_bkash.addTarget(self, action: #selector(bkash_click_method), for: .touchUpInside)
        
        self.couponListWB(str_show_loader: "yes")
    }
    
    @objc func cash_click_method() {
        // AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        let generator = UIImpactFeedbackGenerator(style: .soft)
        generator.impactOccurred()
        self.btn_cash_tick.setImage(UIImage(systemName: "checkmark"), for: .normal)
        self.btn_cash_tick.isHidden = false
        self.btn_bkash_tick.isHidden = true
    }
    
    @objc func bkash_click_method() {
        let generator = UIImpactFeedbackGenerator(style: .soft)
        generator.impactOccurred()
        
        self.btn_bkash_tick.setImage(UIImage(systemName: "checkmark"), for: .normal)
        self.btn_bkash_tick.isHidden = false
        self.btn_cash_tick.isHidden = true
    }

    @objc func couponListWB(str_show_loader:String) {
        
        if (str_show_loader == "yes") {
            ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: "Please wait...")
        }
        
        
        self.view.endEditing(true)
        
        var parameters:Dictionary<AnyHashable, Any>!
        
        
            if let token_id_is = UserDefaults.standard.string(forKey: str_save_last_api_token) {
                print(token_id_is as Any)
                
                let headers: HTTPHeaders = [
                    "token":String(token_id_is),
                ]
                
                parameters = [
                    "action"    : "couponlist",
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

                            /*let str_token = (JSON["AuthToken"] as! String)
                            UserDefaults.standard.set("", forKey: str_save_last_api_token)
                            UserDefaults.standard.set(str_token, forKey: str_save_last_api_token)*/
                            
                            ERProgressHud.sharedInstance.hide()
                            self.dismiss(animated: true)
                            
                            var ar : NSArray!
                            ar = (JSON["data"] as! Array<Any>) as NSArray
                            self.arr_coupon_list.addObjects(from: ar as! [Any])
                            
                            print(self.arr_coupon_list.count as Any)
                            ERProgressHud.sharedInstance.hide()
                            
                            self.tbleView.delegate = self
                            self.tbleView.dataSource = self
                            self.tbleView.reloadData()
                            
                        } else if message == String(not_authorize_api) {
                            self.login_refresh_token_for_upcoming_ride_wb()
                            
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
    
    @objc func login_refresh_token_for_upcoming_ride_wb() {
        
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
                            
                            self.couponListWB(str_show_loader: "no")
                            
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

extension before_payment: UITableViewDataSource , UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.arr_coupon_list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:before_payment_table_cell = tableView.dequeueReusableCell(withIdentifier: "before_payment_table_cell") as! before_payment_table_cell
            
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        cell.backgroundColor = .clear
         
        let item = self.arr_coupon_list[indexPath.row] as? [String:Any]
        print(item as Any)
//
//        cell.lbl_name.text = (item!["Name"] as! String)
//        cell.lbl_phone.text = (item!["phone"] as! String)
//        cell.lbl_relation.text = "Relation : "+(item!["relation"] as! String)
//        
//        cell.btn_setting.tag = indexPath.row
//        cell.btn_setting.addTarget(self, action: #selector(setting_click_method), for: .touchUpInside)
//        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
     
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
}

class before_payment_table_cell: UITableViewCell {
    
    @IBOutlet weak var img_profile:UIImageView! {
        didSet {
            img_profile.backgroundColor = .gray
            img_profile.layer.cornerRadius = 30
            img_profile.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var lbl_name:UILabel!
    @IBOutlet weak var lbl_phone:UILabel!
    @IBOutlet weak var lbl_relation:UILabel!
    
    @IBOutlet weak var btn_setting:UIButton!
    
}
