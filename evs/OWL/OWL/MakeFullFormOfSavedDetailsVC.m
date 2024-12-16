//
//  MakeFullFormOfSavedDetailsVC.m
//  OWL
//
//  Created by Apple on 9/13/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "MakeFullFormOfSavedDetailsVC.h"
#import "camera.h"
#import "Alert.h"

@interface MakeFullFormOfSavedDetailsVC ()
{
    NSString *Address;
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
    
    
    UIScrollView *scrolViewFull;
    
    UIPickerView *pickerGender;
    UIToolbar *pickerToolbar;
    
    NSData *imageDatas;
    UIImage *image ;
    
    UIView *viewOnScroll;
    
    UIDatePicker *datePicker;
    NSDate *theMaximumDate;
    
    IBOutlet UIImageView *imgProfilePicture;
    
    UIDatePicker *timePicker;
    NSDate *theMaximumtime;
    
    
   // NSData *imageData;
    
    NSMutableArray *arrCountryData, *arrCountryDataShow, *arrStateData, *arrStateDataShow, *arrCityData, *arrCityDataShow;
    
    UIImage *picture;
    
    
}
@property (strong, nonatomic)NSMutableArray *arrIsThe;

@property (strong, nonatomic)NSMutableArray *arrGender;
@property (strong, nonatomic)NSMutableArray *arrIsTheChild;

@property (strong, nonatomic)NSMutableArray *cardsArray;
@property (strong, nonatomic)NSMutableArray *cardsArrayId;

@property (strong, nonatomic)NSMutableArray *arrState;
@property (strong, nonatomic)NSMutableArray *arrStateId;

@property (strong, nonatomic)NSMutableArray *arrCity;
@property (strong, nonatomic)NSMutableArray *arrCityId;

@property (strong, nonatomic)NSMutableArray *arrColorOfHair;
@property (strong, nonatomic)NSMutableArray *arrColorOfEye;

@property (strong, nonatomic)NSMutableArray *arrLensYesOrNo;


@end

@implementation MakeFullFormOfSavedDetailsVC
@synthesize strDelegateOrNot;
@synthesize dictGetAllValueOfClickedSavedChild;
- (void)viewDidLoad
{
    [super viewDidLoad];

    //NSLog(@"dictGetAllValueOfClickedSavedChild==%@",dictGetAllValueOfClickedSavedChild);
    
    arrCountryData = [[NSMutableArray alloc]initWithCapacity:0];
    arrStateData = [[NSMutableArray alloc]initWithCapacity:0];
    arrCityData = [[NSMutableArray alloc]initWithCapacity:0];
    arrCountryDataShow = [[NSMutableArray alloc]initWithCapacity:0];
    arrStateDataShow = [[NSMutableArray alloc]initWithCapacity:0];
    arrCityDataShow = [[NSMutableArray alloc]initWithCapacity:0];
    _arrColorOfHair = [[NSMutableArray alloc]initWithCapacity:0];
    _arrColorOfEye = [[NSMutableArray alloc]initWithCapacity:0];
    _arrLensYesOrNo = [[NSMutableArray alloc]initWithCapacity:0];
    
    _cardsArray=[[NSMutableArray alloc]init];
    _cardsArrayId=[[NSMutableArray alloc]init];
    
    _arrState=[[NSMutableArray alloc]init];
    _arrStateId=[[NSMutableArray alloc]init];
    
    _arrCity=[[NSMutableArray alloc]init];
    _arrCityId=[[NSMutableArray alloc]init];
    
    txtCountry.delegate=self;
    txtState.delegate=self;
    
    Address = @"";
    
    [self allTextFieldsMakeFulForm];
}

#pragma mark - compress , map
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"Saved Child Details"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(sideBarMenuOfAddMissingChildEmpty)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    
}

