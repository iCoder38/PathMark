//
//  ContactVC.h
//  OWL
//
//  Created by Apple on 8/22/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactVC : UIViewController
<
UITextFieldDelegate,
UITextViewDelegate,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate
>
{
    IBOutlet UITextField *txtName;
    IBOutlet UITextField *txtEmail;
    IBOutlet UITextField *txtEnterSubect;
    IBOutlet UITextField *txtUploadImage;
    
    IBOutlet UITextView *txtMessage;
    
    IBOutlet UIButton *btnSubmit;
}
@end
