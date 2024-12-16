//
//  MissingChildListDetailsVC.m
//  OWL
//
//  Created by Apple on 7/26/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "MissingChildListDetailsVC.h"

@interface MissingChildListDetailsVC ()
{
//    CLLocationManager *locationManager;
    
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
    
    NSDictionary *dictToGetMissingChildDetails;
    
    NSArray *arrOfMissingAndFoundUserDetails;
}
@end

@implementation MissingChildListDetailsVC

@synthesize strCheckFoundOrMissing;
@synthesize strCheckForDelete;
@synthesize dictGetMissingAndFoundChild;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    btnDelete.hidden=YES;
    
    ScrollVieww.delegate=self;
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    dictToGetMissingChildDetails = [userDefaults objectForKey:@"keyTransferMissingChildPerson"];
    

    //keyisItBlockOrNot
    
    
    
    
    
    self.view.backgroundColor=DarkGray;
    
    
    
    
    
    tbleView.delegate=self;
    tbleView.dataSource=self;
    tbleView.backgroundColor=White;
    
    
    
    
    
    
    
//load server data
    [self allDataFromServer];
    
    btnPrice.tintColor=White;
    NSString *strGetMissingChildPrizeMoney=[NSString stringWithFormat:@"%@",[dictToGetMissingChildDetails objectForKey:@"prize_money"]];
    
    if ([strGetMissingChildPrizeMoney isEqualToString:@""])
    {
        [btnPrice setTitle:@"" forState:UIControlStateNormal];
    }
    else
    {
        NSLog(@"yes");
        [btnPrice setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -10)];
        [btnPrice setImage:[UIImage imageNamed:@"ribbon"] forState:UIControlStateNormal];
        [btnPrice setTitle:[NSString stringWithFormat:@"$%@",[dictToGetMissingChildDetails objectForKey:@"prize_money"]] forState:UIControlStateNormal];
    }
    
    [btnPleaseHelpMeToFindAchild setTitle:[NSString stringWithFormat:@"%@",[dictToGetMissingChildDetails objectForKey:@"prize_msg"]] forState:UIControlStateNormal];
    
    if ([[NSString stringWithFormat:@"%@",[dictToGetMissingChildDetails objectForKey:@"prize_msg"]] isEqualToString:@""])
    {
        
    }
    else
        
    {
    
    [btnPleaseHelpMeToFindAchild addTarget:self action:@selector(popUpToGoBack) forControlEvents:UIControlEventTouchUpInside];
    }
    btnPrice.titleLabel.font=ms14;
}



-(void)popUpToGoBack{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Additional Details" message:[NSString stringWithFormat:@"%@",[dictToGetMissingChildDetails objectForKey:@"prize_msg"]] preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault
      handler:^(UIAlertAction *Action){
 
      }];
    
    [alertController addAction:actionOk];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


#pragma mark - loadServerData
-(void)allDataFromServer{
    
    [btnDelete setTitle:[NSString stringWithFormat:@"Delete - %@ %@",[dictToGetMissingChildDetails objectForKey:@"first_name"],[dictToGetMissingChildDetails objectForKey:@"last_name"]] forState:UIControlStateNormal];
    [btnDelete addTarget:self action:@selector(areYourSureAlert) forControlEvents:UIControlEventTouchUpInside];
    
    lblFirstName.text=[NSString stringWithFormat:@"%@ %@",[dictToGetMissingChildDetails objectForKey:@"first_name"],[dictToGetMissingChildDetails objectForKey:@"last_name"]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *startD = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",[dictToGetMissingChildDetails objectForKey:@"date_of_birth"]]];
    NSDate *endD = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:unitFlags fromDate:startD toDate:endD options:0];
    
    NSInteger year  = [components year];
    NSInteger month  = [components month];
    NSInteger day  = [components day];
    
    lblAgeAndGender.text=[NSString stringWithFormat:@"Age : %ldY - %ldM  | Gender:%@",(long)year,(long)month,[dictToGetMissingChildDetails objectForKey:@"gender"]];
    
    if (iPhoneVersion==5)
    {
        lblAgeAndGender.font=ml14;
    }
    else
    {
        lblAgeAndGender.font=ml16;
    }
    
    lblDateOfDisapeance.text=[NSString stringWithFormat:@"%@",[dictToGetMissingChildDetails objectForKey:@"date_of_disappearance"]];
    
    [imgProfile sd_setImageWithURL:[dictToGetMissingChildDetails objectForKey:@"image"]
                  placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
    
    imgProfile.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] init];
    [tapRecognizer addTarget:self action:@selector(bigButtonTapped:)];
    [imgProfile addGestureRecognizer:tapRecognizer];
    [imgProfile setAccessibilityLabel:@"OWL"];
    imgProfile.layer.cornerRadius = 40.0f;
    imgProfile.clipsToBounds=YES;
}

