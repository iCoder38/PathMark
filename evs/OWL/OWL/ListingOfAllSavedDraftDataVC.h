//
//  ListingOfAllSavedDraftDataVC.h
//  OWL
//
//  Created by Apple on 9/13/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListingOfAllSavedDraftDataVC : UIViewController
<
UITableViewDelegate,
UITableViewDataSource
>
{
    IBOutlet UITableView *tbleeView;
}
@end
