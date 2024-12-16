//
//  AddMissingChildFormTwoVC.m
//  OWL
//
//  Created by Rameshwar on 22/08/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "AddMissingChildFormTwoVC.h"
#import "DBManager.h"
#import "StoreData.h"


@interface AddMissingChildFormTwoVC (){
    UIScrollView *scrolViewFull;
             //    CLLocationManager *locationManager;
    
    
    NSString *Address;
        CLLocationManager *locationManager;
        CLLocation *currentLocation;
     
    UIPickerView *pickerGender;
    UIToolbar *pickerToolbar;

    UIView *viewOnScroll;

    UIDatePicker *datePicker;
    NSDate *theMaximumDate;

    UIImageView *imgProfilePicture;

//    NSData *imageData;
    NSData *imageDatas;
    UIImage *image ;

    NSArray *arrShowSavedData;

    StoreData *storSavedData;


}

@property (strong, nonatomic)NSMutableArray *arrGender;
@property (strong, nonatomic)NSMutableArray *arrIsThe;

@end

@implementation AddMissingChildFormTwoVC
@synthesize dictGetDataFromFirstForm;
@synthesize imgGet;
- (void)viewDidLoad
{

    [super viewDidLoad];
    
    NSLog(@"dictGetDataFromFirstForm===%@",dictGetDataFromFirstForm);
    
    
    
    imageDatas = [NSData dataWithData:UIImagePNGRepresentation(imgGet)];
    
    
    
    imageDatas = [self compressImage:imgGet];
    
    
    Address = @"";
    
    

}

-(NSData *)compressImage:(UIImage *)imagez
{
    
    
    float actualHeight = imagez.size.height;
    float actualWidth = imagez.size.width;
    float compressionQuality = 0.5;
    
    
    NSLog(@"Actual height :%f and Width :%f",actualHeight,actualWidth);
    CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
    UIGraphicsBeginImageContext(rect.size);
    [imagez drawInRect:rect];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    imageDatas= UIImageJPEGRepresentation(img, compressionQuality);
    UIGraphicsEndImageContext();
    
    return imageDatas;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    currentLocation = [locations objectAtIndex:0];
    [locationManager stopUpdatingLocation];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (!(error))
         {
             CLPlacemark *placemark = [placemarks objectAtIndex:0];
             NSLog(@"\nCurrent Location Detected\n");
             NSLog(@"placemark %@",placemark);
             NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
             
            Address = [[NSString alloc]initWithString:locatedAt];
             NSString *Area = [[NSString alloc]initWithString:placemark.locality];
             NSString *Country = [[NSString alloc]initWithString:placemark.country];
             NSString *CountryArea = [NSString stringWithFormat:@"%@, %@", Area,Country];
              NSLog(@"%@",Address);
             NSLog(@"%@",Area);
             NSLog(@"%@",Country);
             NSLog(@"%@",CountryArea);
         }
         else
         {
             NSLog(@"Geocode failed with error %@", error);
             NSLog(@"\nCurrent Location Not Detected\n");
             //return;
             //CountryArea = NULL;
         }
         /*---- For more results
          placemark.region);
          placemark.country);
          placemark.locality);
          placemark.name);
          placemark.ocean);
          placemark.postalCode);
          placemark.subLocality);
          placemark.location);
          ------*/
     }];
}


-(void)UiDesignPattern
{
    self.view.backgroundColor=White;

    _arrIsThe=[[NSMutableArray alloc]initWithCapacity:0];
    
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

    viewOnScroll=[[UIView alloc]initWithFrame:cgFrame(0, 0, self.view.frame.size.width, self.view.frame.size.height+1500)];
    //viewOnScroll.backgroundColor=Blue;
    [scrolViewFull addSubview:viewOnScroll];


    //lost,missing,runaway,abducted,kidnapped,others

    self.arrIsThe=[[NSMutableArray alloc] initWithObjects:@"Lost",@"Missing",@"Runaway",@"Others", nil];

    
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];

    NSString *strLoginUserId=[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]];


