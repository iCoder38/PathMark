//
//  WhoWhereWhenVC.m
//  OWL
//
//  Created by Apple on 9/4/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "WhoWhereWhenVC.h"

@interface WhoWhereWhenVC ()

@end

@implementation WhoWhereWhenVC
@synthesize dictGetAllDataOfIFoundMyChild;

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"dictGetAllDataOfIFoundMyChild===%@",dictGetAllDataOfIFoundMyChild);
    
    [Alert textFieldplaceholder:txtWho placeholder:@"Who?" color:Black font:ml14];
    [Alert setLeftPaddingTextField:txtWho paddingValue:20];
    txtWho.delegate=self;
    
    [Alert textFieldplaceholder:txtWhen placeholder:@"When?" color:Black font:ml14];
    [Alert setLeftPaddingTextField:txtWhen paddingValue:20];
    txtWhen.delegate=self;
    
    [Alert textFieldplaceholder:txtWhere placeholder:@"Where?" color:Black font:ml14];
    [Alert setLeftPaddingTextField:txtWhere paddingValue:20];
    txtWhere.delegate=self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"FOUND CHILDREN/PEOPLE INFO"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backFromMissingDetails)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
}

-(void)backFromMissingDetails
{
    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];
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

#pragma mark - who,where,when webservice
#pragma mark - webservice
-(void)ifoundMyChild
{
    
    [Alert svProgress:pleaseWait];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    parameters = @{
                   @"action"            : @"updateChildStatus",
                   @"userId"           : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]],
                   @"childId":[NSString stringWithFormat:@"%@",[dictGetAllDataOfIFoundMyChild objectForKey:@"id"]],
                   @"status":@"Found"
                   };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         [SVProgressHUD dismiss];
         
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
         {
             
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