-(void)sideBarMenuOfAddMissingChildEmpty
{
    goBackDR
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

-(void)allTextFieldsMakeFulForm
{
    [self countryWebService];
    
    
    self.view.backgroundColor=White;
    
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
    
    imgBGTSP.image = [UIImage imageNamed:@"tps"];
    [self.view addSubview:imgBGTSP];
    scrolViewFull=[[UIScrollView alloc]initWithFrame:cgFrame(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrolViewFull.backgroundColor = Clear;
    [self.view addSubview:scrolViewFull];
    
    viewOnScroll=[[UIView alloc]initWithFrame:cgFrame(0, 0, self.view.frame.size.width, self.view.frame.size.height+1700)];
    //viewOnScroll.backgroundColor=Blue;
    [scrolViewFull addSubview:viewOnScroll];
    
    self.arrGender=[[NSMutableArray alloc] initWithObjects:@"Male",@"Female", nil];
    
    self.arrLensYesOrNo=[[NSMutableArray alloc] initWithObjects:@"Yes",@"No", nil];
    
    self.arrIsTheChild=[[NSMutableArray alloc] initWithObjects:@"Lost",@"Missing",@"Runaway",@"Others", nil];
    
    
    
    int xPos = 20;
    
    int yPos = 8;
    
    int heights = 45;
    
    UIColor *txtColor=RGBc(104, 104, 104);
    UIColor *bgColor=RGBc(238, 238, 238);
    
    txtFirstName            =[[UITextField alloc]init];
    imgVieww                =[[UIImageView alloc]init];
    txtLastName             =[[UITextField alloc]init];
    txtAddPicture           =[[UITextField alloc]init];
    txtGender               =[[UITextField alloc]init];
    txtDOB                  =[[UITextField alloc]init];
    txtDateOfDisapearance   =[[UITextField alloc]init];
    txtPlaceOfDisapearance  =[[UITextField alloc]init];
    txtFatherName           =[[UITextField alloc]init];
    txtMotherName           =[[UITextField alloc]init];
    txtCountry              =[[UITextField alloc]init];
    txtState                =[[UITextField alloc]init];
    txtCity                 =[[UITextField alloc]init];
    txtPinOrZipCode         =[[UITextField alloc]init];
    txtAddress =[[UITextField alloc]init];
    
    txtPinOrZipCode.keyboardType=UIKeyboardTypeNumbersAndPunctuation;
    
    //delegate
    txtFirstName.delegate=self;
    txtLastName.delegate=self;
    txtAddPicture.delegate=self;
    txtGender.delegate=self;
    txtDOB.delegate=self;
    txtDateOfDisapearance.delegate=self;
    txtPlaceOfDisapearance.delegate=self;
    txtFatherName.delegate=self;
    txtMotherName.delegate=self;
    txtCountry.delegate=self;
    txtState.delegate=self;
    txtCity.delegate=self;
    txtPinOrZipCode.delegate=self;
    txtAddress.delegate=self;
    
    
    txtPinCode                          =[[UITextField alloc]init];
    txtLastSeenLocation                 =[[UITextField alloc]init];
    txtParentsMobileNumber              =[[UITextField alloc]init];
    txtIdentificationMark               =[[UITextField alloc]init];
    txtHeight                           =[[UITextField alloc]init];
    txtWeight                           =[[UITextField alloc]init];
    txtColourOfEyes                     =[[UITextField alloc]init];
    txtColorOfHair                      =[[UITextField alloc]init];
    txtWearGlassOrContactLens           =[[UITextField alloc]init];
    txtTheChildWasLastSeendWearing      =[[UITextField alloc]init];
    txtAnySuspicion                     =[[UITextField alloc]init];
    txtIsTheChild                       =[[UITextField alloc]init];
    txtComplaintDate                    =[[UITextField alloc]init];
    txtComplaintBy                      =[[UITextField alloc]init];
    txtPrizeReward                      =[[UITextField alloc]init];
    txtRewardInformation                =[[UITextField alloc]init];
    
    //delegate
    txtTheChildWasLastSeendWearing.delegate=self;
    txtWearGlassOrContactLens.delegate=self;
    txtAnySuspicion.delegate=self;
    txtPinCode.delegate=self;
    txtParentsMobileNumber.delegate=self;
    txtLastSeenLocation.delegate=self;
    txtIdentificationMark.delegate=self;
    txtHeight.delegate=self;
    txtWeight.delegate=self;
    txtColourOfEyes.delegate=self;
    txtColorOfHair.delegate=self;
    txtWearGlassOrContactLens.delegate=self;
    txtTheChildWasLastSeendWearing.delegate=self;
    txtIsTheChild.delegate=self;
    txtComplaintDate.delegate=self;
    txtComplaintBy.delegate=self;
    txtPrizeReward.delegate=self;
    txtRewardInformation.delegate=self;
    
     NSDateFormatter *dateFormatterDateOfDis2 = [[NSDateFormatter alloc] init];
    NSDateFormatter *dateFormatterDateOfDis = [[NSDateFormatter alloc] init];
    
    
    [Alert textFieldplaceholder:txtFirstName frame:cgFrame(20, 80, kSCREEN_WIDTH/2-30, heights) placeholder:@"First Name" textColor:txtColor font:ml16 bg:[UIColor colorWithRed: 238.0 / 255.0 green: 238.0 / 255.0 blue: 238.0/ 255.0 alpha : 1] cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    [Alert textFieldplaceholder:txtLastName frame:cgFrame(txtFirstName.frame.size.width + txtFirstName.frame.origin.x + 10, 80, kSCREEN_WIDTH/2-20, heights) placeholder:@"Last Name" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    [Alert textFieldplaceholder:txtAddPicture frame:cgFrame(xPos, txtFirstName.frame.size.height + txtFirstName.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Add Picture" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    imgProfilePicture = [[UIImageView alloc]initWithFrame:CGRectMake(txtAddPicture.frame.size.width-55, 0, 45, 45)];
    imgProfilePicture.contentMode = UIViewContentModeScaleAspectFit;
    [txtAddPicture addSubview:imgProfilePicture];
    
    
    [Alert textFieldplaceholder:txtGender frame:cgFrame(xPos, txtAddPicture.frame.size.height + txtAddPicture.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Gender" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    [Alert textFieldplaceholder:txtDOB frame:cgFrame(xPos, txtGender.frame.size.height + txtGender.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Date of Birth" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    txtDOB.delegate=self;
    NSString *maxDateString = txtDOB.text;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    theMaximumDate = [dateFormatter dateFromString: maxDateString];
    [datePicker setMaximumDate:theMaximumDate];
    [datePicker setMaximumDate:[NSDate date]];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    [txtDOB setInputView:datePicker];
    
    
    
   
    
    [Alert textFieldplaceholder:txtFatherName frame:cgFrame(xPos, txtDOB.frame.size.height + txtDOB.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Father's name" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    [Alert textFieldplaceholder:txtMotherName frame:cgFrame(xPos, txtFatherName.frame.size.height + txtFatherName.frame.origin.y + yPos, kSCREEN_WIDTH-40, 45) placeholder:@"Mother's name" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    [Alert textFieldplaceholder:txtAddress frame:cgFrame(xPos, txtMotherName.frame.size.height + txtMotherName.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Address" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    [Alert textFieldplaceholder:txtCountry frame:cgFrame(xPos, txtAddress.frame.size.height + txtAddress.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Select Country" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    [Alert textFieldplaceholder:txtState frame:cgFrame(xPos, txtCountry.frame.size.height + txtCountry.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Select State" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    [Alert textFieldplaceholder:txtCity frame:cgFrame(xPos, txtState.frame.size.height + txtState.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Select City" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    [Alert textFieldplaceholder:txtPinOrZipCode frame:cgFrame(xPos, txtCity.frame.size.height + txtCity.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Postal code/Zip code" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    [Alert textFieldplaceholder:txtParentsMobileNumber frame:cgFrame(xPos, txtPinOrZipCode.frame.size.height + txtPinOrZipCode.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Parents Mobile Number" textColor:txtColor font:ml16 bg:[UIColor colorWithRed: 238.0 / 255.0 green: 238.0 / 255.0 blue: 238.0/ 255.0 alpha : 1] cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    [Alert textFieldplaceholder:txtIdentificationMark frame:cgFrame(20, txtParentsMobileNumber.frame.size.height + txtParentsMobileNumber.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Identification Mark" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    if (iPhoneVersion == 5)
    {
        [Alert textFieldplaceholder:txtHeight frame:cgFrame(20, txtIdentificationMark.frame.size.height + txtIdentificationMark.frame.origin.y + yPos, kSCREEN_WIDTH/2-30, heights) placeholder:@"Height(inches)" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
        
        
        [Alert textFieldplaceholder:txtWeight frame:cgFrame(txtHeight.frame.size.width + txtHeight.frame.origin.x + 10, txtIdentificationMark.frame.size.height + txtIdentificationMark.frame.origin.y + yPos, kSCREEN_WIDTH/2-20, heights) placeholder:@"Weight(pounds)" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:10 yesNo:YES];
        
        
        
        [Alert textFieldplaceholder:txtColourOfEyes frame:cgFrame(20, txtWeight.frame.size.height + txtWeight.frame.origin.y + yPos, kSCREEN_WIDTH/2-30, heights) placeholder:@"Eye Color" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:10 yesNo:YES];
        
        
        
        [Alert textFieldplaceholder:txtColorOfHair frame:cgFrame(txtColourOfEyes.frame.size.width + txtColourOfEyes.frame.origin.x + 10, txtWeight.frame.size.height + txtWeight.frame.origin.y + yPos, kSCREEN_WIDTH/2-20, heights) placeholder:@"Hair color" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
        
        
        
    }
    else
    {
        
        [Alert textFieldplaceholder:txtHeight frame:cgFrame(xPos, txtIdentificationMark.frame.size.height + txtIdentificationMark.frame.origin.y + yPos, 162.5, heights) placeholder:@"Height(inches)" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:10 yesNo:YES];
        
        
        [Alert textFieldplaceholder:txtWeight frame:cgFrame(txtHeight.frame.size.width + txtHeight.frame.origin.x + 10, txtIdentificationMark.frame.size.height + txtIdentificationMark.frame.origin.y + yPos, 162.5, heights) placeholder:@"Weight(pounds)" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:10 yesNo:YES];
        
        
        
        [Alert textFieldplaceholder:txtColourOfEyes frame:cgFrame(xPos, txtWeight.frame.size.height + txtWeight.frame.origin.y + yPos, 162.5, heights) placeholder:@"Eye Color" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
        
        
        
        
        
        [Alert textFieldplaceholder:txtColorOfHair frame:cgFrame(txtColourOfEyes.frame.size.width + txtColourOfEyes.frame.origin.x + 10, txtWeight.frame.size.height + txtWeight.frame.origin.y + yPos, kSCREEN_WIDTH/2-20, heights) placeholder:@"Hair color" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
        
    }
    
    [Alert textFieldplaceholder:txtWearGlassOrContactLens frame:cgFrame(xPos, txtColourOfEyes.frame.size.height + txtColourOfEyes.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Wear glasses or contact lens" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    [Alert textFieldplaceholder:txtIsTheChild frame:cgFrame(xPos, txtWearGlassOrContactLens.frame.size.height + txtWearGlassOrContactLens.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Is This Child?" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    [Alert textFieldplaceholder:txtAnySuspicion frame:cgFrame(xPos, txtIsTheChild.frame.size.height + txtIsTheChild.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Any Suspicion/ Specific Details" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    [Alert textFieldplaceholder:txtTheChildWasLastSeendWearing frame:cgFrame(xPos, txtAnySuspicion.frame.size.height + txtAnySuspicion.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Child was last seen wearing" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
//    [Alert textFieldplaceholder:txtComplaintDate frame:cgFrame(xPos, txtTheChildWasLastSeendWearing.frame.size.height + txtTheChildWasLastSeendWearing.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Date Alert Issued" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    txtComplaintDate.delegate=self;
    NSString *maxDateStringDateOfDisss = txtComplaintDate.text;
    NSDateFormatter *dateFormatterDateOfDisss = [[NSDateFormatter alloc] init];
    //2015-01-20
    dateFormatterDateOfDis.dateFormat = @"yyyy-MM-dd";
    theMaximumDate = [dateFormatterDateOfDisss dateFromString: maxDateStringDateOfDisss];
    [datePicker setMaximumDate:theMaximumDate];
    [datePicker setMaximumDate:[NSDate date]];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    
    pickerToolbar = [[UIToolbar alloc] init];
    pickerToolbar.barStyle = UIBarStyleBlackTranslucent;
    [pickerToolbar sizeToFit];
    UIBarButtonItem *flexibleSpaceLefts = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem* doneButtons = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneClicked:)];
    [pickerToolbar setItems:[NSArray arrayWithObjects:flexibleSpaceLefts, doneButtons, nil]];
    [datePicker addTarget:self action:@selector(updateTextFieldDateOfDisappearances:) forControlEvents:UIControlEventValueChanged];
    txtComplaintDate.inputAccessoryView = pickerToolbar;
    [txtComplaintDate setInputView:datePicker];
    
    
    
    [Alert textFieldplaceholder:txtComplaintBy frame:cgFrame(xPos, txtTheChildWasLastSeendWearing.frame.size.height + txtTheChildWasLastSeendWearing.frame.origin.y + yPos, kSCREEN_WIDTH-40, 45) placeholder:@"Alert Initiated by" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    
    
    [Alert textFieldplaceholder:txtLastSeenLocation frame:cgFrame(xPos, txtComplaintBy.frame.size.height + txtComplaintBy.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Last Seen Location" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    [Alert textFieldplaceholder:txtDateOfDisapearance frame:cgFrame(xPos, txtLastSeenLocation.frame.size.height + txtLastSeenLocation.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Date Of Disappearance " textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    txtDateOfDisapearance.delegate=self;
    NSString *maxDateStringDateOfDis = txtDateOfDisapearance.text;
    
    //2015-01-20
    dateFormatterDateOfDis.dateFormat = @"yyyy-MM-dd";
    theMaximumDate = [dateFormatterDateOfDis dateFromString: maxDateStringDateOfDis];
    [datePicker setMaximumDate:theMaximumDate];
    [datePicker setMaximumDate:[NSDate date]];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    [datePicker addTarget:self action:@selector(updateTextFieldDateOfDisappearance:) forControlEvents:UIControlEventValueChanged];
    [txtDateOfDisapearance setInputView:datePicker];
    
    
    
    [Alert textFieldplaceholder:txtPlaceOfDisapearance frame:cgFrame(xPos, txtDateOfDisapearance.frame.size.height + txtDateOfDisapearance.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Time of Disappearnce" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    timePicker = [[UIDatePicker alloc]init];
    [timePicker setDate:[NSDate date]];
    txtPlaceOfDisapearance.delegate=self;
    NSString *maxDateStringDateOfDis2 = txtPlaceOfDisapearance.text;
    
    //2015-01-20
    dateFormatterDateOfDis2.dateFormat = @"hh:mm a";
    theMaximumtime = [dateFormatterDateOfDis2 dateFromString: maxDateStringDateOfDis2];
    //    [timePicker setMaximumDate:theMaximumtime];
    //    [timePicker setMaximumDate:[NSDate date]];
    [timePicker setDatePickerMode:UIDatePickerModeTime];
    [timePicker addTarget:self action:@selector(updateTextFieldTimeOfDisappearance:) forControlEvents:UIControlEventValueChanged];
    [txtPlaceOfDisapearance setInputView:timePicker];
    
    
    
    
    
    [Alert textFieldplaceholder:txtPrizeReward frame:cgFrame(xPos, txtPlaceOfDisapearance.frame.size.height + txtPlaceOfDisapearance.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Reward Offered" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    [Alert textFieldplaceholder:txtRewardInformation frame:cgFrame(xPos, txtPrizeReward.frame.size.height + txtPrizeReward.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Reward Information" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    btnSubmit=[UIButton buttonWithType:UIButtonTypeCustom];
    //btnSubmit.frame.size.width + btnSubmit.frame.origin.x + 10, txtRewardInformation.frame.size.height + txtRewardInformation.frame.origin.y + yPos, kSCREEN_WIDTH/2-20, heights
    btnSubmit.frame=cgFrame(20, txtRewardInformation.frame.size.height + txtRewardInformation.frame.origin.y + yPos, kSCREEN_WIDTH/2-30, heights);
    
    [btnSubmit setTitle:@"SAVE DETAILS" forState:UIControlStateNormal];
    btnSubmit.titleLabel.font=ms16;
    btnSubmit.layer.cornerRadius=4;
    btnSubmit.clipsToBounds=YES;
    btnSubmit .backgroundColor=[UIColor blackColor];
    [btnSubmit addTarget:self action:@selector(whenUserClickSaveDraft) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    btnDraft=[UIButton buttonWithType:UIButtonTypeCustom];
    
    btnDraft.frame=cgFrame(btnSubmit.frame.size.width + btnSubmit.frame.origin.x + 10, txtRewardInformation.frame.size.height + txtRewardInformation.frame.origin.y + yPos, kSCREEN_WIDTH/2-20, heights);
    
    [btnDraft setTitle:@"INITIATE ALERT" forState:UIControlStateNormal];
    btnDraft.titleLabel.font=ms16;
    btnDraft.layer.cornerRadius=4;
    btnDraft.clipsToBounds=YES;
    btnDraft .backgroundColor=[UIColor blackColor];
    [btnDraft addTarget:self action:@selector(submitAddMissingChildForm) forControlEvents:UIControlEventTouchUpInside];
    
    
    //add subview
    [viewOnScroll addSubview:txtFirstName];
    [viewOnScroll addSubview:txtLastName];
    [viewOnScroll addSubview:txtAddPicture];
    [viewOnScroll addSubview:txtGender];
    [viewOnScroll addSubview:txtDOB];
    [viewOnScroll addSubview:txtDateOfDisapearance];
    [viewOnScroll addSubview:txtPlaceOfDisapearance];
    [viewOnScroll addSubview:txtFatherName];
    [viewOnScroll addSubview:txtMotherName];
    [viewOnScroll addSubview:txtAddress];
    [viewOnScroll addSubview:txtCountry];
    [viewOnScroll addSubview:txtState];
    [viewOnScroll addSubview:txtCity];
    
    [viewOnScroll addSubview:btnSubmit];
    [viewOnScroll addSubview:btnDraft];
    [viewOnScroll addSubview:txtPinOrZipCode];
    [viewOnScroll addSubview:txtParentsMobileNumber];
    [viewOnScroll addSubview:txtIdentificationMark];
    [viewOnScroll addSubview:txtHeight];
    [viewOnScroll addSubview:txtWeight];
    [viewOnScroll addSubview:txtColourOfEyes];
    [viewOnScroll addSubview:txtColorOfHair];
    [viewOnScroll addSubview:txtWearGlassOrContactLens];
    [viewOnScroll addSubview:txtAnySuspicion];
    [viewOnScroll addSubview:txtTheChildWasLastSeendWearing];
    [viewOnScroll addSubview:txtIsTheChild];
    [viewOnScroll addSubview:txtComplaintDate];
    [viewOnScroll addSubview:txtComplaintBy];
    [viewOnScroll addSubview:txtPrizeReward];
    [viewOnScroll addSubview:txtRewardInformation];
    [viewOnScroll addSubview:txtLastSeenLocation];
    [viewOnScroll addSubview:btnSubmit];
    [viewOnScroll addSubview:btnDraft];
    
    
    
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
    txtAddress.keyboardAppearance = UIKeyboardAppearanceDark;
    
    txtPrizeReward.keyboardAppearance = UIKeyboardAppearanceDark;
    txtPrizeReward.keyboardType = UIKeyboardTypePhonePad;
    
    txtRewardInformation.keyboardAppearance = UIKeyboardAppearanceDark;
    
    [self serverDataFetch];
}

-(void)serverDataFetch
{
    
    txtFirstName.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"first_name"]];
    txtLastName.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"last_name"]];
   
    [imgProfilePicture sd_setImageWithURL:[NSURL URLWithString:[dictGetAllValueOfClickedSavedChild objectForKey:@"image"]] placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
    
    imageDatas = [self compressImage:imgProfilePicture.image];

    
    txtGender.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"gender"]];
    txtDOB.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"date_of_birth"]];//dob
    txtDateOfDisapearance.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"date_of_disappearance"]];//date of disappearnce
    txtPlaceOfDisapearance.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"place_disappearance"]];//time of disappearance
    txtFatherName.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"father_name"]];//father's name
    txtMotherName.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"mother_name"]];//mother's name
    txtCountry.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"country"]];//country
    
    txtState.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"state"]];//state
   
    txtCity.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"city"]];//city
    txtAddress.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"address"]];
    txtPinOrZipCode.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"pincode"]];//city
    
    txtParentsMobileNumber.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"parents_mobile_number"]];//city
    
    txtIdentificationMark.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"identification_marks"]];//city
    
    txtHeight.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"height"]];//city
    
    txtWeight.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"weight"]];//weight
    
    txtColourOfEyes.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"color_of_eyes"]];//color of eye
    
    txtColorOfHair.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"color_of_hair"]];//color of hair
    
    txtIsTheChild.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"is_the_child_lost_reason"]];//is the child
    
    txtComplaintDate.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"complaint_date"]];//complaint date
    
    txtComplaintBy.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"complained_by"]];//complaint by
    
    txtLastSeenLocation.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"last_seen_location"]];//last seen location
    
    txtPrizeReward.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"prize_money"]];//prize money
    
    txtRewardInformation.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"prize_msg"]];//prize message

    txtWearGlassOrContactLens.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"is_wear_glasses_lens"]];//prize message
    
    txtAnySuspicion.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"any_suspicion"]];//prize message

    txtTheChildWasLastSeendWearing.text=[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"last_seen_wearing"]];//prize message

}

