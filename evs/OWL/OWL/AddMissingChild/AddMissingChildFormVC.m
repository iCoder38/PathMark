//
//  AddMissingChildFormVC.m
//  OWL
//
//  Created by Rameshwar on 21/08/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "AddMissingChildFormVC.h"
#import "camera.h"
#import "AddMissingChildFormTwoVC.h"
#import "DBManager.h"
#import "StoreData.h"



@interface AddMissingChildFormVC (){
    UIScrollView *scrolViewFull;

    UIPickerView *pickerGender;
    UIToolbar *pickerToolbar;

    UIView *viewOnScroll;

    UIDatePicker *datePicker;
    NSDate *theMaximumDate;
    
    UIDatePicker *timePicker;
    NSDate *theMaximumtime;

    UIImageView *imgProfilePicture;

    NSData *imageData;
    UIImage *image ;

    NSMutableArray *arrCountryData, *arrCountryDataShow, *arrStateData, *arrStateDataShow, *arrCityData, *arrCityDataShow;

    NSArray *arrShowSavedData;
    
    UIImage *picture;

}

@property (strong, nonatomic)NSMutableArray *arrGender;
@property (strong, nonatomic)NSMutableArray *arrIsTheChild;

@property (strong, nonatomic)NSMutableArray *cardsArray;
@property (strong, nonatomic)NSMutableArray *cardsArrayId;

@property (strong, nonatomic)NSMutableArray *arrState;
@property (strong, nonatomic)NSMutableArray *arrStateId;

@property (strong, nonatomic)NSMutableArray *arrCity;
@property (strong, nonatomic)NSMutableArray *arrCityId;


@end

@implementation AddMissingChildFormVC
@synthesize StrCheckSideMenuOrNot;

- (void)viewDidLoad
{

    [super viewDidLoad];

    arrCountryData = [[NSMutableArray alloc]initWithCapacity:0];
    arrStateData = [[NSMutableArray alloc]initWithCapacity:0];
    arrCityData = [[NSMutableArray alloc]initWithCapacity:0];
    arrCountryDataShow = [[NSMutableArray alloc]initWithCapacity:0];
    arrStateDataShow = [[NSMutableArray alloc]initWithCapacity:0];
    arrCityDataShow = [[NSMutableArray alloc]initWithCapacity:0];


    _cardsArray=[[NSMutableArray alloc]init];
    _cardsArrayId=[[NSMutableArray alloc]init];
    
    _arrState=[[NSMutableArray alloc]init];
    _arrStateId=[[NSMutableArray alloc]init];
    
    _arrCity=[[NSMutableArray alloc]init];
    _arrCityId=[[NSMutableArray alloc]init];
    
    txtCountry.delegate=self;
    txtState.delegate=self;
    

    [self UiDesignPattern];

}

