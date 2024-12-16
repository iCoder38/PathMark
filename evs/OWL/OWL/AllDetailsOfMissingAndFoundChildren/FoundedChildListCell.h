//
//  FoundedChildListCell.h
//  OWL
//
//  Created by Apple on 7/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoundedChildListCell : SWTableViewCell

@property(nonatomic,strong) IBOutlet UIImageView *imgProfile;
@property(nonatomic,strong) IBOutlet UIImageView *imgFound;
@property(nonatomic,strong) IBOutlet UILabel *lblUsername;
@property(nonatomic,strong) IBOutlet UILabel *lblCountry;

@end
