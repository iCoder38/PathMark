//
//  bKash_payment_gateway.swift
//  PathMark
//
//  Created by Dishant Rajput on 30/04/24.
//

import UIKit
import Foundation
import Alamofire

class bKash_payment_gateway: UIViewController {
    
    // Define your API endpoint
    let bKashAPIURL = URL(string: "https://api.bkash.com")!
    
    // Define your bKash credentials
    let merchantID = "your_merchant_id"
    let username = "sandboxTokenizedUser02"
    let password = "sandboxTokenizedUser02@12345"
    
    // Define your payment details
    let amount = "100"
    let invoiceNumber = "12345"
    
    let apiKey = "4f6o0cjiki2rfm34kfdadl1eqq"
    let apiSecret = "2is7hdktrekvrbljjh44ll3d9l1dtjo4pasmjvs5vl5qr3fug4b"
    @IBOutlet weak var btn_pay:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btn_pay.addTarget(self, action: #selector(bKash_payment), for: .touchUpInside)
        
    }
    
    @objc func bKash_payment() {
        
//        let apiKey = "4f6o0cjiki2rfm34kfdadl1eqq"
//        let apiSecret = "2is7hdktrekvrbljjh44ll3d9l1dtjo4pasmjvs5vl5qr3fug4b"
//        
//        generateGrantToken(apiKey: apiKey, apiSecret: apiSecret) { result in
//            switch result {
//            case .success(let grantToken):
//                print("Grant Token: \(grantToken)")
//                // Use the grant token as an authorization parameter
//                
//            case .failure(let error):
//                print("Error: \(error.localizedDescription)")
//                // Handle the error
//            }
//        }
    
        
        // Example usage:
        /*let accessToken = "eyJraWQiOiJvTVJzNU9ZY0wrUnRXQ2o3ZEJtdlc5VDBEcytrckw5M1NzY0VqUzlERXVzPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiJlODNlMDkwMC1jY2ZmLTQzYTctODhiNy0wNjE5NDJkMTVmOTYiLCJhdWQiOiI2cDdhcWVzZmljZTAxazltNWdxZTJhMGlhaCIsImV2ZW50X2lkIjoiZjg5M2RjYzEtMjdkMS00OTRhLTk4YWEtNTVmOTQxMjQ0ZDYwIiwidG9rZW5fdXNlIjoiaWQiLCJhdXRoX3RpbWUiOjE3MTQ0Nzc2NTEsImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC5hcC1zb3V0aGVhc3QtMS5hbWF6b25hd3MuY29tXC9hcC1zb3V0aGVhc3QtMV9yYTNuUFkzSlMiLCJjb2duaXRvOnVzZXJuYW1lIjoic2FuZGJveFRva2VuaXplZFVzZXIwMiIsImV4cCI6MTcxNDQ4MTI1MCwiaWF0IjoxNzE0NDc3NjUxfQ.tIc8hqGZmJjE_xjtZU4keDZkxIaWii-4p9kMtRKy8JxiqoxkmqscPWFaVD4EUZN2m9xGa9CmKkzy3C4UZh6neTjoOpbYob7fKmFntKkbgskOY3gKyC3v9PK_zj60bMjpMdjWCNRTFJWB-rr0pNFUNGTvJ49ruHhy4VmeziMwmK3YuJ96HyYunWEcbnH84YN9qvDIDoZ2XJ5pUWEOrFMYFfa5200CmFjLIUB6ORJUaJ4es8D4Ml673bc8U4KZJKp2tuDA_WVWcFwdGvVxpd8qDzYzdFID_YyPvK2c8kTXSpFFwjkpM4_qr9pkO_FLBq8KNLoaTR6CAxxUWMgHQCSbkQ"
        let amount = 100.0 // Example amount in BDT

        createBKashPayment(accessToken: accessToken, amount: amount) { result in
            switch result {
            case .success(let response):
                print("Payment Response: \(response)")
                // Handle the payment response
                
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                // Handle the error
            }
        }*/
        
        
        // 2
        // initiateBKashPayment(amount: 100.0)
        
        
        self.getAccessToken2020()
    }
    
    
    
