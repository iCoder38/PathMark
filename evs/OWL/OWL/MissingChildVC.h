//
//  MissingChildVC.h
//  OWL
//
//  Created by Apple on 7/24/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MissingChildVC : UIViewController
<
UIGestureRecognizerDelegate,
UITableViewDelegate,
UITableViewDataSource
>
{
    IBOutlet UITableView *tbleView;
    IBOutlet UIImageView *imgAddMissingChild;
}
@end
