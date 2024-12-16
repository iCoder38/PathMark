//
//  ViewController.h
//  OWL
//
//  Created by Apple on 7/24/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<
UITextFieldDelegate
>
{
    IBOutlet UITextField *txtUserName;
    IBOutlet UITextField *txtPassword;
    
    IBOutlet UIButton *btnSignIn;
    IBOutlet UIButton *btnSignUp,*btnGuest;
    
    IBOutlet UIButton *btnClickHere;
}

@end

