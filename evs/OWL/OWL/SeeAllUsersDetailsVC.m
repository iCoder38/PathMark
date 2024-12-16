//
//  SeeAllUsersDetailsVC.m
//  OWL
//
//  Created by Apple on 8/23/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "SeeAllUsersDetailsVC.h"
#import <MessageUI/MessageUI.h>

#define TRY_AN_ANIMATED_GIF 0

@interface SeeAllUsersDetailsVC ()
<
MFMailComposeViewControllerDelegate, UITableViewDelegate, UITableViewDataSource
>
{
    NSArray *arrDetailsOfClickedUser;
    NSDictionary *dictGetMissingAndFoundChild;
    
    UIButton *btnArrow, *btnOppositeArrow;
}
@end

@implementation SeeAllUsersDetailsVC
@synthesize dictGetAllDataFromMapUser;
@synthesize strFromMissingChild;

- (void)viewDidLoad
{
    [super viewDidLoad];

    clview.delegate=self;
    clview.dataSource=self;
  

    if (kSCREEN_HEIGHT == 1024) {
        
         imgUserProfilePicture.layer.cornerRadius=90;
    }
    else{
        
         imgUserProfilePicture.layer.cornerRadius=60;
    }
    
    imgUserProfilePicture.clipsToBounds=YES;
    
    btnArrow             =   [UIButton buttonWithType:UIButtonTypeCustom];
    btnOppositeArrow     =   [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    [self allValueComesFromServer];
    
    
    NSUserDefaults *defHitChat = [NSUserDefaults standardUserDefaults];
    [defHitChat setObject:@"NO" forKey:@"startChatHit"];
    [defHitChat synchronize];
}

-(void)allValueComesFromServer
{
    arrDetailsOfClickedUser=[dictGetAllDataFromMapUser objectForKey:@"Child"];

    NSString *strImage = [dictGetAllDataFromMapUser objectForKey:@"image"];
    
    NSURL *imageURL = [[NSURL alloc]initWithString:strImage];
    [imgUserProfilePicture sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
    
    [imgUserProfileBgPicture sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
    
    imgUserProfilePicture.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] init];
    [tapRecognizer addTarget:self action:@selector(bigButtonTapped:)];
    [imgUserProfilePicture addGestureRecognizer:tapRecognizer];
    [imgUserProfilePicture setAccessibilityLabel:@"Photo of a cat wearing a Bane costume."];
    imgUserProfilePicture.layer.cornerRadius = imgUserProfilePicture.bounds.size.width/2.0f;
    
    imgUserProfilePicture.layer.borderColor=White.CGColor;
    imgUserProfilePicture.layer.borderWidth=0.90f;
    
    lblUserName.text=[NSString stringWithFormat:@"%@",[dictGetAllDataFromMapUser objectForKey:@"firstName"]];
    
    lblUserCountry.text=[NSString stringWithFormat:@"%@",[dictGetAllDataFromMapUser objectForKey:@"address"]];
    
    [btnChat setBackgroundColor:RGBc(250, 127, 64)];
    [btnContact setBackgroundColor:RGBc(39, 214, 158)];
    
    btnChat.layer.cornerRadius=4;
    btnChat.clipsToBounds=YES;
    [btnChat addTarget:self action:@selector(btnChatClickMethod) forControlEvents:UIControlEventTouchUpInside];
    
    btnContact.layer.cornerRadius=4;
    btnContact.clipsToBounds=YES;
    
    
   

}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)bigButtonTapped:(id)sender{
    
    // Create image info
    JTSImageInfo *imageInfo = [[JTSImageInfo alloc] init];
#if TRY_AN_ANIMATED_GIF == 1
    imageInfo.imageURL = [NSURL URLWithString:@"http://media.giphy.com/media/O3QpFiN97YjJu/giphy.gif"];
#else
    imageInfo.image = imgUserProfilePicture.image;
#endif
    imageInfo.referenceRect = imgUserProfilePicture.frame;
    imageInfo.referenceView = imgUserProfilePicture.superview;
    imageInfo.referenceContentMode = imgUserProfilePicture.contentMode;
    imageInfo.referenceCornerRadius = imgUserProfilePicture.layer.cornerRadius;
    
    // Setup view controller
    JTSImageViewController *imageViewer = [[JTSImageViewController alloc]
       initWithImageInfo:imageInfo
       mode:JTSImageViewControllerMode_Image
 backgroundStyle:JTSImageViewControllerBackgroundOption_Scaled];
    
    [imageViewer showFromViewController:self transition:JTSImageViewControllerTransition_FromOriginalPosition];
}




