//
//  PrivateChat.m
//  ScholarSuccess
//
//  Created by Lalit on 21/12/16.
//  Copyright © 2016 Lalit. All rights reserved.
//

#import "PrivateChatVC.h"
#import <Firebase/Firebase.h>
#import "Alert.h"
#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "NNMWebService.h"

@interface PrivateChatVC ()<NNMWebServiceDelegate>{

    UITableView *tbleChatView, *tblePopView;
    UIView *navView, *completeBackgroundView, *containerView, *popCustomView;
    UIButton *btnBack, *btnAttachments, *btnSendMsgs;
    UIImageView *imgChateUserView;
    UILabel *navTitleBar;
    UITextView *txtChatView;
    UIBlurEffect *blurEffect;
    UIVisualEffectView *blurEffectView;
    NSString *strStoreChat;
    NSDictionary *dictUserData;
    FIRDatabaseReference *FIRDB, *FIRDB1322;
    NSMutableArray *arrReceiveAllChat, *arrChattingDays;
    __block   int connt;
    
    NSString *strStoreMsgs;
     FIRDatabaseHandle _refHandle;
    
    AppDelegate *appD;
}

@property (strong, nonatomic) FIRDatabaseReference *ref;

@end

@implementation PrivateChatVC
@synthesize strNotification;

-(void)navigationBar
{

    self.navigationController.navigationBarHidden = TRUE;
    navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 66)];
    navView.backgroundColor = Black;
    [self.view addSubview:navView];


    btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    btnBack.frame = CGRectMake(5, 22, 40, 40);
    [btnBack setBackgroundColor:[UIColor clearColor]];
    
    if ([_strComingFrom isEqualToString:@"AD"] == TRUE) {
        
        [btnBack setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [btnBack addTarget:self action:@selector(hitMenu:) forControlEvents:UIControlEventTouchUpInside];
        
        imgChateUserView = [[UIImageView alloc]initWithFrame:CGRectMake(btnBack.frame.size.height+10,22, 40, 40)];
        imgChateUserView.backgroundColor = [UIColor clearColor];
        
        
        NSString *strimage = _chatUserImage;
        
        NSURL *url =[NSURL URLWithString:strimage];
        [imgChateUserView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@""]];
        
        
        
        imgChateUserView.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] init];
        [tapRecognizer addTarget:self action:@selector(bigButtonTapped:)];
        [imgChateUserView addGestureRecognizer:tapRecognizer];
        [imgChateUserView setAccessibilityLabel:@"Photo of a cat wearing a Bane costume."];
        imgChateUserView.layer.cornerRadius = imgChateUserView.bounds.size.width/2.0f;
        
        
        
        imgChateUserView.layer.cornerRadius = 20;
        imgChateUserView.clipsToBounds = TRUE;
        imgChateUserView.backgroundColor = Black;
        imgChateUserView.contentMode = UIViewContentModeScaleAspectFit;
        [navView addSubview:imgChateUserView];
        
        navTitleBar = [[UILabel alloc]initWithFrame:CGRectMake(imgChateUserView.frame.size.width+imgChateUserView.frame.origin.x+10, 20, kSCREEN_WIDTH-(imgChateUserView.frame.size.width+imgChateUserView.frame.origin.x+70), 40)];
        navTitleBar.text = _chatUserName;
        navTitleBar.textColor = [UIColor whiteColor];
        navTitleBar.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
        navTitleBar.textAlignment = NSTextAlignmentCenter;
        navTitleBar.backgroundColor = [UIColor clearColor];
        [navView addSubview:navTitleBar];
        
    }
    else{
        
        [btnBack setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [btnBack addTarget:self action:@selector(hitBack:) forControlEvents:UIControlEventTouchUpInside];
        
        
        imgChateUserView = [[UIImageView alloc]initWithFrame:CGRectMake(btnBack.frame.size.height+10,22, 40, 40)];
        imgChateUserView.backgroundColor = [UIColor clearColor];
        NSString *strimage;
        if([strNotification  isEqual: @"no"])
        {
            strimage = [_dictChatUserInfo objectForKey:@"image"];

        }
        else
        {
        strimage = [_dictChatUserInfo objectForKey:@"person_image"];
        }
        NSURL *url =[NSURL URLWithString:strimage];
        [imgChateUserView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@""]];
        
        
        
        imgChateUserView.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] init];
        [tapRecognizer addTarget:self action:@selector(bigButtonTapped:)];
        [imgChateUserView addGestureRecognizer:tapRecognizer];
        [imgChateUserView setAccessibilityLabel:@"Photo of a cat wearing a Bane costume."];
        imgChateUserView.layer.cornerRadius = imgChateUserView.bounds.size.width/2.0f;
        
        
        
        imgChateUserView.layer.cornerRadius = 20;
        imgChateUserView.clipsToBounds = TRUE;
        imgChateUserView.backgroundColor = Black;
        imgChateUserView.contentMode = UIViewContentModeScaleAspectFit;
        [navView addSubview:imgChateUserView];
        
        navTitleBar = [[UILabel alloc]initWithFrame:CGRectMake(imgChateUserView.frame.size.width+imgChateUserView.frame.origin.x+10, 20, kSCREEN_WIDTH-(imgChateUserView.frame.size.width+imgChateUserView.frame.origin.x+70), 40)];
        if([strNotification  isEqual: @"no"])
        {
            navTitleBar.text = [_dictChatUserInfo objectForKey:@"firstName"];

        }
        else
        {
        navTitleBar.text = [_dictChatUserInfo objectForKey:@"person_name"];
        }
        navTitleBar.textColor = [UIColor whiteColor];
        navTitleBar.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
        navTitleBar.textAlignment = NSTextAlignmentCenter;
        navTitleBar.backgroundColor = [UIColor clearColor];
        [navView addSubview:navTitleBar];
        
    }
    
    [navView addSubview:btnBack];


    btnAttachments = [UIButton buttonWithType:UIButtonTypeCustom];
    btnAttachments.frame = CGRectMake(kSCREEN_WIDTH-40, 28, 24, 24);
    [btnAttachments setImage:[UIImage imageNamed:@"user-"] forState:UIControlStateNormal];
    [btnAttachments setBackgroundColor:[UIColor clearColor]];
    [btnAttachments addTarget:self action:@selector(openProfile:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:btnAttachments];


}

