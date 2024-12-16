//
//  MissingChildCell.h
//  OWL
//
//  Created by Apple on 7/25/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MissingChildCell : UITableViewCell

@property(nonatomic,strong) IBOutlet UIImageView *imgProfile;
@property(nonatomic,strong) IBOutlet UILabel *lblUsername;
@property(nonatomic,strong) IBOutlet UILabel *lblCountry;
@property(nonatomic,strong) IBOutlet UILabel *lblPrice;
@property(nonatomic,strong) IBOutlet UIImageView *imgPrice;

@end
