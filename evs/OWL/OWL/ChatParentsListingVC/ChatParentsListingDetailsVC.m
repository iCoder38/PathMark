//
//  ChatParentsListingDetailsVC.m
//  OWL
//
//  Created by Apple on 9/6/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "ChatParentsListingDetailsVC.h"
#import <MessageUI/MessageUI.h>
#define TRY_AN_ANIMATED_GIF 0

@interface ChatParentsListingDetailsVC ()
<
MFMailComposeViewControllerDelegate
>
{
    NSArray *arrDetailsOfParentsList;
    
    
}
@end

@implementation ChatParentsListingDetailsVC
@synthesize dictFetchClickParentsDetails;

- (void)viewDidLoad
{
    [super viewDidLoad];

    //NSLog(@"dictFetchClickParentsDetails=====>%@",dictFetchClickParentsDetails);
    
    clview.delegate=self;
    clview.dataSource=self;
    
    
    
    imgUserProfilePicture.layer.cornerRadius=60;
    imgUserProfilePicture.clipsToBounds=YES;
    
    
    NSString *strImage = [dictFetchClickParentsDetails objectForKey:@"image"];
    
    NSURL *imageURL = [[NSURL alloc]initWithString:strImage];
    [imgUserProfilePicture sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"name"]];
    
    [imgUserProfileBgPicture sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"name"]];
    
    imgUserProfilePicture.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] init];
    [tapRecognizer addTarget:self action:@selector(bigButtonTappeds:)];
    [imgUserProfilePicture addGestureRecognizer:tapRecognizer];
    [imgUserProfilePicture setAccessibilityLabel:@"Photo of a cat wearing a Bane costume."];
    imgUserProfilePicture.layer.cornerRadius = imgUserProfilePicture.bounds.size.width/2.0f;
    
    imgUserProfilePicture.layer.borderColor=White.CGColor;
    imgUserProfilePicture.layer.borderWidth=0.90f;
    
    
    //lblUserName
    //lblUserCountry
    
    lblUserName.text=[NSString stringWithFormat:@"%@",[dictFetchClickParentsDetails objectForKey:@"firstName"]];
    
    lblUserCountry.text=[NSString stringWithFormat:@"%@",[dictFetchClickParentsDetails objectForKey:@"address"]];
    
    
    [btnChat setBackgroundColor:RGBc(250, 127, 64)];
    [btnContact setBackgroundColor:RGBc(39, 214, 158)];
    
    btnChat.layer.cornerRadius=4;
    btnChat.clipsToBounds=YES;
    [btnChat addTarget:self action:@selector(chatHereMethods) forControlEvents:UIControlEventTouchUpInside];
    btnContact.layer.cornerRadius=4;
    btnContact.clipsToBounds=YES;
    [btnContact addTarget:self action:@selector(mailmeMethod) forControlEvents:UIControlEventTouchUpInside];
    //mailmeMethod
    [self listingOfAllParentsDetails];
}

- (void)bigButtonTappeds:(id)sender
{
    
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - collection view
-(void)viewWillAppear:(BOOL)animated
{
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
    
    
    UIBarButtonItem *anotherButton1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"chat"] style:UIBarButtonItemStylePlain target:self action:@selector(chatHereMethods)];
    
    UIBarButtonItem *anotherButton2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"call"] style:UIBarButtonItemStylePlain target:self action:@selector(callHereMethods)];
    
    self.navigationItem.rightBarButtonItems=@[anotherButton1,anotherButton2];
    
    
}

-(void)chatHereMethods
{
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    
    
    PrivateChatVC *rvc=[[PrivateChatVC alloc]init];;
    
    rvc.username1 = [NSString stringWithFormat:@"%@+%@",[myDictionary objectForKey:@"firebaseId"], [dictFetchClickParentsDetails objectForKey:@"firebaseId"]];
    
    rvc.username2 = [NSString stringWithFormat:@"%@+%@",[dictFetchClickParentsDetails objectForKey:@"firebaseId"],[myDictionary objectForKey:@"firebaseId"]];
    
    NSLog(@"username1==%@",rvc.username1);
    NSLog(@"username1==%@",rvc.username2);
    
    rvc.dictChatUserInfo=dictFetchClickParentsDetails;
    
    rvc.dictMyInfo=myDictionary;
    
    [self.navigationController pushViewController:rvc animated:YES];
    
    rvc=nil;

}