-(IBAction)openProfile:(id)sender{
    
    [self moveOnDetails:_dictChatUserInfo];
}



-(void)moveOnDetails:(NSDictionary *)dictData{
    
//    if (iPhoneVersion == 5)
//    {
//        UIStoryboard *STO=[UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//        SeeAllUsersDetailsVC *seealluser=[STO instantiateViewControllerWithIdentifier:@"SeeAllUsersDetailsVCId"];
//        seealluser.dictGetAllDataFromMapUser=dictData;
//        [self.navigationController pushViewController:seealluser animated:YES];
//    }
//    else if (iPhoneVersion == 6)
//    {
        UIStoryboard *STO=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        SeeAllUsersDetailsVC *seealluser=[STO instantiateViewControllerWithIdentifier:@"SeeAllUsersDetailsVCId"];
        seealluser.dictGetAllDataFromMapUser=dictData;
        [self.navigationController pushViewController:seealluser animated:YES];
//    }
//    else if (iPhoneVersion == 61)
//    {
//        UIStoryboard *STO=[UIStoryboard storyboardWithName:@"Main6p" bundle:nil];
//        
//        SeeAllUsersDetailsVC *seealluser=[STO instantiateViewControllerWithIdentifier:@"SeeAllUsersDetailsVCId"];
//        seealluser.dictGetAllDataFromMapUser=dictData;
//        [self.navigationController pushViewController:seealluser animated:YES];
//    }
//    else
//    {
//        UIStoryboard *STO=[UIStoryboard storyboardWithName:@"Mainpad" bundle:nil];
//        
//        SeeAllUsersDetailsVC *seealluser=[STO instantiateViewControllerWithIdentifier:@"SeeAllUsersDetailsVCId"];
//        seealluser.dictGetAllDataFromMapUser=dictData;
//        [self.navigationController pushViewController:seealluser animated:YES];
//    }
}

-(IBAction)hitMenu:(id)sender{
    
    appD = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [appD getAfterLogin];
    
}

