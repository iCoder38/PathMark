//
//  UserProfileVC.m
//  OWL
//
//  Created by Apple on 8/22/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "UserProfileVC.h"

@interface UserProfileVC ()

@end

@implementation UserProfileVC
@synthesize dictToGetMissingChildDetails;

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"dictToGetMissingChildDetails==%@",dictToGetMissingChildDetails);
    
    imgUserProfilePicture.layer.cornerRadius=60;
    imgUserProfilePicture.clipsToBounds=YES;
    
    imgUserProfilePicture.layer.borderColor=White.CGColor;
    imgUserProfilePicture.layer.borderWidth=2.f;
    
    [btnStartChat setBackgroundColor:RGBc(250, 127, 64)];
    btnStartChat.layer.cornerRadius=4;
    btnStartChat.clipsToBounds=YES;
    [btnStartChat setTitleColor:White forState:UIControlStateNormal];
    [btnStartChat addTarget:self action:@selector(chatWithMeClickMethod) forControlEvents:UIControlEventTouchUpInside];

    
    [btnContact setBackgroundColor:RGBc(39, 214, 158)];
    btnContact.layer.cornerRadius=4;
    btnContact.clipsToBounds=YES;
    [btnContact setTitleColor:White forState:UIControlStateNormal];
    [btnContact addTarget:self action:@selector(contactClickMethod) forControlEvents:UIControlEventTouchUpInside];

}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"USER PROFILE"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(leftMenuBarInUserprofile)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    UIBarButtonItem *rightBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarInUserprofile)];
    
    self.navigationItem.rightBarButtonItem=rightBarButton;

    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    
}

-(void)contactClickMethod
{
    ContactVC *cvc=[self.storyboard instantiateViewControllerWithIdentifier:@"ContactVCId"];
    [self.navigationController pushViewController:cvc animated:YES];
}

-(void)chatWithMeClickMethod
{
    
}

-(void)leftMenuBarInUserprofile
{
    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];
}

-(void)rightBarInUserprofile
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
