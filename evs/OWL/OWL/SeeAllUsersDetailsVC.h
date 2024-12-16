//
//  SeeAllUsersDetailsVC.h
//  OWL
//
//  Created by Apple on 8/23/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MissingChildListDetailsVC.h"

@interface SeeAllUsersDetailsVC : UIViewController
<
UICollectionViewDelegate,
UICollectionViewDataSource
>
{
    
    IBOutlet UILabel *lblUserName;
    IBOutlet UILabel *lblUserCountry;
    
    IBOutlet UIImageView *imgUserProfilePicture;
    IBOutlet UIImageView *imgUserProfileBgPicture;
    IBOutlet UIImageView *imgTransparent;
    IBOutlet UICollectionView *clview;
    
    IBOutlet UIButton *btnChat;
    IBOutlet UIButton *btnContact;
    IBOutlet UIButton *btnContactWithoutChat;
    
   // IBOutlet UITableView *tbleDataView;
}



@property(strong,nonatomic)NSDictionary *dictGetAllDataFromMapUser;
@property(strong,nonatomic) NSString *strFromMissingChild;
@end