- (void)bigButtonTapped:(id)sender
{
    
    // Create image info
    JTSImageInfo *imageInfo = [[JTSImageInfo alloc] init];
#if TRY_AN_ANIMATED_GIF == 1
    imageInfo.imageURL = [NSURL URLWithString:@"http://media.giphy.com/media/O3QpFiN97YjJu/giphy.gif"];
#else
    imageInfo.image = imgChateUserView.image;
#endif
    imageInfo.referenceRect = imgChateUserView.frame;
    imageInfo.referenceView = imgChateUserView.superview;
    imageInfo.referenceContentMode = imgChateUserView.contentMode;
    imageInfo.referenceCornerRadius = imgChateUserView.layer.cornerRadius;
    
    // Setup view controller
    JTSImageViewController *imageViewer = [[JTSImageViewController alloc]
                                           initWithImageInfo:imageInfo
                                           mode:JTSImageViewControllerMode_Image
                                           backgroundStyle:JTSImageViewControllerBackgroundOption_Scaled];
    
    [imageViewer showFromViewController:self transition:JTSImageViewControllerTransition_FromOriginalPosition];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self navigationBar];

    completeBackgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 66, kSCREEN_WIDTH, kSCREEN_HEIGHT-66)];
    completeBackgroundView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:completeBackgroundView];
    self.view.backgroundColor = [UIColor whiteColor];

    popCustomView = [[UIView alloc]init];
    
    NSUserDefaults*defaults=[NSUserDefaults  standardUserDefaults];
    NSDictionary *dictData = [defaults objectForKey:@"keyAllDataOfLoginUserOWL"];
    
    _dictMyInfo = dictData;

    [[NSUserDefaults standardUserDefaults] setObject:[_dictMyInfo objectForKey:@"firebaseId"] forKey:@"userFirebaseID"];

    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];

    [nc addObserver:self selector:@selector(keyboardWillShow:) name:
     UIKeyboardWillShowNotification object:nil];

    [nc addObserver:self selector:@selector(keyboardWillHide:) name:
     UIKeyboardWillHideNotification object:nil];



    arrReceiveAllChat = nil;
    arrReceiveAllChat = [[NSMutableArray alloc]initWithCapacity:0];

    arrChattingDays = nil;
    arrChattingDays = [[NSMutableArray alloc]initWithCapacity:0];

    FIRDB = [FIRDatabase database].reference;


    [self loadAllChat];

    tblePopView = [[UITableView alloc]init];
    tbleChatView = [[UITableView alloc]init];
   
    
    [self loadCompleteChatSendView];
    [self loadChatTableView];
   // [self loadPopUpTableView];
    
}



-(void)loadChatTableView
{

    tbleChatView.frame = CGRectMake(0, 0, completeBackgroundView.frame.size.width, completeBackgroundView.frame.size.height-70);
    tbleChatView.backgroundColor = [UIColor whiteColor];
    tbleChatView.separatorColor = [UIColor clearColor];
    tbleChatView.dataSource = self;
    tbleChatView.delegate = self;
    [completeBackgroundView addSubview:tbleChatView];

}

-(void)loadPopUpTableView
{

    [blurEffectView removeFromSuperview];
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.frame = CGRectMake(0,66, kSCREEN_WIDTH, kSCREEN_HEIGHT-66);
    blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:blurEffectView];

    blurEffectView.hidden = TRUE;


    [popCustomView removeFromSuperview];
    popCustomView.frame = CGRectMake(kSCREEN_WIDTH-155, 5, 150, 150);
    popCustomView.backgroundColor = [UIColor clearColor];
    popCustomView.layer.cornerRadius = 5.0;
    popCustomView.clipsToBounds = TRUE;
    [blurEffectView addSubview:popCustomView];

    popCustomView.hidden = TRUE;



    tblePopView.frame = CGRectMake(0, 0, popCustomView.frame.size.width, popCustomView.frame.size.height);
    tblePopView.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
    tblePopView.separatorColor = [UIColor clearColor];
    tblePopView.dataSource = self;
    tblePopView.delegate = self;
    [popCustomView addSubview:tblePopView];
}