-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"Details"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backFromMissingDetails)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    NSString *savedValue = [[NSUserDefaults standardUserDefaults]stringForKey:@"keyisItBlockOrNot"];
    NSLog(@"savedValue===%@",savedValue);

    
    if ([savedValue isEqualToString:@"Yes"])
    {
        [btnChat setTitle:@"UNBLOCK" forState:UIControlStateNormal];
        self.navigationItem.rightBarButtonItem=nil;
    }
    else {
        
        [btnChat setTitle:@"CHAT" forState:UIControlStateNormal];
        NSString *strImage;
        
        if (kSCREEN_HEIGHT == 1024) {
            
            strImage = @"cross";
        }
        else {
            
            strImage = @"block";
        }
        
        UIBarButtonItem *rightBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:strImage] style:UIBarButtonItemStylePlain target:self action:@selector(blockThatUser)];
        rightBarButton.tintColor=Red;
       self.navigationItem.rightBarButtonItem=rightBarButton;
        
    }
    
    if ([strFromMissingChild isEqualToString:@"iAmFromMissingChildList"])
    {
        [self getAllMissingChildAddedByMe];
    }
    else
    {
        
    }
    
    btnContactWithoutChat.layer.cornerRadius = 4.0;
    btnContactWithoutChat.clipsToBounds = TRUE;
    
    if ([[dictGetAllDataFromMapUser objectForKey:@"blockByOther"] isEqualToString:@"Yes"] == TRUE) {
        
        btnContactWithoutChat.hidden = FALSE;
        btnChat.hidden = TRUE;
        btnContact.hidden = TRUE;
        
    }
    else{
        
        btnContactWithoutChat.hidden = TRUE;
        btnChat.hidden = FALSE;
        btnContact.hidden = FALSE;
    }
    
    
    NSString *strHitChat = [[NSUserDefaults standardUserDefaults] objectForKey:@"startChatHit"];
    
    if ([strHitChat isEqualToString:@"YES"] == TRUE) {
        
        [self startChatClick];
    }
    
    
    btnOppositeArrow.frame = CGRectMake(10, imgTransparent.frame.size.height-40, 30, 30);
    btnOppositeArrow.backgroundColor = [UIColor clearColor];
    [btnOppositeArrow setImage:[UIImage imageNamed:@"aropposite"] forState:UIControlStateNormal];
    [btnOppositeArrow addTarget:self action:@selector(hitOppositeArrow:) forControlEvents:UIControlEventTouchUpInside];
  
    [imgTransparent addSubview:btnOppositeArrow];
    
    
    btnArrow.frame = CGRectMake(kSCREEN_WIDTH-40, imgTransparent.frame.size.height-40, 30, 30);
    [btnArrow setImage:[UIImage imageNamed:@"ar"] forState:UIControlStateNormal];
    btnArrow.backgroundColor = [UIColor clearColor];
    [btnArrow addTarget:self action:@selector(hitArrow:) forControlEvents:UIControlEventTouchUpInside];
    [imgTransparent addSubview:btnArrow];
    
    imgTransparent.userInteractionEnabled = TRUE;
    
}

-(void)btnChatClickMethod
{
    if([[[NSUserDefaults standardUserDefaults] valueForKey: @"guest"]   isEqual: @"false"])
    {
    if ([btnChat.titleLabel.text isEqualToString:@"CHAT"])
    {
      
        [self navigateChatScreen];
    }
    else
    {
        [self unBlockAnUser];
    }
    }
    else
    {
        [Alert svError:@"Please Register/Login to use this Functionality"];
    }
}

-(void)blockThatUser
{
    if([[[NSUserDefaults standardUserDefaults] valueForKey: @"guest"]   isEqual: @"false"])
    {
    NSString *StrBlockMessage=[NSString stringWithFormat:@"Are you sure you want to block (%@)",[dictGetAllDataFromMapUser objectForKey:@"firstName"]];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Block" message:StrBlockMessage preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Yes"style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
        
        [self blockAnUser:dictGetAllDataFromMapUser];
        
    }];
    
    
    UIAlertAction *actionCnacel = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
    }];
    
    [alertController addAction:actionCnacel];
    [alertController addAction:actionOk];
    
    [self presentViewController:alertController animated:YES completion:nil];
        
    }
    else
    {
        [Alert svError:@"Please Register/Login to use this Functionality"];
    }
}

