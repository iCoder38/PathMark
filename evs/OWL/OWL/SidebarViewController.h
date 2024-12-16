//
//  SidebarViewController.h
//  SidebarDemo
//
//  Created by Simon on 29/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SWRevealViewController.h"
#import "AppDelegate.h"

@interface SidebarViewController : UIViewController<SWRevealViewControllerDelegate,UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
{
         IBOutlet UILabel *lblLogout;
    NSMutableArray  *arrayForBool;
    NSArray *sectionTitleArray;
    NSMutableArray *buttinStateArray;
    NSMutableArray *indexSectionArray;
     NSMutableArray *titleArray;

}
@property (weak, nonatomic) IBOutlet UITableView *expandableTableView;
@property(strong,nonatomic)SWRevealViewController *swcontroller;
@property(nonatomic,strong) NSMutableArray * dataModelArray;
@end