-(void)loadCompleteChatSendView
{


    containerView = [[UIView alloc]initWithFrame:CGRectMake(0, completeBackgroundView.frame.size.height-60, kSCREEN_WIDTH, 60)];
    containerView.backgroundColor = Black;
    [completeBackgroundView addSubview:containerView];

    
    txtChatView = [[UITextView alloc]initWithFrame:CGRectMake(10, 10, kSCREEN_WIDTH-90, 40)];
    txtChatView.autocorrectionType = UITextAutocorrectionTypeYes;
    txtChatView.autocorrectionType = UITextAutocorrectionTypeNo;
    txtChatView.font = [UIFont fontWithName:@"HelveticaNeue" size:16];
    txtChatView.backgroundColor = [UIColor whiteColor];
     
   // txtChatView.placeholder = @"type something...";
   
  //  [txtChatView setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"type something..." attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}]];
    
   // txtChatView.placeholder.textColor = [UIColor whiteColor];
    txtChatView.textColor = [UIColor darkGrayColor];
    txtChatView.delegate=self;
    [containerView addSubview:txtChatView];



    btnSendMsgs = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSendMsgs.frame = CGRectMake(kSCREEN_WIDTH-80, 10, 80, 40);
    [btnSendMsgs setTitle:@"Send" forState:UIControlStateNormal];
    [btnSendMsgs setTitleColor:White forState:UIControlStateNormal];
    btnSendMsgs.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    [btnSendMsgs addTarget:self action:@selector(sendMsgs:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:btnSendMsgs];


}

-(IBAction)hitBack:(id)sender
{

    [self.navigationController popViewControllerAnimated:YES];
}



//
//-(void) keyboardWillShow:(NSNotification *) note {
//
//
//    [Alert moveUpView:self.view];
//
//}
//
//-(void) keyboardWillHide:(NSNotification *) note{
//
//    [Alert moveDownView:self.view];
//
//}

- (void)keyboardWillShow:(NSNotification *)note {
    
    CGSize keyboardSize = [[[note userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;

    float newVerticalPosition = -keyboardSize.height;

    [self moveFrameToVerticalPosition:newVerticalPosition forDuration:0.3f];
}


- (void)keyboardWillHide:(NSNotification *)note {
    [self moveFrameToVerticalPosition:0.0f forDuration:0.3f];
}

- (void)moveFrameToVerticalPosition:(float)position forDuration:(float)duration {
    CGRect frame = self.view.frame;
    frame.origin.y = position;

    [UIView animateWithDuration:duration animations:^{
        self.view.frame = frame;
    }];
}

#pragma mark Send Message

-(IBAction)sendMsgs:(id)sender
{

    [txtChatView resignFirstResponder];

    NSUserDefaults*defaults=[NSUserDefaults  standardUserDefaults];
    NSDictionary *dictData = [defaults objectForKey:@"keyAllDataOfLoginUserOWL"];
    
    _dictMyInfo = dictData;

    NSArray* words = [txtChatView.text componentsSeparatedByCharactersInSet :[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    NSString* nospacestring = [words componentsJoinedByString:@""];

    if (nospacestring.length == 0)
    {
        return;
    }
    
    NSUserDefaults *defHitChat = [NSUserDefaults standardUserDefaults];
    [defHitChat setObject:@"YES" forKey:@"startChatHit"];
    [defHitChat synchronize];

    strStoreChat = txtChatView.text;

    FIRDatabaseReference *usersRef = [[FIRDB child:@"one_to_one"]child:_username1];

    [usersRef observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *snapshot){

        if(![snapshot.value isEqual:[NSNull null]])
        {
            NSDictionary *post1;
            if([strNotification  isEqual: @"no"])
            {
                post1 = @{
                          
                          @"chat_receiver":[_dictChatUserInfo objectForKey:@"firstName"],
                          @"chat_sender": [_dictMyInfo objectForKey:@"firstName"],
                          @"chatSenderId": [_dictMyInfo objectForKey:@"firebaseId"],
                          @"chat_message": txtChatView.text,
                          @"chat_time": [Alert getCurrentTime],
                          // @"chat_date": [Alert getCurrentDate],
                          @"chat_sender_img": [_dictMyInfo objectForKey:@"image"],
                          @"chat_receiver_img": [_dictChatUserInfo objectForKey:@"image"]
                          
                          };
            }
            else
            {
                
                post1 = @{
                          
                          @"chat_receiver":[_dictChatUserInfo objectForKey:@"person_name"],
                          @"chat_sender": [_dictMyInfo objectForKey:@"firstName"],
                          @"chatSenderId": [_dictMyInfo objectForKey:@"firebaseId"],
                          @"chat_message": txtChatView.text,
                          @"chat_time": [Alert getCurrentTime],
                          // @"chat_date": [Alert getCurrentDate],
                          @"chat_sender_img": [_dictMyInfo objectForKey:@"image"],
                          @"chat_receiver_img": [_dictChatUserInfo objectForKey:@"person_image"]
                          
                          };
                
            }
            FIRDatabaseReference *post1Ref = [usersRef childByAutoId];
            [post1Ref setValue: post1];
            txtChatView.text = @"";

            dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
                
                [self hitLoginMethod:[_dictMyInfo objectForKey:@"firstName"] strTitle:strStoreChat];
               
                dispatch_async(dispatch_get_main_queue(), ^(void){
                    
                });
            });
        }
        else
        {

            FIRDatabaseReference *usersRef = [[FIRDB child:@"one_to_one"]child:_username2];
            NSDictionary *post1;
            if([strNotification  isEqual: @"no"])
            {
                post1 = @{
                          @"chat_receiver":[_dictChatUserInfo objectForKey:@"firstName"],
                          @"chat_sender": [_dictMyInfo objectForKey:@"firstName"],
                          @"chatSenderId": [_dictMyInfo objectForKey:@"firebaseId"],
                          @"chat_message": txtChatView.text,
                          @"chat_time": [Alert getCurrentTime],
                          // @"chat_date": [Alert getCurrentDate],
                          @"chat_sender_img": [_dictMyInfo objectForKey:@"image"],
                          @"chat_receiver_img": [_dictChatUserInfo objectForKey:@"image"]
                          
                          };
            }
            else
            {
                
                post1 = @{
                          @"chat_receiver":[_dictChatUserInfo objectForKey:@"person_name"],
                          @"chat_sender": [_dictMyInfo objectForKey:@"firstName"],
                          @"chatSenderId": [_dictMyInfo objectForKey:@"firebaseId"],
                          @"chat_message": txtChatView.text,
                          @"chat_time": [Alert getCurrentTime],
                          // @"chat_date": [Alert getCurrentDate],
                          @"chat_sender_img": [_dictMyInfo objectForKey:@"image"],
                          @"chat_receiver_img": [_dictChatUserInfo objectForKey:@"person_image"]
                          
                          };
                
            }
            FIRDatabaseReference *post1Ref = [usersRef childByAutoId];
            [post1Ref setValue: post1];
            txtChatView.text = @"";

            dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
                
                [self hitLoginMethod:[_dictMyInfo objectForKey:@"firstName"] strTitle:strStoreChat];
                
                dispatch_async(dispatch_get_main_queue(), ^(void){
                    
                });
            });

        }

    }];

}



-(IBAction)attachmentsOpen:(id)sender{

    popCustomView.hidden = FALSE;
    blurEffectView.hidden = FALSE;


    [UIView transitionWithView:popCustomView duration:0.75 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{


    }
                    completion:^(BOOL finished) {

                    }];

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    if (tableView == tblePopView) {

        return 4;
    }
    if (arrReceiveAllChat.count>0) {
        tbleChatView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tbleChatView.backgroundView = nil;
        return [arrReceiveAllChat count];
    }
    else
    {
        [Alert addLabelBGTableView:tbleChatView msg:@"Say Hi." color:Black];

        return 0;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (tableView == tblePopView) {

        return 40;
    }

    NSDictionary *dictChatData = [arrReceiveAllChat objectAtIndex:indexPath.row];

    CGSize msgHeight = [Alert findHeightForText:[dictChatData objectForKey:@"chat_message"] havingWidth:kSCREEN_WIDTH-60 andFont:mr16];

    return msgHeight.height+40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    UITableViewCell *cell;
    static NSString *strCellIdentifier = @"Cell";

    cell = [tableView dequeueReusableCellWithIdentifier:strCellIdentifier];
    if (cell == nil) {

        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCellIdentifier];
    }

    for (UIView *cellView in [cell subviews]) {

        [cellView removeFromSuperview];
    }

    int x = 0;

    if (tableView == tblePopView) {


        UILabel *lblName = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, tblePopView.frame.size.width-10, 40)];
        lblName.textColor = [UIColor whiteColor];


        if (indexPath.row == 0) {
            lblName.text = @"   Gallery";
        }
        else
            if (indexPath.row == 1) {
                lblName.text = @"   Camera";
            }
            else
                if (indexPath.row == 2) {
                    lblName.text = @"   Audio";
                }
                else
                    if (indexPath.row == 3) {
                        lblName.text = @"   Video";
                    }


        lblName.font = [UIFont fontWithName:@"Montserrat-Regular" size:15];
        [cell addSubview:lblName];

        x = 39;

        UIImageView *imgLine = [[UIImageView alloc]initWithFrame:CGRectMake(5, x, popCustomView.frame.size.width-10, 0.7)];
        imgLine.backgroundColor = LightGray;
        [cell addSubview:imgLine];

        cell.backgroundColor = [UIColor clearColor];

        return cell;
    }
    else
    {

        NSDictionary *dictChatData = [arrReceiveAllChat objectAtIndex:indexPath.row];

        CGSize msgHeight = [Alert findHeightForText:[dictChatData objectForKey:@"chat_message"] havingWidth:kSCREEN_WIDTH-60 andFont:mr15];

        UIView *chatBackgroundView = [[UIView alloc]init];

//[dictMessageForSingleChat objectForKey:@"name"]
        //[_dictMyInfo objectForKey:@"firebaseId"]
        NSLog(@"arrReceiveAllChat==%@",arrReceiveAllChat);
        
        if ([[dictChatData objectForKey:@"chatSenderId"] isEqualToString:[_dictMyInfo objectForKey:@"firebaseId"]] == TRUE)
        {

            // My messages

            int chatWidth;

            NSLog(@"%f", msgHeight.width);
            NSLog(@"%f", kSCREEN_WIDTH-50);

            if (msgHeight.width >= kSCREEN_WIDTH-50)
            {

                chatWidth = kSCREEN_WIDTH-50;

                chatBackgroundView.frame = CGRectMake(70, 10, chatWidth, msgHeight.height+30);
            }
            else{
                chatWidth = msgHeight.width+40;

                chatBackgroundView.frame = CGRectMake(kSCREEN_WIDTH-chatWidth-10, 10, chatWidth, msgHeight.height+30);
            }


            chatBackgroundView.layer.cornerRadius = 4.0;
            chatBackgroundView.clipsToBounds = TRUE;
            chatBackgroundView.backgroundColor = [UIColor grayColor];


            UIImageView *imgChatTailView = [[UIImageView alloc]initWithFrame:CGRectMake(chatBackgroundView.frame.size.width+chatBackgroundView.frame.origin.x-10, chatBackgroundView.frame.size.height-5, 15, 15)];

            imgChatTailView.image = [UIImage imageNamed:@"4"];
            [self changeImageColor:@"4" imageView:imgChatTailView andColor:Black];

            [cell addSubview:imgChatTailView];
            [cell addSubview:chatBackgroundView];


            UILabel *lblMessageTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, chatBackgroundView.frame.size.width-20, chatBackgroundView.frame.size.height-30)];

            lblMessageTitle.text = [dictChatData objectForKey:@"chat_message"];
            lblMessageTitle.numberOfLines = 0;
            lblMessageTitle.font = mr15;
            lblMessageTitle.textColor = [UIColor whiteColor];
            [chatBackgroundView addSubview:lblMessageTitle];


            UILabel *lblMessageTime = [[UILabel alloc]initWithFrame:CGRectMake(chatBackgroundView.frame.size.width-135, chatBackgroundView.frame.size.height-20, 130, 20)];
            lblMessageTime.textAlignment = NSTextAlignmentRight;
            lblMessageTime.backgroundColor = [UIColor clearColor];
            lblMessageTime.numberOfLines = 0;
            lblMessageTime.text = [NSString stringWithFormat:@"%@", [dictChatData objectForKey:@"chat_time"]];
            lblMessageTime.font = mr10;
            lblMessageTime.textColor = [UIColor grayColor];
            [chatBackgroundView addSubview:lblMessageTime];


        }
        else{

            // Other Users messages

            int chatWidth;

            NSLog(@"%f", msgHeight.width);
            NSLog(@"%f", kSCREEN_WIDTH-50);

            if (msgHeight.width >= kSCREEN_WIDTH-30) {

                // chatWidth = kSCREEN_WIDTH-50;

                chatBackgroundView.frame = CGRectMake(20, 10, kSCREEN_WIDTH-30, msgHeight.height+30);
            }
            else{
                chatWidth = msgHeight.width+40;

                chatBackgroundView.frame = CGRectMake(20, 10, chatWidth, msgHeight.height+30);
            }


            chatBackgroundView.layer.cornerRadius = 4.0;
            chatBackgroundView.clipsToBounds = TRUE;
            chatBackgroundView.backgroundColor = [UIColor colorWithRed:233.0/255.0 green:236.0/255.0 blue:243.0/255.0 alpha:1.0];


            UIImageView *imgChatTailView = [[UIImageView alloc]initWithFrame:CGRectMake(chatBackgroundView.frame.origin.x-5, chatBackgroundView.frame.size.height-5, 15, 15)];

            imgChatTailView.image = [UIImage imageNamed:@"2"];

            [cell addSubview:imgChatTailView];
            [cell addSubview:chatBackgroundView];


            UILabel *lblMessageTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, chatBackgroundView.frame.size.width-20, chatBackgroundView.frame.size.height-30)];

            lblMessageTitle.text = [dictChatData objectForKey:@"chat_message"];
            lblMessageTitle.numberOfLines = 0;
            lblMessageTitle.font = mr15;
            lblMessageTitle.textColor = [UIColor grayColor];
            [chatBackgroundView addSubview:lblMessageTitle];


            UILabel *lblMessageTime = [[UILabel alloc]initWithFrame:CGRectMake(chatBackgroundView.frame.size.width-135, chatBackgroundView.frame.size.height-20, 130, 20)];
            lblMessageTime.textAlignment = NSTextAlignmentRight;
            lblMessageTime.backgroundColor = [UIColor clearColor];
            lblMessageTime.numberOfLines = 0;
            lblMessageTime.text = [NSString stringWithFormat:@"%@", [dictChatData objectForKey:@"chat_time"]];
            lblMessageTime.font = [UIFont fontWithName:@"Montserrat-Regular" size:10];
            lblMessageTime.textColor = [UIColor lightGrayColor];
            [chatBackgroundView addSubview:lblMessageTime];


        }

    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];

    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    popCustomView.hidden = TRUE;
    blurEffectView.hidden = TRUE;

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0;

}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{


    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tbleChatView.frame.size.width, 30)];
    headerView.backgroundColor = [UIColor whiteColor];

    UILabel *lblShowChatDate = [[UILabel alloc]initWithFrame:CGRectMake(headerView.frame.size.width/2-50, 5, 100, 20)];

    lblShowChatDate.layer.cornerRadius = 8;
    lblShowChatDate.clipsToBounds = TRUE;
    lblShowChatDate.textAlignment = NSTextAlignmentCenter;
    lblShowChatDate.textColor = [UIColor whiteColor];
    lblShowChatDate.font = mr15;
    [headerView addSubview:lblShowChatDate];

    if (arrReceiveAllChat.count == 0)
    {

        return headerView;
    }



    return headerView;
}

