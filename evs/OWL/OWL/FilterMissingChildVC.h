//
//  FilterMissingChildVC.h
//  OWL
//
//  Created by Apple on 7/26/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterMissingChildVC : UIViewController
<
UITextFieldDelegate,
UIScrollViewDelegate,
UIPickerViewDataSource,
UIPickerViewDelegate
>
{
     UITextField *txtCountry;
     UITextField *txtState;
    UITextField *txtCity;
     UITextField *txtSelectGender;
     UITextField *txtSelectAge;
     UITextField *txtSelectColorOfEyes;
     UITextField *txtSelectColorOfHair;
     UITextField *txtIdentificationMark;
     UITextField *txtEnterLocation;
    
    UIButton *btnSearch;
}
@end
