//
//  ListingOfAllSavedTableCell.h
//  OWL
//
//  Created by Apple on 9/13/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListingOfAllSavedTableCell : UITableViewCell
@property(nonatomic,strong) IBOutlet UILabel *lblUsername;
@property(nonatomic,strong) IBOutlet UIImageView *imgView;
@property(nonatomic,strong) IBOutlet UILabel *lblEditedAt;
@end