#pragma mark - Load All Chats
-(void)loadAllChat
{
    FIRDatabaseReference *usersRef =  [[FIRDB child:@"one_to_one"]child:_username1];

    [usersRef observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *snapshot)
    {
        if(![snapshot.value isEqual:[NSNull null]])
        {
            connt=0;

            [usersRef observeEventType:FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot *snapshot)
            {

                NSDictionary *  Dictionary;

                NSString *strImage = snapshot.value[@"chatSenderId"];

                if ([strImage isKindOfClass:[NSString class]])
                {
                    Dictionary= @{

                                  @"chat_receiver":snapshot.value [@"chat_receiver"],
                                  @"chatSenderId":snapshot.value [@"chatSenderId"],
                                  @"chat_sender": snapshot.value [@"chat_sender"],
                                  @"chat_message": snapshot.value [@"chat_message"],
                                  @"chat_time": snapshot.value [@"chat_time"],
                                  //@"chat_date": snapshot.value [@"chat_date"],
                                  @"chat_sender_img": snapshot.value [@"chat_sender_img"],
                                  @"chat_receiver_img": snapshot.value [@"chat_receiver_img"]

                                  };
                }
                else
                {
                    Dictionary= @{
                                  @"chat_message": snapshot.value [@"chat_message"],
                                  @"chat_sender": snapshot.value [@"chat_sender"]
                                  };
                }

                [arrReceiveAllChat addObject:Dictionary];
                [tbleChatView reloadData];
                [tbleChatView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:connt inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
                CGPoint point = tbleChatView.contentOffset;
                point .y -= tbleChatView.rowHeight;
                tbleChatView.contentOffset = point;
                connt++;

                [tbleChatView reloadData];

                if (arrReceiveAllChat.count>0)
                {
                    NSDictionary *dictStore = [arrReceiveAllChat lastObject];
                    if([strNotification  isEqual: @"no"])
                    {
                    [[NSUserDefaults standardUserDefaults] setObject:dictStore forKey:[_dictChatUserInfo objectForKey:@"id"]];
                    }
                    else
                    {
                        [[NSUserDefaults standardUserDefaults] setObject:dictStore forKey:[_dictChatUserInfo objectForKey:@"person_id"]];
                    }
                    [[NSUserDefaults standardUserDefaults] synchronize];
                }
            }];
        }
        else
        {

            FIRDatabaseReference *usersRef =  [[FIRDB child:@"one_to_one"]child:_username2];

            connt=0;

            [usersRef observeEventType:FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot *snapshot) {


                NSDictionary *  Dictionary;

                NSString *strImage = snapshot.value[@"chatSenderId"];

                if ([strImage isKindOfClass:[NSString class]]) {
                    Dictionary= @{


                                  @"chat_receiver":snapshot.value [@"chat_receiver"],
                                  @"chatSenderId":snapshot.value [@"chatSenderId"],
                                  @"chat_sender": snapshot.value [@"chat_sender"],
                                  @"chat_message": snapshot.value [@"chat_message"],
                                  @"chat_time": snapshot.value [@"chat_time"],
                                 // @"chat_date": snapshot.value [@"chat_date"],
                                  @"chat_sender_img": snapshot.value [@"chat_sender_img"],
                                  @"chat_receiver_img": snapshot.value [@"chat_receiver_img"]

                                  };
                }
                else{
                    Dictionary= @{

                                  @"chat_message": snapshot.value [@"chat_message"],
                                  @"chat_sender": snapshot.value [@"chat_sender"]
                                  };
                }

                [arrReceiveAllChat addObject:Dictionary ];
                [tbleChatView reloadData];
                [tbleChatView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:connt inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
                CGPoint point = tbleChatView.contentOffset;
                point .y -= tbleChatView.rowHeight;
                tbleChatView.contentOffset = point;
                connt++;

                [tbleChatView reloadData];

                if (arrReceiveAllChat.count>0) {

                    NSDictionary *dictStore = [arrReceiveAllChat lastObject];
                    if([strNotification  isEqual: @"no"])
                    {
                        [[NSUserDefaults standardUserDefaults] setObject:dictStore forKey:[_dictChatUserInfo objectForKey:@"id"]];
                    }
                    else
                    {
                      [[NSUserDefaults standardUserDefaults] setObject:dictStore forKey:[_dictChatUserInfo objectForKey:@"person_id"]];
                    }
                    
                    [[NSUserDefaults standardUserDefaults] synchronize];

                }

            }];

        }
    }];
}



