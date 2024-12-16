//
//  chatListVC.m
//  OWL
//
//  Created by Rameshwar on 10/3/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "chatListVC.h"

@interface chatListVC ()<UITableViewDelegate, UITableViewDataSource, SWTableViewCellDelegate>{
    
    UITableView *tbleView;
    NSMutableArray *arrRecentChatList;
}

@end

@implementation chatListVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSUserDefaults *defHitChat = [NSUserDefaults standardUserDefaults];
    [defHitChat setObject:@"NO" forKey:@"startChatHit"];
    [defHitChat setObject:nil forKey:@"recentChatUserData"];
    [defHitChat synchronize];
    
    [self loadConfigView];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
     [super viewWillAppear:animated];
    
     [self customizeNavigationBar];

    
    
    NSString *strHitChat = [[NSUserDefaults standardUserDefaults] objectForKey:@"startChatHit"];
    
    if ([strHitChat isEqualToString:@"YES"] == TRUE) {
        
        NSDictionary *dictData = [[NSUserDefaults standardUserDefaults]objectForKey:@"recentChatUserData"];
        
        [self startChatClick:dictData];
    }
    
    [self getRecentChat];
    [tbleView reloadData];
    
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
    lblTitle.text = @"Recent Chats";
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
    
    self.view.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];

    tbleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 65, kSCREEN_WIDTH, kSCREEN_HEIGHT-70)];
    tbleView.backgroundColor = [UIColor colorWithRed:51.0/255.0 green:57.0/255.0 blue:75.0/255.0 alpha:0.0];
    tbleView.delegate = self;
    tbleView.dataSource = self;
    tbleView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tbleView];

}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (arrRecentChatList.count>0) {
        
        tbleView.backgroundView = nil;
        return arrRecentChatList.count;
        
    }
    else{
        
        [Alert addLabelBGTableView:tbleView msg:@"No Recent Chats Found." color:DarkGray];
        
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
//    for (UIView *cellView in [cell.contentView subviews]) {
//        
//        [cellView removeFromSuperview];
//    }
    
    
        if (arrRecentChatList.count==0) {
            
            return cell;
        }
    
        NSDictionary *dictCellData = [arrRecentChatList objectAtIndex:indexPath.row];

        UIView *completeCellView = [[UIView alloc]initWithFrame:CGRectMake(10, 5, kSCREEN_WIDTH-20, 75)];
        completeCellView.backgroundColor = [UIColor whiteColor];
        completeCellView.layer.cornerRadius = 2.0;
        completeCellView.layer.masksToBounds = NO;
        completeCellView.layer.shadowOffset = CGSizeMake(-3, 3);
        completeCellView.layer.shadowRadius = 2;
        completeCellView.layer.shadowOpacity = 0.5;
        [cell.contentView addSubview:completeCellView];
    
    
        UIImageView *profileImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 60)];
        profileImageView.layer.cornerRadius = 30;
        profileImageView.clipsToBounds = TRUE;
       [completeCellView addSubview:profileImageView];
    
        NSString *strURL = [dictCellData objectForKey:@"image"];
        NSURL *url = [NSURL URLWithString:strURL];
        [profileImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
        
        UILabel *lblShopName = [[UILabel alloc]initWithFrame:CGRectMake(80, 0, completeCellView.frame.size.width-90, 45)];
        lblShopName.backgroundColor = [UIColor clearColor];
    
        lblShopName.text = [dictCellData objectForKey:@"firstName"];
        lblShopName.textColor =[UIColor blackColor];
    
        
        lblShopName.textAlignment = NSTextAlignmentLeft;
        lblShopName.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:17];
        lblShopName.numberOfLines = 0;
        [completeCellView addSubview:lblShopName];
    
        NSDictionary *dictMessage = [[NSUserDefaults standardUserDefaults] objectForKey: [dictCellData objectForKey:@"id"]];
    
        NSString *strMessage = [dictMessage objectForKey:@"chat_message"];
        
        UILabel *lblDateTime = [[UILabel alloc]initWithFrame:CGRectMake(80, 45, completeCellView.frame.size.width-90, 20)];
        lblDateTime.backgroundColor = [UIColor clearColor];
    
        if ([strMessage isKindOfClass:[NSString class]] == TRUE) {
            
             lblDateTime.text = [dictCellData objectForKey:@"message"];
        }
        else{
            
             lblDateTime.text = @"No Recent Chat Found";
        }
    
    
        lblDateTime.textAlignment = NSTextAlignmentLeft;
        lblDateTime.textColor = [UIColor grayColor];
        lblDateTime.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        [completeCellView addSubview:lblDateTime];
        
        cell.backgroundColor = Clear;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;

}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
     NSDictionary *dictCellData = [arrRecentChatList objectAtIndex:indexPath.row];
    NSUserDefaults *defHitChat = [NSUserDefaults standardUserDefaults];
    [defHitChat setObject:dictCellData forKey:@"recentChatUserData"];
    [defHitChat synchronize];
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    PrivateChatVC * rvc = [[PrivateChatVC alloc]init];
    
    rvc.username1 = [NSString stringWithFormat:@"%@+%@",[myDictionary objectForKey:@"firebaseId"], [dictCellData objectForKey:@"firebaseId"]];
    
    rvc.username2 = [NSString stringWithFormat:@"%@+%@",[dictCellData objectForKey:@"firebaseId"],[myDictionary objectForKey:@"firebaseId"]];
    
    rvc.dictChatUserInfo=dictCellData;
    rvc.strNotification = @"no";
    rvc.dictMyInfo=myDictionary;
    
    [self.navigationController pushViewController:rvc animated:YES];
    
    rvc=nil;
    
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        return 80;
}