- (void)bigButtonTapped:(id)sender
{
        // Create image info
        JTSImageInfo *imageInfo = [[JTSImageInfo alloc] init];
#if TRY_AN_ANIMATED_GIF == 1
        imageInfo.imageURL = [NSURL URLWithString:@"http://media.giphy.com/media/O3QpFiN97YjJu/giphy.gif"];
#else
        imageInfo.image = imgProfile.image;
#endif
        imageInfo.referenceRect = imgProfile.frame;
        imageInfo.referenceView = imgProfile.superview;
        imageInfo.referenceContentMode = imgProfile.contentMode;
        imageInfo.referenceCornerRadius = imgProfile.layer.cornerRadius;
        
        // Setup view controller
        JTSImageViewController *imageViewer = [[JTSImageViewController alloc]
                                               initWithImageInfo:imageInfo
                                               mode:JTSImageViewControllerMode_Image
                                               backgroundStyle:JTSImageViewControllerBackgroundOption_Scaled];
        
        [imageViewer showFromViewController:self transition:JTSImageViewControllerTransition_FromOriginalPosition];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    dictToGetMissingChildDetails = [userDefaults objectForKey:@"keyTransferMissingChildPerson"];
    
    
    NSString *savedValue = [[NSUserDefaults standardUserDefaults] stringForKey:@"keyisItBlockOrNot"];
    NSLog(@"savedValue===%@",savedValue);
    
    
    
    
    [self allDataFromServer];
    
    if ([strCheckFoundOrMissing isEqualToString:@"fromFound"])
    {
        btnDelete.hidden=NO;
        [self setTitle:@"FOUND CHILD/PERSON"];
    }
    else
    {
        btnDelete.hidden=YES;
        [self setTitle:@"MISSING CHILD/PERSON"];
    }

    [self.navigationItem setHidesBackButton:YES animated:NO];
    
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backFromMissingDetails)];
    
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    if ([[dictToGetMissingChildDetails objectForKey:@"addedByMe"]isEqualToString:@"Yes"])
    {
        
    }
    else
    {
        NSString *strImage;
        
        if (kSCREEN_HEIGHT == 1024) {
            
            strImage = @"chitchat";
        }
        else{
            
            strImage = @"chat";
        }
        
    UIBarButtonItem *rightBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:strImage] style:UIBarButtonItemStylePlain target:self action:@selector(chatClickOnMissingChildDetails)];
        
        NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
        
    self.navigationItem.rightBarButtonItem=rightBarButton;
}
}

-(void)chatClickOnMissingChildDetails
{
//    if (iPhoneVersion == 5)
//    {
//        UIStoryboard *STO=[UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//
////        SeeAllUsersDetailsVC *seealluser=[STO instantiateViewControllerWithIdentifier:@"SeeAllUsersDetailsVCId"];
////
////        seealluser.dictGetAllDataFromMapUser=[dictToGetMissingChildDetails objectForKey:@"addedBy"];
////
////        [self.navigationController pushViewController:seealluser animated:YES];
//
//
//        SeeAllUsersDetailsVC *seealluser=[STO instantiateViewControllerWithIdentifier:@"SeeAllUsersDetailsVCId"];
//        seealluser.strFromMissingChild=@"iAmFromMissingChildList";
//        seealluser.dictGetAllDataFromMapUser=[dictToGetMissingChildDetails objectForKey:@"addedBy"];
//
//        [self.navigationController pushViewController:seealluser animated:YES];
//    }
//
//    else if (iPhoneVersion == 6)
//    {
        UIStoryboard *STO=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        SeeAllUsersDetailsVC *seealluser=[STO instantiateViewControllerWithIdentifier:@"SeeAllUsersDetailsVCId"];
        seealluser.strFromMissingChild=@"iAmFromMissingChildList";
        seealluser.dictGetAllDataFromMapUser=[dictToGetMissingChildDetails objectForKey:@"addedBy"];
        
        [self.navigationController pushViewController:seealluser animated:YES];
        
//    }
//    else if (iPhoneVersion == 61)
//    {
//        UIStoryboard *STO=[UIStoryboard storyboardWithName:@"Main6p" bundle:nil];
//        
//        SeeAllUsersDetailsVC *seealluser=[STO instantiateViewControllerWithIdentifier:@"SeeAllUsersDetailsVCId"];
//        seealluser.strFromMissingChild=@"iAmFromMissingChildList";
//        seealluser.dictGetAllDataFromMapUser=[dictToGetMissingChildDetails objectForKey:@"addedBy"];
//        
//        [self.navigationController pushViewController:seealluser animated:YES];
//        
//        
//    }
//    else
//    {
//        UIStoryboard *STO=[UIStoryboard storyboardWithName:@"Mainpad" bundle:nil];
//        
//        SeeAllUsersDetailsVC *seealluser=[STO instantiateViewControllerWithIdentifier:@"SeeAllUsersDetailsVCId"];
//        seealluser.strFromMissingChild=@"iAmFromMissingChildList";
//        seealluser.dictGetAllDataFromMapUser=[dictToGetMissingChildDetails objectForKey:@"addedBy"];
//        [self.navigationController pushViewController:seealluser animated:YES];
//    }
}