    func getAccessToken2020() {
        
        let tokenURLString = bkash_generate_token
        
        let parameters: [String: Any] = [
            "app_key": bkash_app_key,
            "app_secret": bkash_app_secret_key,
        ]
        
        guard let url = URL(string: tokenURLString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(bkash_user_name, forHTTPHeaderField: "username")
        request.setValue(bkash_password, forHTTPHeaderField: "password")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Basic " + "\(apiKey):\(apiSecret)".data(using: .utf8)!.base64EncodedString(), forHTTPHeaderField: "Authorization")
        
        do {
            let requestData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = requestData
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    // Parse response JSON to extract access token
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        // print(json)
                        // id_token
                        if let accessToken = json!["id_token"] as? String {
                            print("Access Token: \(accessToken)")
                            self.create_payment_after_token(token: "\(accessToken)")
                            
                        } else {
                            print("Access token not found in response")
                        }
                    } catch {
                        print("Error parsing JSON response: \(error.localizedDescription)")
                    }
                } else if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }.resume()
        } catch {
            print("Error serializing request data: \(error.localizedDescription)")
        }
    }
    
    func generateRandomDigits(_ digitNumber: Int) -> String {
        var number = ""
        for i in 0..<digitNumber {
            var randomNumber = arc4random_uniform(10)
            while randomNumber == 0 && i == 0 {
                randomNumber = arc4random_uniform(10)
            }
            number += "\(randomNumber)"
        }
        return number
    }
    
    func create_payment_after_token(token:String) {
        
        // Define your API endpoint for creating a payment
        let paymentURL = URL(string: bkash_create_payment)!

        // Create payment request
        var paymentRequest = URLRequest(url: paymentURL)
        paymentRequest.httpMethod = "POST"

        // Set headers
        paymentRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        paymentRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        paymentRequest.setValue(bkash_app_key, forHTTPHeaderField: "x-app-key")

        // Set your payment details
        let paymentDetails: [String: Any] = [
            "amount": 100, // Amount in your currency
            "currency": "BDT", // Currency code
            "intent": "sale", // Payment intent
            "callbackURL":bkash_call_back_URL,
            "mode":"0011",
            "merchantInvoiceNumber":"invoice_\(generateRandomDigits(10))",
            "payerReference":"ref_\(generateRandomDigits(6))"
            // Other payment details as required by bKash API
        ]

        // Convert payment details to Data
        guard let paymentData = try? JSONSerialization.data(withJSONObject: paymentDetails) else {
            print("Error creating payment data")
            return
        }

        // Attach payment data to the request
        paymentRequest.httpBody = paymentData

        // Create a URLSessionDataTask to send the payment request
        let paymentTask = URLSession.shared.dataTask(with: paymentRequest) { (data, response, error) in
            // Handle response
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }

            if httpResponse.statusCode == 200 {
                // Parse and handle successful response
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print("Payment Response JSON: \(json)")
                        print(type(of: json))
                        // Process your payment response here
                        
                        var dict: Dictionary<AnyHashable, Any>
                        dict = json as! Dictionary<AnyHashable, Any>
                        
                        self.executeBKashPayment(token:token,payment_id: dict["paymentID"] as! String)
                        
                    } catch {
                        print("Error parsing payment response: \(error)")
                    }
                } else {
                    print("Empty payment response data")
                }
            } else {
                print("HTTP status code: \(httpResponse.statusCode)")
                // Handle other status codes
            }
        }

        // Execute the payment task
        paymentTask.resume()
    }
    
    
    func executeBKashPayment(token:String,payment_id:String) {
        
        print(payment_id as Any)
        
        // Define your API endpoint for creating a payment
        let paymentURL = URL(string: bkash_execute_payment)!

        // Create payment request
        var paymentRequest = URLRequest(url: paymentURL)
        paymentRequest.httpMethod = "POST"

        // Set headers
        paymentRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // request.setValue("Basic " + "\(apiKey):\(apiSecret)".data(using: .utf8)!.base64EncodedString(), forHTTPHeaderField: "Authorization")
        paymentRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        paymentRequest.setValue(bkash_app_key, forHTTPHeaderField: "x-app-key")

        // Set your payment details
        let paymentDetails: [String: Any] = [
            "paymentID": String(payment_id),
        ]

        // Convert payment details to Data
        guard let paymentData = try? JSONSerialization.data(withJSONObject: paymentDetails) else {
            print("Error creating payment data")
            return
        }

        // Attach payment data to the request
        paymentRequest.httpBody = paymentData

        // Create a URLSessionDataTask to send the payment request
        let paymentTask = URLSession.shared.dataTask(with: paymentRequest) { (data, response, error) in
            // Handle response
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }

            if httpResponse.statusCode == 200 {
                // Parse and handle successful response
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print("Payment Response JSON: \(json)")
                        
                    } catch {
                        print("Error parsing payment response: \(error)")
                    }
                } else {
                    print("Empty payment response data")
                }
            } else {
                print("HTTP status code: \(httpResponse.statusCode)")
                // Handle other status codes
            }
        }

        // Execute the payment task
        paymentTask.resume()
    }
    
    
    
    
    // request.setValue("yourAppKey", forHTTPHeaderField: "x-app-key")
    
    func createBKashPayment(accessToken: String, amount: Double, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(accessToken)"
        ]
        
        let parameters: [String: Any] = [
            "amount": amount,
            "currency": "BDT",
            // Add any additional parameters required by the bKash API
        ]
        
        AF.request("https://tokenized.sandbox.bka.sh/v1.2.0-beta/tokenized/checkout/create", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any] {
                    completion(.success(json))
                } else {
                    let error = NSError(domain: "Parsing Error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Response is not in expected JSON format"])
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func initiateBKashPayment(amount: Double) {
        let url = URL(string: "https://tokenized.sandbox.bka.sh/v1.2.0-beta/tokenized/checkout/execute")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // Set your authorization header here
        request.setValue("Bearer eyJraWQiOiJvTVJzNU9ZY0wrUnRXQ2o3ZEJtdlc5VDBEcytrckw5M1NzY0VqUzlERXVzPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiJlODNlMDkwMC1jY2ZmLTQzYTctODhiNy0wNjE5NDJkMTVmOTYiLCJhdWQiOiI2cDdhcWVzZmljZTAxazltNWdxZTJhMGlhaCIsImV2ZW50X2lkIjoiZjg5M2RjYzEtMjdkMS00OTRhLTk4YWEtNTVmOTQxMjQ0ZDYwIiwidG9rZW5fdXNlIjoiaWQiLCJhdXRoX3RpbWUiOjE3MTQ0Nzc2NTEsImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC5hcC1zb3V0aGVhc3QtMS5hbWF6b25hd3MuY29tXC9hcC1zb3V0aGVhc3QtMV9yYTNuUFkzSlMiLCJjb2duaXRvOnVzZXJuYW1lIjoic2FuZGJveFRva2VuaXplZFVzZXIwMiIsImV4cCI6MTcxNDQ4MTI1MCwiaWF0IjoxNzE0NDc3NjUxfQ.tIc8hqGZmJjE_xjtZU4keDZkxIaWii-4p9kMtRKy8JxiqoxkmqscPWFaVD4EUZN2m9xGa9CmKkzy3C4UZh6neTjoOpbYob7fKmFntKkbgskOY3gKyC3v9PK_zj60bMjpMdjWCNRTFJWB-rr0pNFUNGTvJ49ruHhy4VmeziMwmK3YuJ96HyYunWEcbnH84YN9qvDIDoZ2XJ5pUWEOrFMYFfa5200CmFjLIUB6ORJUaJ4es8D4Ml673bc8U4KZJKp2tuDA_WVWcFwdGvVxpd8qDzYzdFID_YyPvK2c8kTXSpFFwjkpM4_qr9pkO_FLBq8KNLoaTR6CAxxUWMgHQCSbkQ", forHTTPHeaderField: "Authorization")
        
        let parameters: [String: Any] = [
            "amount": amount,
            "currency": "BDT",
            // Add other parameters as required
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch {
            print("Error serializing parameters: \(error.localizedDescription)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            // Handle response
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
                // Parse response JSON
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Response: \(jsonResponse)")
                    // Handle response JSON
                } catch {
                    print("Error parsing response: \(error.localizedDescription)")
                }
            }
        }
        
        task.resume()
    }

    
    
    
    
    
    
    
    
    
    
    
    
    func generateGrantToken(apiKey: String, apiSecret: String, completion: @escaping (Result<String, Error>) -> Void) {
        // let clientID = "4f6o0cjiki2rfm34kfdadl1eqq"
        // let clientSecret = "2is7hdktrekvrbljjh44ll3d9l1dtjo4pasmjvs5vl5qr3fug4b"
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let parameters: [String: Any] = [
            "app_key": apiKey,
            "app_secret": apiSecret
        ]
        
        AF.request("https://tokenized.sandbox.bka.sh/v1.2.0-beta/tokenized/checkout/token/grant", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any], let grantToken = json["grant_token"] as? String {
                    completion(.success(grantToken))
                } else {
                    let error = NSError(domain: "Parsing Error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Grant token not found in response"])
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
     /*
    func generateBKashToken(clientID: String, clientSecret: String, completion: @escaping (Result<String, Error>) -> Void) {
        
        let url = "https://tokenized.sandbox.bka.sh/v1.2.0-beta/tokenized/checkout/token/grant"

        let parameters: [String: Any] = [
            "app_key": clientID,
            "app_secret": clientSecret,
            "grant_type": "client_credentials"
        ]

        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let json = value as? [String: Any], let accessToken = json["id_token"] as? String {
                        completion(.success(accessToken))
                    } else {
                        completion(.failure(NSError(domain: "com.evs.dev.PathMark", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response format"])))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func initiateBKashPayment(amount: Double, phoneNumber: String, completion: @escaping (Error?) -> Void) {
        let merchantID = "PATHMARK BD PRIVATE LIMITED (ZARIB)-RM59258"
        let username = "sandboxTokenizedUser02"
        let password = "sandboxTokenizedUser02@12345"
        let url = "https://tokenized.sandbox.bka.sh/v1.2.0-beta/tokenized/checkout/create"

        let headers: HTTPHeaders = [
            "X-APP-Key": merchantID,
            "Content-Type": "application/json"
        ]

        let parameters: [String: Any] = [
            "amount": amount,
            "intent": "sale",
            "currency": "BDT",
            "merchantInvoiceNumber": "your_unique_invoice_number",
            "merchantID": merchantID,
            "payerReference": phoneNumber
        ]

        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Payment initiated successfully: \(value)")
                    completion(nil)
                case .failure(let error):
                    print("Error initiating payment: \(error)")
                    completion(error)
                }
            }
    }

    
    func initiateBKashPayment(amount: Double) {
        let url = URL(string: "https://sandbox.bkash.com/payment/agreement/create")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // Set your authorization header here
        request.setValue("Bearer <your_access_token>", forHTTPHeaderField: "Authorization")
        
        let parameters: [String: Any] = [
            "amount": amount,
            "currency": "BDT",
            // Add other parameters as required
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch {
            print("Error serializing parameters: \(error.localizedDescription)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            // Handle response
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
                // Parse response JSON
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Response: \(jsonResponse)")
                    // Handle response JSON
                } catch {
                    print("Error parsing response: \(error.localizedDescription)")
                }
            }
        }
        
        task.resume()
    }

    
    
    
    
    
    
    
    
    // This method should be called when your app is opened from the redirect URI
    func handleOpenURL(url: URL) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let queryItems = components.queryItems else {
            print("Invalid URL or missing query items")
            return
        }
        
        for item in queryItems {
            if item.name == "code" {
                // Found the authorization code
                let authorizationCode = item.value
                // Now you can use this authorization code to exchange for an access token
                print(authorizationCode as Any)
                
                // exchangeAuthorizationCodeForAccessToken(authorizationCode: authorizationCode)
                return
            }
        }
        
        print("Authorization code not found in URL")
    }

    
    
    
    
    
    
    // Function to initiate a payment with bKash
    func initiatePayment(amount: Double, merchantID: String, accessToken: String) {
        // Construct the payment initiation request
        let paymentURLString = "https://api.bkash.com/payment/initiate"
        let parameters: [String: Any] = [
            "amount": amount,
            "merchantID": merchantID,
            // Add other required parameters
        ]
        
        guard let url = URL(string: paymentURLString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let requestData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = requestData
            
            // Send the request
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                // Handle the response
                if let data = data {
                    // Parse the response
                    // Extract checkout URL or payment ID
                } else if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }.resume()
        } catch {
            print("Error serializing request data: \(error.localizedDescription)")
        }
    }
    
    
    /*
     @Header("username") username: String?,
     @Header("password") password: String?,
     @Body grantTokenRequest: GrantTokenRequest
     
     @SerializedName("app_key")
     var appKey : String? = null,
     @SerializedName("app_secret")
     var appSecret  : String? = null
     */
    func getAccessToken2020() {
        let apiKey = "4f6o0cjiki2rfm34kfdadl1eqq"
        let apiSecret = "2is7hdktrekvrbljjh44ll3d9l1dtjo4pasmjvs5vl5qr3fug4b"
        
        let tokenURLString = "https://tokenized.sandbox.bka.sh/v1.2.0-beta/tokenized/checkout/token/grant"
        
        let parameters: [String: Any] = [
            "app_key": apiKey,
            "app_secret": apiSecret,
            "username":"sandboxTokenizedUser02",
            "password":"sandboxTokenizedUser02@12345"
            // "Username":"01332511501",
            // "Password":"^rw4?WX:GCI",
        ]
        
        guard let url = URL(string: tokenURLString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Basic " + "\(apiKey):\(apiSecret)".data(using: .utf8)!.base64EncodedString(), forHTTPHeaderField: "Authorization")
        
        do {
            let requestData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = requestData
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    // Parse response JSON to extract access token
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        print(json)
                        if let accessToken = json!["access_token"] as? String {
                            print("Access Token: \(accessToken)")
                            // Use the access token in your API requests
                        } else {
                            print("Access token not found in response")
                        }
                    } catch {
                        print("Error parsing JSON response: \(error.localizedDescription)")
                    }
                } else if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }.resume()
        } catch {
            print("Error serializing request data: \(error.localizedDescription)")
        }
    }
    
    
    @objc func check() {
        
        
        if let language = UserDefaults.standard.string(forKey: str_language_convert) {
            print(language as Any)
            
            if (language == "en") {
                ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: "Please wait...")
            } else {
                ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: "ড্রাইভার খোঁজা হচ্ছে")
            }
            
            
        }
        
        
        
        self.view.endEditing(true)
        
        
        
        let headers: HTTPHeaders = [
            "username":String("sandboxTokenizedUser02"),
            "password":String("sandboxTokenizedUser02@12345"),
        ]
        var parameters:Dictionary<AnyHashable, Any>!
        parameters = [
            "app_key"   : "4f6o0cjiki2rfm34kfdadl1eqq",
            "appSecret" : String("2is7hdktrekvrbljjh44ll3d9l1dtjo4pasmjvs5vl5qr3fug4b"),
            
        ]
        
        print(parameters as Any)
        
        AF.request("https://tokenized.sandbox.bka.sh/v1.2.0-beta/tokenized/checkout/token/grant", method: .post, parameters: parameters as? Parameters,headers: headers).responseJSON {
            response in
            // debugPrint(response.result)
            
            switch response.result {
            case let .success(value):
                
                let JSON = value as! NSDictionary
                print(JSON as Any)
                
                
            case let .failure(error):
                print(error)
                ERProgressHud.sharedInstance.hide()
                
                self.please_check_your_internet_connection()
                
            }
        }
        
        
    }
    func generateBKashToken() {
        let apiKey = "4f6o0cjiki2rfm34kfdadl1eqq"
        let apiSecret = "2is7hdktrekvrbljjh44ll3d9l1dtjo4pasmjvs5vl5qr3fug4b"
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Basic " + "\(apiKey):\(apiSecret)".data(using: .utf8)!.base64EncodedString()
        ]
        
        AF.request("https://api.bkash.com/token", method: .post, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                // Handle success
                print("Response: \(value)")
                
            case .failure(let error):
                // Handle failure
                print("Error: \(error)")
            }
        }
    }
    
    
    
    
    
    
    
    func generateBKashAccessToken(completion: @escaping (Result<String, Error>) -> Void) {
        let apiKey = "4f6o0cjiki2rfm34kfdadl1eqq"
        let apiSecret = "2is7hdktrekvrbljjh44ll3d9l1dtjo4pasmjvs5vl5qr3fug4b"
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Basic \(Data("\(apiKey):\(apiSecret)".utf8).base64EncodedString())"
        ]
        
        let parameters: [String: Any] = [
            "app_key": apiKey,
            "app_secret": apiSecret,
            "username":"sandboxTokenizedUser02",
            "password":"sandboxTokenizedUser02@12345",
            // Add any additional parameters required by the bKash API
        ]
        
        AF.request("https://api.bkash.com/token", method: .post, parameters: parameters, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any], let accessToken = json["access_token"] as? String {
                    completion(.success(accessToken))
                } else {
                    completion(.failure(NSError(domain: "Parsing Error", code: 0, userInfo: nil)))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func generateGrantToken(apiKey: String, apiSecret: String, completion: @escaping (Result<String, Error>) -> Void) {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let parameters: [String: Any] = [
            "app_key": "4f6o0cjiki2rfm34kfdadl1eqq",
            "app_secret": "2is7hdktrekvrbljjh44ll3d9l1dtjo4pasmjvs5vl5qr3fug4b",
            "username":"sandboxTokenizedUser02",
            "password":"sandboxTokenizedUser02@12345",
        ]
        
        AF.request("https://tokenized.sandbox.bka.sh/v1.2.0-beta/tokenized/checkout/token/grant", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any], let grantToken = json["grant_token"] as? String {
                    completion(.success(grantToken))
                } else {
                    let error = NSError(domain: "Parsing Error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Grant token not found in response"])
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }*/
}
