//
//  AddMissingChildVC.m
//  OWL
//
//  Created by Apple on 7/24/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "AddMissingChildVC.h"


@interface AddMissingChildVC ()
{
    UIScrollView *scrolViewFull;
    
    UIPickerView *pickerGender;
    UIToolbar *pickerToolbar;
    
    UIView *viewOnScroll;
    
    UIDatePicker *datePicker;
    NSDate *theMaximumDate;
    
    IBOutlet UIImageView *imgProfilePicture;
    
    NSData *imageData;
    UIImage *image ;

}

@property (strong, nonatomic)NSMutableArray *arrGender;
@property (strong, nonatomic)NSMutableArray *arrIsTheChild;

@end

@implementation AddMissingChildVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self UiDesignPattern];
}

-(void)UiDesignPattern
{
    //self.view.backgroundColor=White;
    
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
    

    scrolViewFull=[[UIScrollView alloc]initWithFrame:cgFrame(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
     //scrolViewFull.backgroundColor=Yellow;
    
    [self.view addSubview:scrolViewFull];
    
    viewOnScroll=[[UIView alloc]initWithFrame:cgFrame(0, 0, self.view.frame.size.width, self.view.frame.size.height+1500)];
    //viewOnScroll.backgroundColor=Blue;
    [scrolViewFull addSubview:viewOnScroll];
    
    self.arrGender=[[NSMutableArray alloc] initWithObjects:@"Male",@"Female", nil];
    
    self.arrIsTheChild=[[NSMutableArray alloc] initWithObjects:@"Lost",@"Missing",@"Runaway",@"Others", nil];

    [self textFieldMethod];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

- (void)viewDidLayoutSubviews
{
    scrolViewFull.contentSize = CGSizeMake(self.view.frame.size.width, 1450);
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"ADD CHILD/PERSON INFO"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(sideBarMenuInAddNewChild)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    
    //[self dashboardClick];
    
}

-(void)sideBarMenuInAddNewChild
{
//    [self.revealViewController revealToggleAnimated:YES];
    [self.navigationController popViewControllerAnimated:YES];
    [self.view endEditing:YES];
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
    txtAddress=[[UITextField alloc]init];
    txtProvince=[[UITextField alloc]init];
    txtPincode=[[UITextField alloc]init];
    txtParentsMobileNumber=[[UITextField alloc]init];
    txtIdentificationMark=[[UITextField alloc]init];
    txtHeight=[[UITextField alloc]init];
    txtWeight=[[UITextField alloc]init];
    txtColourOfEyes=[[UITextField alloc]init];
    txtColorOfHair=[[UITextField alloc]init];
    txtWearGlassOrContactLens=[[UITextField alloc]init];
    txtIsTheChild=[[UITextField alloc]init];
    txtAnySuspicion=[[UITextField alloc]init];
    txtTheChildWasLastSeendWearing=[[UITextField alloc]init];
    txtComplaintDate=[[UITextField alloc]init];
    txtComplaintBy=[[UITextField alloc]init];
    
    
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
    txtAddress.delegate=self;
    txtProvince.delegate=self;
    txtPincode.delegate=self;
    txtParentsMobileNumber.delegate=self;
    txtIdentificationMark.delegate=self;
    txtHeight.delegate=self;
    txtColourOfEyes.delegate=self;
    txtWearGlassOrContactLens.delegate=self;
    txtIsTheChild.delegate=self;
    txtAnySuspicion.delegate=self;
    txtTheChildWasLastSeendWearing.delegate=self;
    txtComplaintDate.delegate=self;
    txtComplaintBy.delegate=self;
    
    
    
    
    [Alert textFieldplaceholder:txtFirstName frame:cgFrame(xPos, 80, 162.5, heights) placeholder:@"First Name" textColor:txtColor font:ml16 bg:[UIColor colorWithRed: 238.0 / 255.0 green: 238.0 / 255.0 blue: 238.0/ 255.0 alpha : 1] cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    [Alert textFieldplaceholder:txtLastName frame:cgFrame(txtFirstName.frame.size.width + txtFirstName.frame.origin.x + 10, 80, 162.5, heights) placeholder:@"Last Name" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    [Alert textFieldplaceholder:txtAddPicture frame:cgFrame(xPos, txtFirstName.frame.size.height + txtFirstName.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Add Picture" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
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
    
    
    
    [Alert textFieldplaceholder:txtDateOfDisapearance frame:cgFrame(xPos, txtDOB.frame.size.height + txtDOB.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Date Of Disapearance " textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
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
    
    
    
    [Alert textFieldplaceholder:txtPlaceOfDisapearance frame:cgFrame(xPos, txtDateOfDisapearance.frame.size.height + txtDateOfDisapearance.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Place of disappearnce" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    
    [Alert textFieldplaceholder:txtFatherName frame:cgFrame(xPos, txtPlaceOfDisapearance.frame.size.height + txtPlaceOfDisapearance.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Father's name" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    [Alert textFieldplaceholder:txtMotherName frame:cgFrame(xPos, txtFatherName.frame.size.height + txtFatherName.frame.origin.y + yPos, kSCREEN_WIDTH-40, 45) placeholder:@"Mother's name" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    [Alert textFieldplaceholder:txtAddress frame:cgFrame(xPos, txtMotherName.frame.size.height + txtMotherName.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Address" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    [Alert textFieldplaceholder:txtProvince frame:cgFrame(xPos, txtAddress.frame.size.height + txtAddress.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Province" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    [Alert textFieldplaceholder:txtPincode frame:cgFrame(xPos, txtProvince.frame.size.height + txtProvince.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Pincode" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    txtPincode.keyboardType=UIKeyboardTypePhonePad;
    
    
    
    
    [Alert textFieldplaceholder:txtParentsMobileNumber frame:cgFrame(xPos, txtPincode.frame.size.height + txtPincode.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Parent mobile number" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    txtParentsMobileNumber.keyboardType=UIKeyboardTypePhonePad;
    
    
    
    
    
    
    [Alert textFieldplaceholder:txtIdentificationMark frame:cgFrame(xPos, txtParentsMobileNumber.frame.size.height + txtParentsMobileNumber.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Identification mark" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    
    
    
    [Alert textFieldplaceholder:txtHeight frame:cgFrame(xPos, txtIdentificationMark.frame.size.height + txtIdentificationMark.frame.origin.y + yPos, 160, heights) placeholder:@"Height" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    [Alert textFieldplaceholder:txtWeight frame:cgFrame(txtHeight.frame.size.width + txtHeight.frame.origin.x + 15, txtIdentificationMark.frame.size.height + txtIdentificationMark.frame.origin.y + yPos, 160, heights) placeholder:@"Weight" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    [Alert textFieldplaceholder:txtColourOfEyes frame:cgFrame(xPos, txtHeight.frame.size.height + txtHeight.frame.origin.y + yPos, 160, heights) placeholder:@"Color of eyes" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    [Alert textFieldplaceholder:txtColorOfHair frame:cgFrame(txtColourOfEyes.frame.size.width + txtColourOfEyes.frame.origin.x + 15, txtHeight.frame.size.height + txtHeight.frame.origin.y + yPos, 160, heights) placeholder:@"Color of hair" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    [Alert textFieldplaceholder:txtWearGlassOrContactLens frame:cgFrame(xPos, txtColourOfEyes.frame.size.height + txtColourOfEyes.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Wearing glasses or contact lens" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    
    
    [Alert textFieldplaceholder:txtIsTheChild frame:cgFrame(20, txtWearGlassOrContactLens.frame.size.height + txtWearGlassOrContactLens.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Is the child" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    
    
    [Alert textFieldplaceholder:txtAnySuspicion frame:cgFrame(xPos, txtIsTheChild.frame.size.height + txtIsTheChild.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Any Suspicion/ Specific Details" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    
    
    
    [Alert textFieldplaceholder:txtTheChildWasLastSeendWearing frame:cgFrame(xPos, txtAnySuspicion.frame.size.height + txtAnySuspicion.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"The Child was last seen Wearing" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    
    
    
    [Alert textFieldplaceholder:txtComplaintDate frame:cgFrame(xPos, txtTheChildWasLastSeendWearing.frame.size.height + txtTheChildWasLastSeendWearing.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Complaint Date" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    txtComplaintDate.delegate=self;
    NSString *maxDateStringDateOfCompDate = txtComplaintDate.text;
    NSDateFormatter *dateFormatterDateOfDate = [[NSDateFormatter alloc] init];
    //2015-01-20
    dateFormatterDateOfDate.dateFormat = @"yyyy-MM-dd";
    theMaximumDate = [dateFormatterDateOfDate dateFromString: maxDateStringDateOfCompDate];
    [datePicker setMaximumDate:theMaximumDate];
    [datePicker setMaximumDate:[NSDate date]];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    [datePicker addTarget:self action:@selector(updateTextFieldDateOfDate:) forControlEvents:UIControlEventValueChanged];
    [txtComplaintDate setInputView:datePicker];

    
    
    [Alert textFieldplaceholder:txtComplaintBy frame:cgFrame(xPos, txtComplaintDate.frame.size.height + txtComplaintDate.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights) placeholder:@"Compained by" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    btnSubmit=[UIButton buttonWithType:UIButtonTypeCustom];
    btnSubmit.frame=cgFrame(20, txtComplaintBy.frame.size.height + txtComplaintBy.frame.origin.y + yPos, kSCREEN_WIDTH-40, heights);
    [btnSubmit setTitle:@"NEXT" forState:UIControlStateNormal];
    btnSubmit.titleLabel.font=ms16;
    btnSubmit.layer.cornerRadius=4;
    btnSubmit.clipsToBounds=YES;
    btnSubmit .backgroundColor=Black;
    [btnSubmit addTarget:self action:@selector(submitAddMissingChild) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
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
    [viewOnScroll addSubview:txtProvince];
    [viewOnScroll addSubview:txtPincode];
    [viewOnScroll addSubview:txtParentsMobileNumber];
    [viewOnScroll addSubview:txtIdentificationMark];
    [viewOnScroll addSubview:txtHeight];
    [viewOnScroll addSubview:txtWeight];
    [viewOnScroll addSubview:txtColourOfEyes];
    [viewOnScroll addSubview:txtColorOfHair];
    [viewOnScroll addSubview:txtWearGlassOrContactLens];
    [viewOnScroll addSubview:txtIsTheChild];
    [viewOnScroll addSubview:txtAnySuspicion];
    [viewOnScroll addSubview:txtTheChildWasLastSeendWearing];
    [viewOnScroll addSubview:txtComplaintDate];
    [viewOnScroll addSubview:txtComplaintBy];
    
    [viewOnScroll addSubview:btnSubmit];
    
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


#pragma mark - time of disappearance
-(void)updateTextFieldDateOfDisappearance:(id)sender
{
    UIDatePicker *picker12 = (UIDatePicker*)txtDateOfDisapearance.inputView;
    txtDateOfDisapearance.text = [self formatDate:picker12.date];
}

- (NSString *)formatDateDateOfDisappearance:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}


#pragma mark - complaint date

-(void)updateTextFieldDateOfDate:(id)sender
{
    UIDatePicker *picker12 = (UIDatePicker*)txtComplaintDate.inputView;
    txtComplaintDate.text = [self formatDateDateOfDate:picker12.date];
}

- (NSString *)formatDateDateOfDate:(NSDate *)date
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
    
    if(textField==txtGender)
    {
        if(txtGender.text.length>=1)
        {
            //[pickerGender selectRow:[self.arrGender indexOfObject:txtGender.text] inComponent:0 animated:NO];
        }
    }
    if (textField==txtIsTheChild)
    {
        if(txtIsTheChild.text.length>=1)
        {
            //[pickerGender selectRow:[self.arrGender indexOfObject:txtGender.text] inComponent:0 animated:NO];
        }
    }
    return YES;
}

- (IBAction)showPicker:(id)sender
{
    UITextField *textField=(UITextField *)sender;
    pickerGender = [[UIPickerView alloc] init];
    pickerGender.backgroundColor=White;
    pickerGender.showsSelectionIndicator = YES;
    pickerGender.multipleTouchEnabled=YES;
    pickerGender.dataSource = self;
    pickerGender.delegate = self;
    pickerToolbar = [[UIToolbar alloc] init];
    pickerToolbar.barStyle = UIBarStyleBlackTranslucent;
    [pickerToolbar sizeToFit];
    //to make the done button aligned to the right
    UIBarButtonItem *flexibleSpaceLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneClickedOfGenderPicker:)];
    [pickerToolbar setItems:[NSArray arrayWithObjects:flexibleSpaceLeft, doneButton, nil]];
    
    if(textField==txtGender)
    {
        pickerGender.tag=1;
        txtGender.inputView = pickerGender;
        txtGender.inputAccessoryView = pickerToolbar;
    }
    if(textField==txtIsTheChild)
    {
        pickerGender.tag=2;
        txtIsTheChild.inputView = pickerGender;
        txtIsTheChild.inputAccessoryView = pickerToolbar;
    }
}

-(void)doneClickedOfGenderPicker:(id) sender
{
    
    [pickerGender resignFirstResponder];
    
    [txtGender resignFirstResponder];
    
    [self.view endEditing:YES];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(pickerView.tag==1)
    {
        txtGender.text=[self.arrGender objectAtIndex:row];
    }
    if(pickerView.tag==2)
    {
        txtIsTheChild.text=[self.arrIsTheChild objectAtIndex:row];
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField==txtGender)
    {
        txtGender.text=@"Male";
        
    }
    if (textField==txtIsTheChild)
    {
        txtIsTheChild.text=@"Lost";
        
    }
    
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    if(pickerView.tag==1)
    {
        return [self.arrGender count];
    }
    
    if(pickerView.tag==2)
    {
        return [self.arrIsTheChild count];
    }
    
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    if(pickerView.tag==1)
    {
        return [self.arrGender objectAtIndex:row];
    }
    if(pickerView.tag==2)
    {
        return [self.arrIsTheChild objectAtIndex:row];
    }
    
    return 0;
}


-(void)submitAddMissingChild
{
    [Alert svSuccess:@"Adding..."];
        [self addMissingChildFormSubmit];
}
#pragma mark - submit webservice hit here

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

    [_params setObject:strLoginUserId                             forKey:@"userId"];
    
    [_params setObject:@""                              forKey:@"childId"];
    
    [_params setObject:txtFirstName.text                forKey:@"first_name"];
    
    [_params setObject:txtLastName.text                 forKey:@"last_name"];
    
    [_params setObject:@""                              forKey:@"nick_name"];
    
    [_params setObject:txtDOB.text                      forKey:@"date_of_birth"];
    
    [_params setObject:txtDateOfDisapearance.text       forKey:@"date_of_disappearance"];
    
    [_params setObject:txtFatherName.text               forKey:@"father_name"];
    
    [_params setObject:txtMotherName.text               forKey:@"mother_name"];
    
    [_params setObject:txtParentsMobileNumber.text      forKey:@"parents_mobile_number"];
    
    [_params setObject:txtIdentificationMark.text       forKey:@"identification_marks"];
    
    [_params setObject:txtHeight.text                   forKey:@"height"];
    
    [_params setObject:txtWeight.text                   forKey:@"weight"];
    
    [_params setObject:txtColourOfEyes.text             forKey:@"color_of_eyes"];
    
    [_params setObject:txtColorOfHair.text              forKey:@"color_of_hair"];
    
    [_params setObject:txtTheChildWasLastSeendWearing.text          forKey:@"is_wear_glasses_lens"];
    
    [_params setObject:txtIsTheChild.text               forKey:@"is_the_child_lost_reason"];
    
    [_params setObject:txtAnySuspicion.text             forKey:@"any_suspicion"];
    
    [_params setObject:txtTheChildWasLastSeendWearing.text  forKey:@"last_seen_wearing"];
    
    [_params setObject:txtComplaintDate.text            forKey:@"complaint_date"];
    
    [_params setObject:txtComplaintBy.text              forKey:@"complained_by"];
    
    [_params setObject:@""                              forKey:@"state"];
    
    [_params setObject:@""                              forKey:@"city"];
    
    [_params setObject:strCurrentLat                              forKey:@"latitude"];
    
    [_params setObject:strCurrentLong                            forKey:@"longitude"];
    
    
    [_params setObject:@"addMissingChild"               forKey:@"action"];
    
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
    if (imageData)
    {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.jpg\"\r\n", FileParamConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageData];
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
            
            DashboardVC *ds=[self.storyboard instantiateViewControllerWithIdentifier:@"DashboardVCId"];
            [self.navigationController pushViewController:ds animated:YES];
        }
        else
        {
            [Alert svError:somethingIssue];
            NSLog(@"why?====%@",requestError.description);
        }
    }
}

-(void)whenUserSaveAsAdraft
{
    
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    NSString *strLoginUserId=[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]];
    
    NSMutableDictionary* _params = [[NSMutableDictionary alloc] init];
    
    [_params setObject:strLoginUserId                             forKey:@"userId"];
    
    [_params setObject:@""                              forKey:@"childId"];
    
    [_params setObject:txtFirstName.text                forKey:@"first_name"];
    
    [_params setObject:txtLastName.text                 forKey:@"last_name"];
    
    [_params setObject:@""                              forKey:@"nick_name"];
    
    [_params setObject:txtDOB.text                      forKey:@"date_of_birth"];
    
    [_params setObject:txtDateOfDisapearance.text       forKey:@"date_of_disappearance"];
    
    [_params setObject:txtFatherName.text               forKey:@"father_name"];
    
    [_params setObject:txtMotherName.text               forKey:@"mother_name"];
    
    [_params setObject:txtParentsMobileNumber.text      forKey:@"parents_mobile_number"];
    
    [_params setObject:txtIdentificationMark.text       forKey:@"identification_marks"];
    
    [_params setObject:txtHeight.text                   forKey:@"height"];
    
    [_params setObject:txtWeight.text                   forKey:@"weight"];
    
    [_params setObject:txtColourOfEyes.text             forKey:@"color_of_eyes"];
    
    [_params setObject:txtColorOfHair.text              forKey:@"color_of_hair"];
    
    [_params setObject:txtTheChildWasLastSeendWearing.text          forKey:@"is_wear_glasses_lens"];
    
    [_params setObject:txtIsTheChild.text               forKey:@"is_the_child_lost_reason"];
    
    [_params setObject:txtAnySuspicion.text             forKey:@"any_suspicion"];
    
    [_params setObject:txtTheChildWasLastSeendWearing.text  forKey:@"last_seen_wearing"];
    
    [_params setObject:txtComplaintDate.text            forKey:@"complaint_date"];
    
    [_params setObject:txtComplaintBy.text              forKey:@"complained_by"];
    
    [_params setObject:@""                              forKey:@"state"];
    
    [_params setObject:@""                              forKey:@"city"];
    
    [_params setObject:@""                              forKey:@"latitude"];
    
    [_params setObject:@""                              forKey:@"longitude"];
    
    
    
    [_params setObject:@"addMissingChild"               forKey:@"action"];
    
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
    if (imageData)
    {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.jpg\"\r\n", FileParamConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageData];
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
            
            DashboardVC *ds=[self.storyboard instantiateViewControllerWithIdentifier:@"DashboardVCId"];
            [self.navigationController pushViewController:ds animated:YES];
        }
        else
        {
            [SVProgressHUD showErrorWithStatus:[json objectForKey:@"msg"] maskType:SVProgressHUDMaskTypeBlack];
            NSLog(@"why?====%@",requestError.description);
        }
    }
}

-(void)Open_Camera
{
    
#if TARGET_IPHONE_SIMULATOR
    
    NSLog(@"No Camera is set up in Simulator");
    
#else
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:NULL];
    
#endif
    
}

-(void)Open_Library
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate=self;
    imagePicker.navigationBar.tintColor=Black;
    imagePicker.allowsEditing = YES;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
    else
    {
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

-(void)selectphoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    
    UIImage *img =   [info objectForKey:UIImagePickerControllerOriginalImage];
    imgProfilePicture.image =img;
    NSLog(@"image user png is -----<%@",imgProfilePicture.image);
    
    if(imgProfilePicture==nil)
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"OOPS" message:@"No Image Foundy "
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:actionOk];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    else
    {
        imageData=[self compressImage:img];
        
        [picker dismissViewControllerAnimated:YES completion:nil];
        
    }
    return;
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(NSData *)compressImage:(UIImage *)image1
{
    
    float actualHeight = image1.size.height;
    float actualWidth = image1.size.width;

    float compressionQuality = 0.5;
    
    CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
    UIGraphicsBeginImageContext(rect.size);
    [image1 drawInRect:rect];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    imageData = UIImageJPEGRepresentation(img, compressionQuality);
    UIGraphicsEndImageContext();
    
    return imageData;
}

-(IBAction)actionSheetForCameraAndGalleryClick:(id)sender
{
    UIAlertController*alertAction=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
    {
        [self Open_Camera];
    }];
    
    
    UIAlertAction *action1=[UIAlertAction actionWithTitle:@"Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
    {
        [self Open_Library];
    }];
    
    
    UIAlertAction *cancelAlert=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    
    [alertAction addAction:action];
    [alertAction addAction:action1];
    [alertAction addAction:cancelAlert];
    
    [self presentViewController:alertAction animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    
}

@end
