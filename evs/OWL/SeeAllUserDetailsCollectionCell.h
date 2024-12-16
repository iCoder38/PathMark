//
//  SeeAllUserDetailsCollectionCell.h
//  OWL
//
//  Created by Apple on 8/23/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeeAllUserDetailsCollectionCell : UICollectionViewCell<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong) IBOutlet UILabel *lblUserMissingChildName;
@property(nonatomic,strong) IBOutlet UILabel *lblUserMissingChildAgeAndGender;
@property(nonatomic,strong) IBOutlet UILabel *lblUserMissingChildParentMobileNumber;
@property(nonatomic,strong) IBOutlet UILabel *lblUserMissingChildIdentificationMark;
@property(nonatomic,strong) IBOutlet UILabel *lblUserMissingChildHeightAndPound;

@property(nonatomic, retain)IBOutlet UITableView *tbleDataView;

@property(nonatomic,strong) IBOutlet UIImageView *imgChildPhoto;

@property(nonatomic,strong) IBOutlet UIImageView *imgFound;

@property(nonatomic,strong) IBOutlet UIButton *btnStartChat;
@property(nonatomic,strong) IBOutlet UIButton *btnContact;
@property(nonatomic,strong) NSDictionary * dictGetMissingAndFoundChild;
-(void)reloadTableView:(NSDictionary *)dict;

@end
