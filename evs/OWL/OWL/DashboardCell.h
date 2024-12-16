//
//  DashboardCell.h
//  BABQ
//
//  Created by Apple on 7/7/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardCell : UITableViewCell

@property(nonatomic,strong) IBOutlet UILabel *lblGender;

@property(nonatomic,strong) IBOutlet UIView *cellView;


@property(nonatomic,strong) IBOutlet UILabel *lblName;
@property(nonatomic,strong) IBOutlet UILabel *lblDobAndGender;

@end
