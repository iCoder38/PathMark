//
//  ChangePasswordVC.h
//  PTC
//
//  Created by Apple on 7/4/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePasswordVC : UIViewController
<
UITextFieldDelegate
>
{
    IBOutlet UITextField *txtCurrentPassword;
    IBOutlet UITextField *txtNewPassword;
    IBOutlet UITextField *txtConfirmPassword;
    
    IBOutlet UIButton *btnSubmit;
}
@end
