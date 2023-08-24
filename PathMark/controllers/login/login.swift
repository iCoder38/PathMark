//
//  login.swift
//  PathMark
//
//  Created by Dishant Rajput on 10/07/23.
//

import UIKit
//import CryptoSwift
//import JWT
import CommonCrypto
import JWTDecode

// MARK:- LOCATION -
import CoreLocation
import Alamofire

class login: UIViewController , UITextFieldDelegate , CLLocationManagerDelegate {

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
    
    @IBOutlet weak var view_navigation_title:UILabel! {
        didSet {
            view_navigation_title.text = "Login"
            view_navigation_title.textColor = .white
        }
    }
    
    @IBOutlet weak var tbleView:UITableView! {
        didSet {
            tbleView.delegate = self
            tbleView.dataSource = self
            tbleView.reloadData()
            tbleView.backgroundColor = .clear
        }
    }
    
    var dict:NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let defaults = UserDefaults.standard
//        defaults.setValue("", forKey: str_save_login_user_data)
//        defaults.setValue("", forKey: str_save_last_api_token)
        
        
//        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "verify_phone_number_id") as? verify_phone_number
//        self.navigationController?.pushViewController(push!, animated: true)

        self.navigationController?.setNavigationBarHidden(true, animated: false)
         
        self.iAmHereForLocationPermission()
        
        self.remember_me()
        
    }
    
    @objc func remember_me() {
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            print(person as Any)
            
            if person["role"] as! String == "Member" {
                
                // CUSTOMER
//                let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "dashboard_id") as! dashboard
//                self.navigationController?.pushViewController(push, animated: true)
                
                
                if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
                    let indexPath = IndexPath.init(row: 0, section: 0)
                    let cell = self.tbleView.cellForRow(at: indexPath) as! login_table_cell
                    
                    cell.txtEmailAddress.text = (person["email"] as! String)
                    cell.txtPassword.text = "123456"
                }
            } else {
                
                // DRIVER
                let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DPDashboardId")
                self.navigationController?.pushViewController(push, animated: true)
                
            }
            
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
                          
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.startUpdatingLocation()
                      
            @unknown default:
                break
            }
        }
    }
    
    
    @objc func login_wb() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tbleView.cellForRow(at: indexPath) as! login_table_cell
        
        self.show_loading_UI()
        
        var parameters:Dictionary<AnyHashable, Any>!
//        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
//            let x : Int = (person["userId"] as! Int)
//            let myString = String(x)
            
            parameters = [
                "action"    : "login",
                "email"     : String(cell.txtEmailAddress.text!),
                "password"  : String(cell.txtPassword.text!)
            ]
//        }
        
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
                    
                    var dict: Dictionary<AnyHashable, Any>
                    dict = JSON["data"] as! Dictionary<AnyHashable, Any>
                    
                    if strSuccess.lowercased() == "success" {
                        
                        let defaults = UserDefaults.standard
                        defaults.setValue(dict, forKey: str_save_login_user_data)
                        
                        // save token
                        // print("\(JSON["AuthToken"]!)")
                        // print(type(of: JSON["AuthToken"]))
                        
                        let str_token = (JSON["AuthToken"] as! String)
                        UserDefaults.standard.set("", forKey: str_save_last_api_token)
                        UserDefaults.standard.set(str_token, forKey: str_save_last_api_token)
                        
                        let indexPath = IndexPath.init(row: 0, section: 0)
                        let cell = self.tbleView.cellForRow(at: indexPath) as! login_table_cell
                        
                        // save email and pass
                        // email
                        let custom_email_pass = ["email":cell.txtEmailAddress.text!,
                                                 "password":cell.txtPassword.text!]
                        
                        UserDefaults.standard.setValue(custom_email_pass, forKey: str_save_email_password)
                        //
                        
                        self.hide_loading_UI()
                        
                        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "dashboard_id") as? dashboard
                        self.navigationController?.pushViewController(push!, animated: true)
                        
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

