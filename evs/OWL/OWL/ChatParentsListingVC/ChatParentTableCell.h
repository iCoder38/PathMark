//
//  ChatParentTableCell.h
//  OWL
//
//  Created by Apple on 9/6/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatParentTableCell : UITableViewCell

@property(strong,nonatomic)IBOutlet UIImageView *imgProfile;
@property(strong,nonatomic)IBOutlet UILabel *lblFirstAndLastName;
@property(strong,nonatomic)IBOutlet UILabel *lblAddress;

@end
