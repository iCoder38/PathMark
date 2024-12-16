//
//  AddMissingChildEmptyFormVC.h
//  OWL
//
//  Created by Apple on 9/12/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickPhotoFromAppVC.h"

@interface AddMissingChildEmptyFormVC : UIViewController
<
UITextFieldDelegate,
UIScrollViewDelegate,
UIPickerViewDataSource,
UIPickerViewDelegate,
UINavigationControllerDelegate,
UIImagePickerControllerDelegate,
PickPhotoFromAppDelegate
>
{
    UITextField *txtFirstName;
    UIImageView *imgVieww;
    UITextField *txtLastName;
    UITextField *txtAddPicture;
    UITextField *txtGender;
    UITextField *txtDOB;
    UITextField *txtDateOfDisapearance;
    UITextField *txtPlaceOfDisapearance;
    UITextField *txtFatherName;
    UITextField *txtMotherName;
    UITextField *txtAddress;
    UITextField *txtCountry;
    UITextField *txtState;
    UITextField *txtCity;
    UITextField *txtPinOrZipCode;
    
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

    UIButton *btnSubmit;
    UIButton *btnDraft;

}
@property(strong,nonatomic)NSString *strDelegateOrNot;
@end
