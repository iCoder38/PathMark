//
//  donateVC.m
//  OWL
//
//  Created by Rameshwar on 24/08/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "donateVC.h"
#import "BSKeyboardControls.h"
//#import "PaymentViewController.h"

#define AE_CARD @"AE_CARD"
#define VISA_CARD @"VISA_CARD"
#define MASTER_CARD @"MASTER_CARD"
#define DISC_CARD @"DISC_CARD"

@interface donateVC ()<UIScrollViewDelegate, UITextFieldDelegate, UITextViewDelegate, BSKeyboardControlsDelegate, STPAddCardViewControllerDelegate, UIWebViewDelegate>{


    UIScrollView *scrolViewFull;

    UITextField *txtDonationAMount;
    UITextField *txtFullName;
    UITextField *txtEmail;
    UITextField  *txtMessage;
    UITextField *txtCardNumber;
    UITextField *txtExpMonth;
    UITextField *txtExpYear;
    UITextField *txtCVV;
    UITextField *txtNameOnCard;

    UITextRange *previousSelection;
    NSString *previousTextFieldContent;
    
    UIButton *btnSubmit;

    BSKeyboardControls *keyboardControls;

    NSString *theNumber;
    
    UIPickerView *pickerGender;
    UIToolbar *pickerToolbar;
    
    NSDateComponents *currentDateComponents;
    
    NSString *yearString;
    
    UIWebView *webBottomView;
}

@property (strong, nonatomic)NSMutableArray *monthArray;
@property (strong, nonatomic)NSMutableArray *yearsArray;

@end

@implementation donateVC


- (void)viewDidLoad
{

    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    self.monthArray=[[NSMutableArray alloc] initWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12", nil];
    
    self.yearsArray=[[NSMutableArray alloc]initWithObjects:@"2017",@"2018",@"2019",@"2020",@"2021",@"2022",@"2023",@"2024",@"2025",@"2026",@"2027",@"2028",@"2029",@"2030",@"2031",@"2032",@"2033",@"2034",@"2035",@"2036",nil];
    
    [self loadUI];
    
}

-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    [self customizeNavigationBar];

}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self showPicker:textField];
    
    if(textField==txtExpMonth)
    {
        if(txtExpMonth.text.length>=1)
        {
            // [pickerGender selectRow:[self.cardsArray indexOfObject:txtCountry.text] inComponent:0 animated:NO];
        }
    }
    
    if(textField==txtExpYear)
    {
        if(txtExpYear.text.length>=1)
        {
            // [pickerGender selectRow:[self.cardsArray indexOfObject:txtCountry.text] inComponent:0 animated:NO];
        }
    }
    
    
    
    
    
    return YES;
}

- (IBAction)showPicker:(id)sender
{
    UITextField *textField=(UITextField *)sender;
    pickerGender = [[UIPickerView alloc] init];
    pickerGender.showsSelectionIndicator = YES;
    pickerGender.dataSource = self;
    pickerGender.delegate = self;
    pickerToolbar = [[UIToolbar alloc] init];
    pickerToolbar.barStyle = UIBarStyleBlackTranslucent;
    [pickerToolbar sizeToFit];
    //to make the done button aligned to the right
    UIBarButtonItem *flexibleSpaceLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneClicked:)];
    [pickerToolbar setItems:[NSArray arrayWithObjects:flexibleSpaceLeft, doneButton, nil]];
    
    if(textField==txtExpMonth)
    {
        pickerGender.tag=1;
        //txtGender.text=@"Male";
        txtExpMonth.inputView = pickerGender;
        txtExpMonth.inputAccessoryView = pickerToolbar;
    }
    else
    if(textField==txtExpYear)
    {
        pickerGender.tag=2;
        //txtGender.text=@"Male";
        txtExpYear.inputView = pickerGender;
        txtExpYear.inputAccessoryView = pickerToolbar;
    }
  
    
    
}

-(void)doneClicked:(id) sender
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    self.view.frame = CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height);
    
    
    [UIView commitAnimations];
    
    [txtExpMonth resignFirstResponder];
    [txtExpYear resignFirstResponder];
    [txtMessage resignFirstResponder];
    
}