//    DBManager* db = [[DBManager alloc] initWithDB:kDB_NAME];
//
//     arrShowSavedData = [db getProductData:kTABLE_NAME strUserId:strLoginUserId];

    if (arrShowSavedData.count>0) {

        [self textFieldMethod:arrShowSavedData];

    }
    else{

        [self textFieldMethod];
        
    }



}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self showPicker:textField];
    
    if(textField==txtIsTheChild)
    {
        if(txtIsTheChild.text.length>=1)
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
    
    txtPrizeReward.inputAccessoryView = pickerToolbar;
    
    if(textField==txtIsTheChild)
    {
        pickerGender.tag=1;
        //txtGender.text=@"Male";
        txtIsTheChild.inputView = pickerGender;
        txtIsTheChild.inputAccessoryView = pickerToolbar;
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
    
    
    
    [txtIsTheChild resignFirstResponder];
    [txtComplaintDate resignFirstResponder];
    [txtPrizeReward resignFirstResponder];
    
    
    
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
   
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(pickerView.tag==1)
    {
        txtIsTheChild.text = [_arrIsThe objectAtIndex:row];
        
    }
    
}
    - (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
    {
        if(pickerView.tag==1)
        {
            return [_arrIsThe count];
        }
        return 0;
    }
    
    - (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
    {
        if(pickerView.tag==1)
        {
            return [_arrIsThe objectAtIndex:row];
        }
        return 0;
    }
    

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField==txtHeight)
    {
        
        if ([txtHeight.text hasPrefix:@"1"]||
            [txtHeight.text hasPrefix:@"2"]||
            [txtHeight.text hasPrefix:@"3"]||
            [txtHeight.text hasPrefix:@"4"]||
            [txtHeight.text hasPrefix:@"5"]||
            [txtHeight.text hasPrefix:@"6"]||
            [txtHeight.text hasPrefix:@"7"]||
            [txtHeight.text hasPrefix:@"8"]||
            [txtHeight.text hasPrefix:@"9"]
            )
        {
            NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            
            for (int i = 0; i < [string length]; i++)
            {
                unichar c = [string characterAtIndex:i];
                if (![myCharSet characterIsMember:c])
                {
                    
                    return NO;
                }
                else
                {
                    NSLog(@"ok");
                }
            }
        }
        else
        {
            NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"123456789"];
            
            for (int i = 0; i < [string length]; i++)
            {
                unichar c = [string characterAtIndex:i];
                if (![myCharSet characterIsMember:c])
                {
                    
                    return NO;
                }
                else
                {
                    NSLog(@"ok");
                }
            }
        }

        
        
        
        return YES;
    }
    
    if (textField==txtWeight)
    {
        
        if ([txtWeight.text hasPrefix:@"1"]||
            [txtWeight.text hasPrefix:@"2"]||
            [txtWeight.text hasPrefix:@"3"]||
            [txtWeight.text hasPrefix:@"4"]||
            [txtWeight.text hasPrefix:@"5"]||
            [txtWeight.text hasPrefix:@"6"]||
            [txtWeight.text hasPrefix:@"7"]||
            [txtWeight.text hasPrefix:@"8"]||
            [txtWeight.text hasPrefix:@"9"]
            )
        {
            NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            
            for (int i = 0; i < [string length]; i++)
            {
                unichar c = [string characterAtIndex:i];
                if (![myCharSet characterIsMember:c])
                {
                    
                    return NO;
                }
                else
                {
                    NSLog(@"ok");
                }
            }
        }
        else
        {
            NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"123456789"];
            
            for (int i = 0; i < [string length]; i++)
            {
                unichar c = [string characterAtIndex:i];
                if (![myCharSet characterIsMember:c])
                {
                    
                    return NO;
                }
                else
                {
                    NSLog(@"ok");
                }
            }
        }
        
        
        
        
        return YES;
    }
    
    if (textField==txtColourOfEyes)
    {
        
        
            NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUYWXYZ"];
            
            for (int i = 0; i < [string length]; i++)
            {
                unichar c = [string characterAtIndex:i];
                if (![myCharSet characterIsMember:c])
                {
                    
                    return NO;
                }
                else
                {
                    NSLog(@"ok");
                }
            }
        
        
        
        
        return YES;
    }
    
    if (textField==txtColorOfHair)
    {
        
        
        NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUYWXYZ"];
        
        for (int i = 0; i < [string length]; i++)
        {
            unichar c = [string characterAtIndex:i];
            if (![myCharSet characterIsMember:c])
            {
                
                return NO;
            }
            else
            {
                NSLog(@"ok");
            }
        }
        
        
        
        
        return YES;
    }
    
    if (textField==txtPinCode)
    {
        
        
        if(range.length + range.location > textField.text.length)
        {
            return NO;
        }
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 6;
        
    }
    
    if (textField==txtParentsMobileNumber) {
        
        int length = (int)[self getLength:textField.text];
        
        if(length == 10)
        {
            if(range.length == 0)
                return NO;
        }
        
        if(length == 3)
        {
            NSString *num = [self formatNumber:textField.text];
            textField.text = [NSString stringWithFormat:@"(%@) ",num];
            
            if(range.length > 0)
                textField.text = [NSString stringWithFormat:@"%@",[num substringToIndex:3]];
        }
        else if(length == 6)
        {
            NSString *num = [self formatNumber:textField.text];
            textField.text = [NSString stringWithFormat:@"(%@) %@-",[num  substringToIndex:3],[num substringFromIndex:3]];
            
            if(range.length > 0)
                textField.text = [NSString stringWithFormat:@"(%@) %@",[num substringToIndex:3],[num substringFromIndex:3]];
        }
    }

    
    return YES;
}

- (void)viewDidLayoutSubviews
{
    if (iPhoneVersion == 5)
    {
        scrolViewFull.contentSize = CGSizeMake(kSCREEN_WIDTH, kSCREEN_HEIGHT+350);
    }
    else
    {
    
    scrolViewFull.contentSize = CGSizeMake(kSCREEN_WIDTH, kSCREEN_HEIGHT+220);
    }
}

-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    
    locationManager = [CLLocationManager new];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];


    [self UiDesignPattern];

    [self customizeNavigationBar];
    
}

-(void)customizeNavigationBar
{

    self.navigationController.navigationBarHidden = TRUE;

    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 65)];
    navView.backgroundColor = Black;
    [self.view addSubview:navView];


    UIButton *btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
    btnMenu.frame = CGRectMake(10, 30, 24, 24);
    [btnMenu setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [btnMenu addTarget:self action:@selector(hitMenu:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:btnMenu];


    UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(35, 20, kSCREEN_WIDTH-70, 45)];
    lblTitle.text = @"ADD CHILD/PERSON INFO";
    lblTitle.textColor = White;
    lblTitle.font = mr16;
    lblTitle.textAlignment = NSTextAlignmentCenter;
    [navView addSubview:lblTitle];

}

-(IBAction)hitMenu:(id)sender
{

    [self.navigationController popViewControllerAnimated:YES];
    [self.view endEditing:YES];

}

