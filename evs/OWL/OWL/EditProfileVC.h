//
//  EditProfileVC.h
//  OWL
//
//  Created by Apple on 7/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickPhotoFromAppVC.h"

@interface EditProfileVC : UIViewController
<
UITextFieldDelegate,
UIScrollViewDelegate,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
CLLocationManagerDelegate,
MKMapViewDelegate,
UIGestureRecognizerDelegate,
UINavigationControllerDelegate,
PickPhotoFromAppDelegate
>
{
    IBOutlet UITextField *txtFirstName;
    IBOutlet UITextField *txtEmail;
    IBOutlet UITextField *txtPassword;
    IBOutlet UITextField *txtConfirmPassword;
    IBOutlet UITextField *txtPhoneNumber;
    IBOutlet UITextField *txtAddress;
    IBOutlet UITextField *txtZipcode;
    
    IBOutlet UIImageView *imgProfilePicture;
    
    IBOutlet UIScrollView *ScrollVieww;
    
    IBOutlet UIView *vieww;
    
    IBOutlet UIButton *btnSignUp;
    
    IBOutlet UIButton *btnFacebookR;
    
    CLLocationManager *locationManager;
    
    UILabel *_label;
    UIButton *_button;
}

@property(strong , nonatomic) NSString *strDelegateOrNot;
@property(strong , nonatomic) NSString *matchFrom;
@end