-(void)backFromMissingDetails{
    
    dictGetMissingAndFoundChild = nil;
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    if (arrDetailsOfClickedUser.count>0)
    {
         clview.backgroundView = nil;
        return arrDetailsOfClickedUser.count;
    }
    else
    {
        [Alert addLabelBGCollectionView:clview msg:@"No Child" color:Black];
        
        return 0;
    }
    

    return arrDetailsOfClickedUser.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView
              layout:(UICollectionViewLayout *)collectionViewLayout
   sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

   CGFloat height = self.view.frame.size.height;
   CGFloat width  = self.view.frame.size.width;
   // in case you you want the cell to be 40% of your controllers view
   return CGSizeMake(width , height-300);
 }

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
      SeeAllUserDetailsCollectionCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"seeAllUserDetailsCollectionCell" forIndexPath:indexPath];
    
    NSLog(@"%d", indexPath.row);
    
      dictGetMissingAndFoundChild=[arrDetailsOfClickedUser objectAtIndex:indexPath.row];
      NSLog(@"collection View data %@", dictGetMissingAndFoundChild);
    [cell reloadTableView:dictGetMissingAndFoundChild];
    
      cell.lblUserMissingChildName.text=[NSString stringWithFormat:@"%@ %@", [dictGetMissingAndFoundChild objectForKey:@"first_name"] , [dictGetMissingAndFoundChild objectForKey:@"last_name"]];
    
      NSString *birthDate = [NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"date_of_birth"]];
    
    NSDate *todayDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-dd-MM"];
    NSDate *dateOfBirth = [dateFormatter dateFromString:birthDate];
    
    
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *componentsNew = [gregorian components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:dateOfBirth toDate:todayDate options:0];
    
    
    NSInteger month =  [componentsNew month];
    NSInteger year  =  [componentsNew year];
    
    NSLog(@"You live since %li years and %li days",(long)month,(long)year);
    
    cell.lblUserMissingChildAgeAndGender.text=[NSString stringWithFormat:@"Age : %ld Y %ld M | Gender : %@",(long)year, (long)month,[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"gender"]]];
    cell.lblUserMissingChildAgeAndGender.numberOfLines = 0;
    
    cell.lblUserMissingChildParentMobileNumber.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"parents_mobile_number"]];
    
    cell.lblUserMissingChildIdentificationMark.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"identification_marks"]];
    
    
   cell.lblUserMissingChildHeightAndPound.text=[NSString stringWithFormat:@"%@ pound %@ inch",[dictGetMissingAndFoundChild objectForKey:@"height"],[dictGetMissingAndFoundChild objectForKey:@"weight"]];
    
    
    NSString *strImage = [dictGetMissingAndFoundChild objectForKey:@"image"];
    NSURL *imageURL = [[NSURL alloc]initWithString:strImage];
    [cell.imgChildPhoto sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];

    cell.imgChildPhoto.layer.cornerRadius=35;
    cell.imgChildPhoto.clipsToBounds=YES;

    cell.imgChildPhoto.layer.borderColor=Black.CGColor;
    cell.imgChildPhoto.layer.borderWidth=0.90f;
    
    if ([[dictGetMissingAndFoundChild objectForKey:@"status"] isEqualToString:@"2"] == TRUE) {
        
        cell.imgFound.hidden = TRUE;
        // Missing Child
    }
    else{
         // Founded Child
        
        cell.imgFound.hidden = FALSE;
    }

    cell.backgroundColor=[UIColor clearColor];
    
    return cell;
}




-(IBAction)getContactedClick:(id)sender{
    
    if ([MFMailComposeViewController canSendMail]) {
        
        NSString *emailTitle = @"OWL";
        NSString *messageBody = @"";
        NSArray *toRecipents = [NSArray arrayWithObject:[dictGetAllDataFromMapUser objectForKey:@"emailId"]];
        
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        [mc setSubject:emailTitle];
        [mc setMessageBody:messageBody isHTML:NO];
        [mc setToRecipients:toRecipents];
        [self presentViewController:mc animated:YES completion:NULL];
        
    }
    else{
        
        [Alert alertControllerTitle:@"OWL" msg:@"can not sent mail" ok:@"Ok" controller:self.navigationController];
    }
}
    
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
    {
        switch (result)
        {
            case MFMailComposeResultCancelled:
                NSLog(@"Mail cancelled");
                break;
            case MFMailComposeResultSaved:
                NSLog(@"Mail saved");
                break;
            case MFMailComposeResultSent:
                NSLog(@"Mail sent");
                break;
            case MFMailComposeResultFailed:
                NSLog(@"Mail sent failure: %@", [error localizedDescription]);
                break;
            default:
                break;
        }
        [self dismissViewControllerAnimated:YES completion:NULL];
    }


