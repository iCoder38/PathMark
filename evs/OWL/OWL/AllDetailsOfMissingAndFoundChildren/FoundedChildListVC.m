//
//  FoundedChildListVC.m
//  OWL
//
//  Created by Apple on 7/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "FoundedChildListVC.h"
#import "ColdCaseDetailViewController.h"

@interface FoundedChildListVC ()
{
    NSArray *arrAllFoundedChildList;
    NSArray * arrAllColdCaseList;
   // NSString *isColdCase;
}
@end

@implementation FoundedChildListVC
@synthesize strBackWithoutFilter;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    UIGestureRecognizer.dele
    
//    UIImageView *imgBGp=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    
//    if (IS_IPHONE_5_SCREEN)
//    {
//        imgBGp.image=bgImageFor5;
//    }
//    else
//        if (IS_IPHONE_6_SCREEN)
//        {
//            imgBGp.image=bgImageFor6;
//        }
//        else
//            if (IS_IPHONE_6Plus_SCREEN)
//            {
//                imgBGp.image=bgImageFor6plus;
//            }
//            else
//                if (IS_IPAD_iPad_SCREEN)
//                {
//                    imgBGp.image=bgImageForipad;
//                }
//    
//    UIImageView *imgFullView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    imgFullView.backgroundColor=RGBc(53, 60, 78);
//    imgFullView.alpha=0.70f;
//    [self.view insertSubview:imgFullView atIndex:0];
//    [self.view insertSubview:imgBGp atIndex:0];
    
    tbleView.delegate=self;
    tbleView.dataSource=self;
    tbleView.separatorColor=Black;
    tbleView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    tbleView.backgroundColor=White;
    tbleView.allowsMultipleSelectionDuringEditing = NO;
    
    
    
    if([_isColdCase isEqualToString:@"yes"]){
        [self coldCaseListWebservice];
    }else{
        [self foundedChildListWebservice];
    }
    
    
    
    
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
     
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(menuClickMethodFromMissingChild)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    if([_isColdCase isEqualToString:@"yes"]){
         [self setTitle:@"COLD CASES"];
    }else{
       [self setTitle:@"FOUND CHILD/PERSON"];
        UIBarButtonItem *SETTINGBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"filter"] style:UIBarButtonItemStylePlain target:self action:@selector(settingClickMethod)];
        self.navigationItem.rightBarButtonItem=SETTINGBarButton;
    }
    
    
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"TestNotification"
                                               object:nil];
    
    
    
    
    
}

- (void) receiveTestNotification:(NSNotification *) notification
{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    arrAllFoundedChildList = [userDefaults objectForKey:@"keyStoreFilterFoundChils"];
    
        if ([[notification name] isEqualToString:@"TestNotification"])
        {
            NSLog (@"Successfully received the test notification!");
            
            [tbleView reloadData];
            
        }
    else
    {
        [tbleView reloadData];
    }
}

-(void)settingClickMethod
{
    FilterFoundChildVC *fmc=[self.storyboard instantiateViewControllerWithIdentifier:@"FilterFoundChildVCId"];
    [self.navigationController pushViewController:fmc animated:YES];
}