-(void)chatFromMissingChildDetails
{
    
}

-(void)backFromMissingDetails
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLayoutSubviews
{
    if ([strCheckFoundOrMissing isEqualToString:@"fromFound"])
    {
       ScrollVieww.contentSize = CGSizeMake(self.view.frame.size.width, 660);
    }
    else
    {
        ScrollVieww.contentSize = CGSizeMake(self.view.frame.size.width, 620);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)changePasswordWebservice
{
    [Alert svProgress:@"Deleting..."];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    parameters = @{
                   @"action": @"deletechild",
                   @"childId" : [NSString stringWithFormat:@"%@",[dictToGetMissingChildDetails objectForKey:@"id"]]
                   };
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSDictionary *dictPhotographerLogin=responseObject;
        
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
         {
             goBackDR
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

-(void)areYourSureAlert
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert!"
                                          
     message:[NSString stringWithFormat:@"Delete - %@ %@",[dictToGetMissingChildDetails objectForKey:@"first_name"],[dictToGetMissingChildDetails objectForKey:@"last_name"]]
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                               
                                                       style:UIAlertActionStyleDestructive
                               
                                                     handler:^(UIAlertAction *alert)
                               {
                                   [self changePasswordWebservice];
                               }];
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"Cancel"
                               
                                                       style:UIAlertActionStyleDefault
                               
                                                     handler:nil];

    
    [alertController addAction:actionOk];
    [alertController addAction:actionCancel];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (void)passDataBack
{
    strCheckForDelete=@"iAmFromSeeAllUserForDeleteMethod";
    
    if ([_delegate respondsToSelector:@selector(dataFromController:)])
    {
        [_delegate checkForBack:strCheckForDelete];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 16;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"missingChildListDetailsCell";
    MissingChildListDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[MissingChildListDetailsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    else if (indexPath.row == 0)
    {
        cell.lblTitle.text=@"Date of Disappearance";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"date_of_disappearance"]];
    }
    else if (indexPath.row == 1)
    {
        cell.lblTitle.text=@"Time of Disappearance";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"place_disappearance"]];
    }
    else if (indexPath.row == 2)
    {
        cell.lblTitle.text=@"Father's name";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"father_name"]];
    }
    else if (indexPath.row == 3)
    {
        cell.lblTitle.text=@"Mother's name";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"mother_name"]];
    }
    else if (indexPath.row == 4)
    {
        cell.lblTitle.text=@"Parents Mobile Number";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"parents_mobile_number"]];
    }
    else if (indexPath.row == 5)
    {
        cell.lblTitle.text=@"Address";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@,%@,%@,%@",[dictGetMissingAndFoundChild objectForKey:@"address"],[dictGetMissingAndFoundChild objectForKey:@"city"],[dictGetMissingAndFoundChild objectForKey:@"state"],[dictGetMissingAndFoundChild objectForKey:@"country"]];
    }
    else if (indexPath.row == 6)
    {
        cell.lblTitle.text=@"Postal code/Zipcode";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"pincode"]];
    }
    else if (indexPath.row == 7)
    {
        cell.lblTitle.text=@"Identification mark";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"identification_marks"]];
    }
    else if (indexPath.row == 8)
    {
        cell.lblTitle.text=@"Height - Weight";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@ inch & %@ pounds",[dictGetMissingAndFoundChild objectForKey:@"height"],[dictGetMissingAndFoundChild objectForKey:@"weight"]];
    }
    else if (indexPath.row == 9)
    {
        cell.lblTitle.text=@"Color of Eyes";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"color_of_eyes"]];
    }
    else if (indexPath.row == 10)
    {
        cell.lblTitle.text=@"Color of Hair";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"color_of_hair"]];
    }
    else if (indexPath.row == 11)
    {
        cell.lblTitle.text=@"Is the Child lost reason";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"is_the_child_lost_reason"]];
    }
    else if (indexPath.row == 12)
    {
        cell.lblTitle.text=@"Any Suspicion/ Specific Details";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"any_suspicion"]];
    }
    else if (indexPath.row == 13)
    {
        cell.lblTitle.text=@"Last seen wearing";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"last_seen_wearing"]];
    }
//    else if (indexPath.row == 14)
//    {
//        cell.lblTitle.text=@"Date Alert Issued";
//        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"complaint_date"]];
//    }
    else if (indexPath.row == 14)
    {
        cell.lblTitle.text=@"Alert Initiated by";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"complained_by"]];
    }
    else if (indexPath.row == 15)
    {
        cell.lblTitle.text=@"Last seen location";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"last_seen_location"]];
    }
    else if (indexPath.row == 16)
    {
        cell.lblTitle.text=@"Reward offer";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"prize_money"]];
    }
    else if (indexPath.row == 17)
    {
        cell.lblTitle.text=@"Reward Information";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"prize_msg"]];
    }
    
    cell.lblTitle.font=ms18;
    cell.lblSubtitle.font=ml16;
    
    cell.backgroundColor=Clear;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