static PrivateChatVC * extracted() {
    PrivateChatVC *rvc=[[PrivateChatVC alloc]init];
    return rvc;
}

-(void)startChatClick{
    
    if([[[NSUserDefaults standardUserDefaults] valueForKey: @"guest"]   isEqual: @"false"])
    {
    [Alert svProgress:@"Please wait..."];
    
    NSDictionary * myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    
    NSDictionary *dictMessage = [[NSUserDefaults standardUserDefaults] objectForKey:[dictGetAllDataFromMapUser objectForKey:@"id"]];
    
    NSString *strMessage = [dictMessage objectForKey:@"chat_message"];
    
    if ([strMessage isKindOfClass:[NSString class]] == TRUE) {
        
        
    }
    else{
        
        strMessage = @"";
    }
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    
    parameters = @{
                   @"action": @"startChat",
                   @"user_id":[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]],
                   @"profile_id" : [NSString stringWithFormat:@"%@",[dictGetAllDataFromMapUser objectForKey:@"id"]],
                   @"message":strMessage
                   };
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
           [SVProgressHUD dismiss];
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
         {
           
            
             
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
    else
    {
        [Alert svError:@"Please Register/Login to use this Functionality"];
    }
}



-(void)navigateChatScreen{
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    PrivateChatVC * rvc = extracted();;
    
    rvc.username1 = [NSString stringWithFormat:@"%@+%@",[myDictionary objectForKey:@"firebaseId"], [dictGetAllDataFromMapUser objectForKey:@"firebaseId"]];
    
    rvc.username2 = [NSString stringWithFormat:@"%@+%@",[dictGetAllDataFromMapUser objectForKey:@"firebaseId"],[myDictionary objectForKey:@"firebaseId"]];
    
    rvc.dictChatUserInfo=dictGetAllDataFromMapUser;
    
    rvc.dictMyInfo=myDictionary;
    rvc.strNotification = @"no";

    [self.navigationController pushViewController:rvc animated:YES];
    
    rvc=nil;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - block webservice
-(void)blockAnUser :(NSDictionary *)dictGetAllDataOfClickedMapUsers
{
    [Alert svProgress:@"Please wait..."];
    
    
        NSDictionary * myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        NSDictionary *parameters;
        parameters = @{
                       @"action": @"block",
                       @"userId":[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]],
                       @"blockuserId" : [NSString stringWithFormat:@"%@",[dictGetAllDataOfClickedMapUsers objectForKey:@"id"]]
                       };
        NSLog(@"parameters-------%@",parameters);
        
        [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             
             NSDictionary *dictPhotographerLogin=responseObject;
             
             
             
             if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
             {
                 [SVProgressHUD dismiss];
                 
                 NSUserDefaults *extraKeyForBlock = [NSUserDefaults standardUserDefaults];
                 [extraKeyForBlock setObject:[[dictPhotographerLogin objectForKey:@"response"] objectForKey:@"blockMe"] forKey:@"keyisItBlockOrNot"];
                 [extraKeyForBlock synchronize];
                 
                 NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                                         stringForKey:@"keyisItBlockOrNot"];
                 NSLog(@"savedValue===%@",savedValue);

                 
                 if ([savedValue isEqualToString:@"Yes"])
                 {
                     [btnChat setTitle:@"UNBLOCK" forState:UIControlStateNormal];
                     self.navigationItem.rightBarButtonItem=nil;
                 }
                 else
                 {
                     [btnChat setTitle:@"CHAT" forState:UIControlStateNormal];
                     
                     NSString *strImage;
                     if (kSCREEN_HEIGHT == 1024) {
                         
                         strImage = @"cross";
                     }
                     else{
                         
                         strImage = @"block";
                     }
                     
                     UIBarButtonItem *rightBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:strImage] style:UIBarButtonItemStylePlain target:self action:@selector(blockThatUser)];
                     rightBarButton.tintColor=Red;
                     self.navigationItem.rightBarButtonItem=rightBarButton;
                 }

                 
                 NSString *strTest=@"onlyForCheck";
                 NSUserDefaults *checkk = [NSUserDefaults standardUserDefaults];
                 [checkk setObject:strTest forKey:@"keyOnlyForCheck"];
                 [checkk synchronize];

                 

                 
                 
                 
                 
                 /*
                 if ([[[dictPhotographerLogin objectForKey:@"response"]objectForKey:@"blockMe"]isEqualToString:@"Yes"])
                 {
                     [btnChat setTitle:@"UNBLOCK" forState:UIControlStateNormal];
                     self.navigationItem.rightBarButtonItem=nil;
                     
                 }
                 else
                 {
                     
                     [btnChat setTitle:@"CHAT" forState:UIControlStateNormal];
                 }
*/
                 
                 
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

#pragma mark - block webservice
-(void)unBlockAnUser
{
    [Alert svProgress:@"Please wait..."];
    
    
    NSDictionary * myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    parameters = @{
                   @"action": @"unblock",
                   @"userId":[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]],
                   @"blockuserId" : [NSString stringWithFormat:@"%@",[dictGetAllDataFromMapUser objectForKey:@"id"]]
                   };
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
         {
             [SVProgressHUD dismiss];
             
             NSUserDefaults *extraKeyForBlock = [NSUserDefaults standardUserDefaults];
             [extraKeyForBlock setObject:[[dictPhotographerLogin objectForKey:@"response"] objectForKey:@"blockMe"] forKey:@"keyisItBlockOrNot"];
             [extraKeyForBlock synchronize];
             
             NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                                     stringForKey:@"keyisItBlockOrNot"];
             NSLog(@"savedValue===%@",savedValue);
             
             
             if ([savedValue isEqualToString:@"Yes"])
             {
                 [btnChat setTitle:@"UNBLOCK" forState:UIControlStateNormal];
                 self.navigationItem.rightBarButtonItem=nil;
             }
             else
             {
                 [btnChat setTitle:@"CHAT" forState:UIControlStateNormal];
                 
                 NSString *strImage;
                 if (kSCREEN_HEIGHT == 1024) {
                     
                     strImage = @"cross";
                 }
                 else{
                     
                     strImage = @"block";
                 }
                 
                 UIBarButtonItem *rightBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:strImage] style:UIBarButtonItemStylePlain target:self action:@selector(blockThatUser)];
                 
                 rightBarButton.tintColor=Red;
                 self.navigationItem.rightBarButtonItem=rightBarButton;
             }
             
             NSString *strTest=@"onlyForCheck";
             NSUserDefaults *checkk = [NSUserDefaults standardUserDefaults];
             [checkk setObject:strTest forKey:@"keyOnlyForCheck"];
             [checkk synchronize];
             
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