-(void)stateAlert
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warning!"
                                          
                                                                             message:@"Please select a country"
                                          
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                               
                                                       style:UIAlertActionStyleDefault
                               
                                                     handler:nil];
    
    
    [alertController addAction:actionOk];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

-(void)cityAlert
{
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warning!"
                                              
                                                                                 message:@"Please select a State"
                                              
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
        
        
        UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                                   
                                                           style:UIAlertActionStyleDefault
                                   
                                                         handler:nil];
        
        
        [alertController addAction:actionOk];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(pickerView.tag==1)
    {
        txtExpMonth.text = [_monthArray objectAtIndex:row];
        
        NSLog(@"txtExpMonth.text===%@",txtExpMonth.text);
        
    }
    
    else
    if(pickerView.tag==2)
    {
        txtExpYear.text = [_yearsArray objectAtIndex:row];
        
        
    }
    
    
    
    
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    if(pickerView.tag==1)
    {
        return [_monthArray count];
    }
    else
    if(pickerView.tag==2)
    {
        return [_yearsArray count];
    }
    
    
    
    
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    if(pickerView.tag==1)
    {
        return [_monthArray objectAtIndex:row];
    }
    else
    if(pickerView.tag==2)
    {
        return [_yearsArray objectAtIndex:row];
    }
    
    
    return 0;
}






-(void)customizeNavigationBar
{

    self.navigationController.navigationBarHidden = TRUE;

    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 65)];
    navView.backgroundColor = Black;
    [self.view addSubview:navView];


    UIButton *btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
    btnMenu.frame = CGRectMake(10, 30, 24, 24);
    [btnMenu setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [btnMenu addTarget:self action:@selector(hitMenu:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:btnMenu];


    UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(35, 20, kSCREEN_WIDTH-70, 45)];
    lblTitle.text = @"DONATE";
    lblTitle.textColor = White;
    lblTitle.font = mr16;
    lblTitle.textAlignment = NSTextAlignmentCenter;
    [navView addSubview:lblTitle];

}

-(IBAction)hitMenu:(id)sender{

    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];
    
}

