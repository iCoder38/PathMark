//
//  ChatParentListingVC.m
//  OWL
//
//  Created by Apple on 9/6/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "ChatParentListingVC.h"
#import "AppDelegate.h"

@interface ChatParentListingVC ()
{
    NSArray *arrParentsListing;
    AppDelegate *appOnlineOrOffline;
}
@end

@implementation ChatParentListingVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    tbleView.delegate=self;
    tbleView.dataSource=self;
    
    tbleView.backgroundColor=Clear;
    tbleView.separatorColor=Black;
    
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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"PARENTS LISTING"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(backFromSettingScreenChat)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    [self listingOfAllParents];
}

-(void)backFromSettingScreenChat
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
    if (arrParentsListing.count>0)
    {
        tbleView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tbleView.backgroundView = nil;
        return [arrParentsListing count];
    }
    else
    {
        [Alert addLabelBGTableView:tbleView msg:@"No User Found" color:White];
        
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"chatParentTableCell";
    ChatParentTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[ChatParentTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *dictLocalShowParentsList=[arrParentsListing objectAtIndex:indexPath.row];
    cell.lblFirstAndLastName.text=[NSString stringWithFormat:@"%@",[dictLocalShowParentsList objectForKey:@"firstName"]];
    
    cell.lblAddress.text=[NSString stringWithFormat:@"%@",[dictLocalShowParentsList objectForKey:@"address"]];
    
    cell.lblFirstAndLastName.textColor=White;
    cell.lblAddress.textColor=White;
    
    [cell.imgProfile sd_setImageWithURL:[dictLocalShowParentsList objectForKey:@"image"]
                       placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
    
    cell.imgProfile.layer.cornerRadius=30;
    cell.imgProfile.clipsToBounds=YES;
    
    cell.backgroundColor=Clear;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIStoryboard *Sto;
    
//    if (iPhoneVersion == 5)
//    {
//        Sto=[UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//    }
//    else if (iPhoneVersion == 6)
//    {
        Sto=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    }
//    else if (iPhoneVersion == 61)
//    {
//        Sto=[UIStoryboard storyboardWithName:@"Main6p" bundle:nil];
//    }
//    else
//    {
//        Sto=[UIStoryboard storyboardWithName:@"Mainpad" bundle:nil];
//    }
    
    ChatParentsListingDetailsVC *cpld=[Sto instantiateViewControllerWithIdentifier:@"ChatParentsListingDetailsVCId"];
    cpld.dictFetchClickParentsDetails=[arrParentsListing objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:cpld animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

#pragma mark - delete all notifications
-(void)listingOfAllParents
{
    [SVProgressHUD showWithStatus:pleaseWait maskType:SVProgressHUDMaskTypeBlack];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    NSDictionary *parameters;
    parameters = @{
                   @"action"            : @"ChatUserList",
                   @"userId"            : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]],
                   };
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]== TRUE)
         {
             
             //NSLog(@"dictPhotographerLogin==%@",dictPhotographerLogin);
             
             arrParentsListing=[dictPhotographerLogin objectForKey:@"response"];
             
             [SVProgressHUD dismiss];
             
             [tbleView reloadData];
             
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
