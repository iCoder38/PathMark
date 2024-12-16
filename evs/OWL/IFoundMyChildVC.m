//
//  IFoundMyChildVC.m
//  OWL
//
//  Created by Apple on 8/23/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "IFoundMyChildVC.h"

@interface IFoundMyChildVC ()

@end

@implementation IFoundMyChildVC
@synthesize dictGetMissingChildList;

- (void)viewDidLoad
{
    [super viewDidLoad];

    ScrollVieww.delegate=self;
    
    NSLog(@"dictGetMissingChildList===%@",dictGetMissingChildList);
    
    //load server data
    [self allDataFromServer];
    
      btnIfoundMyChild.tintColor=White;
    [btnIfoundMyChild setBackgroundColor:RGBc(250, 127, 64)];
    btnIfoundMyChild.layer.cornerRadius=4;
    btnIfoundMyChild.clipsToBounds=YES;
    btnIfoundMyChild.titleLabel.font=ms14;
    [btnIfoundMyChild addTarget:self action:@selector(ifoundMyChild) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - loadServerData
-(void)allDataFromServer
{
    lblFirstName.text=[NSString stringWithFormat:@"%@ %@",[dictGetMissingChildList objectForKey:@"first_name"],[dictGetMissingChildList objectForKey:@"last_name"]];
    
     lblMotherName.text=[NSString stringWithFormat:@"F: %@/M: %@",[dictGetMissingChildList objectForKey:@"father_name"],[dictGetMissingChildList objectForKey:@"mother_name"]];

    lblAddress.text=[NSString stringWithFormat:@"%@",[[dictGetMissingChildList objectForKey:@"addedBy"] objectForKey:@"address"]];
    
    lblParentsNumer.text=[NSString stringWithFormat:@"%@",[dictGetMissingChildList objectForKey:@"parents_mobile_number"]];
    
    lblIdenficationMark.text=[NSString stringWithFormat:@"%@",[dictGetMissingChildList objectForKey:@"identification_marks"]];
    
    lblHeightAndWeight.text=[NSString stringWithFormat:@"%@ Inches %@ Pounds",[dictGetMissingChildList objectForKey:@"height"],[dictGetMissingChildList objectForKey:@"weight"]];
    
    lblDateOfBirth.text=[NSString stringWithFormat:@"%@",[dictGetMissingChildList objectForKey:@"date_of_birth"]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *startD = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",[dictGetMissingChildList objectForKey:@"date_of_birth"]]];
    NSDate *endD = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:unitFlags fromDate:startD toDate:endD options:0];
    
    NSInteger year  = [components year];
    NSInteger month  = [components month];
    NSInteger day  = [components day];
    
    NSLog(@"%ld:%ld:%ld", (long)year, (long)month,(long)day);
    
    
    lblAgeAndGender.text=[NSString stringWithFormat:@"Age : %ldY - %ldM | Gender:%@",(long)year,month,[dictGetMissingChildList objectForKey:@"gender"]];
    
    lblDateOfDisapeance.text=[NSString stringWithFormat:@"%@",[dictGetMissingChildList objectForKey:@"date_of_disappearance"]];
    
    [imgProfile sd_setImageWithURL:[dictGetMissingChildList objectForKey:@"image"]
                  placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
    imgProfile.layer.cornerRadius = 40.0f;
    imgProfile.clipsToBounds=YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"MISSING CHILD DETAILS"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backFromMissingDetails)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    if ([[NSString stringWithFormat:@"%@",[dictGetMissingChildList objectForKey:@"addedByMe"]]isEqualToString:@"Yes"])
    {
        
    }
    else
    {
    UIBarButtonItem *rightBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"chat"] style:UIBarButtonItemStylePlain target:self action:@selector(chatFromMissingChildDetails)];
    
    self.navigationItem.rightBarButtonItem=rightBarButton;
    }
    
}

-(void)chatFromMissingChildDetails
{
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    PrivateChatVC *rvc=[[PrivateChatVC alloc]init];;
    
    rvc.username1 = [NSString stringWithFormat:@"%@+%@",[myDictionary objectForKey:@"firebaseId"], [dictGetMissingChildList objectForKey:@"firebaseId"]];
    
    rvc.username2 = [NSString stringWithFormat:@"%@+%@",[dictGetMissingChildList objectForKey:@"firebaseId"],[myDictionary objectForKey:@"firebaseId"]];
    
    rvc.dictChatUserInfo=[dictGetMissingChildList objectForKey:@"addedBy"];
    
    rvc.dictMyInfo=myDictionary;
    
    [self.navigationController pushViewController:rvc animated:YES];
    
    rvc=nil;
}

-(void)backFromMissingDetails
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLayoutSubviews
{
    ScrollVieww.contentSize = CGSizeMake(self.view.frame.size.width, 400);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - webservice
-(void)ifoundMyChild
{
    /*"action : updateChildStatus
     status: {Found/ Missing}
     childId:
     userId:        "*/
    
    [Alert svProgress:pleaseWait];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    parameters = @{
                   @"action"            : @"updateChildStatus",
                   @"userId"           : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]],
                   @"childId":[NSString stringWithFormat:@"%@",[dictGetMissingChildList objectForKey:@"id"]],
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