-(void)loadUI
{

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

    imgBGp.alpha=0.60f;

    [self.view insertSubview:imgBGp atIndex:0];


    UIImageView *imgBGTSP=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];

    imgBGTSP.image = [UIImage imageNamed:@"tps" ];
    [self.view addSubview:imgBGTSP];

    scrolViewFull=[[UIScrollView alloc]initWithFrame:cgFrame(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrolViewFull.backgroundColor = Clear;
    [self.view addSubview:scrolViewFull];



    txtDonationAMount=[[UITextField alloc]init];
    txtFullName=[[UITextField alloc]init];
    txtEmail=[[UITextField alloc]init];
    txtMessage=[[UITextField alloc]init];
    txtCardNumber=[[UITextField alloc]init];
    
    txtExpYear=[[UITextField alloc]init];
    txtExpMonth=[[UITextField alloc]init];
    txtCVV=[[UITextField alloc]init];
    txtCVV.tag = 101;
    txtNameOnCard=[[UITextField alloc]init];

    txtCardNumber.delegate=self;
    
    
    int heights = 45;

    UIColor *txtColor=RGBc(104, 104, 104);
    UIColor *bgColor=RGBc(238, 238, 238);



    [Alert textFieldplaceholder:txtDonationAMount frame:cgFrame(20, 80, kSCREEN_WIDTH-40, heights) placeholder:@"Enter Donation Amount" textColor:txtColor font:ml16 bg:[UIColor colorWithRed: 238.0 / 255.0 green: 238.0 / 255.0 blue: 238.0/ 255.0 alpha : 1] cornerRadius:4 paddingValue:20 yesNo:YES];



    [Alert textFieldplaceholder:txtFullName frame:cgFrame(20, txtDonationAMount.frame.size.height + txtDonationAMount.frame.origin.y + 10, kSCREEN_WIDTH-40, heights) placeholder:@"Full Name" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];


    [Alert textFieldplaceholder:txtEmail frame:cgFrame(20, txtFullName.frame.size.height + txtFullName.frame.origin.y + 10, kSCREEN_WIDTH-40, heights) placeholder:@"Email" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];


    [Alert textFieldplaceholder:txtMessage frame:cgFrame(20, txtEmail.frame.size.height + txtEmail.frame.origin.y + 10, kSCREEN_WIDTH-40, heights) placeholder:@"Message" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
 

    [Alert textFieldplaceholder:txtCardNumber frame:cgFrame(20, txtMessage.frame.size.height + txtMessage.frame.origin.y + 10, kSCREEN_WIDTH-40, heights) placeholder:@"Enter your card number" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];



    [Alert textFieldplaceholder:txtExpMonth frame:cgFrame(20, txtCardNumber.frame.size.height + txtCardNumber.frame.origin.y + 10, kSCREEN_WIDTH/2-20, heights) placeholder:@"Exp Month" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];



    [Alert textFieldplaceholder:txtExpYear frame:cgFrame(kSCREEN_WIDTH/2+10, txtCardNumber.frame.size.height + txtCardNumber.frame.origin.y + 10, kSCREEN_WIDTH/2-30, heights) placeholder:@"Exp Year" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];


    [Alert textFieldplaceholder:txtCVV frame:cgFrame(20, txtExpYear.frame.size.height + txtExpYear.frame.origin.y + 10, 100, heights) placeholder:@"CVV" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];


     [Alert textFieldplaceholder:txtNameOnCard frame:cgFrame(130, txtExpYear.frame.size.height + txtExpYear.frame.origin.y + 10, kSCREEN_WIDTH-150, heights) placeholder:@"Name On Card" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];


    btnSubmit=[UIButton buttonWithType:UIButtonTypeCustom];
    btnSubmit.frame=cgFrame(20, txtNameOnCard.frame.size.height + txtNameOnCard.frame.origin.y + 20, kSCREEN_WIDTH-40, heights);
    [btnSubmit setTitle:@"DONATE NOW" forState:UIControlStateNormal];
    btnSubmit.titleLabel.font=ms16;
    btnSubmit.layer.cornerRadius=4;
    btnSubmit.clipsToBounds=YES;
    btnSubmit .backgroundColor=[UIColor colorWithRed:0.0/255.0 green:204.0/255.0 blue:102.0/255.0 alpha:1.0];
    [btnSubmit addTarget:self action:@selector(hitPayment:) forControlEvents:UIControlEventTouchUpInside];

    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = btnSubmit.layer.bounds;

    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[UIColor colorWithWhite:1.0f alpha:0.1f].CGColor,
                            (id)[UIColor colorWithRed:0.0/255.0 green:204.0/255.0 blue:102.0/255.0 alpha:1.0].CGColor,
                            nil];

    gradientLayer.locations = [NSArray arrayWithObjects:
   [NSNumber numberWithFloat:0.0f],[NSNumber numberWithFloat:1.0f],
                               nil];

    gradientLayer.cornerRadius = btnSubmit.layer.cornerRadius;
    [btnSubmit.layer addSublayer:gradientLayer];


    txtDonationAMount.keyboardAppearance = UIKeyboardAppearanceDark;
    txtFullName.keyboardAppearance = UIKeyboardAppearanceDark;
    txtEmail.keyboardAppearance = UIKeyboardAppearanceDark;
    txtMessage.keyboardAppearance = UIKeyboardAppearanceDark;
    txtCardNumber.keyboardAppearance = UIKeyboardAppearanceDark;
    txtExpMonth.keyboardAppearance = UIKeyboardAppearanceDark;
    txtExpYear.keyboardAppearance = UIKeyboardAppearanceDark;
    txtCVV.keyboardAppearance = UIKeyboardAppearanceDark;
    txtNameOnCard.keyboardAppearance = UIKeyboardAppearanceDark;

    txtDonationAMount.delegate=self;
    txtFullName.delegate=self;
    txtEmail.delegate=self;
    txtMessage.delegate=self;
    txtExpMonth.delegate=self;
    txtExpYear.delegate=self;
    txtCVV.delegate=self;
    txtNameOnCard.delegate=self;

    txtDonationAMount.keyboardType  =   UIKeyboardTypeDecimalPad;
    txtEmail.keyboardType           =   UIKeyboardTypeEmailAddress;
    txtCardNumber.keyboardType      =   UIKeyboardTypePhonePad;
    txtExpMonth.keyboardType        =   UIKeyboardTypePhonePad;
    txtExpYear.keyboardType         =   UIKeyboardTypePhonePad;
    txtCVV.keyboardType             =   UIKeyboardTypePhonePad;
    txtMessage.keyboardType         =   UIKeyboardTypeDefault;

    [scrolViewFull addSubview:txtDonationAMount];
    [scrolViewFull addSubview:txtFullName];
    [scrolViewFull addSubview:txtEmail];
    [scrolViewFull addSubview:txtMessage];
    [scrolViewFull addSubview:txtCardNumber];
    [scrolViewFull addSubview:txtExpMonth];
    [scrolViewFull addSubview:txtExpYear];
    [scrolViewFull addSubview:txtCVV];
    [scrolViewFull addSubview:txtNameOnCard];
    [scrolViewFull addSubview:btnSubmit];

    scrolViewFull.contentSize = CGSizeMake(kSCREEN_WIDTH, kSCREEN_HEIGHT+180);


    NSArray *fields = @[ txtDonationAMount, txtFullName, txtEmail, txtMessage, txtCardNumber, txtExpMonth, txtExpYear, txtCVV, txtNameOnCard];

    keyboardControls = [[BSKeyboardControls alloc] initWithFields:fields];
    [keyboardControls setDelegate:self];
    
    
    webBottomView = [[UIWebView alloc]init];
    webBottomView.delegate = self;
    webBottomView.frame = CGRectMake(0, btnSubmit.frame.size.height + btnSubmit.frame.origin.y + 30, kSCREEN_WIDTH, 180);
    webBottomView.opaque = NO;
    webBottomView.backgroundColor = [UIColor clearColor];
    [scrolViewFull addSubview:webBottomView];
    
    NSURLRequest *urlReq = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Donate" ofType:@"html"]]];
    
    [webBottomView loadRequest:urlReq];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(aMethod:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"https://stripe.com" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Italic" size:16];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [button setBackgroundColor:[UIColor blackColor]];
    button.frame = CGRectMake(0, webBottomView.frame.size.height + webBottomView.frame.origin.y-10 , kSCREEN_WIDTH, 25);
    [scrolViewFull addSubview:button];
    
}

-(IBAction)aMethod:(id)sender{
    
      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://stripe.com"]];
    
}


- (void)textFieldDidBeginEditing:(UIView *)textField {

    [keyboardControls setActiveField:textField];
}

- (void)keyboardControlsDonePressed:(BSKeyboardControls *)keyboardControls1{

    [keyboardControls1.activeField resignFirstResponder];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    [textField resignFirstResponder];
    return TRUE;
}

-(IBAction)hitPayment:(id)sender
{
    
    NSString *strNameValidate = txtNameOnCard.text;
    
    strNameValidate = [strNameValidate stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *strFullName = txtFullName.text;
    
    strFullName = [strFullName stringByReplacingOccurrencesOfString:@" " withString:@""];

    NSString *strMessage = txtMessage.text;
    
    strMessage = [strMessage stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    if ([txtDonationAMount.text isEqualToString:@""])
    {
        [Alert svError:@"Donation Amount should not be empty"];
    }
    else if ([txtFullName.text isEqualToString:@""])
    {
        [Alert svError:@"Full name should not be empty"];
    }
    else if ([txtEmail.text isEqualToString:@""])
    {
        [Alert svError:@"Email should not be empty"];
    }
    else if (![self validateEmailWithString:txtEmail.text])
    {
        [Alert svError:@"Email is not valid"];
    }
    else if([txtMessage.text isEqualToString:@""])
    {
        [Alert svError:@"Message should not be empty"];
    }
    else if (txtCardNumber.text.length < 16)
    {
        [Alert svError:@"Card number should be 16 characters"];
    }
    else if([txtExpMonth.text isEqualToString:@""])
    {
        [Alert svError:@"Exp.Month should not be empty"];
    }
    else if([txtExpYear.text isEqualToString:@""])
    {
        [Alert svError:@"Exp. Year should not be empty"];
    }
    else if([txtCVV.text isEqualToString:@""])
    {
        [Alert svError:@"CVV should not be empty"];
    }
    else if([txtNameOnCard.text isEqualToString:@""])
    {
        [Alert svError:@"Name on card should not be empty"];
    }
    else
    {
        if (strNameValidate.length == 0)
        {
            [Alert svError:@"Name on card is Invalid"];
            return;
        }
        else if (strFullName.length == 0)
        {
            [Alert svError:@"Invalid Name"];
            return;
        }
        else if (strMessage.length == 0)
        {
            [Alert svError:@"Invalid Message"];
            return;
        }

    BOOL networkStatus = [Alert networkStatus];

    if (networkStatus)
    {
        [SVProgressHUD dismiss];
       // [self successPopUp];
        
        
        
        [self handleAddPaymentMethodButtonTapped];
    }
    else
    {
// show error

    }
    }
  
}

- (BOOL)validateEmailWithString:(NSString*)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

-(void)successPopUp
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert!"
                                          
                                                                             message:@"Successfully submited"
                                          
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    //We add buttons to the alert controller by creating UIAlertActions:
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                               
                                                       style:UIAlertActionStyleDefault
                               
                                                     handler:^(UIAlertAction *Alert)
    {
        
        txtDonationAMount.text=@"";
        txtFullName.text=@"";
        txtEmail.text=@"";
        txtMessage.text=@"";
        txtCardNumber.text=@"";
        txtExpYear.text=@"";
        txtExpMonth.text=@"";
        txtCVV.text=@"";
        txtNameOnCard.text=@"";
        
        UIStoryboard *storyboards;
        
//        if (iPhoneVersion == 5)
//        {
//            storyboards = [UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//        }
//        else if (iPhoneVersion == 6)
//        {
            storyboards = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        }
//        else if (iPhoneVersion == 61)
//        {
//            storyboards = [UIStoryboard storyboardWithName:@"Main6p" bundle:nil];
//        }
//        else
//        {
//            storyboards = [UIStoryboard storyboardWithName:@"Mainpad" bundle:nil];
//        }
        
        DashboardVC  *ds=(DashboardVC *)[storyboards instantiateViewControllerWithIdentifier:@"DashboardVCId"];
        
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:ds];
        
        [navController setViewControllers: @[ds] animated: YES];
        [self.revealViewController setFrontViewController:navController];
        [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        
     }];
    
    [alertController addAction:actionOk];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void)handleAddPaymentMethodButtonTapped
{

    STPCardParams *cardParams = [[STPCardParams alloc] init];
    
    cardParams.number       = txtCardNumber.text;
    cardParams.expMonth     = [txtExpMonth.text intValue];
    cardParams.expYear      = [txtExpYear.text intValue];
    cardParams.cvc          = txtCVV.text ;

    NSLog(@"cardParams:%@,\n%lu\n%lu\n%@",cardParams.number,(unsigned long)cardParams.expYear,(unsigned long)cardParams.expMonth,cardParams.cvc);
    [[STPAPIClient sharedClient] createTokenWithCard:cardParams completion:^(STPToken *token, NSError *error)
     {
        if (token == nil || error != nil)
        {
             [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
            return ;
        }

        [self submitTokenToBackend:token completion:^(NSError *error)
        {
            if (error)
            {
                 [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];

            }
            else
            {



            }
        }];
    }];

}
- (void)submitTokenToBackend:(STPToken *)token completion:(void (^)(NSError *error))completionBlock{

    [SVProgressHUD showWithStatus:pleaseWait maskType:SVProgressHUDMaskTypeBlack];

    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];

    NSString *strLoginUserId=[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]];

    int amount = [txtDonationAMount.text intValue]*100;

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{
                                 @"action": @"chargerAmount",
                                 @"amount": [NSString stringWithFormat:@"%d",amount] ,
                                 @"tokenId": token,
                                 @"userId": strLoginUserId,
                                 @"description": txtMessage.text,
                                 @"email": txtEmail.text,
                                 };

    NSLog(@"parameters-------%@",parameters);

    [manager POST:[NSString stringWithFormat:@"%@",@"https://demo.evirtualservices.com/OWL/site/strippayment/charge.php"] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {

         NSDictionary *dictPaymentResponse = responseObject;

         if ([[dictPaymentResponse objectForKey:@"status"] isEqualToString:@"Success"]== TRUE){

             [self hitEVSServer:dictPaymentResponse];

         }
         else
         {


         }

     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];

     }];

}


