//
//  OWLNotificationVC.m
//  OWL
//
//  Created by Rameshwar on 10/3/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "OWLNotificationVC.h"
#import <SWTableViewCell.h>

@interface OWLNotificationVC ()<UITableViewDataSource,UITableViewDelegate, SWTableViewCellDelegate>{
    
    
    AppDelegate *appD;
    NSIndexPath *indexPathCard;
    UIImageView *imgTransaction, *imgRecurring;
    UIButton *btnRecurring;
    UIButton *btnTransaction;
    UITableView *tbleView;
    int rowCount;
    UIActivityIndicatorView *activityIndicator;
    NSMutableArray *arrAllNotification;
    NSMutableArray *arrNextPostData;
    int page;
    int totalPages;
    BOOL firstTimeLoadData;
    
    UIButton *btnClearNotification;
    UIImageView  *imgDC, *imgCC;
    UIButton *btnNormalList, *btnRecurringList;
    
    NSString *strNotificationTypeCurrently;
    
    int selectedIndexPath;
}

@end

@implementation OWLNotificationVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
   
    [self customizeNavigationBar];
    
    [self loadConfigView];
    
    [self listOfNotifications];
    
}

-(void)customizeNavigationBar{
    
    self.navigationController.navigationBarHidden = TRUE;
    
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 65)];
    navView.backgroundColor = Black;
    [self.view addSubview:navView];
    
    
    UIButton *btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
    btnMenu.frame = CGRectMake(10, 30, 24, 24);
    [btnMenu setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [btnMenu addTarget:self action:@selector(hitMenu:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:btnMenu];
    
    
    UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(35, 20, kSCREEN_WIDTH-70, 45)];
    lblTitle.text = @"Notifications";
    lblTitle.textColor = White;
    lblTitle.font = mr16;
    lblTitle.textAlignment = NSTextAlignmentCenter;
    [navView addSubview:lblTitle];
    
}

-(IBAction)hitMenu:(id)sender{
    
    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];
    
}

-(void)loadConfigView{
    
    UIImageView *imgBGp=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    if (IS_IPHONE_5_SCREEN)
    {
        imgBGp.image=bgImageFor5;
    }
    else
        if (IS_IPHONE_6_SCREEN)
        {
            imgBGp.image=bgImageFor6;
        }
        else
            if (IS_IPHONE_6Plus_SCREEN)
            {
                imgBGp.image=bgImageFor6plus;
            }
            else
                if (IS_IPAD_iPad_SCREEN)
                {
                    imgBGp.image=bgImageForipad;
                }
    
    [self.view insertSubview:imgBGp atIndex:0];
    
    tbleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 65, kSCREEN_WIDTH, kSCREEN_HEIGHT-70)];
    tbleView.backgroundColor = [UIColor colorWithRed:51.0/255.0 green:57.0/255.0 blue:75.0/255.0 alpha:0.6];
    tbleView.delegate = self;
    tbleView.dataSource = self;
    tbleView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tbleView];
    
    
    btnClearNotification = [UIButton buttonWithType:UIButtonTypeCustom];
    btnClearNotification.frame = CGRectMake( kSCREEN_WIDTH-80, kSCREEN_HEIGHT-80, 55, 55);
    [btnClearNotification setImage:[UIImage imageNamed:@"CN"] forState:UIControlStateNormal];
    [btnClearNotification addTarget:self action:@selector(clearNotification:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnClearNotification];
}


#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (arrAllNotification.count>0) {
        
        tbleView.backgroundView = nil;
        return arrAllNotification.count;
        
    }
    else{
        
        [Alert addLabelBGTableView:tbleView msg:@"No notifications found." color:White];
        
        return 0;
    }
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSString * const CELL_ID = @"Cell";

    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CELL_ID];

    if (cell == nil) {

        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_ID];

    }

    for (UIView *cellView in [cell.contentView subviews]) {

        [cellView removeFromSuperview];
    }
    
//    
//    NSString * const CELL_ID = @"Cell";
//    
//    SWTableViewCell *cell = (SWTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CELL_ID];
//    
//    if (cell == nil) {
//        
//        cell = [[SWTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_ID];
//        cell.delegate = self;
//        cell.rightUtilityButtons = [self deleteSwipe];
//        
//    }
//    
////    for (UIView *cellView in [cell.contentView subviews]) {
////        
////        [cellView removeFromSuperview];
////    }
//    
    if (arrAllNotification.count==0) {
        
        return cell;
    }
    