#pragma mark - country , state , city

#pragma mark - country
-(void)countryWebService
{
    
    [SVProgressHUD showWithStatus:pleaseWait maskType:SVProgressHUDMaskTypeBlack];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{
                                 @"action": @"country"
                                 };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSDictionary *dictPhotographerLogin=responseObject;
         
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]== TRUE)
         {
             [SVProgressHUD dismiss];
             
             [[NSUserDefaults standardUserDefaults] setObject:dictPhotographerLogin forKey:@"keyAllDataOfLoginUser"];
             
             for (NSInteger i=0; i<[[dictPhotographerLogin objectForKey:@"response"]count]; i++)
             {
                 
                 NSString *strname =[[[dictPhotographerLogin objectForKey:@"response"]objectAtIndex:i] objectForKey:@"name"];
                 
                 NSString *strId =[[[dictPhotographerLogin objectForKey:@"response"]objectAtIndex:i] objectForKey:@"id"];
                 
                 [self.cardsArray addObject:strname];
                 [self.cardsArrayId addObject:strId];
                 
             }
             
             if(![txtCountry.text  isEqual: @""])
             {
                 for(int i=0;i<_cardsArray.count;i++)
                 {
                     if(txtCountry.text == _cardsArray[i])
                     {
                         [self stateWebService:_cardsArrayId[i]];
                     }
                 }
                 
             }
             
             [self->pickerGender reloadAllComponents];
             
             [self webserviceToGetColorOfHairColorOfEye];
             
         }
         else
         {
             NSLog(@"nopes");
             
             [SVProgressHUD showErrorWithStatus:[dictPhotographerLogin objectForKey:@"msg"] maskType:SVProgressHUDMaskTypeBlack];
             
         }
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
         
         //[self.navigationController popViewControllerAnimated:YES];
         
     }];
    
}

