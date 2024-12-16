//
//  RegistrationVC.h
//  BABQ
//
//  Created by Apple on 7/6/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MyAnnotation.h"

typedef void(^locationBlock)();

@interface RegistrationVC : UIViewController
<
UITextFieldDelegate,
UIScrollViewDelegate,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
CLLocationManagerDelegate,
MKMapViewDelegate,
UIGestureRecognizerDelegate,
UINavigationControllerDelegate
>
{
    IBOutlet UITextField *txtFirstName;
    IBOutlet UITextField *txtEmail;
    IBOutlet UITextField *txtPassword;
    IBOutlet UITextField *txtConfirmPassword;
    IBOutlet UITextField *txtPhoneNumber;
    IBOutlet UITextField *txtAddress;
    IBOutlet UITextField *txtZipcode;
    IBOutlet UITextField *txtUpload;

    IBOutlet UIImageView *imgProfilePicture;
    IBOutlet UIImageView *imgIdProof;
    
    IBOutlet UIScrollView *ScrollVieww;
    
    IBOutlet UIButton *btnSignIn;
    
    IBOutlet UIView *vieww;
    
    IBOutlet UIButton *btnSignUp;
    
    IBOutlet UIButton *btnFacebookR;
    
    IBOutlet UIButton *btnGalleryOuter;
    
    CLLocationManager *locationManager; 
}

-(void)GetCurrentLocation_WithBlock:(void(^)())block;

@property(nonatomic, weak) IBOutlet MKMapView* mapView;


@property (nonatomic, strong) locationBlock _locationBlock;
@property (nonatomic,copy)CLLocationManager *locationManager;
@property (nonatomic)CLLocationCoordinate2D coordinate;
@property (nonatomic,strong) NSString *current_Lat;
@property (nonatomic,strong) NSString *current_Long;

@end
