//
//  ChatParentsListingDetailsVC.h
//  OWL
//
//  Created by Apple on 9/6/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ChatParentsListingDetailsVC : UIViewController
<
UICollectionViewDelegate,
UICollectionViewDataSource
>
{
    
    IBOutlet UILabel *lblUserName;
    IBOutlet UILabel *lblUserCountry;
    
    IBOutlet UIImageView *imgUserProfilePicture;
    IBOutlet UIImageView *imgUserProfileBgPicture;
    
    IBOutlet UICollectionView *clview;
    
    IBOutlet UIButton *btnChat;
    IBOutlet UIButton *btnContact;
}
@property(strong,nonatomic)NSDictionary *dictFetchClickParentsDetails;
@end
