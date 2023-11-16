//
//  schedule_a_ride.swift
//  PathMark
//
//  Created by Dishant Rajput on 16/11/23.
//

import UIKit
import FSCalendar

class schedule_a_ride: UIViewController {

    var str_get_category_id:String!
    var str_from_location:String!
    var str_to_location:String!
    
    var searched_place_location_lat:String!
    var searched_place_location_long:String!
    
    var my_location_lat:String!
    var my_location_long:String!
    
    fileprivate lazy var dateFormatter2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    fileprivate lazy var dateFormatter1: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    
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
            lblNavigationTitle.text = "Payment"
            lblNavigationTitle.textColor = NAVIGATION_TITLE_COLOR
            lblNavigationTitle.backgroundColor = .clear
        }
    }
    
    var str_selected_date:String! = ""
    @IBOutlet weak var lbl_selected_date:UILabel! {
        didSet {
            lbl_selected_date.backgroundColor = UIColor(red: 246.0/255.0, green: 200.0/255.0, blue: 68.0/255.0, alpha: 1)
        }
    }
    
    @IBOutlet weak var btn_select_time:UIButton!
    
    @IBOutlet weak var btn_schedule:UIButton! {
        didSet {
            btn_schedule.backgroundColor = navigation_color
            btn_schedule.layer.cornerRadius = 12
            btn_schedule.clipsToBounds = true
            btn_schedule.setTitleColor(.white, for: .normal)
            btn_schedule.setTitle("Schedule a ride now", for: .normal)
        }
    }
    
    // calendar
    @IBOutlet weak var calendar: FSCalendar! {
        didSet {
            calendar.appearance.headerTitleFont = UIFont(name: "Poppins-SemiBold", size: 18)
            
            calendar.appearance.weekdayFont = UIFont(name: "Poppins-Regular", size: 14)
            calendar.appearance.weekdayTextColor = UIColor.init(red: 38.0/255.0, green: 34.0/255.0, blue: 108.0/255.0, alpha: 1)
            
            calendar.appearance.todayColor = UIColor.systemOrange// app_red_orange_mix_color
             
            calendar.appearance.eventDefaultColor = UIColor.systemPink
            calendar.scope = .month
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnBack.addTarget(self, action: #selector(back_click_method_2), for: .touchUpInside)
        
        self.btn_select_time.addTarget(self, action: #selector(select_time_click_method), for: .touchUpInside)
        self.btn_schedule.addTarget(self, action: #selector(schedule_a_ride_click_method2), for: .touchUpInside)
        
        // calendar
        self.calendar.delegate = self
        self.calendar.dataSource = self
        self.calendar.scope = .month
        
        print(self.str_get_category_id as Any)
        print(self.str_from_location as Any)
        print(self.str_to_location as Any)
        print(self.searched_place_location_lat as Any)
        print(self.searched_place_location_long as Any)
        // print(self.strSaveLongitude as Any)
        print(self.my_location_lat as Any)
        print(self.my_location_long as Any)
    }
    
    @objc func back_click_method_2() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func schedule_a_ride_click_method2() {
        
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "schedule_confirm_booking_id") as? schedule_confirm_booking
        
        push!.str_get_category_id2 = String(self.str_get_category_id)
        push!.str_from_location2 = String(self.str_from_location)
        push!.str_to_location2 = String(self.str_to_location)

        push!.my_location_lat2 = String(self.my_location_lat)
        push!.my_location_long2 = String(self.my_location_long)

        push!.searched_place_location_lat2 = String(self.searched_place_location_lat)
        push!.searched_place_location_long2 = String(self.searched_place_location_long)
        
        self.navigationController?.pushViewController(push!, animated: true)
        
    }
    
    @objc func select_time_click_method() {
        RPicker.selectDate(title: "Select Time", cancelText: "Cancel", datePickerMode: .time, didSelectDate: { (selectedDate) in
            // TODO: Your implementation for date
            self.btn_select_time.setTitle(selectedDate.dateString("HH:mm"), for: .normal)
        })
    }
    
    // calendar
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let foramtter = DateFormatter()
        
        foramtter.dateFormat = "yyyy-MM-dd"
        
        let date = foramtter.string(from: date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date_set = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let resultString = dateFormatter.string(from: date_set!)
        // cell.lblSelectedDate.text = "Selected Date: " + resultString
        
        print("Selected Date: " + resultString)
        
        self.str_selected_date = resultString
        self.lbl_selected_date.text = "Selected Date: " + resultString
        
        /*if self.datesWithEvent.contains(resultString) {
            print("yes")
            
            for i in 0..<self.arr_dates.count {
                let item = self.arr_dates[i] as? [String:Any]
                print(item as Any)
                
                if (resultString == item!["eventDate"] as! String) {
                    print("yes open browser")
                    
                    if let url = URL(string: item!["URL"] as! String) {
                        UIApplication.shared.open(url)
                    }
                    return
                }
                
                
                
                
            }
        } else {
            print("no")
        }*/
        
        
        // self.get_calendar_date_WB(str_date: resultString)
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let dateString = self.dateFormatter2.string(from: date)
//        if self.datesWithEvent.contains(dateString) {
//            return 1
//        }

        return 0
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
        let key = self.dateFormatter2.string(from: date)
//        if self.datesWithEvent != nil {
//            return UIColor.black
//        }
        return appearance.selectionColor
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, borderDefaultColorFor date: Date) -> UIColor? {
        let key = self.dateFormatter1.string(from: date)
//        if let color = self.borderDefaultColors[key] {
//            return color
//        }
        return appearance.borderDefaultColor
    }
}

extension schedule_a_ride : FSCalendarDelegate,FSCalendarDataSource {
    
}
