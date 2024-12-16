//
//  UserProfileVC.h
//  OWL
//
//  Created by Apple on 8/22/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserProfileVC : UIViewController
{
    IBOutlet UIImageView *imgUserProfilePicture;
    IBOutlet UIImageView *imgUserProfileBgPicture;
    
    IBOutlet UILabel *lblUserName;
    IBOutlet UILabel *lblUserCountry;
    IBOutlet UILabel *lblUserMissingChildName;
    IBOutlet UILabel *lblUserMissingChildAgeAndGender;
    IBOutlet UILabel *lblUserMissingChildParentMobileNumber;
    IBOutlet UILabel *lblUserMissingChildIdentificationMark;
    IBOutlet UILabel *lblUserMissingChildHeightAndPound;
    
    IBOutlet UIButton *btnStartChat;
    IBOutlet UIButton *btnContact;
    
}
@property(strong,nonatomic) NSDictionary  *dictToGetMissingChildDetails;

@end