-(void)changeImageColor:(NSString *)imageName imageView:(UIImageView *)imageView andColor:(UIColor *)yourColor
{
    UIImage *image = [UIImage imageNamed:imageName];
    imageView.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [imageView setTintColor: yourColor];
}

#pragma mark - send notification to other device

-(void)hitLoginMethod:(NSString *)strName strTitle:(NSString *)strTitle{
    
    NSMutableDictionary* _params = [[NSMutableDictionary alloc] init];
    NSMutableDictionary * dictNotification = [[NSMutableDictionary alloc] init];
    NSMutableDictionary * dictChat = [[NSMutableDictionary alloc] init];
    
    
    [dictNotification setObject:strName forKey:@"title"];
    
    [dictNotification setObject:strTitle forKey:@"body"];
    [dictNotification setObject:@"true" forKey:@"content_available"];
    
    
    [dictChat setObject:strTitle forKey: @"message"];
    [dictChat setObject:@"Chat" forKey: @"type" ];
    [dictChat setObject:[self.dictMyInfo valueForKey:@"id"] forKey: @"person_id"];
    [dictChat setObject:strName forKey: @"person_name"];
    [dictChat setObject:[self.dictMyInfo valueForKey:@"image"] forKey: @"person_image"];
    [dictChat setObject:[self.dictMyInfo valueForKey:@"firebaseId"] forKey: @"person_firebaseid"];
    [dictChat setObject:[self.dictMyInfo valueForKey:@"token"] forKey: @"deviceToken"];
    
    
    

//    [dictNotification setObject:[_dictChatUserInfo objectForKey:@"firebaseId"] forKey:@"receiverUserFirbaseId"];
//
//    [dictNotification setObject:[_dictMyInfo objectForKey:@"firebaseId"] forKey:@"senderUserFirbaseId"];
//
//    [dictNotification setObject:_dictMyInfo forKey:@"chatSenderData"];
//
//    [dictNotification setObject:[_dictMyInfo objectForKey:@"image"] forKey:@"image"];
    

    
    
    NSURL* requestURL = [NSURL URLWithString:@"https://fcm.googleapis.com/fcm/send"];

    NNMWebService * connection = [[NNMWebService alloc]init];
    connection.delegate = self;
    
    [_params setObject:dictNotification  forKey:@"notification"];
    
    [_params setObject:@"High"  forKey:@"priority"];
    
    [_params setObject:dictChat forKey:@"data"];
    
    if([strNotification  isEqual: @"no"])
    {
    [_params setObject:[_dictChatUserInfo objectForKey:@"token"]  forKey:@"to"];
    }
    else
    {
        [_params setObject:[_dictChatUserInfo objectForKey:@"deviceToken"]  forKey:@"to"];
 
    }
        
    
    NSLog(@"[self jsonStringWithDictionary:[_params mutableCopy]]%@",[self jsonStringWithDictionary:[_params mutableCopy]]);
    
    [connection webServicePostString:[self jsonStringWithDictionary:[_params mutableCopy]] urlString:[NSString stringWithFormat:@"%@", requestURL] methodName:@"chathit"];
    
    [self comeUpInTableViewWebserviceMethod];
    
}

