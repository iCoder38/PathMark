//
//  IFoundMyChildVC.h
//  OWL
//
//  Created by Apple on 8/23/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IFoundMyChildVC : UIViewController
<
UIScrollViewDelegate
>
{
    IBOutlet UIScrollView *ScrollVieww;
    
    IBOutlet UIView *ContentVieww;
    
    IBOutlet UIImageView *imgProfile;
    
    IBOutlet UILabel *lblFirstName;
    IBOutlet UILabel *lblMotherName;
    IBOutlet UILabel *lblAddress;
    IBOutlet UILabel *lblParentsNumer;
    IBOutlet UILabel *lblIdenficationMark;
    IBOutlet UILabel *lblHeightAndWeight;
    IBOutlet UILabel *lblDateOfBirth;
    IBOutlet UILabel *lblDateOfDisapeance;
    IBOutlet UILabel *lblAgeAndGender;
    
    IBOutlet UIButton *btnIfoundMyChild;
    
}

@property(strong,nonatomic) NSDictionary *dictGetMissingChildList;
@end
