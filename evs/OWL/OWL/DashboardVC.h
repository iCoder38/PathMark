//
//  DashboardVC.h
//  BABQ
//
//  Created by Apple on 7/7/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardVC : UIViewController
<
UITableViewDelegate,
UITableViewDataSource,
UITextFieldDelegate,
UIPickerViewDelegate,
UIPickerViewDataSource
>
{
    IBOutlet UILabel *lblName;
    IBOutlet UILabel *lblCountry;
    
    IBOutlet UIImageView *imgUserProfile;
    
    IBOutlet UIButton *btnFintIt;
    IBOutlet UIButton *btnMissingChild;
    
    
}
@end