//    UIColor *cellColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.2];
    
     UIColor *cellColor = [UIColor clearColor];
    
    
    NSDictionary *dictCellData = [arrAllNotification objectAtIndex:indexPath.row];

    if ([[dictCellData objectForKey:@"type"] isEqualToString:@"Admin Notification"] == TRUE) {
        
        
        CGSize msgHeight = [self findHeightForText:[dictCellData objectForKey:@"message"] havingWidth:kSCREEN_WIDTH-60 andFont:[UIFont fontWithName:@"HelveticaNeue" size:16]];
        
        
        UIView *completeCellView = [[UIView alloc]initWithFrame:CGRectMake(10, 5, kSCREEN_WIDTH-20, msgHeight.height+10+30)];
        completeCellView.backgroundColor = cellColor;
        completeCellView.layer.cornerRadius = 2.0;
        completeCellView.layer.masksToBounds = NO;
        completeCellView.layer.shadowOffset = CGSizeMake(-3, 3);
        completeCellView.layer.shadowRadius = 2;
        completeCellView.layer.shadowOpacity = 0.5;
        [cell.contentView addSubview:completeCellView];
        
        
        UILabel *lblShopName = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, completeCellView.frame.size.width-60, msgHeight.height+10)];
        lblShopName.numberOfLines = 0;
        lblShopName.backgroundColor = [UIColor clearColor];
        lblShopName.text = [dictCellData objectForKey:@"message"];
        lblShopName.textAlignment = NSTextAlignmentLeft;
        lblShopName.textColor = [UIColor whiteColor];
        lblShopName.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        [completeCellView addSubview:lblShopName];
        
        
        
        UILabel *lblDate = [[UILabel alloc]initWithFrame:CGRectMake(15, lblShopName.frame.size.height+lblShopName.frame.origin.y, completeCellView.frame.size.width-10, 20)];
        lblDate.numberOfLines = 0;
        lblDate.backgroundColor = [UIColor clearColor];
        lblDate.text = [dictCellData objectForKey:@"time"];
        lblDate.textAlignment = NSTextAlignmentLeft;
        lblDate.textColor = [UIColor whiteColor];
        lblDate.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
        [completeCellView addSubview:lblDate];
        
        
        
        NSString *strURL = [dictCellData objectForKey:@"url"];
        
        if (strURL.length>0) {
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
        else{
            
            cell.accessoryType = UITableViewCellAccessoryNone;
            
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.backgroundColor = Clear;
        
        return cell;
        
    }
    else{
            
            UIView *completeCellView = [[UIView alloc]initWithFrame:CGRectMake(10, 5, kSCREEN_WIDTH-20, 75)];
            completeCellView.backgroundColor = cellColor;
            completeCellView.layer.cornerRadius = 2.0;
            completeCellView.layer.masksToBounds = NO;
            completeCellView.layer.shadowOffset = CGSizeMake(-3, 3);
            completeCellView.layer.shadowRadius = 2;
            completeCellView.layer.shadowOpacity = 0.5;
            [cell.contentView addSubview:completeCellView];
            
            UILabel *lblShopName = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, completeCellView.frame.size.width-10, 45)];
            lblShopName.backgroundColor = [UIColor clearColor];
        
        if ([[dictCellData objectForKey:@"type"] isEqualToString:@"addMissingChild"] == TRUE) {
            
            lblShopName.text = [NSString stringWithFormat:@"\"%@\" initiated missing child/person alert.", [dictCellData objectForKey:@"user_name"]];
            lblShopName.textColor =[UIColor whiteColor];
            
            NSString *strMessage = @"initiated missing child/person alert.";
            
            NSString *nameLength = [dictCellData objectForKey:@"user_name"];
          
            NSMutableAttributedString *text =
            [[NSMutableAttributedString alloc]
             initWithAttributedString: lblShopName.attributedText];
            [text addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:196.0/255.0 green:208.0/255.0 blue:237.0/255.0 alpha:1.0] range:NSMakeRange(nameLength.length+2, strMessage.length)];
            
            [lblShopName setAttributedText: text];
            
        }
        else{
            
            lblShopName.text = [NSString stringWithFormat:@"\"%@\" found missing child/person.", [dictCellData objectForKey:@"user_name"]];
            
            
            
            NSString *strMessage = @"found missing child/person.";
            lblShopName.textColor =[UIColor whiteColor];
            NSString *nameLength = [dictCellData objectForKey:@"user_name"];
            
            
            NSMutableAttributedString *text =
            [[NSMutableAttributedString alloc]
             initWithAttributedString: lblShopName.attributedText];
            
        [text addAttribute:NSForegroundColorAttributeName
         value:[UIColor colorWithRed:196.0/255.0 green:208.0/255.0 blue:237.0/255.0 alpha:1.0]range:NSMakeRange(nameLength.length+2, strMessage.length)];
            
            [lblShopName setAttributedText: text];
            
        }
        
            lblShopName.textAlignment = NSTextAlignmentLeft;
            lblShopName.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:17];
            lblShopName.numberOfLines = 0;
            [completeCellView addSubview:lblShopName];
            
            
            UILabel *lblDateTime = [[UILabel alloc]initWithFrame:CGRectMake(15, 45, completeCellView.frame.size.width-20, 20)];
            lblDateTime.backgroundColor = [UIColor clearColor];
            lblDateTime.text = [dictCellData objectForKey:@"time"];
            lblDateTime.textAlignment = NSTextAlignmentLeft;
            lblDateTime.textColor = [UIColor whiteColor];
            lblDateTime.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
            [completeCellView addSubview:lblDateTime];
        
            cell.backgroundColor = Clear;
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
            cell.accessoryType = UITableViewCellAccessoryNone;
        
            return cell;
        
        }
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dictCellData = [arrAllNotification objectAtIndex:indexPath.row];
    
    if ([[dictCellData objectForKey:@"type"] isEqualToString:@"Admin Notification"] == TRUE) {
        
        
        NSString *strURL = [dictCellData objectForKey:@"url"];
        
        if (strURL.length>0) {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[dictCellData objectForKey:@"url"]]];
            
        }
        
        
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        
        NSDictionary *dictCellData = [arrAllNotification objectAtIndex:indexPath.row];
        
        if ([[dictCellData objectForKey:@"type"] isEqualToString:@"Admin Notification"] == TRUE) {
            
            CGSize msgHeight = [self findHeightForText:[dictCellData objectForKey:@"message"] havingWidth:kSCREEN_WIDTH-60 andFont:[UIFont fontWithName:@"HelveticaNeue" size:16]];
            
            return msgHeight.height+10+30+10;
            
        }
        else{
            
            return 80;
            
        }
}


