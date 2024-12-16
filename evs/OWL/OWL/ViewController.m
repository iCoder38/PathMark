    //
//  ViewController.m
//  OWL
//
//  Created by Apple on 7/24/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "ViewController.h"


@import Firebase;
@import FirebaseDatabase;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    txtUserName.keyboardType=UIKeyboardTypeEmailAddress;
    
    NSLog(@"%@", [[FIRInstanceID instanceID] token]);
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self designUI];
    
    self.navigationController.navigationBarHidden=YES;
}

-(void)designUI{
    
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

    UIColor *rgbP=LightGray;
    
    [Alert textFieldplaceholder:txtUserName placeholder:@"Email address" color:rgbP font:ml14];
    [Alert textFieldplaceholder:txtPassword placeholder:@"Password" color:rgbP font:ml14];
    
    [Alert setLeftPaddingTextField:txtUserName paddingValue:20];
    [Alert setLeftPaddingTextField:txtPassword paddingValue:20];
    
    txtUserName.delegate=self;
    txtPassword.delegate=self;
    txtPassword.secureTextEntry=YES;
    
    UIColor *rgb=RGBc(255, 255, 255);
    txtUserName.backgroundColor=rgb;
    txtPassword.backgroundColor=rgb;
    
    txtUserName.layer.cornerRadius=2.0;
    txtUserName.clipsToBounds=YES;
    txtUserName.layer.borderWidth=1.0f;
    txtUserName.layer.borderColor=Clear.CGColor;
    txtUserName.autocorrectionType = UITextAutocorrectionTypeYes;
    txtUserName.autocorrectionType = UITextAutocorrectionTypeNo;
    
    txtPassword.layer.cornerRadius=2.0;
    txtPassword.clipsToBounds=YES;
    txtPassword.layer.borderWidth=1.0f;
    txtPassword.layer.borderColor=Clear.CGColor;
    txtPassword.autocorrectionType = UITextAutocorrectionTypeYes;
    txtPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    
    txtUserName.keyboardAppearance=UIKeyboardAppearanceDark;
    txtPassword.keyboardAppearance=UIKeyboardAppearanceDark;
    
    btnSignIn.backgroundColor=Black;
    [btnSignIn setTitleColor:White forState:UIControlStateNormal];
    [btnSignIn addTarget:self action:@selector(signInClickFromLogin) forControlEvents:UIControlEventTouchUpInside];
    
    [btnSignUp setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    [btnSignUp addTarget:self action:@selector(signUpClickFromLogin) forControlEvents:UIControlEventTouchUpInside];
    
    [btnGuest setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    [btnGuest addTarget:self action:@selector(GuestLogin) forControlEvents:UIControlEventTouchUpInside];
    
    [btnClickHere setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnClickHere addTarget:self action:@selector(clickHereClickFromLogin) forControlEvents:UIControlEventTouchUpInside];
    
}


-(void)GuestLogin
{
    [[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"guest"];
    
    DashboardVC *fp=[self.storyboard instantiateViewControllerWithIdentifier:@"DashboardVCId"];
    [self.navigationController pushViewController:fp animated:YES];
}

-(void)signInClickFromLogin
{
    
    [Alert moveDownView:self.view];
    [self.view endEditing:YES];
    [Alert svProgress:@"Sign in..."];
    [self firebaseLoginOWL];
    
}

-(void)signUpClickFromLogin
{
    DisclaimerVC *fp=[self.storyboard instantiateViewControllerWithIdentifier:@"DisclaimerVCId"];
    [self.navigationController pushViewController:fp animated:YES];
    
}

-(void)clickHereClickFromLogin
{
    ForgotPasswordVC *fp=[self.storyboard instantiateViewControllerWithIdentifier:@"ForgotPasswordVCId"];
    [self.navigationController pushViewController:fp animated:YES];
}


-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [Alert moveUpView:self.view];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [Alert moveDownView:self.view];
    
    dismissKeyboardDR
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - firebase Login
-(void)firebaseLoginOWL
{
    if ([txtUserName.text isEqualToString:@""])
    {
       // [loaderView removeFromSuperview];
        [Alert svError:@"Email address should not be empty."];
        
    }
    else if ([txtPassword.text isEqualToString:@""])
    {
        //[loaderView removeFromSuperview];
        [Alert svError:@"Password should not be empty."];
     }
    else
    {
        
        [[FIRAuth auth] signInWithEmail:txtUserName.text
                               password:txtPassword.text
                             completion:^(FIRUser *user, NSError *error)
         {
             if (error)
             {
                // [loaderView removeFromSuperview];
                 [Alert svError:@"Email or password is incorrect"];
             }
             else
             {
                 [self loginClickInOwl];
             }
             
         }];
    }
    
}

#pragma mark - login webservice hit here
-(void)loginClickInOwl
{
    if ([txtUserName.text isEqualToString:@""])
    {
        [Alert svError:emailV];
        [Alert border:txtUserName color:Red width:1];
    }
    else
        if ([txtPassword.text isEqualToString:@""])
        {
            [Alert svError:passwordV];
            [Alert border:txtPassword color:Red width:1];
        }
        else
        {
            [Alert border:txtPassword color:White width:1];
            [Alert border:txtPassword color:White width:1];
            
            NSUserDefaults *defDeviceToken=[NSUserDefaults standardUserDefaults];

            
            NSLog(@"%@",[defDeviceToken objectForKey:@"deviceID"]);
            
            
#if TARGET_IPHONE_SIMULATOR
            
            [[NSUserDefaults standardUserDefaults] setObject: @"f6a165bf39a0aa14c1909bc62396eb6981f6fa67bd1735958a9445eb88a6e1b3" forKey:@"deviceID"];
            
#else
            
#endif
            
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            
            NSDictionary *parameters;
            
            parameters = @{
                           @"action"      : @"login",
                           @"emailId"     : txtUserName.text,
                           @"password"    : txtPassword.text,
                           @"device"      : @"ios",
                           @"deviceToken" : [[FIRInstanceID instanceID] token],
                           @"token":[[FIRInstanceID instanceID] token]
                           };
            
            NSLog(@"parameters-------%@",parameters);
            
            [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
             {
                 
                 NSDictionary *dictPhotographerLogin=responseObject;
                 
                 if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE){
                     
                     [[NSUserDefaults standardUserDefaults] setObject:[dictPhotographerLogin objectForKey:@"response"] forKey:@"keyAllDataOfLoginUserOWL"];
                     [[NSUserDefaults standardUserDefaults] setValue:@"false" forKey:@"guest"];

                     DashboardVC *fp=[self.storyboard instantiateViewControllerWithIdentifier:@"DashboardVCId"];
                     [self.navigationController pushViewController:fp animated:YES];
                     
                     [SVProgressHUD showSuccessWithStatus:@"Done" maskType:SVProgressHUDMaskTypeBlack];
                     
                 }
                 else
                 {
                     
                     [SVProgressHUD showErrorWithStatus:@"Email or Password is incorrect" maskType:SVProgressHUDMaskTypeBlack];
                     
                 }
                 
             }
                  failure:^(AFHTTPRequestOperation *operation, NSError *error)
             
             {
                 [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
                 
             }];
            
        }
}



@end