-(void)menuClickMethodFromMissingChild
{
    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if([_isColdCase isEqualToString:@"yes"]){
        if (arrAllColdCaseList.count>0)
        {
            tbleView.backgroundView = nil;
            return arrAllColdCaseList.count;
        }
        else
        {
            [Alert addLabelBGTableView:tbleView msg:@"No data found" color:Black];
            
            return 0;
        }
    }else{
    
        if (arrAllFoundedChildList.count>0)
        {
            tbleView.backgroundView = nil;
            return arrAllFoundedChildList.count;
        }
        else
        {
            [Alert addLabelBGTableView:tbleView msg:@"No data found" color:Black];
            
            return 0;
        }
    }
    
    
    return arrAllFoundedChildList.count;
    
    
    
    
    //return  arrAllFoundedChildList.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    static NSString *cellIdentifier = @"foundedChildListCell";
    
    FoundedChildListCell *cell = (FoundedChildListCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                                                           forIndexPath:indexPath];
    
    //cell.leftUtilityButtons = [self leftButtons];
    
    
    cell.rightUtilityButtons = [self rightButtons];
    
    
    
    cell.delegate = self;
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    if([_isColdCase isEqualToString:@"yes"])
    {
        cell.imgFound.hidden = TRUE;
        NSDictionary *dictLocalToGetAllFoundedChildList=[arrAllColdCaseList objectAtIndex:indexPath.row];
        
        NSLog(@"dictLocalToGetAllFoundedChildList==%@",dictLocalToGetAllFoundedChildList);
        [cell.imgProfile sd_setImageWithURL:[dictLocalToGetAllFoundedChildList objectForKey:@"image_1"]
                           placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
        
        cell.imgProfile.layer.cornerRadius=35;
        cell.imgProfile.clipsToBounds=YES;
        
        cell.lblUsername.text=[NSString stringWithFormat:@"%@",[dictLocalToGetAllFoundedChildList objectForKey:@"name"]];
        cell.lblUsername.font=ms16;
        
        cell.lblCountry.text=[NSString stringWithFormat:@"%@",[dictLocalToGetAllFoundedChildList objectForKey:@"address"]];
    }else{
      NSDictionary *dictLocalToGetAllFoundedChildList=[arrAllFoundedChildList objectAtIndex:indexPath.row];
      
      NSLog(@"dictLocalToGetAllFoundedChildList==%@",dictLocalToGetAllFoundedChildList);
      [cell.imgProfile sd_setImageWithURL:[dictLocalToGetAllFoundedChildList objectForKey:@"image"]
                         placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
      
      cell.imgProfile.layer.cornerRadius=35;
      cell.imgProfile.clipsToBounds=YES;
      
      cell.lblUsername.text=[NSString stringWithFormat:@"%@ %@",[dictLocalToGetAllFoundedChildList objectForKey:@"first_name"],[dictLocalToGetAllFoundedChildList objectForKey:@"last_name"]];
      cell.lblUsername.font=ms16;
      
      cell.lblCountry.text=[NSString stringWithFormat:@"%@",[[dictLocalToGetAllFoundedChildList objectForKey:@"addedBy"] objectForKey:@"address"]];
    }
    
    
    cell.lblCountry.font=ml14;
    
    cell.lblUsername.textColor=Black;
    cell.lblCountry.textColor=LightGray;
    
    cell.lblUsername.font=ms16;
    cell.lblCountry.font=ml14;
    
    cell.tag=indexPath.row;
    
    
    cell.backgroundColor=Clear;
    
    return cell;
}


- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    
    //[rightUtilityButtons sw_addUtilityButtonWithColor:
     //[UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
       //                                         title:@"More"];
    
    
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                title:@"Delete"];
    
    return rightUtilityButtons;
}
- (NSArray *)leftButtons
{
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
                                                icon:[UIImage imageNamed:@"check.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:1.0]
                                                icon:[UIImage imageNamed:@"clock.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188f alpha:1.0]
                                                icon:[UIImage imageNamed:@"cross.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.55f green:0.27f blue:0.07f alpha:1.0]
                                                icon:[UIImage imageNamed:@"list.png"]];
    
    return leftUtilityButtons;
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell scrollingToState:(SWCellState)state
{
    switch (state)
    {
        case 0:
            NSLog(@"utility buttons closed");
            break;
        case 1:
            NSLog(@"left utility buttons open");
            break;
        case 2:
            NSLog(@"right utility buttons open");
            break;
        default:
            break;
    }
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index
{
    switch (index) {
        case 0:
            NSLog(@"left button 0 was pressed");
            break;
        case 1:
            NSLog(@"left button 1 was pressed");
            break;
        case 2:
            NSLog(@"left button 2 was pressed");
            break;
        case 3:
            NSLog(@"left btton 3 was pressed");
        default:
            break;
    }
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Delete"
                                          
                                                                             message:@"Are you sure you want to delete?"
                                          
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    //We add buttons to the alert controller by creating UIAlertActions:
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                               
                                                       style:UIAlertActionStyleDefault
                               
                                                     handler:^(UIAlertAction *Action)
                               {
                                   NSIndexPath *cellIndexPath = [tbleView indexPathForCell:cell];
                                   
                                   NSDictionary *dictLocalDelete=[arrAllFoundedChildList objectAtIndex:cellIndexPath.row];
                                   
                                   
                                   
                                   [self deleteFoundUserWebservice:dictLocalDelete];
                               }]; //You can use a block	 here to handle a press on this button
    
    UIAlertAction *actionNo = [UIAlertAction actionWithTitle:@"Cancel"
                               
                                                       style:UIAlertActionStyleDefault
                               
                                                     handler:nil];
    [alertController addAction:actionOk];
    [alertController addAction:actionNo];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell
{
    // allow just one cell's utility button to be open at once
    return YES;
}

- (BOOL)swipeableTableViewCell:(SWTableViewCell *)cell canSwipeToState:(SWCellState)state
{
    switch (state) {
        case 1:
            // set to NO to disable all left utility buttons appearing
            return YES;
            break;
        case 2:
            // set to NO to disable all right utility buttons appearing
            return YES;
            break;
        default:
            break;
    }
    
    return YES;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if([_isColdCase isEqualToString:@"yes"]){
        ColdCaseDetailViewController *cld=[self.storyboard instantiateViewControllerWithIdentifier:@"ColdCaseDetailViewController"];
        cld.coldCaseDataDict = [arrAllColdCaseList objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:cld animated:YES];
    }else{
        MissingChildListDetailsVC *mcld=[self.storyboard instantiateViewControllerWithIdentifier:@"MissingChildListDetailsVCId"];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:[arrAllFoundedChildList objectAtIndex:indexPath.row] forKey:@"keyTransferMissingChildPerson"];
        [userDefaults synchronize];

        //mcld.dictToGetMissingChildDetails=[arrAllFoundedChildList objectAtIndex:indexPath.row];
        
        mcld.dictGetMissingAndFoundChild=[arrAllFoundedChildList objectAtIndex:indexPath.row];
        
        mcld.strCheckFoundOrMissing=@"fromFound";
        [self.navigationController pushViewController:mcld animated:YES];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //add code here for when you hit delete
    }
}

#pragma mark - founded child list webservice
-(void)foundedChildListWebservice
{
    
    [Alert svProgress:pleaseWait];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
   
    parameters = @{
                   @"action"            : @"foundChildren",
                   @"userId"           : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]]
                   };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
         {
             
             arrAllFoundedChildList=[dictPhotographerLogin objectForKey:@"response"];
             
             if (arrAllFoundedChildList.count>0)
             {
                 tbleView.backgroundView = nil;
                 
                 [tbleView reloadData];
             }
             else
             {
                 [tbleView reloadData];
             }
             
             [SVProgressHUD dismiss];
             
             
         }
         else
         {
             
             [SVProgressHUD showErrorWithStatus:[dictPhotographerLogin objectForKey:@"msg"] maskType:SVProgressHUDMaskTypeBlack];
             
         }
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     
     {
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
     }];
}
#pragma mark - cold case list webservice
-(void)coldCaseListWebservice
{
    
    [Alert svProgress:pleaseWait];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
   
    parameters = @{
                   @"action"            : @"coldcaselist",
                   @"pageNo":@"1"
                   };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
         {
             
             arrAllColdCaseList=[dictPhotographerLogin objectForKey:@"coldcaselist"];
             
             if (arrAllColdCaseList.count>0)
             {
                 tbleView.backgroundView = nil;
                 
                 [tbleView reloadData];
             }
             else
             {
                 [tbleView reloadData];
             }
             
             [SVProgressHUD dismiss];
             
             
         }
         else
         {
             
             [SVProgressHUD showErrorWithStatus:[dictPhotographerLogin objectForKey:@"msg"] maskType:SVProgressHUDMaskTypeBlack];
             
         }
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     
     {
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
     }];
}
-(void)deleteFoundUserWebservice :(NSDictionary *)dictToGetDataOfFoundedChildren
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    parameters = @{
                   @"action": @"deletechild",
                   @"childId" : [NSString stringWithFormat:@"%@",[dictToGetDataOfFoundedChildren objectForKey:@"id"]]
                   };
    NSLog(@"parameters-------%@",parameters);
    
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
         {
             [self foundedChildListWebservice];
         }
         else
         {
             [SVProgressHUD showErrorWithStatus:somethingIssue maskType:SVProgressHUDMaskTypeBlack];
         }
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     
     {
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
     }];
    
}

@end