-(void)textFieldMethod:(NSArray *)arrData
{


    int xPos = 20;

    int yPos = 8;

    int heights = 45;

    UIColor *txtColor=RGBc(104, 104, 104);
    UIColor *bgColor=RGBc(238, 238, 238);


    //alloc
    txtPinCode  =[[UITextField alloc]init];
    txtParentsMobileNumber  =[[UITextField alloc]init];
    txtIdentificationMark   =[[UITextField alloc]init];
    txtHeight               =[[UITextField alloc]init];
    txtWeight               =[[UITextField alloc]init];
    txtColourOfEyes         =[[UITextField alloc]init];
    txtColorOfHair          =[[UITextField alloc]init];
    txtWearGlassOrContactLens=[[UITextField alloc]init];
    txtIsTheChild           =[[UITextField alloc]init];
    txtComplaintDate        =[[UITextField alloc]init];
    txtComplaintBy          =[[UITextField alloc]init];
    txtLastSeenLocation    =[[UITextField alloc]init];
    txtPrizeReward          =[[UITextField alloc]init];
    txtRewardInformation    =[[UITextField alloc]init];

    //delegate
    txtPinCode.delegate=self;
    txtParentsMobileNumber.delegate=self;
    txtIdentificationMark.delegate=self;
    txtHeight.delegate=self;
    txtWeight.delegate=self;
    txtColourOfEyes.delegate=self;
    txtColorOfHair.delegate=self;
    txtWearGlassOrContactLens.delegate=self;
    txtIsTheChild.delegate=self;
    txtComplaintDate.delegate=self;
    txtComplaintBy.delegate=self;
    txtLastSeenLocation.delegate=self;
    txtPrizeReward.delegate=self;
    txtRewardInformation.delegate=self;


    [Alert textFieldplaceholder:txtPinCode frame:cgFrame(xPos, 80, kSCREEN_WIDTH-40, heights) placeholder:@"Postalcode/Zipcode" textColor:txtColor font:ml16 bg:[UIColor colorWithRed: 238.0 / 255.0 green: 238.0 / 255.0 blue: 238.0/ 255.0 alpha : 1] cornerRadius:4 paddingValue:20 yesNo:YES];


    [Alert textFieldplaceholder:txtParentsMobileNumber frame:cgFrame(xPos, 80, kSCREEN_WIDTH-40, heights) placeholder:@"Parents Mobile Number" textColor:txtColor font:ml16 bg:[UIColor colorWithRed: 238.0 / 255.0 green: 238.0 / 255.0 blue: 238.0/ 255.0 alpha : 1] cornerRadius:4 paddingValue:20 yesNo:YES];



    [Alert textFieldplaceholder:txtIdentificationMark frame:cgFrame(20, txtParentsMobileNumber.frame.size.height + txtParentsMobileNumber.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Identification Mark" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];



    if (iPhoneVersion == 5)
    {
        [Alert textFieldplaceholder:txtHeight frame:cgFrame(20, txtIdentificationMark.frame.size.height + txtIdentificationMark.frame.origin.y + yPos, kSCREEN_WIDTH/2-30, heights) placeholder:@"Height(inches)" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:10 yesNo:YES];
        
        
        [Alert textFieldplaceholder:txtWeight frame:cgFrame(txtHeight.frame.size.width + txtHeight.frame.origin.x + 10, txtIdentificationMark.frame.size.height + txtIdentificationMark.frame.origin.y + yPos, kSCREEN_WIDTH/2-20, heights) placeholder:@"Weight(pounds)" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:10 yesNo:YES];
        
        
        
        [Alert textFieldplaceholder:txtColourOfEyes frame:cgFrame(20, txtWeight.frame.size.height + txtWeight.frame.origin.y + yPos, kSCREEN_WIDTH/2-30, heights) placeholder:@"Eye Color" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
        
        
        
        
        [Alert textFieldplaceholder:txtWearGlassOrContactLens frame:cgFrame(txtColourOfEyes.frame.size.width + txtColourOfEyes.frame.origin.x + 10, txtWeight.frame.size.height + txtWeight.frame.origin.y + yPos, kSCREEN_WIDTH/2-20, heights) placeholder:@"Hair Color" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
        

    }
    else
    {
    
    [Alert textFieldplaceholder:txtHeight frame:cgFrame(xPos, txtIdentificationMark.frame.size.height + txtIdentificationMark.frame.origin.y + yPos, 162.5, heights) placeholder:@"Height(inches)" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:10 yesNo:YES];


    [Alert textFieldplaceholder:txtWeight frame:cgFrame(txtHeight.frame.size.width + txtHeight.frame.origin.x + 10, txtIdentificationMark.frame.size.height + txtIdentificationMark.frame.origin.y + yPos, 162.5, heights) placeholder:@"Weight(pounds)" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:10 yesNo:YES];

        
        
        [Alert textFieldplaceholder:txtColourOfEyes frame:cgFrame(xPos, txtWeight.frame.size.height + txtWeight.frame.origin.y + yPos, 162.5, heights) placeholder:@"Eye Color" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
        
        
        
        
        [Alert textFieldplaceholder:txtWearGlassOrContactLens frame:cgFrame(txtColourOfEyes.frame.size.width + txtColourOfEyes.frame.origin.x + 10, txtWeight.frame.size.height + txtWeight.frame.origin.y + yPos, 162.5, heights) placeholder:@"Hair Color" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
        

    }
    
    
    
    
    
    


    


    [Alert textFieldplaceholder:txtIsTheChild frame:cgFrame(xPos, txtWearGlassOrContactLens.frame.size.height + txtWearGlassOrContactLens.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Is This Child?" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];





//    [Alert textFieldplaceholder:txtComplaintDate frame:cgFrame(xPos, txtIsTheChild.frame.size.height + txtIsTheChild.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Date Alert Issued" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    txtComplaintDate.delegate=self;
    NSString *maxDateStringDateOfDis = txtComplaintDate.text;
    NSDateFormatter *dateFormatterDateOfDis = [[NSDateFormatter alloc] init];
    //2015-01-20
    dateFormatterDateOfDis.dateFormat = @"yyyy-MM-dd";
    theMaximumDate = [dateFormatterDateOfDis dateFromString: maxDateStringDateOfDis];
    [datePicker setMaximumDate:theMaximumDate];
    [datePicker setMaximumDate:[NSDate date]];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    
    pickerToolbar = [[UIToolbar alloc] init];
    pickerToolbar.barStyle = UIBarStyleBlackTranslucent;
    [pickerToolbar sizeToFit];
    UIBarButtonItem *flexibleSpaceLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneClicked:)];
    [pickerToolbar setItems:[NSArray arrayWithObjects:flexibleSpaceLeft, doneButton, nil]];
    
    [datePicker addTarget:self action:@selector(updateTextFieldDateOfDisappearance:) forControlEvents:UIControlEventValueChanged];
    txtComplaintDate.inputAccessoryView = pickerToolbar;
    [txtComplaintDate setInputView:datePicker];


    txtPrizeReward.inputAccessoryView = pickerToolbar;

    [Alert textFieldplaceholder:txtComplaintBy frame:cgFrame(xPos, txtTheChildWasLastSeendWearing.frame.size.height + txtTheChildWasLastSeendWearing.frame.origin.y + yPos, kSCREEN_WIDTH-40, 45) placeholder:@"Alert Initiated by" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];

    [Alert textFieldplaceholder:txtLastSeenLocation frame:cgFrame(xPos, txtComplaintBy.frame.size.height + txtComplaintBy.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Last Seen Location" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];


    [Alert textFieldplaceholder:txtPrizeReward frame:cgFrame(xPos, txtLastSeenLocation.frame.size.height + txtLastSeenLocation.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Reward Offered" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];




    [Alert textFieldplaceholder:txtRewardInformation frame:cgFrame(xPos, txtPrizeReward.frame.size.height + txtPrizeReward.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Reward Information" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];


    btnDraft=[UIButton buttonWithType:UIButtonTypeCustom];
    btnDraft.frame=cgFrame(20, txtRewardInformation.frame.size.height + txtRewardInformation.frame.origin.y + yPos, kSCREEN_WIDTH/2-30, heights);
    
    [btnDraft setTitle:@"SAVE DETAILS" forState:UIControlStateNormal];
    btnDraft.titleLabel.font=ms16;
    btnDraft.layer.cornerRadius=4;
    btnDraft.clipsToBounds=YES;
    btnDraft .backgroundColor=[UIColor darkGrayColor];
    [btnDraft addTarget:self action:@selector(submitInDB:) forControlEvents:UIControlEventTouchUpInside];
    
    
    btnInitiateAlert=[UIButton buttonWithType:UIButtonTypeCustom];
    btnInitiateAlert.frame=cgFrame(btnDraft.frame.size.width + btnDraft.frame.origin.x + 10, txtRewardInformation.frame.size.height + txtRewardInformation.frame.origin.y + yPos, kSCREEN_WIDTH/2-20, heights);
    [btnInitiateAlert setTitle:@"INITIATE ALERT" forState:UIControlStateNormal];
    btnInitiateAlert.titleLabel.font=ms16;
    btnInitiateAlert.layer.cornerRadius=4;
    btnInitiateAlert.clipsToBounds=YES;
    btnInitiateAlert .backgroundColor=[UIColor blackColor];
    [btnInitiateAlert addTarget:self action:@selector(submitAddMissingChild:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //add subview
    //[viewOnScroll addSubview:txtPinCode];
    [viewOnScroll addSubview:txtParentsMobileNumber];
    [viewOnScroll addSubview:txtIdentificationMark];
    [viewOnScroll addSubview:txtHeight];
    [viewOnScroll addSubview:txtWeight];
    [viewOnScroll addSubview:txtColourOfEyes];
    [viewOnScroll addSubview:txtColorOfHair];
    [viewOnScroll addSubview:txtWearGlassOrContactLens];
    [viewOnScroll addSubview:txtIsTheChild];
    [viewOnScroll addSubview:txtComplaintDate];
    [viewOnScroll addSubview:txtComplaintBy];
    [viewOnScroll addSubview:txtLastSeenLocation];
    [viewOnScroll addSubview:txtPrizeReward];
    [viewOnScroll addSubview:txtRewardInformation];
    [viewOnScroll addSubview:btnDraft];
    [viewOnScroll addSubview:btnInitiateAlert];



    txtPinCode.keyboardAppearance = UIKeyboardAppearanceDark;
    txtLastSeenLocation.keyboardAppearance = UIKeyboardAppearanceDark;

    txtPinCode.keyboardType = UIKeyboardTypeNumberPad;


    txtParentsMobileNumber.keyboardAppearance = UIKeyboardAppearanceDark;
    txtParentsMobileNumber.keyboardType = UIKeyboardTypePhonePad;

    txtIdentificationMark.keyboardAppearance = UIKeyboardAppearanceDark;

    txtHeight.keyboardAppearance = UIKeyboardAppearanceDark;
    txtHeight.keyboardType = UIKeyboardTypePhonePad;

    txtWeight.keyboardAppearance = UIKeyboardAppearanceDark;
    txtWeight.keyboardType = UIKeyboardTypePhonePad;


    txtColourOfEyes.keyboardAppearance = UIKeyboardAppearanceDark;
    txtColorOfHair.keyboardAppearance = UIKeyboardAppearanceDark;
    txtWearGlassOrContactLens.keyboardAppearance = UIKeyboardAppearanceDark;
    txtIsTheChild.keyboardAppearance = UIKeyboardAppearanceDark;
    txtComplaintDate.keyboardAppearance = UIKeyboardAppearanceDark;
    txtComplaintBy.keyboardAppearance = UIKeyboardAppearanceDark;
    
    txtPrizeReward.keyboardAppearance = UIKeyboardAppearanceDark;
    txtPrizeReward.keyboardType = UIKeyboardTypePhonePad;
    
    txtRewardInformation.keyboardAppearance = UIKeyboardAppearanceDark;

    storSavedData = [arrShowSavedData objectAtIndex:0];

    if (storSavedData.pincode.length>0 && [storSavedData.pincode isEqualToString:@"NULL"] == FALSE)
    {

        txtPinCode.text = storSavedData.pincode;

    }

    if (storSavedData.parentsMobileNumber.length>0 && [storSavedData.parentsMobileNumber isEqualToString:@"NULL"] == FALSE)
    {

        txtParentsMobileNumber.text = storSavedData.parentsMobileNumber;

    }

    if (storSavedData.identificationMark.length>0 && [storSavedData.identificationMark isEqualToString:@"NULL"] == FALSE)
    {

        txtIdentificationMark.text = storSavedData.identificationMark;

    }

    if (storSavedData.eyeColor.length>0 && [storSavedData.eyeColor isEqualToString:@"NULL"] == FALSE)
    {

        txtColourOfEyes.text = storSavedData.eyeColor;

    }

    if (storSavedData.hairColor.length>0 && [storSavedData.hairColor isEqualToString:@"NULL"] == FALSE)
    {

        txtColorOfHair.text = storSavedData.hairColor;

    }

    if (storSavedData.complainedBy.length>0 && [storSavedData.complainedBy isEqualToString:@"NULL"] == FALSE)
    {

        txtComplaintBy.text = storSavedData.complainedBy;

    }

    if (storSavedData.complainedDate.length>0 && [storSavedData.complainedDate isEqualToString:@"NULL"] == FALSE)
    {

        txtComplaintDate.text = storSavedData.complainedDate;
        
    }

    if (storSavedData.height.length>0 && [storSavedData.height isEqualToString:@"NULL"] == FALSE)
    {

        txtHeight.text = storSavedData.height;

    }

    if (storSavedData.weight.length>0 && [storSavedData.weight isEqualToString:@"NULL"] == FALSE)
    
    {

        txtWeight.text = storSavedData.weight;

    }

    if (storSavedData.prizeReward.length>0 && [storSavedData.prizeReward isEqualToString:@"NULL"] == FALSE)
    {

        txtPrizeReward.text = storSavedData.prizeReward;

    }

    if (storSavedData.rewardInformation.length>0 && [storSavedData.rewardInformation isEqualToString:@"NULL"] == FALSE)
    {

        txtRewardInformation.text = storSavedData.rewardInformation;

    }

    if (storSavedData.isThisChild.length>0 && [storSavedData.isThisChild isEqualToString:@"NULL"] == FALSE)
    {

        txtIsTheChild.text = storSavedData.isThisChild;

    }

}

-(void)textFieldMethod
{


    int xPos = 20;

    int yPos = 8;

    int heights = 45;

    UIColor *txtColor=RGBc(104, 104, 104);
    UIColor *bgColor=RGBc(238, 238, 238);


//alloc
    txtPinCode                  =[[UITextField alloc]init];
    txtLastSeenLocation                  =[[UITextField alloc]init];
    txtParentsMobileNumber      =[[UITextField alloc]init];
    txtIdentificationMark       =[[UITextField alloc]init];
    txtHeight                   =[[UITextField alloc]init];
    txtWeight                   =[[UITextField alloc]init];
    txtColourOfEyes             =[[UITextField alloc]init];
    txtColorOfHair              =[[UITextField alloc]init];
    txtWearGlassOrContactLens   =[[UITextField alloc]init];
    txtIsTheChild               =[[UITextField alloc]init];
    txtComplaintDate            =[[UITextField alloc]init];
    txtComplaintBy              =[[UITextField alloc]init];
    txtPrizeReward              =[[UITextField alloc]init];
    txtRewardInformation        =[[UITextField alloc]init];

//delegate
    txtPinCode.delegate=self;
    txtParentsMobileNumber.delegate=self;
    txtLastSeenLocation.delegate=self;
    txtIdentificationMark.delegate=self;
    txtHeight.delegate=self;
    txtWeight.delegate=self;
    txtColourOfEyes.delegate=self;
    txtColorOfHair.delegate=self;
    txtWearGlassOrContactLens.delegate=self;
    txtIsTheChild.delegate=self;
    txtComplaintDate.delegate=self;
    txtComplaintBy.delegate=self;
    txtPrizeReward.delegate=self;
    txtRewardInformation.delegate=self;


    [Alert textFieldplaceholder:txtPinCode frame:cgFrame(xPos, 80, kSCREEN_WIDTH-40, heights) placeholder:@"Pin Code" textColor:txtColor font:ml16 bg:[UIColor colorWithRed: 238.0 / 255.0 green: 238.0 / 255.0 blue: 238.0/ 255.0 alpha : 1] cornerRadius:4 paddingValue:20 yesNo:YES];


    [Alert textFieldplaceholder:txtParentsMobileNumber frame:cgFrame(xPos, 80, kSCREEN_WIDTH-40, heights) placeholder:@"Parents Mobile Number" textColor:txtColor font:ml16 bg:[UIColor colorWithRed: 238.0 / 255.0 green: 238.0 / 255.0 blue: 238.0/ 255.0 alpha : 1] cornerRadius:4 paddingValue:20 yesNo:YES];


    [Alert textFieldplaceholder:txtIdentificationMark frame:cgFrame(20, txtParentsMobileNumber.frame.size.height + txtParentsMobileNumber.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Identification Mark" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];


    if (iPhoneVersion == 5)
    {
        [Alert textFieldplaceholder:txtHeight frame:cgFrame(20, txtIdentificationMark.frame.size.height + txtIdentificationMark.frame.origin.y + yPos, kSCREEN_WIDTH/2-30, heights) placeholder:@"Height(inches)" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
        
        
        [Alert textFieldplaceholder:txtWeight frame:cgFrame(txtHeight.frame.size.width + txtHeight.frame.origin.x + 10, txtIdentificationMark.frame.size.height + txtIdentificationMark.frame.origin.y + yPos, kSCREEN_WIDTH/2-20, heights) placeholder:@"Weight(pounds)" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:10 yesNo:YES];
        
        
        
        [Alert textFieldplaceholder:txtColourOfEyes frame:cgFrame(20, txtWeight.frame.size.height + txtWeight.frame.origin.y + yPos, kSCREEN_WIDTH/2-30, heights) placeholder:@"Eye Color" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:10 yesNo:YES];
        
        
        
        
        [Alert textFieldplaceholder:txtWearGlassOrContactLens frame:cgFrame(txtColourOfEyes.frame.size.width + txtColourOfEyes.frame.origin.x + 10, txtWeight.frame.size.height + txtWeight.frame.origin.y + yPos, kSCREEN_WIDTH/2-20, heights) placeholder:@"Hair Color" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
        
        
    }
    else
    {
        
        [Alert textFieldplaceholder:txtHeight frame:cgFrame(xPos, txtIdentificationMark.frame.size.height + txtIdentificationMark.frame.origin.y + yPos, 162.5, heights) placeholder:@"Height(inches)" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:10 yesNo:YES];
        
        
        [Alert textFieldplaceholder:txtWeight frame:cgFrame(txtHeight.frame.size.width + txtHeight.frame.origin.x + 10, txtIdentificationMark.frame.size.height + txtIdentificationMark.frame.origin.y + yPos, 162.5, heights) placeholder:@"Weight(pounds)" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:10 yesNo:YES];
        
        
        
        [Alert textFieldplaceholder:txtColourOfEyes frame:cgFrame(xPos, txtWeight.frame.size.height + txtWeight.frame.origin.y + yPos, 162.5, heights) placeholder:@"Eye Color" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
        
        
        
        
        [Alert textFieldplaceholder:txtWearGlassOrContactLens frame:cgFrame(txtColourOfEyes.frame.size.width + txtColourOfEyes.frame.origin.x + 10, txtWeight.frame.size.height + txtWeight.frame.origin.y + yPos, 162.5, heights) placeholder:@"Hair Color" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
        
        
    }
    

    
    
    [Alert textFieldplaceholder:txtIsTheChild frame:cgFrame(xPos, txtWearGlassOrContactLens.frame.size.height + txtWearGlassOrContactLens.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Is This Child?" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];


//    [Alert textFieldplaceholder:txtComplaintDate frame:cgFrame(xPos, txtIsTheChild.frame.size.height + txtIsTheChild.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Date Alert Issued" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];


    [Alert textFieldplaceholder:txtComplaintBy frame:cgFrame(xPos, txtTheChildWasLastSeendWearing.frame.size.height + txtTheChildWasLastSeendWearing.frame.origin.y + yPos, kSCREEN_WIDTH-40, 45) placeholder:@"Alert Initiated by" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    txtComplaintDate.delegate=self;
    NSString *maxDateStringDateOfDis = txtComplaintDate.text;
    NSDateFormatter *dateFormatterDateOfDis = [[NSDateFormatter alloc] init];
    //2015-01-20
    dateFormatterDateOfDis.dateFormat = @"yyyy-MM-dd";
    theMaximumDate = [dateFormatterDateOfDis dateFromString: maxDateStringDateOfDis];
    [datePicker setMaximumDate:theMaximumDate];
    [datePicker setMaximumDate:[NSDate date]];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    
    pickerToolbar = [[UIToolbar alloc] init];
    pickerToolbar.barStyle = UIBarStyleBlackTranslucent;
    [pickerToolbar sizeToFit];
    UIBarButtonItem *flexibleSpaceLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneClicked:)];
    [pickerToolbar setItems:[NSArray arrayWithObjects:flexibleSpaceLeft, doneButton, nil]];
    
    [datePicker addTarget:self action:@selector(updateTextFieldDateOfDisappearance:) forControlEvents:UIControlEventValueChanged];
    txtComplaintDate.inputAccessoryView = pickerToolbar;
    [txtComplaintDate setInputView:datePicker];



    [Alert textFieldplaceholder:txtLastSeenLocation frame:cgFrame(xPos, txtComplaintBy.frame.size.height + txtComplaintBy.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Last Seen Location" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    

    [Alert textFieldplaceholder:txtPrizeReward frame:cgFrame(xPos, txtLastSeenLocation.frame.size.height + txtLastSeenLocation.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Reward Offered" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];




    [Alert textFieldplaceholder:txtRewardInformation frame:cgFrame(xPos, txtPrizeReward.frame.size.height + txtPrizeReward.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Reward Information" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];



    btnDraft=[UIButton buttonWithType:UIButtonTypeCustom];
    btnDraft.frame=cgFrame(20, txtRewardInformation.frame.size.height + txtRewardInformation.frame.origin.y + yPos, kSCREEN_WIDTH/2-30, heights);
    
    [btnDraft setTitle:@"SAVE DETAILS" forState:UIControlStateNormal];
    btnDraft.titleLabel.font=ms16;
    btnDraft.layer.cornerRadius=4;
    btnDraft.clipsToBounds=YES;
    btnDraft .backgroundColor=[UIColor darkGrayColor];
    [btnDraft addTarget:self action:@selector(submitInDB:) forControlEvents:UIControlEventTouchUpInside];


    btnInitiateAlert=[UIButton buttonWithType:UIButtonTypeCustom];
    btnInitiateAlert.frame=cgFrame(btnDraft.frame.size.width + btnDraft.frame.origin.x + 10, txtRewardInformation.frame.size.height + txtRewardInformation.frame.origin.y + yPos, kSCREEN_WIDTH/2-20, heights);
    [btnInitiateAlert setTitle:@"INITIATE ALERT" forState:UIControlStateNormal];
    btnInitiateAlert.titleLabel.font=ms16;
    btnInitiateAlert.layer.cornerRadius=4;
    btnInitiateAlert.clipsToBounds=YES;
    btnInitiateAlert .backgroundColor=[UIColor blackColor];
    [btnInitiateAlert addTarget:self action:@selector(submitAddMissingChild:) forControlEvents:UIControlEventTouchUpInside];


//add subview
    //[viewOnScroll addSubview:txtPinCode];
    [viewOnScroll addSubview:txtParentsMobileNumber];
    [viewOnScroll addSubview:txtIdentificationMark];
    [viewOnScroll addSubview:txtHeight];
    [viewOnScroll addSubview:txtWeight];
    [viewOnScroll addSubview:txtColourOfEyes];
    [viewOnScroll addSubview:txtColorOfHair];
    [viewOnScroll addSubview:txtWearGlassOrContactLens];
    [viewOnScroll addSubview:txtIsTheChild];
    [viewOnScroll addSubview:txtComplaintDate];
    [viewOnScroll addSubview:txtComplaintBy];
    [viewOnScroll addSubview:txtPrizeReward];
    [viewOnScroll addSubview:txtRewardInformation];
    [viewOnScroll addSubview:txtLastSeenLocation];
    [viewOnScroll addSubview:btnDraft];
    [viewOnScroll addSubview:btnInitiateAlert];


    txtPinCode.keyboardAppearance = UIKeyboardAppearanceDark;
    txtPinCode.keyboardType = UIKeyboardTypeNumberPad;

    txtParentsMobileNumber.keyboardAppearance = UIKeyboardAppearanceDark;
    txtParentsMobileNumber.keyboardType = UIKeyboardTypePhonePad;

    txtIdentificationMark.keyboardAppearance = UIKeyboardAppearanceDark;

    txtHeight.keyboardAppearance = UIKeyboardAppearanceDark;
    txtHeight.keyboardType = UIKeyboardTypePhonePad;

    txtWeight.keyboardAppearance = UIKeyboardAppearanceDark;
    txtWeight.keyboardType = UIKeyboardTypePhonePad;

    txtColourOfEyes.keyboardAppearance = UIKeyboardAppearanceDark;
    txtColorOfHair.keyboardAppearance = UIKeyboardAppearanceDark;
    txtWearGlassOrContactLens.keyboardAppearance = UIKeyboardAppearanceDark;
    txtIsTheChild.keyboardAppearance = UIKeyboardAppearanceDark;
    txtComplaintDate.keyboardAppearance = UIKeyboardAppearanceDark;
    txtComplaintBy.keyboardAppearance = UIKeyboardAppearanceDark;
    
    txtPrizeReward.keyboardAppearance = UIKeyboardAppearanceDark;
    txtPrizeReward.keyboardType = UIKeyboardTypePhonePad;
    
    txtRewardInformation.keyboardAppearance = UIKeyboardAppearanceDark;
    
}


#pragma mark - date of disappearance
-(void)updateTextFieldDateOfDisappearance:(id)sender
{
    UIDatePicker *picker12 = (UIDatePicker*)txtComplaintDate.inputView;
    txtComplaintDate.text = [self formatDate:picker12.date];
}

- (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}



-(IBAction)submitInDB:(id)sender
{


    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];

    NSString *strLoginUserId=[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]];


//    DBManager* db = [[DBManager alloc] initWithDB:kDB_NAME];
//    [db createTableWithName:[NSString stringWithFormat:@"%@", kTABLE_NAME]];
//
//    StoreData * productData  = [[StoreData alloc]init];
//
//    productData.firstname                   = storSavedData.firstname;
//    productData.lastname                    = storSavedData.lastname;
//    productData.gender                      = storSavedData.gender;
//    productData.dob                         = storSavedData.dob;
//    productData.dateofdisappearance         = storSavedData.dateofdisappearance;
//    productData.placeofdisappearance        = storSavedData.placeofdisappearance;
//    productData.fathername                  = storSavedData.fathername;
//    productData.mothername                  = storSavedData.mothername;
//    productData.selectcountry               = storSavedData.selectcountry;
//    productData.selectcity                  = storSavedData.selectcity;
//    productData.selectstate                 = storSavedData.selectstate;
//
//    productData.pincode                     = txtPinCode.text;
//    productData.parentsMobileNumber         = txtParentsMobileNumber.text;
//    productData.userId                      = strLoginUserId;
//    productData.identificationMark          = txtIdentificationMark.text;
//    productData.height                      = txtHeight.text;
//    productData.weight                      = txtWeight.text;
//    productData.eyeColor                    = txtColourOfEyes.text;
//    productData.hairColor                   = txtColorOfHair.text;
//    productData.isThisChild                 = txtIsTheChild.text;
//    productData.complainedDate              = txtComplaintDate.text;
//    productData.complainedBy                = txtComplaintBy.text;
//    productData.prizeReward                 = txtPrizeReward.text;
//    productData.rewardInformation           = txtRewardInformation.text;
//
//
//
//    [db insertAndUpdateArrayUsingTrasaction:@[productData] tableName:[NSString stringWithFormat:@"%@", kTABLE_NAME]];
//
    
    [SVProgressHUD  showSuccessWithStatus:@"Your details has been saved"];
    
}

-(IBAction)submitAddMissingChild:(id)sender
{
    
    if ([txtParentsMobileNumber.text isEqualToString:@""])
    {
        [Alert svError:@"Parent's Mobile Number should not be empty"];
    }
    else
    if ([txtIdentificationMark.text isEqualToString:@""])
    {
        [Alert svError:@"Identification mark should not be empty"];
    }
    else if ([txtHeight.text isEqualToString:@""])
    {
        [Alert svError:@"Height should not be empty"];
    }
    else
    if ([txtWeight.text isEqualToString:@""])
    {
        [Alert svError:@"Weight should not be empty"];
    }
    else if ([txtColourOfEyes.text isEqualToString:@""])
    {
        [Alert svError:@"Color of eyes should not be empty"];
    }
    
//    else
//    if ([txtColorOfHair.text isEqualToString:@""])
//    {
//        [Alert svError:@"Color of hair should not be empty"];
//    }
    
    else if ([txtIsTheChild.text isEqualToString:@""])
    {
        [Alert svError:@"is the child should not be empty"];
    }
//    else
//    if ([txtComplaintDate.text isEqualToString:@""])
//    {
//        [Alert svError:@"Date Alert Issued should not be empty"];
//    }
    else if ([txtComplaintBy.text isEqualToString:@""])
    {
        [Alert svError:@"Alert Initiated by should not be empty"];
    }
    else if ([txtWeight.text isEqualToString:@"0"])
    {
        [Alert svError:@"Invalid weight"];
    }
    else if ([txtHeight.text isEqualToString:@"0"])
    {
        [Alert svError:@"Invalid height"];
    }
    else
    {
    
    [self addMissingChildFormSubmit];
        
    }
}

#pragma mark - final registration
-(void)addMissingChildFormSubmit
{
 
    [Alert svProgress:@"Please wait..."];
    
    
    NSString *strCurrentLat= [[NSUserDefaults standardUserDefaults]
                                    stringForKey:@"keyMyCurrentLat"];
    NSString *strCurrentLong = [[NSUserDefaults standardUserDefaults]
                                     stringForKey:@"keyMyCurrentLong"];
      
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    NSString *strLoginUserId=[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]];
    
    NSMutableDictionary* _params = [[NSMutableDictionary alloc] init];
    
    [_params setObject:strLoginUserId                   forKey:@"userId"];
    
    [_params setObject:[NSString stringWithFormat:@"%@",[dictGetDataFromFirstForm objectForKey:@"keyFullName"]]                              forKey:@"first_name"];
    
    [_params setObject:[NSString stringWithFormat:@"%@",[dictGetDataFromFirstForm objectForKey:@"keyLastName"]]                              forKey:@"last_name"];
    
    [_params setObject:[NSString stringWithFormat:@"%@",[dictGetDataFromFirstForm objectForKey:@"keyGender"]]                              forKey:@"gender"];
    
    [_params setObject:[NSString stringWithFormat:@"%@",[dictGetDataFromFirstForm objectForKey:@"keyCountry"]]                              forKey:@"country"];
    
    [_params setObject:[NSString stringWithFormat:@"%@",[dictGetDataFromFirstForm objectForKey:@"keyCity"]]                              forKey:@"city"];
    
    [_params setObject:[NSString stringWithFormat:@"%@",[dictGetDataFromFirstForm objectForKey:@"keyState"]]                              forKey:@"state"];
    
    [_params setObject:[NSString stringWithFormat:@"%@",[dictGetDataFromFirstForm objectForKey:@"keyPlaceOfDisapearance"]]                              forKey:@"place_disappearance"];
    
    [_params setObject:[NSString stringWithFormat:@"%@",[dictGetDataFromFirstForm objectForKey:@"keyFatherName"]]                              forKey:@"father_name"];
    [_params setObject:[NSString stringWithFormat:@"%@",[dictGetDataFromFirstForm objectForKey:@"keyMotheName"]]                              forKey:@"mother_name"];

    
    [_params setObject:[NSString stringWithFormat:@"%@",[dictGetDataFromFirstForm objectForKey:@"keyDob"]]                             forKey:@"date_of_birth"];
    
    [_params setObject:[NSString stringWithFormat:@"%@",[dictGetDataFromFirstForm objectForKey:@"keyDateOfDisappearance"]]                              forKey:@"date_of_disappearance"];
   
    [_params setObject:txtParentsMobileNumber.text      forKey:@"parents_mobile_number"];
    
    [_params setObject:txtIdentificationMark.text       forKey:@"identification_marks"];
    
    [_params setObject:txtHeight.text                   forKey:@"height"];
    
    [_params setObject:txtWeight.text                   forKey:@"weight"];
    
    [_params setObject:txtColourOfEyes.text             forKey:@"color_of_eyes"];
    
    [_params setObject:txtColorOfHair.text              forKey:@"color_of_hair"];
    
    [_params setObject:@"no"                            forKey:@"is_wear_glasses_lens"];
    
    [_params setObject:txtIsTheChild.text               forKey:@"is_the_child_lost_reason"];
    
    [_params setObject:txtAnySuspicion.text             forKey:@"any_suspicion"];
    
    [_params setObject:txtTheChildWasLastSeendWearing.text  forKey:@"last_seen_wearing"];
    
    [_params setObject:txtComplaintDate.text            forKey:@"complaint_date"];
    
    [_params setObject:txtComplaintBy.text              forKey:@"complained_by"];
    
    [_params setObject:Address                            forKey:@"address"];
    
    [_params setObject:txtLastSeenLocation.text              forKey:@"last_seen_location"];
    
    [_params setObject:strCurrentLat                             forKey:@"latitude"];
    
    [_params setObject:strCurrentLong                        forKey:@"longitude"];
    
    [_params setObject:@"addMissingChild"               forKey:@"action"];
    
    NSLog(@"_params===%@",_params);
    
    NSString *BoundaryConstant = @"----------V2ymHFg03ehbqgZCaKO6jy";
    NSString* FileParamConstant = @"image";
    
    
    
    NSURL* requestURL = [NSURL URLWithString:BaseURLOfOWL];
    
    
    // create request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setHTTPShouldHandleCookies:NO];
    [request setTimeoutInterval:30];
    [request setHTTPMethod:@"POST"];
    
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", BoundaryConstant];
    [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    // post body
    NSMutableData *body = [NSMutableData data];
    
    // add params (all params are strings)
    for (NSString *param in _params)
    {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@\r\n", [_params objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    // add image data
    if (imageDatas)
    {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.jpg\"\r\n", FileParamConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageDatas];
        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // setting the body of the post to the reqeust
    [request setHTTPBody:body];
    
    // set the content-length
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[body length]];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    // set URL
    [request setURL:requestURL];
    
    NSURLResponse *response = nil;
    NSError *requestError = nil;
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&requestError];
    
    if (requestError == nil)
    {
        
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&requestError];
        
        if ([[json objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
        {
            
            [Alert svSuccess:@"Done"];
            

                UIStoryboard *Sty=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
                DashboardVC *ds=[Sty instantiateViewControllerWithIdentifier:@"DashboardVCId"];
                [self.navigationController pushViewController:ds animated:YES];

            
        }
        else
        {
            [Alert svError:somethingIssue];
            NSLog(@"why?====%@",requestError.description);
        }
    }
}




- (NSString *)formatNumber:(NSString *)mobileNumber
{
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    
    int length = (int)[mobileNumber length];
    if(length > 10)
    {
        mobileNumber = [mobileNumber substringFromIndex: length-10];
        
    }
    
    return mobileNumber;
}

- (int)getLength:(NSString *)mobileNumber
{
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    int length = (int)[mobileNumber length];
    
    return length;
}



@end
