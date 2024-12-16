//
//  FoundedChildListVC.h
//  OWL
//
//  Created by Apple on 7/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoundedChildListVC : UIViewController
<
UITableViewDelegate,
UITableViewDataSource,
UIGestureRecognizerDelegate,
SWTableViewCellDelegate
>
{
    IBOutlet UITableView *tbleView;
}
@property(strong,nonatomic)NSString *strBackWithoutFilter;
@property(strong,nonatomic)NSString *isColdCase;
@end
