//
//  SidebarViewController.m
//  SidebarDemo
//
//  Created by Simon on 29/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "SidebarViewController.h"
#import "SWRevealViewController.h"
#import "EditProfileVC.h"
#import "AddMissingChildNewVC.h"
#import "donateVC.h"
#import "AddMissingChildFormVC.h"
#import "OWLNotificationVC.h"
#import "chatListVC.h"
#import <SafariServices/SafariServices.h>
#import "MainViewController.h"


@interface SidebarViewController ()<UISearchDisplayDelegate,SFSafariViewControllerDelegate>
{
    NSArray *menuItems,*arrImg;
    int intGroupCount,intChatCount,intPhotoCount;
    NSUInteger indentation;
    NSArray *nodes;
    UIButton*btn;
    int dynamicHeight;
    BOOL expandTableView;
    NSDictionary *dictLoginData;
    
    
}

@property (nonatomic, strong) NSMutableArray *searchResult;

@end

@implementation SidebarViewController
@synthesize  dataModelArray;

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
    
    dictLoginData = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    intGroupCount = 0;
    intChatCount = 0;
    _expandableTableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    
    [_expandableTableView reloadData];
    
}


- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    dynamicHeight = 40;
    expandTableView = NO;
    
    [[UITableView appearance] setSeparatorColor:[UIColor redColor]];
    
    //    [self.navigationItem setHidesBackButton:YES animated:NO];
    //    self.navigationController.navigationBarHidden=NO;
    //    [self.navigationController.navigationBar setTitleTextAttributes:
    //     @{NSForegroundColorAttributeName:White,
    //       NSFontAttributeName:mr14}];
    //    DnavColor
    
    self.navigationController.navigationBarHidden=YES;
    
    menuItems = @[@"a",
                  @"Dashboard",
                  @"Edit User Profile",
                  // @"See All Users",
                  @"Recent Chats",
                  @"Missing Child/Person",
                  @"Found Child/Person",
                  @"Add Missing Child/Person",
                  @"Cold Cases",
                  @"Saved Details",
                  @"Faqs",
                  @"Photo Gallery",
                  @"Notifications",
                  @"Settings",
                  @"Help",
                  @"Delete account",
                  @"Logout",
                  @""];
    
    buttinStateArray =[[NSMutableArray alloc]init];
    indexSectionArray =[[NSMutableArray alloc]init];
    titleArray =[[NSMutableArray alloc]init];
    _expandableTableView.backgroundColor =Black;
    _expandableTableView.separatorColor = Clear;
    _expandableTableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static  NSString *cellIdentifier = @"TournamentDetailListTableViewCell";
    
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        
    }

    for (UIView *cellView in [cell subviews]) {

        [cellView removeFromSuperview];
    }
    
    if (indexPath.row == 0){
        
        
        UILabel*lbl;
        lbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
        
        UILabel *lblUserName;
        UILabel *lblUserCountry;
        UIImageView*imgUser;
        imgUser=[[UIImageView alloc]initWithFrame:CGRectMake(60, 20, 100, 100)];
        
        lblUserName=[[UILabel alloc]initWithFrame:CGRectMake(10, 120, 200, 40)];
        lblUserCountry=[[UILabel alloc]initWithFrame:CGRectMake(10, 145, 200, 60)];
        lblUserName.numberOfLines = 0;
        lblUserCountry.numberOfLines = 0;
        
        imgUser.layer.cornerRadius=50;
        imgUser.clipsToBounds=YES;
        imgUser.layer.borderWidth=1.0f;
        imgUser.layer.borderColor = White.CGColor;
        imgUser.contentMode = UIViewContentModeScaleAspectFit;
        
        NSDictionary *myDictionarya = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
        
        
        
        lblUserName.textAlignment=NSTextAlignmentCenter;
        lblUserName.font=[UIFont fontWithName:@"HelveticaNeue-Bold" size:19];
        lblUserName.backgroundColor=Clear;
        
        lblUserCountry.textAlignment=NSTextAlignmentCenter;
        lblUserCountry.font=ms15;
        lblUserCountry.backgroundColor=Clear;
        
        lblUserName.textColor=[UIColor colorWithWhite:0.8 alpha:1.0];
        lblUserCountry.textAlignment=NSTextAlignmentCenter;
        lblUserCountry.font=[UIFont fontWithName:@"HelveticaNeue-Bold" size:16];
        lblUserCountry.numberOfLines = 0;
        lblUserCountry.backgroundColor=[UIColor clearColor];
        lblUserCountry.textColor=[UIColor colorWithWhite:0.8 alpha:1.0];
        
        
        
        [cell addSubview:lbl];
        [cell addSubview:imgUser];
        [cell addSubview:lblUserName];
        [cell addSubview:lblUserCountry];
        
        
        if([[[NSUserDefaults standardUserDefaults] valueForKey: @"guest"]   isEqual: @"false"])
        {
            NSString *strImage = [myDictionarya objectForKey:@"image"];
            
            strImage = [strImage stringByReplacingOccurrencesOfString:@" " withString:@""];
            NSURL *imageURL = [[NSURL alloc]initWithString:strImage];
            
            [imgUser sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
            
            
            lblUserName.text=[[NSString stringWithFormat:@"%@",[myDictionarya objectForKey:@"firstName"]] uppercaseString];
            
            lblUserCountry.text=[NSString stringWithFormat:@"%@ , %@",[myDictionarya objectForKey:@"address"],[myDictionarya objectForKey:@"zipcode"]];
            
            
        }
        else
        {
            [imgUser setImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
            
        }
        cell.backgroundColor = Clear;
        
    }
    else if (indexPath.row == 12)
    {
        
        UIImageView*imgUser;
        imgUser=[[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 16, 16)];
        
        UILabel *fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, 200, 40)];
        fromLabel.text = [menuItems objectAtIndex:indexPath.row];
        fromLabel.numberOfLines = 1;
        fromLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;         fromLabel.adjustsFontSizeToFitWidth = YES;
        fromLabel.minimumScaleFactor = 10.0f/12.0f;
        fromLabel.clipsToBounds = YES;
        fromLabel.font=ml14;
        fromLabel.backgroundColor = [UIColor clearColor];
        fromLabel.textColor = [UIColor colorWithWhite:0.8 alpha:1.0];
        fromLabel.textAlignment = NSTextAlignmentLeft;
        fromLabel.backgroundColor=Clear;
        cell.backgroundColor = Clear;
        
        [cell addSubview:fromLabel];
        
        
        UIView *viewIndexNine=[[UIView alloc]initWithFrame:CGRectMake(0, 50, 300, 110)];
        
        viewIndexNine.backgroundColor=Clear;
        
        UIImageView *imgEP = [[UIImageView alloc]initWithFrame:CGRectMake(25, 5, 10, 10)];
        imgEP.image = [UIImage imageNamed:@"left"];
        imgEP.contentMode = UIViewContentModeScaleAspectFit;
        //[viewIndexNine addSubview:imgEP];
        
        UIButton *btnEditProfile = [UIButton buttonWithType:UIButtonTypeCustom];
        btnEditProfile.frame = CGRectMake(40, 0, 200, 20);
        [btnEditProfile setTitle:@"Edit Profile" forState:UIControlStateNormal];
        [btnEditProfile setTitleColor:White forState:UIControlStateNormal];
        btnEditProfile.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btnEditProfile.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
        [btnEditProfile addTarget:self action:@selector(hitEditProfile:) forControlEvents:UIControlEventTouchUpInside];
        
        //[viewIndexNine addSubview:btnEditProfile];
        
        
        UIImageView *imgCP = [[UIImageView alloc]initWithFrame:CGRectMake(25, 5, 10, 10)];
        imgCP.image = [UIImage imageNamed:@"left"];
        imgCP.contentMode = UIViewContentModeScaleAspectFit;
        [viewIndexNine addSubview:imgCP];
        
        UIButton *btnChangePassword = [UIButton buttonWithType:UIButtonTypeCustom];
        btnChangePassword.frame = CGRectMake(40, 0, 200, 20);
        [btnChangePassword setTitle:@"Change Password" forState:UIControlStateNormal];
        [btnChangePassword setTitleColor:White forState:UIControlStateNormal];
        btnChangePassword.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btnChangePassword.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
        [btnChangePassword addTarget:self action:@selector(hitCP:) forControlEvents:UIControlEventTouchUpInside];
        
        [viewIndexNine addSubview:btnChangePassword];
        
        
        UIImageView *imgNS = [[UIImageView alloc]initWithFrame:CGRectMake(25, 35, 10, 10)];
        imgNS.image = [UIImage imageNamed:@"left"];
        imgNS.contentMode = UIViewContentModeScaleAspectFit;
        [viewIndexNine addSubview:imgNS];
        
        UIButton *btnNotificationSetting = [UIButton buttonWithType:UIButtonTypeCustom];
        btnNotificationSetting.frame = CGRectMake(40, 28, 200, 20);
        [btnNotificationSetting setTitle:@"Notification Settings" forState:UIControlStateNormal];
        [btnNotificationSetting setTitleColor:White forState:UIControlStateNormal];
        btnNotificationSetting.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btnNotificationSetting.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
        [btnNotificationSetting addTarget:self action:@selector(hitNS:) forControlEvents:UIControlEventTouchUpInside];
        [viewIndexNine addSubview:btnNotificationSetting];
        
        
        
        if (expandTableView == YES)
        {
            
            [cell addSubview:viewIndexNine];
            
            return cell;
            
        }
        
    }
    
    else if (indexPath.row == 16)
    {
        UIView *viewIndexNine=[[UIView alloc]initWithFrame:CGRectMake(20, 10, 200, 170)];
        viewIndexNine.backgroundColor= [UIColor blackColor];
        
        [cell addSubview:viewIndexNine];
        
        int xOrigin ;
        
        
        if (kSCREEN_HEIGHT == 568) {
            
            xOrigin = 5;
        }
        else{
            
            xOrigin = 20;
        }
        
        UIButton *btnFB;
        UIButton *btnTW;
        UIButton *btnGplus;
        UIButton *btnInsta;
        UIButton *btnLinkedIn;
        
        btnFB=[UIButton buttonWithType:UIButtonTypeCustom];
        [btnFB setBackgroundImage:[UIImage imageNamed:@"facebook"] forState:UIControlStateNormal];
        [btnFB addTarget:self action:@selector(facebookClick:) forControlEvents:UIControlEventTouchUpInside];
        
        btnFB.backgroundColor=Black;
        btnFB.frame=CGRectMake(0, 5, 24, 24);
        
        
        btnTW=[UIButton buttonWithType:UIButtonTypeCustom];
        [btnTW setBackgroundImage:[UIImage imageNamed:@"twitter"] forState:UIControlStateNormal];
        [btnTW addTarget:self action:@selector(twitterClick:) forControlEvents:UIControlEventTouchUpInside];
        btnTW.backgroundColor=Black;
        btnTW.frame=CGRectMake(btnFB.frame.size.width + btnFB.frame.origin.x + xOrigin, 5, 24, 24);
        
        
        btnGplus=[UIButton buttonWithType:UIButtonTypeCustom];
        [btnGplus   setBackgroundImage:[UIImage imageNamed:@"instagram"] forState:UIControlStateNormal];
        [btnGplus addTarget:self action:@selector(instaClick:) forControlEvents:UIControlEventTouchUpInside];
        btnGplus.backgroundColor=Black;
        btnGplus.frame=CGRectMake(btnTW.frame.size.width + btnTW.frame.origin.x + xOrigin, 5, 24, 24);
        
        btnInsta=[UIButton buttonWithType:UIButtonTypeCustom];
        [btnInsta   setTitle:@"owl-oncewaslost.com"  forState:UIControlStateNormal];
        [btnInsta addTarget:self action:@selector(linkedInClick:) forControlEvents:UIControlEventTouchUpInside];
        btnInsta.backgroundColor=Black;
        btnInsta.frame=CGRectMake(0, 40, 180, 35);;
        
        
        btnLinkedIn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btnLinkedIn   setTitle:@"https://once-was-lost-podcast.blubrry.net/subscribe-to-podcast/"  forState:UIControlStateNormal];
        btnLinkedIn.titleLabel.numberOfLines = 4;
        [btnLinkedIn addTarget:self action:@selector(googlePlusClick:) forControlEvents:UIControlEventTouchUpInside];
        btnLinkedIn.backgroundColor=Black;
        btnLinkedIn.frame=CGRectMake(0, 95, 180, 60);;
        
        
        [viewIndexNine addSubview:btnFB];
        [viewIndexNine addSubview:btnTW];
        [viewIndexNine addSubview:btnGplus];
        [viewIndexNine addSubview:btnInsta];
        [viewIndexNine addSubview:btnLinkedIn];
        cell.backgroundColor = Black;
        
    }
    else{
        
        UIImageView*imgUser;
        imgUser=[[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 16, 16)];
        
        UILabel *fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, 200, 40)];
        fromLabel.text = [menuItems objectAtIndex:indexPath.row];
        fromLabel.numberOfLines = 1;
        fromLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;         fromLabel.adjustsFontSizeToFitWidth = YES;
        fromLabel.minimumScaleFactor = 10.0f/12.0f;
        fromLabel.clipsToBounds = YES;
        fromLabel.font=ml14;
        fromLabel.backgroundColor = [UIColor clearColor];
        fromLabel.textColor = [UIColor colorWithWhite:0.8 alpha:1.0];
        fromLabel.textAlignment = NSTextAlignmentLeft;
        [cell addSubview:fromLabel];
        fromLabel.backgroundColor=Clear;
        
        cell.backgroundColor = Clear;
        
    }
    
    if (indexPath.row == 14) {
        UILabel *fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, 200, 40)];
        fromLabel.text = [menuItems objectAtIndex:indexPath.row];
        fromLabel.numberOfLines = 1;
        fromLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;         
        fromLabel.adjustsFontSizeToFitWidth = YES;
        fromLabel.minimumScaleFactor = 10.0f/12.0f;
        fromLabel.clipsToBounds = YES;
        fromLabel.font=ml14;
        fromLabel.backgroundColor = [UIColor redColor];
        fromLabel.textColor = [UIColor redColor];
        fromLabel.textAlignment = NSTextAlignmentLeft;
        [cell addSubview:fromLabel];
        fromLabel.backgroundColor=Clear;
        
        cell.backgroundColor = Clear;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        return 200;
    }
    else if (indexPath.row==12)
    {
        return dynamicHeight;
    }
    else if (indexPath.row==13)
    {
        return 40;
    }
    else if (indexPath.row==16)
    {
        return 170;
    }
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row==1){
        
        DashboardVC  *ds=(DashboardVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"DashboardVCId"];
        
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:ds];
        
        [navController setViewControllers: @[ds] animated: YES];
        [self.revealViewController setFrontViewController:navController];
        [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        
    }
    else
        if (indexPath.row==2)
        {
            
            
            
            if([[[NSUserDefaults standardUserDefaults] valueForKey: @"guest"]   isEqual: @"false"])
            {
                EditProfileVC *epvc=[self.storyboard instantiateViewControllerWithIdentifier:@"EditProfileVCId"];
                
                UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:epvc];
                
                [navController setViewControllers: @[epvc] animated: YES];
                [self.revealViewController setFrontViewController:navController];
                [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
            }
            else
            {
                [Alert svError:@"Please Register/Login to use this Functionality"];
            }
            
        }
    
    /*else
     if (indexPath.row==3)
     {
     
     seeAllUserOnMapVC *SAU = [[seeAllUserOnMapVC alloc]init];
     
     UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:SAU];
     
     [navController setViewControllers: @[SAU] animated: YES];
     [self.revealViewController setFrontViewController:navController];
     [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
     
     }*/
        else
            if (indexPath.row==3)
            {
                if([[[NSUserDefaults standardUserDefaults] valueForKey: @"guest"]   isEqual: @"false"])
                {
                    chatListVC *SAU = [[chatListVC alloc]init];
                    
                    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:SAU];
                    
                    [navController setViewControllers: @[SAU] animated: YES];
                    [self.revealViewController setFrontViewController:navController];
                    [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
                    
                }
                else
                {
                    [Alert svError:@"Please Register/Login to use this Functionality"];
                }
                
            }
            else if (indexPath.row==4){
                
                MissingChildListVC  *ds=(MissingChildListVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"MissingChildListVCId"];
                
                UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:ds];
                
                [navController setViewControllers: @[ds] animated: YES];
                [self.revealViewController setFrontViewController:navController];
                [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
            }
            else if (indexPath.row==5)
            {
                
                FoundedChildListVC *ds=(FoundedChildListVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"FoundedChildListVCId"];
                ds.isColdCase = @"no";
                UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:ds];
                
                [navController setViewControllers: @[ds] animated: YES];
                [self.revealViewController setFrontViewController:navController];
                [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
                
            }
            else
                if (indexPath.row==6){
                    
                    if([[[NSUserDefaults standardUserDefaults] valueForKey: @"guest"]   isEqual: @"false"])
                    {
                        AddMissingChildNewVC  *hp=[AddMissingChildNewVC new];
                        
                        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:hp];
                        
                        [navController setViewControllers: @[hp] animated: YES];
                        [self.revealViewController setFrontViewController:navController];
                        [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
                        
                    }
                    else
                    {
                        
                        
                        [Alert svError:@"Please Register/Login to use this Functionality"];
                        
                    }
                }
    
                else if (indexPath.row==7)
                {
                    FoundedChildListVC *ds=(FoundedChildListVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"FoundedChildListVCId"];
                    ds.isColdCase = @"yes";
                    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:ds];
                    
                    [navController setViewControllers: @[ds] animated: YES];
                    [self.revealViewController setFrontViewController:navController];
                    [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
                }
                else if (indexPath.row==8)
                {
                    /*
                     AddMissingChildFormVC  *hp=[AddMissingChildFormVC new];
                     hp.StrCheckSideMenuOrNot=@"yesiAmSideBar";
                     UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:hp];
                     
                     [navController setViewControllers: @[hp] animated: YES];
                     [self.revealViewController setFrontViewController:navController];
                     [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
                     */
                    if([[[NSUserDefaults standardUserDefaults] valueForKey: @"guest"]   isEqual: @"false"])
                    {
                        ListingOfAllSavedDraftDataVC  *hp=(ListingOfAllSavedDraftDataVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"ListingOfAllSavedDraftDataVCId"];
                        
                        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:hp];
                        
                        [navController setViewControllers: @[hp] animated: YES];
                        [self.revealViewController setFrontViewController:navController];
                        [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
                    }
                    else
                    {
                        [Alert svError:@"Please Register/Login to use this Functionality"];
                    }
                }
                else
                    if (indexPath.row==9)
                    {
                        
                        FAQsVC  *hp=(FAQsVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"FAQsVCId"];
                        
                        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:hp];
                        
                        [navController setViewControllers: @[hp] animated: YES];
                        [self.revealViewController setFrontViewController:navController];
                        [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
                        
                    }
                    else
                        if (indexPath.row==10)
                        {
                            if([[[NSUserDefaults standardUserDefaults] valueForKey: @"guest"]   isEqual: @"false"])
                            {
                                PhotosVC  *hp=(PhotosVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"PhotosVCId"];
                                
                                UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:hp];
                                
                                [navController setViewControllers: @[hp] animated: YES];
                                [self.revealViewController setFrontViewController:navController];
                                [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
                                
                            }
                            else
                            {
                                [Alert svError:@"Please Register/Login to use this Functionality"];
                            }
                        }
                        else if (indexPath.row==11){
                            
                            if([[[NSUserDefaults standardUserDefaults] valueForKey: @"guest"]   isEqual: @"false"])
                            {
                                OWLNotificationVC *OWLNVC = [[OWLNotificationVC alloc]init];
                                UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:OWLNVC];
                                
                                [navController setViewControllers: @[OWLNVC] animated: YES];
                                [self.revealViewController setFrontViewController:navController];
                                [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
                            }
                            else
                            {
                                [Alert svError:@"Please Register/Login to use this Functionality"];
                            }
                        }
                        else
                            if (indexPath.row==12)
                            {
                                
                                if([[[NSUserDefaults standardUserDefaults] valueForKey: @"guest"]   isEqual: @"false"])
                                {
                                    if (expandTableView == NO) {
                                        
                                        expandTableView = YES;
                                        dynamicHeight = 100;
                                    }
                                    else{
                                        expandTableView = NO;
                                        dynamicHeight = 40;
                                    }
                                    
                                    
                                    [_expandableTableView reloadData];
                                    return;
                                }
                                else
                                {
                                    [Alert svError:@"Please Register/Login to use this Functionality"];
                                }
                                
                            }
    //                        else
    //                            if (indexPath.row==14)
    //                            {
    //                               /*
    //                                donateVC *hp = [[donateVC alloc]init];
    //
    //                                UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:hp];
    //
    //                                [navController setViewControllers: @[hp] animated: YES];
    //                                [self.revealViewController setFrontViewController:navController];
    //                                [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
    //
    //                                */
    //
    //
    //                                NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"https://owl-oncewaslost.com/donate/"]];
    //                                if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
    //                                    [[UIApplication sharedApplication] openURL:URL options:@{} completionHandler:NULL];
    //                                }else{
    //                                    // Fallback on earlier versions
    //                                    [[UIApplication sharedApplication] openURL:URL];
    //                                }
    //                            }
                            else if (indexPath.row==15) {
                                
                                    if([[[NSUserDefaults standardUserDefaults] valueForKey: @"guest"]   isEqual: @"false"])
                                    {
                                        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Logout" message:@"Are you sure you want to logout?"
                                                                                                          preferredStyle:UIAlertControllerStyleAlert];
                                        
                                        
                                        
                                        UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Logout"style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
                                            
                                            [self logoutClick];
                                            
                                        }];
                                        
                                        
                                        UIAlertAction *actionCnacel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                                            
                                        }];
                                        
                                        
                                        [alertController addAction:actionCnacel];
                                        [alertController addAction:actionOk];
                                        
                                        [self presentViewController:alertController animated:YES completion:nil];
                                        
                                    }
                                    else
                                    {
                                        ViewController  *dashboard=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerId"];
                                        
                                        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:dashboard];
                                        
                                        [navController setViewControllers: @[dashboard] animated: YES];
                                        [self.revealViewController setFrontViewController:navController];
                                        [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
                                    }
                                    
                                    
                                }
                                else
                                    if (indexPath.row == 13)
                                    {
                                        
                                        HelpVC  *hp=(HelpVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"HelpVCId"];
                                        
                                        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:hp];
                                        
                                        [navController setViewControllers: @[hp] animated: YES];
                                        [self.revealViewController setFrontViewController:navController];
                                        [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
                                        
                                    }
                                    else
                                        if (indexPath.row == 14)
                                        {
                                            
                                            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Delete account" message:@"Are you sure you want to delete account? Your all data will be removed permanently"
                                                                                                              preferredStyle:UIAlertControllerStyleAlert];
                                            
                                            
                                            
                                            UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Delete"style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
                                                
                                                [self deleteAccount];
                                                
                                            }];
                                            
                                            
                                            UIAlertAction *actionCnacel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                                                
                                            }];
                                            
                                            
                                            [alertController addAction:actionCnacel];
                                            [alertController addAction:actionOk];
                                            
                                            [self presentViewController:alertController animated:YES completion:nil];
                                            
                                        }
}


