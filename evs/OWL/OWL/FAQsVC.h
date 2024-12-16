//
//  FAQsVC.h
//  ZYN
//
//  Created by Apple on 6/2/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Utils.h"
#import "SidebarViewController.h"
#import "SWRevealViewController.h"
#import "AppDelegate.h"
#import "RRNCollapsableSectionTableViewController.h"


@interface FAQsVC : RRNCollapsableTableViewController<UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UILabel*lblNavigation;
    
    BOOL plusButton;
    
    int indexOfPlusButton;
    
    //IBOutlet UITableView*tbleView;
    
    BOOL internetflag;

}

@property(weak,nonatomic) IBOutlet UITableView *tbleView;

@end