#pragma mark - state
-(void)stateWebService : (NSString *)getCountryId
{
    _arrState=nil;
    _arrStateId=nil;
    
    _arrState=[[NSMutableArray alloc]initWithCapacity:0];
    _arrStateId=[[NSMutableArray alloc]initWithCapacity:0];
    
    [SVProgressHUD showWithStatus:@"Fetching state..." maskType:SVProgressHUDMaskTypeBlack];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{
                                 @"action": @"state",
                                 @"countryId" : getCountryId
                                 };
    
    NSLog(@"parameters-------%@",parameters);
    
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]== TRUE)
             
         {
             [SVProgressHUD dismiss];
             
             for (NSInteger i=0; i<[[dictPhotographerLogin objectForKey:@"response"]count]; i++)
             {
                 
                 NSString *strname =[[[dictPhotographerLogin objectForKey:@"response"]objectAtIndex:i] objectForKey:@"name"];
                 
                 NSString *strId =[[[dictPhotographerLogin objectForKey:@"response"]objectAtIndex:i] objectForKey:@"id"];
                 
                 [self.arrState addObject:strname];
                 [self.arrStateId addObject:strId];
                 
             }
             
             
             if(![txtState.text  isEqual: @""])
             {
                 for(int i=0;i<_arrState.count;i++)
                 {
                     if(txtCountry.text == _arrState[i])
                     {
                         [self cityWebService:_arrStateId[i]];
                     }
                 }
                 
             }
             [self->pickerGender reloadAllComponents];
             
             
             
             //             txtState.text=[NSString stringWithFormat:@"%@",[[[dictPhotographerLogin objectForKey:@"response"]objectAtIndex:0] objectForKey:@"name"]];
             
             //             [self cityWebService:[NSString stringWithFormat:@"%@",[[[dictPhotographerLogin objectForKey:@"response"]objectAtIndex:0] objectForKey:@"id"]]];
             
             
             
         }
         else
         {
             NSLog(@"nopes");
             
             [SVProgressHUD showErrorWithStatus:[dictPhotographerLogin objectForKey:@"msg"] maskType:SVProgressHUDMaskTypeBlack];
             
         }
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
         
     }];
    
}

#pragma mark - state
-(void)cityWebService : (NSString *)getStateId
{
    _arrCity=nil;
    _arrCityId=nil;
    
    _arrCity=[[NSMutableArray alloc]initWithCapacity:0];
    _arrCityId=[[NSMutableArray alloc]initWithCapacity:0];
    
    [SVProgressHUD showWithStatus:@"Fetching city..." maskType:SVProgressHUDMaskTypeBlack];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{
                                 @"action": @"city",
                                 @"stateId" : getStateId
                                 };
    
    NSLog(@"parameters-------%@",parameters);
    
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]== TRUE)
             
         {
             [SVProgressHUD dismiss];
             
             for (NSInteger i=0; i<[[dictPhotographerLogin objectForKey:@"response"]count]; i++)
             {
                 
                 NSString *strname =[[[dictPhotographerLogin objectForKey:@"response"]objectAtIndex:i] objectForKey:@"name"];
                 
                 NSString *strId =[[[dictPhotographerLogin objectForKey:@"response"]objectAtIndex:i] objectForKey:@"id"];
                 
                 
                 [self.arrCity addObject:strname];
                 [self.arrCityId addObject:strId];
                 
             }
             
             if(self.arrCity.count == 0)
             {
                 txtCity.userInteractionEnabled = false;
                 txtCity.placeholder = @"No City";
             }
             else
             {
                 txtCity.userInteractionEnabled = true;
                 txtCity.placeholder = @"Select City";
                 
                 [self->pickerGender reloadAllComponents];
             }
             
         }
         else
         {
             NSLog(@"nopes");
             
             [SVProgressHUD showErrorWithStatus:[dictPhotographerLogin objectForKey:@"msg"] maskType:SVProgressHUDMaskTypeBlack];
             
         }
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
         
     }];
    
}

-(void)updateTextField:(id)sender
{
    UIDatePicker *picker12 = (UIDatePicker*)txtDOB.inputView;
    txtDOB.text = [self formatDate:picker12.date];
}

- (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}

//updateTextFieldDateOfDisappearances
-(void)updateTextFieldDateOfDisappearances:(id)sender
{
    UIDatePicker *picker12 = (UIDatePicker*)txtComplaintDate.inputView;
    txtComplaintDate.text = [self formatDateDateOfDisappearances:picker12.date];
}

- (NSString *)formatDateDateOfDisappearances:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}

#pragma mark - time of disappearance
-(void)updateTextFieldDateOfDisappearance:(id)sender
{
    UIDatePicker *picker12 = (UIDatePicker*)txtDateOfDisapearance.inputView;
    txtDateOfDisapearance.text = [self formatDateDateOfDisappearance:picker12.date];
}

- (NSString *)formatDateDateOfDisappearance:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}

-(void)updateTextFieldTimeOfDisappearance:(id)sender
{
    UIDatePicker *picker12 = (UIDatePicker*)txtPlaceOfDisapearance.inputView;
    txtPlaceOfDisapearance.text = [self formatDatedr:picker12.date];
}

- (NSString *)formatDatedr:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

