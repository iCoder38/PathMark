//
//  NotificationSettingsVC.h
//  OWL
//
//  Created by Apple on 8/2/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationSettingsVC : UIViewController
<
UITextFieldDelegate,
UIPickerViewDelegate,
UIPickerViewDataSource
>
{
    IBOutlet UISwitch *swEnableNotification;
    IBOutlet UISwitch *swSpecificCountry;
    IBOutlet UISwitch *swSpecificState;
    IBOutlet UISwitch *swMute;
    
    IBOutlet UITextField *txtCountry;
    IBOutlet UITextField *txtState;
    
    IBOutlet UIView *view1;
    IBOutlet UIView *view2;
    IBOutlet UIView *view3;
    IBOutlet UIView *view4;
}
@end