#pragma mark - getAllMissingChildAddedByMe
-(void)getAllMissingChildAddedByMe//iAmFromMissingChildList
{

    [Alert svProgress:pleaseWait];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    
    parameters = @{
                   @"action"            : @"Userchild",
                   @"userId"           : [NSString stringWithFormat:@"%@",[dictGetAllDataFromMapUser objectForKey:@"id"]]
                   };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSDictionary *dictPhotographerLogin=responseObject;
         [SVProgressHUD dismiss];
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
         {
            arrDetailsOfClickedUser=[dictPhotographerLogin objectForKey:@"response"];
             
             if (arrDetailsOfClickedUser.count == 0 || arrDetailsOfClickedUser.count == 1) {
                 
                 btnOppositeArrow.hidden = TRUE;
                 btnArrow.hidden = TRUE;
             }
             else{
                 
                 btnOppositeArrow.hidden = TRUE;
             }
             
             [clview reloadData];
         }
         else
         {
             [SVProgressHUD showErrorWithStatus:@"Something went wrong.Please try again later" maskType:SVProgressHUDMaskTypeBlack];
         }
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     
     {
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
     }];
}

-(IBAction)contactWithoutChat:(id)sender{
    
    if ([MFMailComposeViewController canSendMail]) {
        
        NSString *emailTitle = @"OWL";
        NSString *messageBody = @"";
        NSArray *toRecipents = [NSArray arrayWithObject:[dictGetAllDataFromMapUser objectForKey:@"emailId"]];
        
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        [mc setSubject:emailTitle];
        [mc setMessageBody:messageBody isHTML:NO];
        [mc setToRecipients:toRecipents];
        [self presentViewController:mc animated:YES completion:NULL];
        
    }
    else{
        
        [Alert alertControllerTitle:@"OWL" msg:@"can not sent mail" ok:@"Ok" controller:self.navigationController];
    }
}
/*

#pragma mark - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 17;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"missingChildListDetailsCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    for (UIView *cellView in cell.subviews){
        
        [cellView removeFromSuperview];
    }
    
     NSLog(@"table View data %@", dictGetMissingAndFoundChild);
    
    UILabel *lblHeading = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, kSCREEN_WIDTH-20, 25)];
    lblHeading.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:17];
    lblHeading.textColor = [UIColor blackColor];
    [cell addSubview:lblHeading];
    
    UILabel *lblHeadingValue = [[UILabel alloc]initWithFrame:CGRectMake(10, 25, kSCREEN_WIDTH-20, 45)];
    lblHeadingValue.numberOfLines = 0;
    lblHeadingValue.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
    lblHeadingValue.textColor = [UIColor grayColor];
    [cell addSubview:lblHeadingValue];
    
    
 if (indexPath.row == 0)
    {
        lblHeading.text=@"Date of Disappearance";
        lblHeadingValue.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"date_of_disappearance"]];
    }
    else if (indexPath.row == 1)
    {
        lblHeading.text=@"Time of Disappearance";
        lblHeadingValue.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"place_disappearance"]];
    }
    else if (indexPath.row == 2)
    {
        lblHeading.text=@"Father's name";
        lblHeadingValue.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"father_name"]];
    }
    else if (indexPath.row == 3)
    {
        lblHeading.text=@"Mother's name";
        lblHeadingValue.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"mother_name"]];
    }
    else if (indexPath.row == 4)
    {
        lblHeading.text=@"Parents Mobile Number";
        lblHeadingValue.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"parents_mobile_number"]];
    }
    else if (indexPath.row == 5)
    {
        lblHeading.text=@"Address";
        lblHeadingValue.text=[NSString stringWithFormat:@"%@,%@,%@,%@",[dictGetMissingAndFoundChild objectForKey:@"address"],[dictGetMissingAndFoundChild objectForKey:@"city"],[dictGetMissingAndFoundChild objectForKey:@"state"],[dictGetMissingAndFoundChild objectForKey:@"country"]];
    }
    else if (indexPath.row == 6)
    {
        lblHeading.text=@"Postal code/Zipcode";
        lblHeadingValue.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"pincode"]];
    }
    else if (indexPath.row == 7)
    {
        lblHeading.text=@"Identification mark";
        lblHeadingValue.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"identification_marks"]];
    }
    else if (indexPath.row == 8)
    {
        lblHeading.text=@"Height - Weight";
        lblHeadingValue.text=[NSString stringWithFormat:@"%@ inch & %@ pounds",[dictGetMissingAndFoundChild objectForKey:@"height"],[dictGetMissingAndFoundChild objectForKey:@"weight"]];
    }
    else if (indexPath.row == 9)
    {
        lblHeading.text=@"Color of Eyes";
        lblHeadingValue.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"color_of_eyes"]];
    }
    else if (indexPath.row == 10)
    {
        lblHeading.text=@"Color of Hair";
       lblHeadingValue.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"color_of_hair"]];
    }
    else if (indexPath.row == 11)
    {
        lblHeading.text=@"Is the Child lost reason";
        lblHeadingValue.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"is_the_child_lost_reason"]];
    }
    
    else if (indexPath.row == 12)
    {
        lblHeading.text=@"Any suspicion";
        lblHeadingValue.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"any_suspicion"]];rr
    }
    else if (indexPath.row == 13)
    {
        lblHeading.text=@"Wear Glasses/Lens";
        lblHeadingValue.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"is_wear_glasses_lens"]];
    }
    else if (indexPath.row == 14)
    {
        lblHeading.text=@"Last seen wearing";
        lblHeadingValue.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"last_seen_wearing"]];
    }
    else if (indexPath.row == 15)
    {
        lblHeading.text=@"Alert Initiated by";
        lblHeadingValue.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"complained_by"]];
    }
    else if (indexPath.row == 16)
    {
        lblHeading.text=@"Last seen location";
        lblHeadingValue.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"last_seen_location"]];
    }
    else if (indexPath.row == 17)
    {
        lblHeading.text=@"Reward offer";
        lblHeadingValue.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"prize_money"]];
    }
    else if (indexPath.row == 18)
    {
        lblHeading.text=@"Reward Information";
        lblHeadingValue.text=[NSString stringWithFormat:@"%@",[dictGetMissingAndFoundChild objectForKey:@"prize_msg"]];
    }
    
    cell.backgroundColor=Clear;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

*/

-(IBAction)hitArrow:(id)sender{
    
    NSLog(@"arrow hit");
    
}


-(IBAction)hitOppositeArrow:(id)sender{
    
      NSLog(@"opposite arrow hit");
    
}


@end