- (void)viewDidLayoutSubviews
{
    if (IS_IPHONE_5_SCREEN)
    {
        scrolViewFull.contentSize = CGSizeMake(kSCREEN_WIDTH, kSCREEN_HEIGHT+1200);
    }
    else
    {
        scrolViewFull.contentSize = CGSizeMake(kSCREEN_WIDTH, kSCREEN_HEIGHT+1100);
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == txtPinOrZipCode)
    {
        if(range.length + range.location > textField.text.length)
        {
            return NO;
        }
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 6;
        
        
    }
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self showPicker:textField];
    
    if(textField==txtAddPicture)
    {
        [self galleryOrCamera];
        return NO;
    }
    
    if(textField==txtCountry)
    {
        if(txtCountry.text.length>=1)
        {
            // [pickerGender selectRow:[self.cardsArray indexOfObject:txtCountry.text] inComponent:0 animated:NO];
        }
    }
    else
        if(textField == txtState)
        {
            if(txtState.text.length==1)
            {
                
                [pickerGender selectRow:[self.arrState indexOfObject:txtState.text] inComponent:0 animated:NO];
                
            }
            
            
        }
        else
            if(textField==txtGender)
            {
                if(txtGender.text.length>=1)
                {
                    [pickerGender selectRow:[self.arrGender indexOfObject:txtGender.text] inComponent:0 animated:NO];
                }
            }
    
            else
                if(textField==txtIsTheChild)
                {
                    if(txtIsTheChild.text.length>=1)
                    {
                        [pickerGender selectRow:[self.arrIsThe indexOfObject:txtIsTheChild.text] inComponent:0 animated:NO];
                    }
                }
    
    
                else
                    if(textField==txtColorOfHair)
                    {
                        if(txtColorOfHair.text.length>=1)
                        {
                            [pickerGender selectRow:[self.arrColorOfHair indexOfObject:txtColorOfHair.text] inComponent:0 animated:NO];
                        }
                    }
                    else
                        if(textField==txtColourOfEyes)
                        {
                            if(txtColourOfEyes.text.length>=1)
                            {
                                [pickerGender selectRow:[self.arrColorOfEye indexOfObject:txtColourOfEyes.text] inComponent:0 animated:NO];
                            }
                        }
                        else
                            if(textField==txtWearGlassOrContactLens)
                            {
                                if(txtWearGlassOrContactLens.text.length>=1)
                                {
                                    //[pickerGender selectRow:[self.arrColorOfEye indexOfObject:txtWearGlassOrContactLens.text] inComponent:0 animated:NO];
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
    
    txtDOB.inputAccessoryView = pickerToolbar;
    txtDateOfDisapearance.inputAccessoryView = pickerToolbar;
    
    if(textField==txtCountry)
    {
        pickerGender.tag=1;
        txtCountry.inputView = pickerGender;
        txtCountry.inputAccessoryView = pickerToolbar;
    }
    else
        if(textField==txtState)
        {
            pickerGender.tag=2;
            txtState.inputView = pickerGender;
            txtState.inputAccessoryView = pickerToolbar;
        }
        else
            if(textField==txtGender)
            {
                pickerGender.tag=3;
                txtGender.inputView = pickerGender;
                txtGender.inputAccessoryView = pickerToolbar;
            }
            else
                if(textField==txtCity)
                {
                    pickerGender.tag=4;
                    txtCity.inputView = pickerGender;
                    txtCity.inputAccessoryView = pickerToolbar;
                }
                else
                    if(textField==txtIsTheChild)
                    {
                        pickerGender.tag=5;
                        txtIsTheChild.inputView = pickerGender;
                        txtIsTheChild.inputAccessoryView = pickerToolbar;
                    }
    
                    else
                        if(textField==txtColorOfHair)
                        {
                            pickerGender.tag=6;
                            txtColorOfHair.inputView = pickerGender;
                            txtColorOfHair.inputAccessoryView = pickerToolbar;
                        }
                        else
                            if(textField==txtColourOfEyes)
                            {
                                pickerGender.tag=7;
                                txtColourOfEyes.inputView = pickerGender;
                                txtColourOfEyes.inputAccessoryView = pickerToolbar;
                            }
                            else
                                if(textField==txtWearGlassOrContactLens)
                                {
                                    pickerGender.tag=8;
                                    txtWearGlassOrContactLens.inputView = pickerGender;
                                    txtWearGlassOrContactLens.inputAccessoryView = pickerToolbar;
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
    
    
    [txtCountry resignFirstResponder];
    [txtState resignFirstResponder];
    [txtCity resignFirstResponder];
    [txtGender resignFirstResponder];
    [txtDOB resignFirstResponder];
    [txtDateOfDisapearance resignFirstResponder];
    [txtIsTheChild resignFirstResponder];
    [txtComplaintDate resignFirstResponder];
    [txtPrizeReward resignFirstResponder];
    [txtColorOfHair resignFirstResponder];
    [txtColourOfEyes resignFirstResponder];
    [txtWearGlassOrContactLens resignFirstResponder];
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField==txtState)
    {
        if ([txtCountry.text isEqualToString:@""])
        {
            [self.view endEditing:YES];
            
            [self stateAlert];
            
        }
        
        
        
    }
    if (textField==txtCity)
    {
        if ([txtState.text isEqualToString:@""])
        {
            [self.view endEditing:YES];
            
            [self cityAlert];
            
        }
        
    }
    
    if (textField == txtPinOrZipCode)
    {
            txtPinOrZipCode.keyboardType=UIKeyboardTypeDefault;
    }
    
    if (textField==txtGender)
    {
        txtGender.text=@"Male";
        
    }
    
    if (textField==txtIsTheChild)
    {
        txtIsTheChild.text=@"Lost";
        
    }
    if (textField==txtWearGlassOrContactLens)
    {
        txtWearGlassOrContactLens.text=@"Yes";
        
    }
    
}

-(void)stateAlert
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warning!"message:@"Please select a country"
                                          
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
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warning!" message:@"Please select a State"
                                              
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
        txtCountry.text = [_cardsArray objectAtIndex:row];
        
        NSString *strCountryId=[NSString stringWithFormat:@"%@",[_cardsArrayId objectAtIndex:row]];
        
        NSString *valueToSave = strCountryId;
        [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"keySaveCountryId"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        
        [self stateWebService:strCountryId];
    }
    else
        if(pickerView.tag==2)
        {
            txtState.text = [_arrState objectAtIndex:row];
            
            NSLog(@"txtState.text==%@",txtState.text);
            
            NSString *strStateId=[NSString stringWithFormat:@"%@",[_arrStateId objectAtIndex:row]];
            
            NSString *valueToSave = strStateId;
            [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"keySaveStateId"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            
            [self cityWebService:strStateId];
            
            
        }
        else
            
            if(pickerView.tag==3)
            {
                txtGender.text=[self.arrGender objectAtIndex:row];
            }
    
            else
                if(pickerView.tag==4)
                {
                    txtCity.text = [_arrCity objectAtIndex:row];
                    
                    NSString *strCityId=[NSString stringWithFormat:@"%@",[_arrCityId objectAtIndex:row]];
                    
                    NSString *valueToSave = strCityId;
                    [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"keySaveCityId"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    
                }
                else
                    if(pickerView.tag==5)
                    {
                        txtIsTheChild.text = [_arrIsTheChild objectAtIndex:row];
                        
                    }
                    else
                        if(pickerView.tag==6)
                        {
                            txtColorOfHair.text = [_arrColorOfHair objectAtIndex:row];
                            
                        }
                        else
                            if(pickerView.tag==7)
                            {
                                txtColourOfEyes.text = [_arrColorOfEye objectAtIndex:row];
                                
                            }
                            else
                                if(pickerView.tag==8)
                                {
                                    txtWearGlassOrContactLens.text = [_arrLensYesOrNo objectAtIndex:row];
                                    
                                }

    
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    if(pickerView.tag==1)
    {
        return [_cardsArray count];
    }
    else
        if(pickerView.tag==2)
        {
            return [_arrState count];
        }
        else
            if(pickerView.tag==3)
            {
                return [self.arrGender count];
            }
            else
                if(pickerView.tag==4)
                {
                    return [self.arrCity count];
                }
                else
                    if(pickerView.tag==5)
                    {
                        return [self.arrIsTheChild count];
                    }
                    else
                        if(pickerView.tag==6)
                        {
                            return [self.arrColorOfHair count];
                        }
                        else
                            if(pickerView.tag==7)
                            {
                                return [self.arrColorOfEye count];
                            }
                            else
                                if(pickerView.tag==8)
                                {
                                    return [self.arrLensYesOrNo count];
                                }


    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    if(pickerView.tag==1)
    {
        return [_cardsArray objectAtIndex:row];
    }
    else
        if(pickerView.tag==2)
        {
            return [_arrState objectAtIndex:row];
        }
        else
            if(pickerView.tag==3)
            {
                return [self.arrGender objectAtIndex:row];
            }
            else
                if(pickerView.tag==4)
                {
                    return [self.arrCity objectAtIndex:row];
                }
                else
                    if(pickerView.tag==5)
                    {
                        return [_arrIsTheChild objectAtIndex:row];
                    }
                    else
                        if(pickerView.tag==6)
                        {
                            return [_arrColorOfHair objectAtIndex:row];
                        }
                        else
                            if(pickerView.tag==7)
                            {
                                return [_arrColorOfEye objectAtIndex:row];
                            }
                            else
                                if(pickerView.tag==8)
                                {
                                    return [_arrLensYesOrNo objectAtIndex:row];
                                }
    
    return 0;
}

-(void)galleryOrCamera
{
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil  message:nil  preferredStyle:UIAlertControllerStyleActionSheet];
    
    //Add Buttons
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Camera"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    PresentMultiCamera(self, YES);
                                }];
    
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"Gallery"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   
                                   PresentPhotoLibrary(self, YES);
                                   
                               }];
    
    UIAlertAction *action2=[UIAlertAction actionWithTitle:@"Open via Album" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                            {
                                PickPhotoFromAppVC *pick=[self.storyboard instantiateViewControllerWithIdentifier:@"PickPhotoFromAppVCId"];
                                pick.delegate = self;
                                [self.navigationController pushViewController:pick animated:YES];
                                
                            }];
    
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleCancel
                             handler:^(UIAlertAction * action) {
                                 
                                 
                             }];
    
    
    [alert addAction:yesButton];
    [alert addAction:noButton];
    [alert addAction:action2];
    [alert addAction:cancel];
    
    if (kSCREEN_HEIGHT == 1024) {
        
        UIButton *btnSender = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btnSender.frame = CGRectMake(kSCREEN_WIDTH/2-90, 0, 180, 180);
        
        [self.view addSubview:btnSender];
        
        [alert setModalPresentationStyle:UIModalPresentationPopover];
        
        UIPopoverPresentationController *popPresenter = [alert popoverPresentationController];
        
        popPresenter.sourceView = btnSender;
        popPresenter.sourceRect = btnSender.bounds;
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    else{
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

#pragma mark Image Picker delegates

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *img =   [info objectForKey:UIImagePickerControllerOriginalImage];
    imgProfilePicture.image =img;
    NSLog(@"image user png is -----<%@",imgProfilePicture.image);
    
    if(imgProfilePicture==nil)
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"OOPS" message:@"No Image Found"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:actionOk];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    else
    {
        imageDatas=[self compressImage:img];
        
        [picker dismissViewControllerAnimated:YES completion:nil];
        
    }
    return;
}


