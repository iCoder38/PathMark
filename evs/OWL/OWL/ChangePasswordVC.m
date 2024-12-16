//
//  ChangePasswordVC.m
//  PTC
//
//  Created by Apple on 7/4/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "ChangePasswordVC.h"

@interface ChangePasswordVC ()


@end

@implementation ChangePasswordVC

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
    
    UIColor *w=White;
    UIColor *lg=DarkGray;
    UIColor *rgb=RGBc(255, 255, 255);
    
    [Alert textFieldplaceholder:txtCurrentPassword placeholder:@"Current Password" color:lg font:mr15];
    [Alert setLeftPaddingTextField:txtCurrentPassword paddingValue:20];
    txtCurrentPassword.delegate=self;
    txtCurrentPassword.backgroundColor=rgb;
    txtCurrentPassword.textColor=Black;
    [Alert corner:txtCurrentPassword cornerRadius:4 yesNo:YES];
    [Alert border:txtCurrentPassword color:rgb width:1.0f];
    
    [Alert textFieldplaceholder:txtNewPassword placeholder:@"New Password" color:lg font:mr15];
    [Alert setLeftPaddingTextField:txtNewPassword paddingValue:20];
    txtNewPassword.delegate=self;
    txtNewPassword.backgroundColor=rgb;
    txtNewPassword.textColor=Black;
    [Alert corner:txtNewPassword cornerRadius:4 yesNo:YES];
    [Alert border:txtNewPassword color:rgb width:1.0f];
    
    [Alert textFieldplaceholder:txtConfirmPassword placeholder:@"Confirm Password" color:lg font:mr15];
    [Alert setLeftPaddingTextField:txtConfirmPassword paddingValue:20];
    txtConfirmPassword.delegate=self;
    txtConfirmPassword.backgroundColor=rgb;
    txtConfirmPassword.textColor=Black;
    [Alert corner:txtConfirmPassword cornerRadius:4 yesNo:YES];
    [Alert border:txtConfirmPassword color:rgb width:1.0f];
    
    txtCurrentPassword.layer.cornerRadius=2;
    txtCurrentPassword.clipsToBounds=YES;
    
    txtNewPassword.layer.cornerRadius=2;
    txtNewPassword.clipsToBounds=YES;
    
    txtConfirmPassword.layer.cornerRadius=2;
    txtConfirmPassword.clipsToBounds=YES;
    
    txtCurrentPassword.keyboardAppearance=UIKeyboardAppearanceDark;
    txtNewPassword.keyboardAppearance=UIKeyboardAppearanceDark;
    txtConfirmPassword.keyboardAppearance=UIKeyboardAppearanceDark;
    
    btnSubmit.backgroundColor=Black;
    [btnSubmit setTitleColor:w forState:UIControlStateNormal];
    [btnSubmit addTarget:self action:@selector(submitClick) forControlEvents:UIControlEventTouchUpInside];
    
    txtCurrentPassword.secureTextEntry=YES;
    txtConfirmPassword.secureTextEntry=YES;
    txtNewPassword.secureTextEntry=YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [Alert moveUpView:self.view];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [Alert moveDownView:self.view];
    
    [self.view endEditing:YES];
    
    return YES;
}

-(void)submitClick
{
    if ([txtCurrentPassword.text isEqualToString:@""])
    {
        [SVProgressHUD showErrorWithStatus:@"Old Password should not be empty" maskType:SVProgressHUDMaskTypeBlack];
    }
    else
        if ([txtNewPassword.text isEqualToString:@""])
        {
            [SVProgressHUD showErrorWithStatus:@"New Password should not be empty" maskType:SVProgressHUDMaskTypeBlack];

        }
            else
            if ([txtConfirmPassword.text isEqualToString:@""])
            {
                [SVProgressHUD showErrorWithStatus:@"Confirm Password should not be empty" maskType:SVProgressHUDMaskTypeBlack];
            }
            else
                if (![txtNewPassword.text isEqualToString:txtConfirmPassword.text])
                {
                    [SVProgressHUD showErrorWithStatus:@"Password not match." maskType:SVProgressHUDMaskTypeBlack];
                }
                else
                {
                    [self firebaseLoginOWL];
                }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"CHANGE PASSWORD"];
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

-(void)firebaseLoginOWL{
    
    [self.view endEditing:YES];
    [Alert moveDownView:self.view];
    
    
    
    NSDictionary * myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    NSString *strEmail    = [myDictionary objectForKey:@"emailId"];
    NSString *strPassword = txtCurrentPassword.text;
    
    
    if ([strEmail isEqualToString:@""])
    {
        // [loaderView removeFromSuperview];
        [Alert svError:@"Email address should not be empty."];
        
    }
    else if ([strPassword isEqualToString:@""])
    {
        //[loaderView removeFromSuperview];
        [Alert svError:@"Password should not be empty."];
    }
    else
    {
        
        [[FIRAuth auth] signInWithEmail:strEmail password:strPassword completion:^(FIRUser *user, NSError *error){
            
             if (error){
                 
                 [Alert alertControllerTitle:@"OWL" msg:error.localizedDescription ok:@"Ok" controller:self.navigationController];
             }
             else{
                 
                 [Alert svProgress:@"Please Wait..."];
                 [self changePasswordFromFirebase];
             }
             
         }];
    }
    
}

#pragma mark - change password
-(void)changePasswordFromFirebase{
   
    FIRUser *user = [FIRAuth auth].currentUser;
    NSString *newPassword = txtNewPassword.text;
    
    [user updatePassword:newPassword completion:^(NSError *_Nullable error) {
        if (error){
            
            [Alert alertControllerTitle:@"OWL" msg:error.localizedDescription ok:@"Ok" controller:self.navigationController];
        }
        else{

            [self changePasswordWebservice];
        }
    }];
}

-(void)changePasswordWebservice{
    
    NSDictionary * myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    parameters = @{
                   @"action": @"changePassword",
                   @"oldPassword": txtCurrentPassword.text,
                   @"newPassword": txtNewPassword.text,
                   @"userId":[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]]
                   };
    NSLog(@"parameters-------%@",parameters);
    
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject){
         
         NSDictionary *dictPhotographerLogin=responseObject;
        
        if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE){
             
             [SVProgressHUD showSuccessWithStatus:@"Successfully updated" maskType:SVProgressHUDMaskTypeBlack];
             
             txtCurrentPassword.text=@"";
             txtConfirmPassword.text=@"";
             txtNewPassword.text=@"";
             
             [self.navigationController popViewControllerAnimated:YES];
             
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