-(void)logoutClick{
    
    [SVProgressHUD showWithStatus:@"Logging out..." maskType:SVProgressHUDMaskTypeBlack];
    
    NSDictionary * myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    parameters = @{
        @"action": @"logout",
        @"userId":[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]]
    };
    NSLog(@"parameters-------%@",parameters);
    
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
        
        NSDictionary *dictPhotographerLogin=responseObject;
        
        if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
        {
            
            [SVProgressHUD showSuccessWithStatus:@"Successfully Logout" maskType:SVProgressHUDMaskTypeBlack];
            
            NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
            
            [defaults setObject:nil forKey:@"keyAllDataOfLoginUserOWL"];
            [defaults setObject:@"" forKey:@"keyAllDataOfLoginUser"];
            [defaults setObject:@"" forKey:@"keyAllDataOfLoginUserOWL"];
            
            [defaults synchronize];
            
            ViewController  *dashboard=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerId"];
            
            UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:dashboard];
            
            [navController setViewControllers: @[dashboard] animated: YES];
            [self.revealViewController setFrontViewController:navController];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
            
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

-(void)deleteAccount{
    
    [SVProgressHUD showWithStatus:@"deleting..." maskType:SVProgressHUDMaskTypeBlack];
    
    NSDictionary * myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    parameters = @{
        @"action"   : @"deleteaccount",
        @"user_id"  : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]]
    };
    NSLog(@"parameters-------%@",parameters);
    
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
        
        NSDictionary *dictPhotographerLogin=responseObject;
        
        if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
        {
            
            [SVProgressHUD showSuccessWithStatus:@"Successfully deleted" maskType:SVProgressHUDMaskTypeBlack];
            
            NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
            
            [defaults setObject:nil forKey:@"keyAllDataOfLoginUserOWL"];
            [defaults setObject:@"" forKey:@"keyAllDataOfLoginUser"];
            [defaults setObject:@"" forKey:@"keyAllDataOfLoginUserOWL"];
            
            [defaults synchronize];
            
            ViewController  *dashboard=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerId"];
            
            UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:dashboard];
            
            [navController setViewControllers: @[dashboard] animated: YES];
            [self.revealViewController setFrontViewController:navController];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
            
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



- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(IBAction)hitEditProfile:(id)sender
{
    
    EditProfileVC *epvc=[self.storyboard instantiateViewControllerWithIdentifier:@"EditProfileVCId"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:epvc];
    
    [navController setViewControllers: @[epvc] animated: YES];
    [self.revealViewController setFrontViewController:navController];
    [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
    
}

-(IBAction)hitCP:(id)sender
{
    
    ChangePasswordVC *hp=[self.storyboard instantiateViewControllerWithIdentifier:@"ChangePasswordVCId"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:hp];
    
    [navController setViewControllers: @[hp] animated: YES];
    [self.revealViewController setFrontViewController:navController];
    [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
    
}


-(IBAction)hitNS:(id)sender{
    
    NotificationSettingsVC *hp=[self.storyboard instantiateViewControllerWithIdentifier:@"NotificationSettingsVCId"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:hp];
    
    [navController setViewControllers: @[hp] animated: YES];
    [self.revealViewController setFrontViewController:navController];
    [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
    
}


-(void)facebookClick:(id)sender
{
    //   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/OWL-Once-Was-Lost-1357861790996512/"]];
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:[NSURL URLWithString:@"https://www.facebook.com/OWL-Once-Was-Lost-1357861790996512/"] options:@{} completionHandler:nil];
}


-(void)twitterClick:(id)sender{
    
    //   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/OWL_OnceWasLost"]];
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:[NSURL URLWithString:@"https://twitter.com/OWL_OnceWasLost"] options:@{} completionHandler:nil];
}


-(void)googlePlusClick:(id)sender{

    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:[NSURL URLWithString:@"https://once-was-lost-podcast.blubrry.net/subscribe-to-podcast/"] options:@{} completionHandler:nil];
}

-(void)instaClick:(id)sender{
    
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:[NSURL URLWithString:@"https://www.instagram.com/owl.oncewaslost/"] options:@{} completionHandler:nil];
}

-(void)linkedInClick:(id)sender{
    
    //   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://owl-oncewaslost.com/"]];
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:[NSURL URLWithString:@"https://owl-oncewaslost.com/"] options:@{} completionHandler:nil];
}


#pragma Safari View Controller Delegate

- (void)safariViewControllerDidFinish:(nonnull SFSafariViewController *)controller {
    [controller dismissViewControllerAnimated:YES completion:nil];
}



@end