#pragma mark - webservice to submit full form
-(void)submitAddMissingChildForm
{
    
    if ([txtFirstName.text isEqualToString:@""])
    {
        [Alert svError:@"First name should not be empty"];
    }
    else if ([txtLastName.text isEqualToString:@""])
    {
        [Alert svError:@"Last name should not be empty"];
    }
    else if ([txtGender.text isEqualToString:@""])
    {
        [Alert svError:@"Gender should not be empty"];
    }
    else if ([txtDOB.text isEqualToString:@""])
    {
        [Alert svError:@"Date of Birth should not be empty"];
    }
    else if ([txtPlaceOfDisapearance.text isEqualToString:@""])
    {
        [Alert svError:@"Time Of Disapearance should not be empty"];
    }
    else if ([txtFatherName.text isEqualToString:@""])
    {
        [Alert svError:@"Father's name should not be empty"];
    }
    else if ([txtMotherName.text isEqualToString:@""])
    {
        [Alert svError:@"Mother's should not be empty"];
    }
    else if ([txtCountry.text isEqualToString:@""])
    {
        [Alert svError:@"Country should not be empty"];
    }
    else if ([txtState.text isEqualToString:@""])
    {
        [Alert svError:@"State should not be empty"];
    }
    else if ([txtCity.text isEqualToString:@""])
    {
        [Alert svError:@"City should not be empty"];
    }
    else if([self comapreDates] == NO)
    {
        // Error
    }
    else if ([txtParentsMobileNumber.text isEqualToString:@""])
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
        else if ([txtWearGlassOrContactLens.text isEqualToString:@""])
        {
            [Alert svError:@"Lens field should not be empty"];
        }
        else if ([txtWeight.text isEqualToString:@""])
            {
                [Alert svError:@"Weight should not be empty"];
            }
            else if ([txtColourOfEyes.text isEqualToString:@""])
            {
                [Alert svError:@"Color of eyes should not be empty"];
            }
    
            else
            if ([txtColorOfHair.text isEqualToString:@""])
            {
                [Alert svError:@"Color of hair should not be empty"];
            }
            else if ([txtWearGlassOrContactLens.text isEqualToString:@""])
            {
                [Alert svError:@"Lens field should not be empty"];
            }
            else if ([txtAnySuspicion.text isEqualToString:@""])
            {
                [Alert svError:@"Any suspiciuos should not be empty"];
            }
            else if ([txtTheChildWasLastSeendWearing.text isEqualToString:@""])
            {
                [Alert svError:@"Last seen wearing should not be empty"];
            }
//            else if ([txtComplaintDate.text isEqualToString:@""])
//                {
//                    [Alert svError:@"Date Alert Issued should not be empty"];
//                }
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
     
                    [self fullAndFinalSubmitTheFormToServer];
               }
}