-(void)mailmeMethod
{
    /*name of the company must be real as that will help you get recognition*/
    NSString *emailTitle = @"OWL";
    // Email Content
    NSString *messageBody = @"OWL";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"OWL"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
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


-(void)callHereMethods
{
    NSString *one = [[NSString stringWithFormat:@"%@",[dictFetchClickParentsDetails objectForKey:@"mobile"]]
                     stringByReplacingOccurrencesOfString:@"(" withString:@""];
    NSString *two = [one
                     stringByReplacingOccurrencesOfString:@")" withString:@""];
    
    NSString *three = [two
                       stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *four = [three
                      stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    UIApplication *application = [UIApplication sharedApplication];
    NSString *phoneNumber = [@"tel://" stringByAppendingString:four];
    [application openURL:[NSURL URLWithString:phoneNumber] options:@{} completionHandler:nil];
}

-(void)backFromMissingDetails
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section{
    
    if (arrDetailsOfParentsList.count>0)
    {
        clview.backgroundView = nil;
        return arrDetailsOfParentsList.count;
    }
    else
    {
        [Alert addLabelBGCollectionView:clview msg:@"No Child" color:Black];
        
        return 0;
    }
    
    return arrDetailsOfParentsList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ChatParentsListingCollectionCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"chatParentsListingCollectionCell" forIndexPath:indexPath];
    
    NSDictionary *dictLocalDataOfClickedData=[arrDetailsOfParentsList objectAtIndex:indexPath.row];
    
    //NSLog(@"dictLocalDataOfClickedData====%@",dictLocalDataOfClickedData);
    
    cell.lblUserMissingChildName.text=[dictLocalDataOfClickedData objectForKey:@"first_name"];
    
    NSString *birthDate = [NSString stringWithFormat:@"%@",[dictLocalDataOfClickedData objectForKey:@"date_of_birth"]];
    
    NSDate *todayDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    int time = [todayDate timeIntervalSinceDate:[dateFormatter dateFromString:birthDate]];
    int allDays = (((time/60)/60)/24);
    int days = allDays % 365;
    int years = (allDays-days)/365;
    
    NSLog(@"You live since %i years and %i days",years,days);
    
    cell.lblUserMissingChildAgeAndGender.text=[NSString stringWithFormat:@"Age : %d | Gender : %@",years,[NSString stringWithFormat:@"%@",[dictLocalDataOfClickedData objectForKey:@"gender"]]];
    
    cell.lblUserMissingChildParentMobileNumber.text=[NSString stringWithFormat:@"%@",[dictLocalDataOfClickedData objectForKey:@"parents_mobile_number"]];
    
    
    cell.lblUserMissingChildIdentificationMark.text=[NSString stringWithFormat:@"%@",[dictLocalDataOfClickedData objectForKey:@"identification_marks"]];
    
    
    cell.lblUserMissingChildHeightAndPound.text=[NSString stringWithFormat:@"%@ inch ,%@ pound",[dictLocalDataOfClickedData objectForKey:@"height"],[dictLocalDataOfClickedData objectForKey:@"weight"]];
    
    
    NSString *strImage = [dictLocalDataOfClickedData objectForKey:@"image"];
    NSURL *imageURL = [[NSURL alloc]initWithString:strImage];
    [cell.imgChildPhoto sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"name"]];
    
    cell.imgChildPhoto.layer.cornerRadius=35;
    cell.imgChildPhoto.clipsToBounds=YES;
    
    cell.imgChildPhoto.layer.borderColor=Black.CGColor;
    cell.imgChildPhoto.layer.borderWidth=0.90f;
    
    cell.backgroundColor=White;
    
    
    
    return cell;
}


#pragma mark - webservice
#pragma mark - delete all notifications
-(void)listingOfAllParentsDetails
{
    
    [SVProgressHUD showWithStatus:pleaseWait maskType:SVProgressHUDMaskTypeBlack];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
     
    NSDictionary *parameters;
    parameters = @{
                   @"action"            : @"Userchild",
                   @"userId"            : [NSString stringWithFormat:@"%@",[dictFetchClickParentsDetails objectForKey:@"id"]],
                   };
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]== TRUE)
         {
             
             NSLog(@"dictPhotographerLogin==%@",dictPhotographerLogin);
             
             arrDetailsOfParentsList=[dictPhotographerLogin objectForKey:@"response"];
             
             [SVProgressHUD dismiss];
             
             [clview reloadData];
             
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
