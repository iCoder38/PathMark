//
//  ChatParentsListingCollectionCell.h
//  OWL
//
//  Created by Apple on 9/6/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatParentsListingCollectionCell : UICollectionViewCell

@property(nonatomic,strong) IBOutlet UILabel *lblUserMissingChildName;
@property(nonatomic,strong) IBOutlet UILabel *lblUserMissingChildAgeAndGender;
@property(nonatomic,strong) IBOutlet UILabel *lblUserMissingChildParentMobileNumber;
@property(nonatomic,strong) IBOutlet UILabel *lblUserMissingChildIdentificationMark;
@property(nonatomic,strong) IBOutlet UILabel *lblUserMissingChildHeightAndPound;

@property(nonatomic,strong) IBOutlet UIImageView *imgChildPhoto;

@property(nonatomic,strong) IBOutlet UIButton *btnStartChat;
@property(nonatomic,strong) IBOutlet UIButton *btnContact;



@end
