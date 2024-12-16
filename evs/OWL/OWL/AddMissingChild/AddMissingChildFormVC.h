//
//  AddMissingChildFormVC.h
//  OWL
//
//  Created by Rameshwar on 21/08/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MHTextField.h"

@interface AddMissingChildFormVC : UIViewController
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
    UIImageView *imgVieww;
    UITextField *txtLastName;
    UITextField *txtAddPicture;
    UITextField *txtGender;
    UITextField *txtDOB;
    UITextField *txtDateOfDisapearance;
    UITextField *txtPlaceOfDisapearance;
    UITextField *txtFatherName;
    UITextField *txtMotherName;
    UITextField *txtCountry;
    UITextField *txtState;
    UITextField *txtCity;
    UITextField *txtPinOrZipCode;
    
    UIButton *btnSubmit, *btnSave;

}
@property (nonatomic,strong) NSString *StrCheckSideMenuOrNot;
@end