extension login: UITableViewDataSource  , UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:login_table_cell = tableView.dequeueReusableCell(withIdentifier: "login_table_cell") as! login_table_cell
        
        cell.backgroundColor = .clear
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        cell.txtEmailAddress.delegate = self
        cell.txtPassword.delegate = self
        
        cell.btnSignIn.addTarget(self, action: #selector(home_click_method), for: .touchUpInside)
        cell.btnDontHaveAnAccount.addTarget(self, action: #selector(dontHaveAntAccountClickMethod), for: .touchUpInside)
        cell.btn_remember_me.addTarget(self, action: #selector(remember_me_click_method), for: .touchUpInside)
        
        return cell
    }
    
    // 989013037178
    // VLMBIP
    
    @objc func remember_me_click_method() {
        
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tbleView.cellForRow(at: indexPath) as! login_table_cell
        
        if cell.btn_remember_me.tag == 1 {
            
            cell.btn_remember_me.setImage(UIImage(named: "un_check"), for: .normal)
            cell.btn_remember_me.tag = 0
            
            
        } else {
            
            cell.btn_remember_me.tag = 1
            cell.btn_remember_me.setImage(UIImage(named: "check"), for: .normal)
            
            
        }
        
    }
    
    @objc func home_click_method() {
        
        // ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: "Please wait...")
        // ERProgressHud.sharedInstance.hide()
        
        self.login_wb()
        
        
        
    }
    
    @objc func btnForgotPasswordPress() {
        

        
    }
    
    @objc func signInClickMethod() {
        
        
    }
    
    @objc func dontHaveAntAccountClickMethod() {
        
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "sign_up_id")
         self.navigationController?.pushViewController(push, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 900
    }
    
}

class login_table_cell: UITableViewCell {

     
    
    @IBOutlet weak var bgColor:UIImageView!
    
    @IBOutlet weak var viewBGForUpperImage:UIView! {
        didSet {
            viewBGForUpperImage.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var txtEmailAddress:UITextField! {
        didSet {
            Utils.textFieldUI(textField: txtEmailAddress,
                              tfName: txtEmailAddress.text!,
                              tfCornerRadius: 12,
                              tfpadding: 20,
                              tfBorderWidth: 0,
                              tfBorderColor: .clear,
                              tfAppearance: .dark,
                              tfKeyboardType: .emailAddress,
                              tfBackgroundColor: .white,
                              tfPlaceholderText: "Email Address")
            
            txtEmailAddress.layer.masksToBounds = false
            txtEmailAddress.layer.shadowColor = UIColor.black.cgColor
            txtEmailAddress.layer.shadowOffset =  CGSize.zero
            txtEmailAddress.layer.shadowOpacity = 0.5
            txtEmailAddress.layer.shadowRadius = 2
             
        }
    }
    
    @IBOutlet weak var txtPassword:UITextField! {
        didSet {
            Utils.textFieldUI(textField: txtPassword,
                              tfName: txtPassword.text!,
                              tfCornerRadius: 12,
                              tfpadding: 20,
                              tfBorderWidth: 0,
                              tfBorderColor: .clear,
                              tfAppearance: .dark,
                              tfKeyboardType: .default,
                              tfBackgroundColor: .white,
                              tfPlaceholderText: "Password")
            
            txtPassword.layer.masksToBounds = false
            txtPassword.layer.shadowColor = UIColor.black.cgColor
            txtPassword.layer.shadowOffset =  CGSize.zero
            txtPassword.layer.shadowOpacity = 0.5
            txtPassword.layer.shadowRadius = 2
            txtPassword.isSecureTextEntry = true
        }
    }
    
    @IBOutlet weak var btn_remember_me:UIButton! {
        didSet {
            btn_remember_me.tag = 0
            btn_remember_me.setImage(UIImage(named: "un_check"), for: .normal)
        }
    }
    
    @IBOutlet weak var btnSignIn:UIButton! {
        didSet {
             
            Utils.buttonStyle(button: btnSignIn,
                              bCornerRadius: 12,
                              bBackgroundColor: UIColor(red: 246.0/255.0, green: 200.0/255.0, blue: 68.0/255.0, alpha: 1),
                              bTitle: "Sign In",
                              bTitleColor: .black)
            
            btnSignIn.layer.masksToBounds = false
            btnSignIn.layer.shadowColor = UIColor.black.cgColor
            btnSignIn.layer.shadowOffset =  CGSize.zero
            btnSignIn.layer.shadowOpacity = 0.5
            btnSignIn.layer.shadowRadius = 2
            
        }
    }
    
    @IBOutlet weak var btnSignUp:UIButton! {
        didSet {
            Utils.buttonStyle(button: btnSignUp, bCornerRadius: 0, bBackgroundColor: .clear, bTitle: "Sign Up", bTitleColor: .white)
        }
    }
    
    @IBOutlet weak var btnSaveAndContinue:UIButton! {
        didSet {
            Utils.buttonStyle(button: btnSaveAndContinue, bCornerRadius: 6, bBackgroundColor: .black, bTitle: "Sign In", bTitleColor: .white)
        }
    }
    
    @IBOutlet weak var btnForgotPassword:UIButton! {
        didSet {
            Utils.buttonStyle(button: btnForgotPassword,
                              bCornerRadius: 6,
                              bBackgroundColor: .clear,
                              bTitle: "Forgot Password ? - Click here",
                              bTitleColor: navigation_color)
        }
    }
    
    @IBOutlet weak var btnDontHaveAnAccount:UIButton! {
        didSet {
            Utils.buttonStyle(button: btnDontHaveAnAccount, bCornerRadius: 6, bBackgroundColor: .clear, bTitle: "Not a member? Register Now", bTitleColor: UIColor(red: 87.0/255.0, green: 77.0/255.0, blue: 112.0/255.0, alpha: 1))
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