-(void)hitEVSServer:(NSDictionary *)dictPaymentData{

    [SVProgressHUD showWithStatus:pleaseWait maskType:SVProgressHUDMaskTypeBlack];

    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];

    NSString *strLoginUserId=[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{
                                 
         @"action": @"donatePayment",
         @"user_id": strLoginUserId ,
         @"name": txtFullName.text,
         @"email":txtEmail.text ,
         @"message": txtMessage.text,
         @"transaction_id": [dictPaymentData objectForKey:@"tokeId"],
         @"payment_response_data": [dictPaymentData objectForKey:@"paymentResponseString"],
         @"amount": txtDonationAMount.text,
         
     };

    NSLog(@"parameters-------%@",parameters);

    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         [SVProgressHUD dismiss];
         NSDictionary *dictPhotographerLogin=responseObject;

         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]== TRUE)
         {
             
             [SVProgressHUD dismiss];
             [self successPopUp];
             
         }
         else
         {

             [SVProgressHUD dismiss];
         }

     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];

     }];
    
}

-(void)popupAlertDone
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert!"
                                          
                                                                             message:@"Payment is successfull."
                                          
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    //We add buttons to the alert controller by creating UIAlertActions:
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"

       style:UIAlertActionStyleDefault

     handler:^(UIAlertAction *Action){
         
         UIStoryboard *storyboards;

//         if (iPhoneVersion == 5)
//         {
//             storyboards = [UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//         }
//         else if (iPhoneVersion == 6)
//         {
             storyboards = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//         }
//         else if (iPhoneVersion == 61)
//         {
//             storyboards = [UIStoryboard storyboardWithName:@"Main6p" bundle:nil];
//         }
//         else
//         {
//             storyboards = [UIStoryboard storyboardWithName:@"Mainpad" bundle:nil];
//         }
         
         DashboardVC  *ds=(DashboardVC *)[storyboards instantiateViewControllerWithIdentifier:@"DashboardVCId"];
         
         UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:ds];
         
         [navController setViewControllers: @[ds] animated: YES];
         [self.revealViewController setFrontViewController:navController];
         [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
//
     }];

    [alertController addAction:actionOk];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    
    
    if (textField==txtCardNumber)
    {
        
        
        [self getCreditCardType:txtCardNumber.text];
        
        
        NSLog(@"theNumber====%@",theNumber);
        
        if ([theNumber hasPrefix:@"34"])
        {
                    if (range.location == 17)
                    {
                        return NO;
                    }
            
                    // Backspace
                    if ([string length] == 0)
                    return YES;
            
                    if ((range.location == 4) || (range.location == 11) || (range.location == 17))
                    {
            
                        NSString *str    = [NSString stringWithFormat:@"%@ ",textField.text];
                        textField.text   = str;
                    }
                }
       
        
        
        if ([theNumber hasPrefix:@"4"])
        {
            if (range.location == 19)
            {
                return NO;
            }
            
            // Backspace
            if ([string length] == 0)
            return YES;
            
            if ((range.location == 4) || (range.location == 9) || (range.location == 14))
            {
                
                NSString *str    = [NSString stringWithFormat:@"%@ ",textField.text];
                textField.text   = str;
            }
        }
        
        
        
        
        if ([theNumber hasPrefix:@"5"])
        {
            if (range.location == 19)
            {
                return NO;
            }
            
            // Backspace
            if ([string length] == 0)
            return YES;
            
            if ((range.location == 4) || (range.location == 9) || (range.location == 14))
            {
                
                NSString *str    = [NSString stringWithFormat:@"%@ ",textField.text];
                textField.text   = str;
            }
        }
        
        if ([theNumber hasPrefix:@"60"] ||
            [theNumber hasPrefix:@"62"] ||
            [theNumber hasPrefix:@"64"] ||
            [theNumber hasPrefix:@"65"])
        {
            if (range.location == 19)
            {
                return NO;
            }
            
            // Backspace
            if ([string length] == 0)
            return YES;
            
            if ((range.location == 4) || (range.location == 9) || (range.location == 14))
            {
                
                NSString *str    = [NSString stringWithFormat:@"%@ ",textField.text];
                textField.text   = str;
            }
        }
        
    }
    
    
    if (textField==txtCVV)
    {
        [self getCreditCardType:txtCardNumber.text];
        
//american express
        
        if ([theNumber hasPrefix:@"34"])
        {
            if (txtCardNumber.text.length==17)
            {
                if (range.location == 4)
                {
                    return NO;
                }
            }
            else
            {
                [Alert svError:@"Invalid card number"];
                txtCVV.text=@"";
            }
        }
        
       else
        
//other
        
        if ([theNumber hasPrefix:@"4"] ||
            [theNumber hasPrefix:@"5"] ||
            [theNumber hasPrefix:@"60"] ||
            [theNumber hasPrefix:@"62"] ||
            [theNumber hasPrefix:@"64"] ||
            [theNumber hasPrefix:@"65"])
        {
            if (range.location == 3)
            {
                return NO;
            }
        }
        else
        {
            [Alert svError:@"Invalid card number"];
            txtCVV.text=@"";
        }
        
    }
    
    if (textField == txtNameOnCard)
    {
        NSString *str_test = @"Example ";
        NSCharacterSet *whitespaceSet = [NSCharacterSet whitespaceCharacterSet];
        if([str_test rangeOfCharacterFromSet:whitespaceSet].location!=NSNotFound)
        {
            NSLog(@"Found");
        }
    }
    
    

    
    return YES;
}