-(CGSize)findHeightForText:(NSString *)text havingWidth:(CGFloat)widthValue andFont:(UIFont *)font {
    
    CGSize size = CGSizeZero;
    
    if (text) {
        
        CGRect frame = [text boundingRectWithSize:CGSizeMake(widthValue, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:font } context:nil];
        size = CGSizeMake(frame.size.width, frame.size.height + 1);
    }
    return size;
}


#pragma mark - webservice
-(void)getRecentChat{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [SVProgressHUD showWithStatus:pleaseWait maskType:SVProgressHUDMaskTypeBlack];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    NSDictionary *parameters;
    parameters = @{
                   @"action"            : @"getChatList",
                   @"user_id"            : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]]
                   };
    NSLog(@"parameters-------%@",parameters);
    
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]== TRUE)
         {
             arrRecentChatList = [[NSMutableArray alloc]initWithCapacity:0];
             
             NSArray *arrData = [dictPhotographerLogin objectForKey:@"response"] ;
             
             [arrRecentChatList addObjectsFromArray:arrData];
             
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




-(void)startChatClick:(NSDictionary *)dictChatUser{
    
   // [Alert svProgress:@"Please wait..."];
    
    NSDictionary * myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    NSDictionary *dictMessage = [[NSUserDefaults standardUserDefaults] objectForKey:[dictChatUser objectForKey:@"id"]];
    
    NSString *strMessage = [dictMessage objectForKey:@"chat_message"];
    
    if ([strMessage isKindOfClass:[NSString class]] == TRUE) {
        
        
    }
    else{
        
        strMessage = @"";
    }
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    parameters = @{
                   @"action": @"startChat",
                   @"user_id":[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]],
                   @"profile_id" : [NSString stringWithFormat:@"%@",[dictChatUser objectForKey:@"id"]],
                   @"message": strMessage
                   };
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         [SVProgressHUD dismiss];
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
         {
             
             
             
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



- (NSArray *)deleteSwipe{
    
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor redColor] icon:[UIImage imageNamed:@"del"]];
    
    return leftUtilityButtons;
    
}


- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    
    switch (index) {
            
        case 0:
        {
            NSIndexPath *cellIndexPath = [tbleView indexPathForCell:cell];
            
            NSDictionary *dictLocalDelete=[arrRecentChatList objectAtIndex:cellIndexPath.row];
            
            [arrRecentChatList removeObjectAtIndex:cellIndexPath.row];
            
            [tbleView deleteRowsAtIndexPaths:@[cellIndexPath]withRowAnimation:UITableViewRowAnimationAutomatic];
            
            [self deleteRecentChat:dictLocalDelete];
            
            break;
            
        }
        default:
            break;
    }
}

-(void)deleteRecentChat:(NSDictionary *)dictDeleteData{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    NSDictionary *parameters;
    parameters = @{
                   @"action"            : @"deleteRecentChatUser",
                   @"userId"            : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]],
                   @"deletedUserId" : [NSString stringWithFormat:@"%@",[dictDeleteData objectForKey:@"id"]]
                   };
    NSLog(@"parameters-------%@",parameters);
    
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     
     {
         
         
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
         
     }];
    
}

@end