#pragma mark - delegate method
- (void)dataFromController:(NSMutableArray *)data
{
//    NSLog(@"data===%@",data);
    
    strDelegateOrNot=@"iamDelegateInEmptyForm";
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:data forKey:@"keyIamDelegateUserDefaultsInEmptyForm"];
    [userDefaults synchronize];
    
    NSUserDefaults *userDefaultsd = [NSUserDefaults standardUserDefaults];
    NSArray *arrayOfImages = [userDefaultsd objectForKey:@"keyIamDelegateUserDefaultsInEmptyForm"];
    NSString *strImage = [NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",[arrayOfImages objectAtIndex:0]]];
    
    strImage = [strImage stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSURL *imageURL = [[NSURL alloc]initWithString:strImage];
    
    [imgProfilePicture sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
    [imgVieww sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
    
    
}

-(void)fullAndFinalSubmitTheFormToServer
{
    [Alert svProgress:@"Please wait..."];
    
    if ([strDelegateOrNot isEqualToString:@"iamDelegateInEmptyForm"])
    {
        [SVProgressHUD showWithStatus:@"Please wait..." maskType:SVProgressHUDMaskTypeBlack];
        [self webserviceWithNotForMultiPart];
    }
    else
    {
        [SVProgressHUD showWithStatus:@"Please wait..." maskType:SVProgressHUDMaskTypeBlack];
        [self webserviceWithMultiPart];
    }
}

#pragma mark - save draft
-(void)whenUserClickSaveDraft
{
    if ([txtFirstName.text isEqualToString:@""])
    {
        [Alert svError:@"First name should not be empty"];
    }
    else if([txtLastName.text isEqualToString:@""])
    {
        [Alert svError:@"Last name should not be empty"];
    }
    else
    {

    [SVProgressHUD showWithStatus:pleaseWait];
    if ([strDelegateOrNot isEqualToString:@"iamDelegateInEmptyForm"])
    {
        [SVProgressHUD showWithStatus:@"Please wait..." maskType:SVProgressHUDMaskTypeBlack];
         [self whenUserClickSaveDraftWebserviceWithNotForMultiPart];
    }
    else
    {
        [SVProgressHUD showWithStatus:@"Please wait..." maskType:SVProgressHUDMaskTypeBlack];
         [self whenUserClickSaveDraftWebserviceWithMultiPart];
    }
    }
}

-(void)whenUserClickSaveDraftWebserviceWithNotForMultiPart
{
    NSUserDefaults *userDefaultsd = [NSUserDefaults standardUserDefaults];
    NSArray *arrayOfImages = [userDefaultsd objectForKey:@"keyIamDelegateUserDefaultsInEmptyForm"];
//    NSLog(@"arrayOfImages===%@",[NSString stringWithFormat:@"%@",arrayOfImages]);
    NSString *strImage = [NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",[arrayOfImages objectAtIndex:0]]];
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    NSString *strLoginUserId=[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]];
    
    strImage = [strImage stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    
    parameters = @{
                   @"action"                : @"addInDrafts",
                   @"userId"                : strLoginUserId,
                   @"first_name"            : txtFirstName.text,
                   @"last_name"             : txtLastName.text,
                   @"gender"                : txtGender.text,
                   @"country"               : txtCountry.text,
                   @"city"                  : txtCity.text,
                   @"state"                 : txtState.text,
                   @"place_disappearance"   : txtPlaceOfDisapearance.text,
                   @"father_name"           : txtFatherName.text,
                   @"mother_name"           : txtMotherName.text,
                   @"date_of_birth"         : txtDOB.text,
                   @"date_of_disappearance" : txtDateOfDisapearance.text,
                   @"parents_mobile_number" : txtParentsMobileNumber.text,
                   @"identification_marks"  : txtIdentificationMark.text,
                   @"height"                : txtHeight.text,
                   @"weight"                : txtWeight.text,
                   @"color_of_eyes"         :txtColourOfEyes.text,
                   @"color_of_hair"         : txtColorOfHair.text,
                   @"is_wear_glasses_lens"  : txtWearGlassOrContactLens.text,
                   @"is_the_child_lost_reason" : txtIsTheChild.text,
                   @"any_suspicion"         : txtAnySuspicion.text,
                   @"last_seen_wearing"     : txtTheChildWasLastSeendWearing.text,
                   @"complaint_date"        : txtComplaintDate.text,
                   @"complained_by"         : txtComplaintBy.text,
                   @"address"               : txtAddress.text,
                   @"last_seen_location"    : txtLastSeenLocation.text,
                   @"pincode"    : txtPinOrZipCode.text,
                   //[_params setObject:txtPinOrZipCode.text                             forKey:@"pincode"];
                   @"latitude"              : @"",
                   @"longitude"             : @"",
                   @"saved_child_id"         : [NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"id"]],
                   @"address"           :txtAddress.text,
                   //dictGetAllValueOfClickedSavedChild

                   @"image"                 : strImage,
                   };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
         {
             
             strDelegateOrNot=@"";
             
             [SVProgressHUD dismiss];
             
             [self popUpSaveDraft];             
             
         }
         else
         {
             
             [SVProgressHUD showErrorWithStatus:@"Something went wrong.Please try again." maskType:SVProgressHUDMaskTypeBlack];
             
         }
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     
     {
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
         
     }];
}

-(void)whenUserClickSaveDraftWebserviceWithMultiPart
{
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    NSString *strLoginUserId=[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]];
    
    NSMutableDictionary* _params = [[NSMutableDictionary alloc] init];
    
    [_params setObject:strLoginUserId                   forKey:@"userId"];
    
    [_params setObject:txtFirstName.text    forKey:@"first_name"];
    
    [_params setObject:txtLastName.text     forKey:@"last_name"];
    
    [_params setObject:txtGender.text       forKey:@"gender"];
    
    [_params setObject:txtCountry.text      forKey:@"country"];
    
    [_params setObject:txtCity.text         forKey:@"city"];
    
    [_params setObject:txtState.text        forKey:@"state"];
    
    [_params setObject:txtPlaceOfDisapearance.text   forKey:@"place_disappearance"];
    
    [_params setObject:txtFatherName.text            forKey:@"father_name"];
    [_params setObject:txtMotherName.text            forKey:@"mother_name"];
    [_params setObject:txtDOB.text                   forKey:@"date_of_birth"];
    [_params setObject:txtDateOfDisapearance.text    forKey:@"date_of_disappearance"];
    [_params setObject:txtParentsMobileNumber.text   forKey:@"parents_mobile_number"];
    [_params setObject:txtIdentificationMark.text    forKey:@"identification_marks"];
    [_params setObject:txtHeight.text                forKey:@"height"];
    [_params setObject:txtWeight.text                forKey:@"weight"];
    
    [_params setObject:txtColourOfEyes.text          forKey:@"color_of_eyes"];
    
    [_params setObject:txtColorOfHair.text           forKey:@"color_of_hair"];
    
    [_params setObject:txtWearGlassOrContactLens.text          forKey:@"is_wear_glasses_lens"];
    
    [_params setObject:txtIsTheChild.text               forKey:@"is_the_child_lost_reason"];
    
    [_params setObject:txtAnySuspicion.text             forKey:@"any_suspicion"];
    
    [_params setObject:txtTheChildWasLastSeendWearing.text  forKey:@"last_seen_wearing"];
    
    [_params setObject:txtComplaintDate.text            forKey:@"complaint_date"];
    
    [_params setObject:txtComplaintBy.text              forKey:@"complained_by"];
    
    [_params setObject:txtAddress.text              forKey:@"address"];
    
    [_params setObject:txtLastSeenLocation.text              forKey:@"last_seen_location"];
    
    [_params setObject:@""                              forKey:@"latitude"];
    
    [_params setObject:@""                              forKey:@"longitude"];
    
    [_params setObject:txtPinOrZipCode.text                             forKey:@"pincode"];
    
    [_params setObject:[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"id"]]                              forKey:@"saved_child_id"];
    
    [_params setObject:@"addInDrafts"               forKey:@"action"];
    
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
            strDelegateOrNot=@"";
            
            [SVProgressHUD dismiss];
            
            
          //  NSLog(@"response=====%@",[json objectForKey:@"response"]);
            
            
            [self popUpSaveDraft];
        }
        else
        {
            [Alert svError:somethingIssue];
            NSLog(@"why?====%@",requestError.description);
        }
    }
    
}

-(void)webserviceWithNotForMultiPart
{
    
      [SVProgressHUD showWithStatus:@"Please wait..." maskType:SVProgressHUDMaskTypeBlack];
    NSUserDefaults *userDefaultsd = [NSUserDefaults standardUserDefaults];
    NSArray *arrayOfImages = [userDefaultsd objectForKey:@"keyIamDelegateUserDefaultsInEmptyForm"];
//    NSLog(@"arrayOfImages===%@",[NSString stringWithFormat:@"%@",arrayOfImages]);
    NSString *strImage = [NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",[arrayOfImages objectAtIndex:0]]];
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    NSString *strLoginUserId=[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]];
    
    strImage = [strImage stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *strCurrentLat= [[NSUserDefaults standardUserDefaults]
                                        stringForKey:@"keyMyCurrentLat"];
        NSString *strCurrentLong = [[NSUserDefaults standardUserDefaults]
                                         stringForKey:@"keyMyCurrentLong"];
     
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    
    parameters = @{
                   @"action"                : @"addMissingChild",
                   @"userId"                : strLoginUserId,
                   @"first_name"            : txtFirstName.text,
                   @"last_name"             : txtLastName.text,
                   @"gender"                : txtGender.text,
                   @"country"               : txtCountry.text,
                   @"city"                  : txtCity.text,
                   @"state"                 : txtState.text,
                   @"place_disappearance"   : txtPlaceOfDisapearance.text,
                   @"father_name"           : txtFatherName.text,
                   @"mother_name"           : txtMotherName.text,
                   @"date_of_birth"         : txtDOB.text,
                   @"date_of_disappearance" : txtDateOfDisapearance.text,
                   @"parents_mobile_number" : txtParentsMobileNumber.text,
                   @"identification_marks"  : txtIdentificationMark.text,
                   @"height"                : txtHeight.text,
                   @"weight"                : txtWeight.text,
                   @"color_of_eyes"         :txtColourOfEyes.text,
                   @"color_of_hair"         : txtColorOfHair.text,
                   @"is_wear_glasses_lens"  : txtWearGlassOrContactLens.text,
                   @"is_the_child_lost_reason" : txtIsTheChild.text,
                   @"any_suspicion"         : txtAnySuspicion.text,
                   @"last_seen_wearing"     : txtTheChildWasLastSeendWearing.text,
                   @"complaint_date"        : txtComplaintDate.text,
                   @"complained_by"         : txtComplaintBy.text,
                   @"address"               : txtAddress.text,
                   @"last_seen_location"    : txtLastSeenLocation.text,
                   @"pincode"    : txtPinOrZipCode.text,
                   @"latitude"              : strCurrentLat,
                   @"longitude"             : strCurrentLong,
                   @"address"           :txtAddress.text,
                   @"image"                 : strImage,
                   };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
         {
             
             strDelegateOrNot=@"";
             
             [SVProgressHUD dismiss];
             
             [self popUpSaveInitiate];
             
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

-(void)webserviceWithMultiPart
{
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    NSString *strLoginUserId=[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]];
    
    NSMutableDictionary* _params = [[NSMutableDictionary alloc] init];
    
    [_params setObject:strLoginUserId        forKey:@"userId"];
    
    [_params setObject:txtFirstName.text    forKey:@"first_name"];
    
    [_params setObject:txtLastName.text     forKey:@"last_name"];
    
    [_params setObject:txtGender.text       forKey:@"gender"];
    
    [_params setObject:txtCountry.text      forKey:@"country"];
    
    [_params setObject:txtCity.text         forKey:@"city"];
    
    [_params setObject:txtState.text        forKey:@"state"];
    
    [_params setObject:txtPlaceOfDisapearance.text   forKey:@"place_disappearance"];
    
    [_params setObject:txtFatherName.text            forKey:@"father_name"];
    [_params setObject:txtMotherName.text            forKey:@"mother_name"];
    [_params setObject:txtDOB.text                   forKey:@"date_of_birth"];
    [_params setObject:txtDateOfDisapearance.text    forKey:@"date_of_disappearance"];
    [_params setObject:txtParentsMobileNumber.text   forKey:@"parents_mobile_number"];
    [_params setObject:txtIdentificationMark.text    forKey:@"identification_marks"];
    [_params setObject:txtHeight.text                forKey:@"height"];
    [_params setObject:txtWeight.text                forKey:@"weight"];
    
    [_params setObject:txtColourOfEyes.text          forKey:@"color_of_eyes"];
    
    [_params setObject:txtColorOfHair.text           forKey:@"color_of_hair"];
    
    [_params setObject:txtWearGlassOrContactLens.text          forKey:@"is_wear_glasses_lens"];
    
    [_params setObject:txtIsTheChild.text               forKey:@"is_the_child_lost_reason"];
    
    [_params setObject:txtAnySuspicion.text             forKey:@"any_suspicion"];
    
    [_params setObject:txtTheChildWasLastSeendWearing.text  forKey:@"last_seen_wearing"];
    
    [_params setObject:txtComplaintDate.text            forKey:@"complaint_date"];
    
    [_params setObject:txtComplaintBy.text              forKey:@"complained_by"];
    
    [_params setObject:txtAddress.text              forKey:@"address"];
    
    [_params setObject:txtLastSeenLocation.text              forKey:@"last_seen_location"];
    
    [_params setObject:@""                              forKey:@"latitude"];
    
    [_params setObject:@""                              forKey:@"longitude"];
     [_params setObject:txtPrizeReward.text                              forKey:@"prize_money"];
     [_params setObject:txtRewardInformation.text                              forKey:@"prize_msg"];
    
     [_params setObject:txtPrizeReward.text                              forKey:@"prize_money"];
    
      [_params setObject:txtRewardInformation.text                              forKey:@"prize_msg"];
    
    [_params setObject:[NSString stringWithFormat:@"%@",[dictGetAllValueOfClickedSavedChild objectForKey:@"id"]]                              forKey:@"saved_child_id"];

    [_params setObject:txtPinOrZipCode.text                             forKey:@"pincode"];

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
            
            [SVProgressHUD dismiss];
            
            
            //NSLog(@"response=====%@",[json objectForKey:@"response"]);
            
            
            [self popUpSaveInitiate];
        }
        else
        {
            [SVProgressHUD showErrorWithStatus:[json objectForKey:@"msg"] maskType:SVProgressHUDMaskTypeBlack];

            NSLog(@"why?====%@",requestError.description);
        }
    }
    
}