- (NSArray *)deleteSwipe{
    
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor redColor] icon:[UIImage imageNamed:@"del"]];
  
    return leftUtilityButtons;
    
}



-(CGSize)findHeightForText:(NSString *)text havingWidth:(CGFloat)widthValue andFont:(UIFont *)font {
    
    CGSize size = CGSizeZero;
    
    if (text) {
       
        CGRect frame = [text boundingRectWithSize:CGSizeMake(widthValue, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:font } context:nil];
        size = CGSizeMake(frame.size.width, frame.size.height + 1);
    }
    return size;
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    
    switch (index) {
            
        case 0:
        {
            NSIndexPath *cellIndexPath = [tbleView indexPathForCell:cell];
            
             NSDictionary *dictLocalDelete=[arrAllNotification objectAtIndex:cellIndexPath.row];
            
            [arrAllNotification removeObjectAtIndex:cellIndexPath.row];
            
            [tbleView deleteRowsAtIndexPaths:@[cellIndexPath]withRowAnimation:UITableViewRowAnimationAutomatic];
            
           
            
            [self deleteOneNotification:dictLocalDelete];
            
            break;
            
        }
        default:
            break;
    }
}



#pragma mark - webservice
-(void)listOfNotifications{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [SVProgressHUD showWithStatus:pleaseWait maskType:SVProgressHUDMaskTypeBlack];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    NSDictionary *parameters;
    parameters = @{
                   @"action"            : @"notificationList",
                   @"userId"            : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]]
                   };
    NSLog(@"parameters-------%@",parameters);
    
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]== TRUE)
         {
             arrAllNotification = [[NSMutableArray alloc]initWithCapacity:0];
             
             NSArray *arrData = [dictPhotographerLogin objectForKey:@"notifications"] ;
             
             [arrAllNotification addObjectsFromArray:arrData];
             
             if ([arrAllNotification count]==0)
             {
                 btnClearNotification.hidden = TRUE;
             }
             else
             {
                 btnClearNotification.hidden = FALSE;
             }
             
             [tbleView reloadData];
             
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

#pragma mark - delete one notification
-(void)deleteOneNotification :(NSDictionary *)getDeleteClickedData
{
  // [SVProgressHUD showWithStatus:pleaseWait maskType:SVProgressHUDMaskTypeBlack];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    NSDictionary *parameters;
    parameters = @{
                   @"action"            : @"delNotificationById",
                   @"userId"            : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]],
                   @"notificationId" : [NSString stringWithFormat:@"%@",[getDeleteClickedData objectForKey:@"notificationId"]]
                   };
    NSLog(@"parameters-------%@",parameters);
    
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]== TRUE)
         {
             
            // [self listOfNotifications];
             
             
             
         }
         else
         {
             
           //  [SVProgressHUD showErrorWithStatus:[dictPhotographerLogin objectForKey:@"msg"] maskType:SVProgressHUDMaskTypeBlack];
             
         }
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     
     {
         
         
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
         
     }];
    
}

-(IBAction)clearNotification:(id)sender{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"OWL" message:@"Are you sure you want to delete all notifications?"preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"YES"
   style:UIAlertActionStyleDestructive handler:^(UIAlertAction *actionYes)
                               {
                                   [self deleteAllNotifications];
                               }];
    
    UIAlertAction *actionNo = [UIAlertAction actionWithTitle:@"No"
                   style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:actionOk];
    [alertController addAction:actionNo];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

#pragma mark - delete all notifications
-(void)deleteAllNotifications
{
    
    
    [SVProgressHUD showWithStatus:pleaseWait maskType:SVProgressHUDMaskTypeBlack];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    NSDictionary *parameters;
    parameters = @{
                   @"action"            : @"delNotification",
                   @"userId"            : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]],
                   };
 
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject){
         
         [SVProgressHUD dismiss];
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]== TRUE){
             
             [arrAllNotification removeAllObjects];
             [tbleView reloadData];
             btnClearNotification.hidden = TRUE;
             
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


@end
