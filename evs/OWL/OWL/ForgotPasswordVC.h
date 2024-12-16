//
//  ForgotPasswordVC.h
//  PTC
//
//  Created by Apple on 7/5/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPasswordVC : UIViewController
<
UITextFieldDelegate
>
{
    IBOutlet UITextField *txtEmailAddress;
    IBOutlet UIButton *btnSubmit;
}
@end