-(void)UiDesignPattern{
    
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

    imgBGTSP.image = [UIImage imageNamed:@"tps" ];
    [self.view addSubview:imgBGTSP];

    scrolViewFull=[[UIScrollView alloc]initWithFrame:cgFrame(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrolViewFull.backgroundColor = Clear;
    [self.view addSubview:scrolViewFull];

    viewOnScroll=[[UIView alloc]initWithFrame:cgFrame(0, 0, self.view.frame.size.width, self.view.frame.size.height+1700)];
    //viewOnScroll.backgroundColor=Blue;
    [scrolViewFull addSubview:viewOnScroll];

    self.arrGender=[[NSMutableArray alloc] initWithObjects:@"Male",@"Female", nil];

    self.arrIsTheChild=[[NSMutableArray alloc] initWithObjects:@"Lost",@"Missing",@"Runaway",@"Others", nil];


    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];

    NSString *strLoginUserId=[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]];


//    DBManager* db = [[DBManager alloc] initWithDB:kDB_NAME];
//
//    arrShowSavedData = [db getProductData:kTABLE_NAME strUserId:strLoginUserId];

    if (arrShowSavedData.count>0)
    {

        [self textFieldMethod:arrShowSavedData];
        
    }
    else
    {

         [self textFieldMethod];
        
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

- (void)viewDidLayoutSubviews
{
//    if (IS_IPHONE_5_SCREEN)
//    {
        scrolViewFull.contentSize = CGSizeMake(kSCREEN_WIDTH, kSCREEN_HEIGHT+460);
//    }
//    else
//    {
//        scrolViewFull.contentSize = CGSizeMake(kSCREEN_WIDTH, kSCREEN_HEIGHT+320);
//    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == txtPinOrZipCode)
    {
    
        if ([txtCountry.text isEqualToString:@"Canada"])
        {
    if (
        [txtPinOrZipCode.text hasPrefix:@"A"] ||
        [txtPinOrZipCode.text hasPrefix:@"B"] ||
        [txtPinOrZipCode.text hasPrefix:@"C"] ||
        [txtPinOrZipCode.text hasPrefix:@"D"] ||
        [txtPinOrZipCode.text hasPrefix:@"E"] ||
        [txtPinOrZipCode.text hasPrefix:@"F"] ||
        [txtPinOrZipCode.text hasPrefix:@"G"] ||
        [txtPinOrZipCode.text hasPrefix:@"H"] ||
        [txtPinOrZipCode.text hasPrefix:@"I"] ||
        [txtPinOrZipCode.text hasPrefix:@"J"] ||
        [txtPinOrZipCode.text hasPrefix:@"K"] ||
        [txtPinOrZipCode.text hasPrefix:@"L"] ||
        [txtPinOrZipCode.text hasPrefix:@"M"] ||
        [txtPinOrZipCode.text hasPrefix:@"N"] ||
        [txtPinOrZipCode.text hasPrefix:@"O"] ||
        [txtPinOrZipCode.text hasPrefix:@"P"] ||
        [txtPinOrZipCode.text hasPrefix:@"Q"] ||
        [txtPinOrZipCode.text hasPrefix:@"R"] ||
        [txtPinOrZipCode.text hasPrefix:@"S"] ||
        [txtPinOrZipCode.text hasPrefix:@"T"] ||
        [txtPinOrZipCode.text hasPrefix:@"U"] ||
        [txtPinOrZipCode.text hasPrefix:@"V"] ||
        [txtPinOrZipCode.text hasPrefix:@"W"] ||
        [txtPinOrZipCode.text hasPrefix:@"X"] ||
        [txtPinOrZipCode.text hasPrefix:@"Y"] ||
        [txtPinOrZipCode.text hasPrefix:@"Z"] ||
        [txtPinOrZipCode.text hasPrefix:@"a"] ||
        [txtPinOrZipCode.text hasPrefix:@"b"] ||
        [txtPinOrZipCode.text hasPrefix:@"c"] ||
        [txtPinOrZipCode.text hasPrefix:@"d"] ||
        [txtPinOrZipCode.text hasPrefix:@"e"] ||
        [txtPinOrZipCode.text hasPrefix:@"f"] ||
        [txtPinOrZipCode.text hasPrefix:@"g"] ||
        [txtPinOrZipCode.text hasPrefix:@"h"] ||
        [txtPinOrZipCode.text hasPrefix:@"i"] ||
        [txtPinOrZipCode.text hasPrefix:@"j"] ||
        [txtPinOrZipCode.text hasPrefix:@"k"] ||
        [txtPinOrZipCode.text hasPrefix:@"l"] ||
        [txtPinOrZipCode.text hasPrefix:@"m"] ||
        [txtPinOrZipCode.text hasPrefix:@"n"] ||
        [txtPinOrZipCode.text hasPrefix:@"o"] ||
        [txtPinOrZipCode.text hasPrefix:@"p"] ||
        [txtPinOrZipCode.text hasPrefix:@"q"] ||
        [txtPinOrZipCode.text hasPrefix:@"r"] ||
        [txtPinOrZipCode.text hasPrefix:@"s"] ||
        [txtPinOrZipCode.text hasPrefix:@"t"] ||
        [txtPinOrZipCode.text hasPrefix:@"u"] ||
        [txtPinOrZipCode.text hasPrefix:@"v"] ||
        [txtPinOrZipCode.text hasPrefix:@"w"] ||
        [txtPinOrZipCode.text hasPrefix:@"x"] ||
        [txtPinOrZipCode.text hasPrefix:@"y"] ||
        [txtPinOrZipCode.text hasPrefix:@"z"])
    {
        
        
        if (range.location == 7)
        {
            return NO;
        }
        
// Backspace
        if ([string length] == 0)
            return YES;

        
        if ((range.location == 3) || (range.location == 7))
        {
            NSString *str    = [NSString stringWithFormat:@"%@ ",textField.text];
            textField.text   = str;
    }
    
    }
    
    return YES;
    }
        else
        {
            if(range.length + range.location > textField.text.length)
            {
                return NO;
            }
            
            NSUInteger newLength = [textField.text length] + [string length] - range.length;
            return newLength <= 6;

        }
    }
    
    return YES;
}

-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    [self customizeNavigationBar];
    [self countryWebService];
}

-(void)customizeNavigationBar{

    self.navigationController.navigationBarHidden = TRUE;

    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 65)];
    navView.backgroundColor = Black;
    [self.view addSubview:navView];

    
    //StrCheckSideMenuOrNot = yesiAmSideBar

    if ([StrCheckSideMenuOrNot isEqualToString:@"yesiAmSideBar"])
    {
        UIButton *btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
        btnMenu.frame = CGRectMake(10, 30, 24, 24);
        [btnMenu setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
        [btnMenu addTarget:self action:@selector(hitMenu:) forControlEvents:UIControlEventTouchUpInside];
        [navView addSubview:btnMenu];

    }
    else
    {
        UIButton *btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
        btnMenu.frame = CGRectMake(10, 30, 24, 24);
        [btnMenu setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [btnMenu addTarget:self action:@selector(hitbackz:) forControlEvents:UIControlEventTouchUpInside];
        [navView addSubview:btnMenu];

    }
    
    

    UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(35, 20, kSCREEN_WIDTH-70, 45)];
    lblTitle.text = @"ADD CHILD/PERSON INFO";
    lblTitle.textColor = White;
    lblTitle.font = mr16;
    lblTitle.textAlignment = NSTextAlignmentCenter;
    [navView addSubview:lblTitle];

}

