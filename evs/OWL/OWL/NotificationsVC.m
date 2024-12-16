//
//  NotificationsVC.m
//  OWL
//
//  Created by Apple on 7/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "NotificationsVC.h"

@interface NotificationsVC ()
{
    NSArray *arrOfNotificationList;
}
@end

@implementation NotificationsVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    imgFullView.backgroundColor=RGBc(53, 60, 78);
    imgFullView.alpha=0.70f;
    
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
    
    tbleeViews.delegate=self;
    tbleeViews.dataSource=self;
    tbleeViews.backgroundColor=Clear;
    tbleeViews.separatorColor=Clear;
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"NOTIFICATIONS"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(backFromSettingScreen)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
  // [self listOfNotifications];
    
    //[self test];
    
    
}

-(void)test{

        [SVProgressHUD showWithStatus:pleaseWait maskType:SVProgressHUDMaskTypeBlack];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        NSDictionary *parameters;
        parameters = @{
                       @"id" : @"1",

                       };
        NSLog(@"parameters-------%@",parameters);
        
        
        [manager POST:@"http://52.14.154.225/api/profile" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             
             NSDictionary *dictPhotographerLogin=responseObject;
             
             if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]== TRUE)
             {
                 
                 [self listOfNotifications];
                 
                 
                 
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

-(void)backFromSettingScreen
{
    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (arrOfNotificationList.count>0)
    {
        tbleeViews.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tbleeViews.backgroundView = nil;
        return [arrOfNotificationList count];
    }
    else
    {
        [Alert addLabelBGTableView:tbleeViews msg:@"No Notification" color:White];
        
        return 0;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"notificationsCell";
    NotificationsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[NotificationsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *dictLocalListingNotification=[arrOfNotificationList objectAtIndex:indexPath.row];
    
    NSString *strNotificationType = [dictLocalListingNotification objectForKey:@"type"];
    
    if ([strNotificationType isEqualToString:@"Admin Notification"] == TRUE) {
        
        cell.lblTitle.text=[NSString stringWithFormat:@"%@",[dictLocalListingNotification objectForKey:@"message"]];
        cell.lblTitle.numberOfLines = 0;
        cell.lblUserName.text=@"";
        cell.lblWithName.text=@"";
        cell.lblTitle.textColor=RGBc(194, 207, 238);
        cell.lblWithName.textColor=RGBc(194, 207, 238);
        cell.lblUserName.textColor=White;
        
    }
    else{
        
        if (kSCREEN_HEIGHT == 1024) {
            
            NSString *strValue = [NSString stringWithFormat:@"%@ add missing child with name %@",[dictLocalListingNotification objectForKey:@"user_name"],[[dictLocalListingNotification objectForKey:@"child"] objectForKey:@"first_name"]];
            
            cell.lblTitle.text=strValue;
            
            
        }
        else{
            
            cell.lblTitle.text=[NSString stringWithFormat:@"%@ %@",[dictLocalListingNotification objectForKey:@"user_name"],[dictLocalListingNotification objectForKey:@"type"]];
            
            cell.lblUserName.text=[NSString stringWithFormat:@"%@",[[dictLocalListingNotification objectForKey:@"child"] objectForKey:@"first_name"]];
            
        }
        
       
        
        cell.lblTitle.textColor=RGBc(194, 207, 238);
        cell.lblWithName.textColor=RGBc(194, 207, 238);
        
        
        cell.lblUserName.textColor=White;
        
        
    }
    cell.backgroundColor=Clear;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return YES if you want the specified item to be editable.
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        
        NSLog(@"delete array====%@",[arrOfNotificationList objectAtIndex:indexPath.row]);
        
        NSDictionary *dictLocalDelete=[arrOfNotificationList objectAtIndex:indexPath.row];
        
        [self deleteOneNotification:dictLocalDelete];
        
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
             
             arrOfNotificationList=[dictPhotographerLogin objectForKey:@"notifications"];
             
             if ([arrOfNotificationList count]==0)
             {
                 self.navigationItem.rightBarButtonItem=nil;
             }
             else
             {
                 UIBarButtonItem *rightBarButton=[[UIBarButtonItem alloc]initWithTitle:@"Delete all" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAllAlertViewPopUp)];
                 
                 self.navigationItem.rightBarButtonItem=rightBarButton;
             }
             
             
             
             [tbleeViews reloadData];
             
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
    
    
   
    
    [SVProgressHUD showWithStatus:pleaseWait maskType:SVProgressHUDMaskTypeBlack];
    
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
             
             [self listOfNotifications];
             
             
             
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

-(void)deleteAllAlertViewPopUp
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Delete All"
                                          
                                                                             message:@"Are you sure you want to delete all notifications?"
                                          
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"YES"
                               
                                                       style:UIAlertActionStyleDestructive
                               
                                                     handler:^(UIAlertAction *actionYes)
                               {
                                   [self deleteAllNotifications];
                               }];
    
    UIAlertAction *actionNo = [UIAlertAction actionWithTitle:@"No"
                              
                                                      style:UIAlertActionStyleDefault
                              
                                                     handler:nil];
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
    NSLog(@"parameters-------%@",parameters);
    
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]== TRUE)
         {
             
             [self listOfNotifications];
             
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
