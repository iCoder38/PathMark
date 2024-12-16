//
//  DisclaimerVC.m
//  OWL
//
//  Created by Apple on 8/25/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "DisclaimerVC.h"

@interface DisclaimerVC ()

@end

@implementation DisclaimerVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self disclaimerWebservice];
    
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
    
    txtViewDisclaimer.textColor=White;
    txtViewDisclaimer.backgroundColor=Clear;
    
    [btnIagree setTitleColor:White forState:UIControlStateNormal];
    
    btnIagree.backgroundColor=RGBc(37, 214, 157);
    
    [btnIagree addTarget:self action:@selector(iAgreeDisclaimer) forControlEvents:UIControlEventTouchUpInside];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"DISCLAIMER"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(leftMenuBarInDisclaimer)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    
    
    
}

-(void)leftMenuBarInDisclaimer
{
    goBackDR
}

-(void)iAgreeDisclaimer
{
    RegistrationVC *fp=[self.storyboard instantiateViewControllerWithIdentifier:@"RegistrationVCId"];
    [self.navigationController pushViewController:fp animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - disclaimer web service

-(void)disclaimerWebservice
{
    
    [SVProgressHUD showWithStatus:pleaseWait maskType:SVProgressHUDMaskTypeBlack];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{
                                 @"action": @"disclaimer",
                                 
                                 };
    
    NSLog(@"parameters-------%@",parameters);
    
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]== TRUE)
             
         {
             
             
             NSLog(@"dictPhotographerLogin====%@",dictPhotographerLogin);
             
             txtViewDisclaimer.text=[NSString stringWithFormat:@"%@",[dictPhotographerLogin objectForKey:@"content"]];
             
             [SVProgressHUD dismiss];
              
         }
         else
         {
             NSLog(@"nopes");
             
             [SVProgressHUD showErrorWithStatus:[dictPhotographerLogin objectForKey:@"msg"] maskType:SVProgressHUDMaskTypeBlack];
             
         }
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
         
     }];
    
}

@end
