//
//  ChatParentListingVC.h
//  OWL
//
//  Created by Apple on 9/6/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatParentListingVC : UIViewController
<
UITableViewDataSource,
UITableViewDelegate
>
{
    
    IBOutlet UITableView *tbleView;
}
@end