#pragma mark - compare dates
-(BOOL)comapreDates
{
    
    
    NSString * strOne = txtDOB.text;
    
    NSDateFormatter * d1 = [[NSDateFormatter alloc] init];
    d1.dateFormat = @"yyyy-MM-dd";
    NSDate * date = [d1 dateFromString: strOne];
    d1.dateFormat = @"yyyy-MM-dd";
    strOne = [d1 stringFromDate: date];
    //NSLog(@"strone---%@",strOne);
    
    
    
    NSString * strTwo = txtDateOfDisapearance.text;
    
    NSDateFormatter * d2 = [[NSDateFormatter alloc] init];
    d2.dateFormat = @"yyyy-MM-dd";
    NSDate * date2 = [d2 dateFromString: strTwo];
    d1.dateFormat = @"yyyy-MM-dd";
    strTwo = [d2 stringFromDate: date2];
    //NSLog(@"strone---%@",strTwo);
    
    
    
    NSComparisonResult result = [strOne compare:strTwo];
    
    if(result==NSOrderedAscending)
    {
        
        return YES;
        
    }
    else if(result==NSOrderedDescending)
    {
        
        [Alert svError:@"Date of disappearance should not be less than Date of birth"];
        
        return NO;
    }
    else
    {
        [Alert svError:@"Both dates should not be same"];
        
        return NO;
        
    }
    
    return NO;
    
}

-(void)popUpSaveDraft
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Success!"
                                          
                                                                             message:@"Draft has been saved succesfully"
                                          
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    //We add buttons to the alert controller by creating UIAlertActions:
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                               
                                                       style:UIAlertActionStyleDefault
                               
                                                     handler:^(UIAlertAction *Acitons)
                               {
                                   [self pushToDashboard];
                               }];
    
    [alertController addAction:actionOk];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)popUpSaveInitiate
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Success!"
                                          
                                                                             message:@"Alert initiated successfully"
                                          
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    //We add buttons to the alert controller by creating UIAlertActions:
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                               
                                                       style:UIAlertActionStyleDefault
                               
                                                     handler:^(UIAlertAction *Acitons)
                               {
                                   [self pushToDashboard];
                               }];
    
    [alertController addAction:actionOk];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)pushToDashboard
{
//    if (iPhoneVersion == 5)
//    {
//
//        UIStoryboard *Sty=[UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//        DashboardVC *ds=[Sty instantiateViewControllerWithIdentifier:@"DashboardVCId"];
//        [self.navigationController pushViewController:ds animated:YES];
//
//    }
//    else if (iPhoneVersion == 6)
//    {
        UIStoryboard *Sty=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        DashboardVC *ds=[Sty instantiateViewControllerWithIdentifier:@"DashboardVCId"];
        [self.navigationController pushViewController:ds animated:YES];
//    }
//    else if (iPhoneVersion == 61)
//    {
//        UIStoryboard *Sty=[UIStoryboard storyboardWithName:@"Main6p" bundle:nil];
//        DashboardVC *ds=[Sty instantiateViewControllerWithIdentifier:@"DashboardVCId"];
//        [self.navigationController pushViewController:ds animated:YES];
//    }
//    else
//    {
//        UIStoryboard *Sty=[UIStoryboard storyboardWithName:@"Mainpad" bundle:nil];
//        DashboardVC *ds=[Sty instantiateViewControllerWithIdentifier:@"DashboardVCId"];
//        [self.navigationController pushViewController:ds animated:YES];
//    }
    
}

#pragma mark - dropdown
-(void)webserviceToGetColorOfHairColorOfEye
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    
    parameters = @{
                   @"action"                : @"dropdown",
                   };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
         {
             
             strDelegateOrNot=@"";
             
             [SVProgressHUD dismiss];
             
         
             
             NSArray *arrColorEye=[[dictPhotographerLogin objectForKey:@"response"]objectForKey:@"ColorEye"];
             
             for (NSInteger i=0; i<[arrColorEye count]; i++)
             {
                 
                 //NSLog(@"arrColorEye==%@",arrColorEye);
                 
                 NSDictionary *dict=[[[dictPhotographerLogin objectForKey:@"response"]objectForKey:@"ColorEye"]objectAtIndex:i];
                 
                 //NSLog(@"dict===%@",dict);
                 
                 NSString *str=[dict objectForKey:@"name"];
                 
                 [self.arrColorOfEye addObject:str];
                 
             }
             
             [self->pickerGender reloadAllComponents];
             
             [self dropDownTwo];
             
         }
         else
         {
             
             [SVProgressHUD showErrorWithStatus:@"Something went wrong.Please try again." maskType:SVProgressHUDMaskTypeBlack];
             
         }
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     
     {
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
         
     }];
}

-(void)dropDownTwo


{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    
    parameters = @{
                   @"action"                : @"dropdown",
                   };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
         {
             
             strDelegateOrNot=@"";
             
             [SVProgressHUD dismiss];
             
             
             
             //NSLog(@"[dictPhotographerLogin objectForKey:%@",[dictPhotographerLogin objectForKey:@"response"]);
             
             
             
             NSArray *arrColorEye=[[dictPhotographerLogin objectForKey:@"response"]objectForKey:@"ColorHair"];
             
             for (NSInteger i=0; i<[arrColorEye count]; i++)
             {
                 
                 //NSLog(@"arrColorEye==%@",arrColorEye);
                 
                 NSDictionary *dict=[[[dictPhotographerLogin objectForKey:@"response"]objectForKey:@"ColorHair"]objectAtIndex:i];
                 
                 //NSLog(@"dict===%@",dict);
                 
                 NSString *str=[dict objectForKey:@"name"];
                 
                 [self.arrColorOfHair addObject:str];
                 
             }
             
             [self->pickerGender reloadAllComponents];
             
             
             
         }
         else
         {
             
             [SVProgressHUD showErrorWithStatus:@"Something went wrong.Please try again." maskType:SVProgressHUDMaskTypeBlack];
             
         }
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     
     {
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
         
     }];
}
@end
