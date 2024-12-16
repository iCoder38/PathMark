//
//  SettingsVC.m
//  OWL
//
//  Created by Apple on 7/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "SettingsVC.h"

@interface SettingsVC ()

@end

@implementation SettingsVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
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
    
    
    UIImageView *imgFullView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    imgFullView.backgroundColor=RGBc(53, 60, 78);
    imgFullView.alpha=0.70f;
    [self.view insertSubview:imgFullView atIndex:0];
    [self.view insertSubview:imgBGp atIndex:0];
    
    tbleeView.delegate=self;
    tbleeView.dataSource=self;
    tbleeView.backgroundColor=Clear;
    tbleeView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    tbleeView.separatorColor=DarkGray;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"SETTINGS"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(lefttBarButtonClickMethodInSetting)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
}

-(void)lefttBarButtonClickMethodInSetting
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
    // Return the number of rows in the section.
    
    return  3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"settingCell";
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[SettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (indexPath.row==0)
    {
     cell.lblTitle.text=@"Edit profile";
    }
    else if(indexPath.row==1)
    {
     cell.lblTitle.text=@"Change Password";
    }
    else
    {
     cell.lblTitle.text=@"Notification setting";
    }
    
    cell.lblTitle.textColor=White;
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    cell.backgroundColor=Clear;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row==0)
    {
        EditProfileVC *epvc=[self.storyboard instantiateViewControllerWithIdentifier:@"EditProfileVCId"];
        [self.navigationController pushViewController:epvc animated:YES];
    }
    else if(indexPath.row==1)
    {
        ChangePasswordVC *epvc=[self.storyboard instantiateViewControllerWithIdentifier:@"ChangePasswordVCId"];
        [self.navigationController pushViewController:epvc animated:YES];
    }
    else
    {
        NotificationSettingsVC *noti=[self.storyboard instantiateViewControllerWithIdentifier:@"NotificationSettingsVCId"];
        [self.navigationController pushViewController:noti animated:YES];
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
@end
