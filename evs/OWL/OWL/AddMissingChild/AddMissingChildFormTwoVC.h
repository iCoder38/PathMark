//
//  AddMissingChildFormTwoVC.h
//  OWL
//
//  Created by Rameshwar on 22/08/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddMissingChildFormTwoVC : UIViewController<UITextFieldDelegate,
UIScrollViewDelegate,
UIPickerViewDataSource,
UIPickerViewDelegate,
UINavigationControllerDelegate,
UIImagePickerControllerDelegate,
CLLocationManagerDelegate,
MKMapViewDelegate,
UIGestureRecognizerDelegate
>
{


    UITextField *txtPinCode;
    UITextField *txtLastSeenLocation;
    UITextField *txtParentsMobileNumber;
    UITextField *txtIdentificationMark;
    UITextField *txtHeight;
    UITextField *txtWeight;
    UITextField *txtColourOfEyes;
    UITextField *txtColorOfHair;
    UITextField *txtWearGlassOrContactLens;
    UITextField *txtIsTheChild;
    UITextField *txtAnySuspicion;
    UITextField *txtTheChildWasLastSeendWearing;
    UITextField *txtComplaintDate;
    UITextField *txtComplaintBy;
    UITextField *txtPrizeReward;
    UITextField *txtRewardInformation;


    UIButton *btnDraft;
    UIButton *btnInitiateAlert;
}
@property(nonatomic, weak) IBOutlet MKMapView* mapView;
@property (nonatomic, strong) locationBlock _locationBlock;
@property (nonatomic,copy)CLLocationManager *locationManager;
@property (nonatomic)CLLocationCoordinate2D coordinate;
@property (nonatomic,strong) NSString *current_Lat;
@property (nonatomic,strong) NSString *current_Long;
@property(strong,nonatomic) NSDictionary *dictGetDataFromFirstForm;
@property(strong,nonatomic) UIImage *imgGet;
@end