#pragma mark - come up in table view
-(void)comeUpInTableViewWebserviceMethod
{
    
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        
        
        NSDictionary *parameters;
    if([strNotification  isEqual: @"no"])
    {
        parameters = @{
                       @"action"            : @"chat",
                       @"userId"            : [NSString stringWithFormat:@"%@",[_dictMyInfo objectForKey:@"id"]],
                       @"chatuserId"        : [NSString stringWithFormat:@"%@",[_dictChatUserInfo objectForKey:@"id"]]
                       };
    }
    else
    {
        parameters = @{
                       @"action"            : @"chat",
                       @"userId"            : [NSString stringWithFormat:@"%@",[_dictMyInfo objectForKey:@"id"]],
                       @"chatuserId"        : [NSString stringWithFormat:@"%@",[_dictChatUserInfo objectForKey:@"person_id"]]
                       };
    }
        NSLog(@"parameters-------%@",parameters);
        
        [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             
             NSDictionary *dictPhotographerLogin=responseObject;
             
             
             if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]== TRUE)
             {
                 
                 
             }
             else
             {
                 
                 
                 
                 
                 
                 
             }
             
         }
              failure:^(AFHTTPRequestOperation *operation, NSError *error)
         
         {
             
             
             
             
         }];
        
    
    
}

#pragma mark - WebService Delegates

-(void)getDataFormWebService:(NSDictionary *)jsonResults urlStr:(NSString *)yourUR methodName:(NSString *)methodName
{
    
    if ([methodName isEqualToString:@"chathit"])
    {
        
        
    }
}


// WEB SERVER ERROR MSG LOCAL SERVER (APPLICATION SERVER)
-(void) webServiceFailWithApplicationServerMSG:(NSString *)msg{
    
    
    
}

// WEB SERVICE FAIL WITH REGION TCP/IP
-(void) webServiceFail:(NSError *)error{
    
    
}

#pragma mark - Get String From Dictionary
-(NSString*)jsonStringWithDictionary:(NSDictionary*)data{
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
        return nil;
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
        NSLog(@"jsonString->%@",jsonString);
        return jsonString;
    }
}
@end
