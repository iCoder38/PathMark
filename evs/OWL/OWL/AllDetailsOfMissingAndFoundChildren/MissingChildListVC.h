//
//  MissingChildListVC.h
//  OWL
//
//  Created by Apple on 7/25/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MissingChildListDetailsVC.h"




@interface MissingChildListVC : UIViewController
<
UITableViewDelegate,
UITableViewDataSource,
backFromSeeAllUserDelegate
>
{
    IBOutlet UITableView *tbleView;
    
    IBOutlet UIButton *btnPrice;
}

@end