#pragma mark - card validation



- (NSMutableArray *) toCharArray :(NSString *)cardNo
{
    NSMutableArray *characters = [[NSMutableArray alloc] initWithCapacity:[cardNo length]];
    for (int i=0; i < [cardNo length]; i++) {
        NSString *ichar  = [NSString stringWithFormat:@"%c", [cardNo characterAtIndex:i]];
        [characters addObject:ichar];
    }
    return characters;
}


- (NSString *) luhnCheck:(NSString *)creditCardSTR
{
    NSMutableArray *stringAsChars = [self toCharArray:creditCardSTR];
    BOOL isOdd = YES;
    int oddSum = 0;
    int evenSum = 0;
    for (int i = [creditCardSTR length] - 1; i >= 0; i--) {
        int digit = [(NSString *)[stringAsChars objectAtIndex:i] intValue];
        if (isOdd)
        oddSum += digit;
        else
        evenSum += digit/5 + (2*digit) % 10;
        isOdd = !isOdd;
    }
    if((oddSum + evenSum) % 10 == 0)
    {
        return [self getCreditCardType:creditCardSTR];
    }
    else
    {
        return @"Unknown";
    }
}

- (NSString *)getCreditCardType:(NSString *)cardNo
{
    // I checked here for only 4 card you can add more ref
    theNumber = cardNo;
    if ([theNumber hasPrefix:@"34"] || [theNumber hasPrefix:@"37"])
    return AE_CARD;
    else if ([theNumber hasPrefix:@"60"] ||
             [theNumber hasPrefix:@"62"] ||
             [theNumber hasPrefix:@"64"] ||
             [theNumber hasPrefix:@"65"])
    return DISC_CARD;
    
     else if ([theNumber hasPrefix:@"35"])
    {
        NSLog(@"jcb");
        
     return @"JCB";
    }
    
     else if ([theNumber hasPrefix:@"30"] ||
     [theNumber hasPrefix:@"36"] ||
     [theNumber hasPrefix:@"38"] ||
     [theNumber hasPrefix:@"39"])
     return @"Diners Club";
    
    else if ([theNumber hasPrefix:@"4"])
    {
        NSLog(@"visa");
    return VISA_CARD;
    }
    else if ([theNumber hasPrefix:@"5"])
    {
    NSLog(@"master");
    return MASTER_CARD;
    }
    else
    return @"Unknown";
}


#pragma mark: - WebviewDelegate

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
    
}


@end
