//
//  ForgotPasswordVC.m
//  PTC
//
//  Created by Apple on 7/5/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "ForgotPasswordVC.h"

@interface ForgotPasswordVC ()

@end

@implementation ForgotPasswordVC

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
    
    [self.view insertSubview:imgBGp atIndex:0];
    
    
    UIColor *w=White;
    
    [Alert textFieldplaceholder:txtEmailAddress placeholder:@"Registered Email" color:LightGray font:mr15];
    [Alert setLeftPaddingTextField:txtEmailAddress paddingValue:20];
    txtEmailAddress.delegate=self;
    txtEmailAddress.backgroundColor=White;
    txtEmailAddress.textColor=Black;
    
    txtEmailAddress.layer.cornerRadius=2;
    txtEmailAddress.clipsToBounds=YES;
    
    btnSubmit.backgroundColor=Black;
    [btnSubmit setTitleColor:w forState:UIControlStateNormal];
    [btnSubmit addTarget:self action:@selector(submitClickFromForgotPassword) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"FORGOT PASSWORD"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backClickFromForgotPassword)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
}

-(void)backClickFromForgotPassword
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)submitClickFromForgotPassword
{
    
    if ([txtEmailAddress.text isEqualToString:@""])
    {
        [SVProgressHUD showErrorWithStatus:@"Email address should not be empty" maskType:SVProgressHUDMaskTypeBlack];
    }
    else
    {
        
        [SVProgressHUD showWithStatus:@"Please Wait..." maskType:SVProgressHUDMaskTypeBlack];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        NSDictionary *parameters;
        parameters = @{
                       @"action": @"forgetpassword",
                       @"emailId": txtEmailAddress.text
                       
                       };
        NSLog(@"parameters-------%@",parameters);
        
        
        [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             
             [SVProgressHUD dismiss];
             
             NSDictionary *dictPhotographerLogin=responseObject;
             
             if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]== TRUE){

                 [Alert alertControllerTitle:kAPPICATION_TITLE msg:[dictPhotographerLogin objectForKey:@"msg"] ok:k_OK controller:self.navigationController];
                 
                 txtEmailAddress.text=@"";
                 
             }
             else{

                 [Alert alertControllerTitle:kAPPICATION_TITLE msg:[dictPhotographerLogin objectForKey:@"msg"] ok:k_OK controller:self.navigationController];

             }

         }
              failure:^(AFHTTPRequestOperation *operation, NSError *error){

                  [SVProgressHUD dismiss];
                  
             [Alert alertControllerTitle:kAPPICATION_TITLE msg:error.localizedDescription ok:k_OK controller:self.navigationController];
                  
         }];
    }
}

@end
