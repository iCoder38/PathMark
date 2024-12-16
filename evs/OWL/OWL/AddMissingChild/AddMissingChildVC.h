//
//  AddMissingChildVC.h
//  OWL
//
//  Created by Apple on 7/24/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddMissingChildVC : UIViewController
<
UITextFieldDelegate,
UIScrollViewDelegate,
UIPickerViewDataSource,
UIPickerViewDelegate,
UINavigationControllerDelegate,
UIImagePickerControllerDelegate
>
{
     UITextField *txtFirstName;
     UITextField *txtLastName;
     UITextField *txtAddPicture;
     UITextField *txtGender;
     UITextField *txtDOB;
     UITextField *txtDateOfDisapearance;
     UITextField *txtPlaceOfDisapearance;
     UITextField *txtFatherName;
     UITextField *txtMotherName;
     UITextField *txtAddress;
     UITextField *txtProvince;
     UITextField *txtPincode;
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
    
     UIButton *btnSubmit;
}
@end
