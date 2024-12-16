//
//  SettingsVC.h
//  OWL
//
//  Created by Apple on 7/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsVC : UIViewController
<
UITableViewDelegate,
UITableViewDataSource
>
{
    IBOutlet UITableView *tbleeView;
}
@end