-(void)hitbackz:(id)sender
{
goBackDR
}

-(IBAction)hitMenu:(id)sender
{

    [self.revealViewController revealToggleAnimated:YES];
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
    txtFirstName=[[UITextField alloc]init];
    imgVieww=[[UIImageView alloc]init];
    txtLastName=[[UITextField alloc]init];
    txtAddPicture=[[UITextField alloc]init];
    txtGender=[[UITextField alloc]init];
    txtDOB=[[UITextField alloc]init];
    txtDateOfDisapearance=[[UITextField alloc]init];
    txtPlaceOfDisapearance=[[UITextField alloc]init];
    txtFatherName=[[UITextField alloc]init];
    txtMotherName=[[UITextField alloc]init];
    txtCountry=[[UITextField alloc]init];
    txtState=[[UITextField alloc]init];
    txtCity=[[UITextField alloc]init];
    txtPinOrZipCode=[[UITextField alloc]init];
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
    
    StoreData *storSavedData;

    for (int j =0; j<arrData.count; j++)
    {

        storSavedData = [[StoreData alloc]init];
        storSavedData = [arrData objectAtIndex:j];

    }

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



    [Alert textFieldplaceholder:txtDateOfDisapearance frame:cgFrame(xPos, txtDOB.frame.size.height + txtDOB.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Date Of Disappearance " textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    txtDateOfDisapearance.delegate=self;
    NSString *maxDateStringDateOfDis = txtDateOfDisapearance.text;
    NSDateFormatter *dateFormatterDateOfDis = [[NSDateFormatter alloc] init];
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
    NSDateFormatter *dateFormatterDateOfDis2 = [[NSDateFormatter alloc] init];
    //2015-01-20
    dateFormatterDateOfDis2.dateFormat = @"hh:mm a";
    theMaximumtime = [dateFormatterDateOfDis2 dateFromString: maxDateStringDateOfDis2];
//    [timePicker setMaximumDate:theMaximumtime];
//    [timePicker setMaximumDate:[NSDate date]];
    [timePicker setDatePickerMode:UIDatePickerModeTime];
    [timePicker addTarget:self action:@selector(updateTextFieldTimeOfDisappearance:) forControlEvents:UIControlEventValueChanged];
    [txtPlaceOfDisapearance setInputView:timePicker];




    [Alert textFieldplaceholder:txtFatherName frame:cgFrame(xPos, txtPlaceOfDisapearance.frame.size.height + txtPlaceOfDisapearance.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Father's name" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];




    [Alert textFieldplaceholder:txtMotherName frame:cgFrame(xPos, txtFatherName.frame.size.height + txtFatherName.frame.origin.y + yPos, kSCREEN_WIDTH-40, 45) placeholder:@"Mother's name" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];




    [Alert textFieldplaceholder:txtCountry frame:cgFrame(xPos, txtMotherName.frame.size.height + txtMotherName.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Select Country" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];




    [Alert textFieldplaceholder:txtState frame:cgFrame(xPos, txtCountry.frame.size.height + txtCountry.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Select State" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];


    [Alert textFieldplaceholder:txtCity frame:cgFrame(xPos, txtState.frame.size.height + txtState.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Select City" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    [Alert textFieldplaceholder:txtPinOrZipCode frame:cgFrame(xPos, txtCity.frame.size.height + txtCity.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Postal code/Zip code" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];





    btnSave=[UIButton buttonWithType:UIButtonTypeCustom];
    btnSave.frame=cgFrame(20, txtPinOrZipCode.frame.size.height + txtPinOrZipCode.frame.origin.y + yPos, kSCREEN_WIDTH/2-30, heights);
    [btnSave setTitle:@"SAVE DETAILS" forState:UIControlStateNormal];
    btnSave.titleLabel.font=ms16;
    btnSave.layer.cornerRadius=4;
    btnSave.clipsToBounds=YES;
    btnSave .backgroundColor=[UIColor darkGrayColor];
    [btnSave addTarget:self action:@selector(submitInDB:) forControlEvents:UIControlEventTouchUpInside];
    
    
 
    btnSubmit=[UIButton buttonWithType:UIButtonTypeCustom];
    
    btnSubmit.frame=cgFrame(btnSave.frame.size.width + btnSave.frame.origin.x + 10, txtPinOrZipCode.frame.size.height + txtPinOrZipCode.frame.origin.y + yPos, kSCREEN_WIDTH/2-20, heights);

    [btnSubmit setTitle:@"NEXT" forState:UIControlStateNormal];
    btnSubmit.titleLabel.font=ms16;
    btnSubmit.layer.cornerRadius=4;
    btnSubmit.clipsToBounds=YES;
    btnSubmit .backgroundColor=[UIColor blackColor];
    [btnSubmit addTarget:self action:@selector(submitAddMissingChild:) forControlEvents:UIControlEventTouchUpInside];
    





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
    [viewOnScroll addSubview:txtCountry];
    [viewOnScroll addSubview:txtState];
    [viewOnScroll addSubview:txtCity];
    [viewOnScroll addSubview:btnSubmit];
    [viewOnScroll addSubview:btnSave];
    [viewOnScroll addSubview:txtPinOrZipCode];
    
    txtFirstName.text = storSavedData.firstname;
    txtLastName.text = storSavedData.lastname;
    txtDOB.text = storSavedData.dob;
    txtDateOfDisapearance.text = storSavedData.dateofdisappearance;
    txtPlaceOfDisapearance.text = storSavedData.placeofdisappearance;
    txtMotherName.text = storSavedData.mothername;
    txtFatherName.text = storSavedData.fathername;
    txtCountry.text = storSavedData.selectcountry;
    txtCity.text = storSavedData.selectcity;
    txtState.text = storSavedData.selectstate;
    txtGender.text = storSavedData.gender;



    
    
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


-(void)textFieldMethod
{

    int xPos = 20;

    int yPos = 8;

    int heights = 45;

    UIColor *txtColor=RGBc(104, 104, 104);
    UIColor *bgColor=RGBc(238, 238, 238);





    //alloc
    txtFirstName=[[UITextField alloc]init];
    txtLastName=[[UITextField alloc]init];
    txtAddPicture=[[UITextField alloc]init];
    txtGender=[[UITextField alloc]init];
    txtDOB=[[UITextField alloc]init];
    txtDateOfDisapearance=[[UITextField alloc]init];
    txtPlaceOfDisapearance=[[UITextField alloc]init];
    txtFatherName=[[UITextField alloc]init];
    txtMotherName=[[UITextField alloc]init];
    txtCountry=[[UITextField alloc]init];
    txtState=[[UITextField alloc]init];
    txtCity=[[UITextField alloc]init];
    txtPinOrZipCode=[[UITextField alloc]init];

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



    [Alert textFieldplaceholder:txtDateOfDisapearance frame:cgFrame(xPos, txtDOB.frame.size.height + txtDOB.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Date Of Disappearance " textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    txtDateOfDisapearance.delegate=self;
    NSString *maxDateStringDateOfDis = txtDateOfDisapearance.text;
    NSDateFormatter *dateFormatterDateOfDis = [[NSDateFormatter alloc] init];
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
    NSDateFormatter *dateFormatterDateOfDis2 = [[NSDateFormatter alloc] init];
    //2015-01-20
    dateFormatterDateOfDis2.dateFormat = @"hh:mm a";
    theMaximumtime = [dateFormatterDateOfDis2 dateFromString: maxDateStringDateOfDis2];
//    [timePicker setMaximumDate:theMaximumtime];
//    [timePicker setMaximumDate:[NSDate date]];
    [timePicker setDatePickerMode:UIDatePickerModeTime];
    [timePicker addTarget:self action:@selector(updateTextFieldTimeOfDisappearance:) forControlEvents:UIControlEventValueChanged];
    [txtPlaceOfDisapearance setInputView:timePicker];




    [Alert textFieldplaceholder:txtFatherName frame:cgFrame(xPos, txtPlaceOfDisapearance.frame.size.height + txtPlaceOfDisapearance.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Father's name" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];




    [Alert textFieldplaceholder:txtMotherName frame:cgFrame(xPos, txtFatherName.frame.size.height + txtFatherName.frame.origin.y + yPos, kSCREEN_WIDTH-40, 45) placeholder:@"Mother's name" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];




    [Alert textFieldplaceholder:txtCountry frame:cgFrame(xPos, txtMotherName.frame.size.height + txtMotherName.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Select Country" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];




    [Alert textFieldplaceholder:txtState frame:cgFrame(xPos, txtCountry.frame.size.height + txtCountry.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Select State" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];




    [Alert textFieldplaceholder:txtCity frame:cgFrame(xPos, txtState.frame.size.height + txtState.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Select City" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    [Alert textFieldplaceholder:txtPinOrZipCode frame:cgFrame(xPos, txtCity.frame.size.height + txtCity.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Postal code/Zip code" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];



    btnSave=[UIButton buttonWithType:UIButtonTypeCustom];
    btnSave.frame=cgFrame(20, txtPinOrZipCode.frame.size.height + txtPinOrZipCode.frame.origin.y + yPos, 130, heights);
    [btnSave setTitle:@"Save Details" forState:UIControlStateNormal];
    btnSave.titleLabel.font=ms16;
    btnSave.layer.cornerRadius=4;
    btnSave.clipsToBounds=YES;
    btnSave .backgroundColor=[UIColor darkGrayColor];
    [btnSave addTarget:self action:@selector(submitInDB:) forControlEvents:UIControlEventTouchUpInside];


    
    btnSubmit=[UIButton buttonWithType:UIButtonTypeCustom];
    btnSubmit.frame=cgFrame(btnSave.frame.size.width + btnSave.frame.origin.x + 10, txtPinOrZipCode.frame.size.height + txtPinOrZipCode.frame.origin.y + yPos, /*kSCREEN_WIDTH/2-20*/136, heights);
    
    
    
    [btnSubmit setTitle:@"Next" forState:UIControlStateNormal];
    btnSubmit.titleLabel.font=ms16;
    btnSubmit.layer.cornerRadius=4;
    btnSubmit.clipsToBounds=YES;
    btnSubmit .backgroundColor=[UIColor blackColor];
    [btnSubmit addTarget:self action:@selector(submitAddMissingChild:) forControlEvents:UIControlEventTouchUpInside];
    
    if (iPhoneVersion==5)
    {
        
        
        btnSubmit.frame=cgFrame(btnSave.frame.size.width + btnSave.frame.origin.x + 10, txtPinOrZipCode.frame.size.height + txtPinOrZipCode.frame.origin.y + yPos, 136, heights);
        
    }
    else
    {
        btnSubmit.frame=cgFrame(btnSave.frame.size.width + btnSave.frame.origin.x + 10, txtPinOrZipCode.frame.size.height + txtPinOrZipCode.frame.origin.y + yPos, 180, heights);
        
    }


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
    [viewOnScroll addSubview:txtCountry];
    [viewOnScroll addSubview:txtState];
    [viewOnScroll addSubview:txtCity];
    [viewOnScroll addSubview:btnSubmit];
    [viewOnScroll addSubview:btnSave];
    [viewOnScroll addSubview:txtPinOrZipCode];

    
}



-(void)updateTextField:(id)sender
{
    UIDatePicker *picker12 = (UIDatePicker*)txtDOB.inputView;
    txtDOB.text = [self formatDate:picker12.date];
}

-(IBAction)submitInDB:(id)sender
{
    
    

    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];

    NSString *strLoginUserId=[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]];

//
//    DBManager* db = [[DBManager alloc] initWithDB:kDB_NAME];
//    [db createTableWithName:[NSString stringWithFormat:@"%@", kTABLE_NAME]];
//
//    StoreData * productData              = [[StoreData alloc]init];
//
//    productData.firstname                   = txtFirstName.text;
//    productData.lastname       = txtLastName.text;
//    productData.userId         = strLoginUserId;
//    productData.gender         = txtGender.text;
//    productData.dob            = txtDOB.text;
//    productData.dateofdisappearance         = txtDateOfDisapearance.text;
//    productData.placeofdisappearance        = txtPlaceOfDisapearance.text;
//    productData.fathername       = txtFatherName.text;
//    productData.mothername       = txtMotherName.text;
//    productData.selectcountry    = txtCountry.text;
//    productData.selectcity       = txtCity.text;
//    productData.selectstate      = txtState.text;
//
//    [db insertAndUpdateArrayUsingTrasaction:@[productData] tableName:[NSString stringWithFormat:@"%@", kTABLE_NAME]];
    
}



-(IBAction)submitAddMissingChild:(id)sender
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
    else
    {
    
    AddMissingChildFormTwoVC *AMCFTVC = [[AddMissingChildFormTwoVC alloc]init];
    
    NSDictionary *dict =[[NSDictionary alloc]initWithObjectsAndKeys:txtFirstName.text,@"keyFullName",
                         txtLastName.text,@"keyLastName",
                         txtGender.text,@"keyGender",
                         txtDOB.text,@"keyDob",
                         txtDateOfDisapearance.text,@"keyDateOfDisappearance",
                         txtPlaceOfDisapearance.text,@"keyPlaceOfDisapearance",
                         txtFatherName.text,@"keyFatherName",
                         txtMotherName.text,@"keyMotheName",
                         txtCountry.text,@"keyCountry",
                         txtState.text,@"keyState",
                         txtCity.text,@"keyCity",
                         picture,@"uiimageChildImage",nil];
    
    AMCFTVC.dictGetDataFromFirstForm=dict;
    AMCFTVC.imgGet=picture;
    [self.navigationController pushViewController:AMCFTVC animated:YES];
        
    }
    
}

-(BOOL)comapreDates
{

    
    NSString * strOne = txtDOB.text;
    
    NSDateFormatter * d1 = [[NSDateFormatter alloc] init];
    d1.dateFormat = @"yyyy-MM-dd";
    NSDate * date = [d1 dateFromString: strOne];
    d1.dateFormat = @"yyyy-MM-dd";
    strOne = [d1 stringFromDate: date];
    NSLog(@"strone---%@",strOne);
    
    
    
    NSString * strTwo = txtDateOfDisapearance.text;
    
    NSDateFormatter * d2 = [[NSDateFormatter alloc] init];
    d2.dateFormat = @"yyyy-MM-dd";
    NSDate * date2 = [d2 dateFromString: strTwo];
    d1.dateFormat = @"yyyy-MM-dd";
    strTwo = [d2 stringFromDate: date2];
    NSLog(@"strone---%@",strTwo);
    
    
    
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

#pragma mark - date of disappearance
-(void)updateTextFieldDateOfDisappearance:(id)sender
{
    UIDatePicker *picker12 = (UIDatePicker*)txtDateOfDisapearance.inputView;
    txtDateOfDisapearance.text = [self formatDate:picker12.date];
}

- (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}

- (NSString *)formatDateDateOfDisappearance:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
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
        //txtGender.text=@"Male";
        txtCountry.inputView = pickerGender;
        txtCountry.inputAccessoryView = pickerToolbar;
    }
    else
        if(textField==txtState)
        {
            pickerGender.tag=2;
            //txtGender.text=@"Male";
            txtState.inputView = pickerGender;
            txtState.inputAccessoryView = pickerToolbar;
        }
        else
            if(textField==txtGender)
            {
                pickerGender.tag=3;
                //txtGender.text=@"Male";
                txtGender.inputView = pickerGender;
                txtGender.inputAccessoryView = pickerToolbar;
            }
            else
                if(textField==txtCity)
                {
                    pickerGender.tag=4;
                    //txtGender.text=@"Male";
                    txtCity.inputView = pickerGender;
                    txtCity.inputAccessoryView = pickerToolbar;
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
        
                else
            if (textField==txtGender)
            {
                txtGender.text=@"Male";
                
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
        if ([txtCountry.text isEqualToString:@"Canada"])
        {
            txtPinOrZipCode.keyboardType=UIKeyboardTypeDefault;
        }
        else
        {
            txtPinOrZipCode.keyboardType=UIKeyboardTypePhonePad;
            
        }
    }
    
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
    
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warning!"
                                              
                                                                                 message:@"Please select a State"
                                              
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
        
        
        UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                                   
                                                           style:UIAlertActionStyleDefault
                                   
                                                         handler:nil];
        
        
        [alertController addAction:actionOk];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    
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
    
    
    return 0;
}



-(void)galleryOrCamera{

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



    UIAlertAction* cancel = [UIAlertAction
                               actionWithTitle:@"Cancel"
                               style:UIAlertActionStyleCancel
                               handler:^(UIAlertAction * action) {


                               }];


    [alert addAction:yesButton];
    [alert addAction:noButton];
    [alert addAction:cancel];

    if (kSCREEN_HEIGHT == 1024) {
        
        UIButton *btnSender = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btnSender.frame = CGRectMake(kSCREEN_WIDTH/2-90, 90, 180, 180);
        
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

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    picture = info[UIImagePickerControllerEditedImage];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    if (picture)
    {
        imgProfilePicture.image = picture;
        //imageData = [Alert compressImage:picture];
        

    }
    
}


#pragma mark - country,state,city

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
             
             [self->pickerGender reloadAllComponents];
             
             
                          
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
         
         [self.navigationController popViewControllerAnimated:YES];
         
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



@end
