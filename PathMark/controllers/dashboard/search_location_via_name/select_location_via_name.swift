//
//  select_location_via_name.swift
//  PathMark
//
//  Created by Dishant Rajput on 28/08/24.
//

import UIKit

class select_location_via_name: UIViewController {

    var userSelectOriginOrDestination:String!
    
    @IBOutlet weak var btnBack:UIButton! {
        didSet {
            btnBack.tintColor = .black
            btnBack.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var viewMainSearch:UIView! {
        didSet {
            viewMainSearch.layer.cornerRadius = 20
            viewMainSearch.clipsToBounds = true
            viewMainSearch.backgroundColor = .white
            viewMainSearch.layer.masksToBounds = false
            viewMainSearch.layer.shadowColor = UIColor.black.cgColor
            viewMainSearch.layer.shadowOffset =  CGSize.zero
            viewMainSearch.layer.shadowOpacity = 0.5
            viewMainSearch.layer.shadowRadius = 2
            viewMainSearch.layer.cornerRadius = 30
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        debugPrint(self.userSelectOriginOrDestination as Any)
    }
    
}
