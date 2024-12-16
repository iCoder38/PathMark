//
//  FilterFoundChildVC.m
//  OWL
//
//  Created by Apple on 8/23/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "FilterFoundChildVC.h"

@interface FilterFoundChildVC ()
{
    
    UIDatePicker *datePicker;
    NSDate *theMaximumDate;
    
    

    
    
    UIScrollView *scrolViewFull;
    UIView *viewOnScroll;
    
    UIPickerView *pickerGender;
    UIToolbar *pickerToolbar;
    
    
    NSMutableArray *arrSearchArray;
    
}

@property (strong, nonatomic)NSMutableArray *cardsArray;
@property (strong, nonatomic)NSMutableArray *cardsArrayId;

@property (strong, nonatomic)NSMutableArray *arrState;
@property (strong, nonatomic)NSMutableArray *arrStateId;

@property (strong, nonatomic)NSMutableArray *arrCity;
@property (strong, nonatomic)NSMutableArray *arrCityId;

@property (strong, nonatomic)NSMutableArray *arrGender;

@property (strong, nonatomic)NSMutableArray *arrColorOfHair;
@property (strong, nonatomic)NSMutableArray *arrColorOfEye;

@end

@implementation FilterFoundChildVC

@synthesize strIdentificationFilterArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    arrSearchArray=[[NSMutableArray alloc]initWithCapacity:0];
    
    _cardsArray=[[NSMutableArray alloc]init];
    _cardsArrayId=[[NSMutableArray alloc]init];
    
    _arrState=[[NSMutableArray alloc]init];
    _arrStateId=[[NSMutableArray alloc]init];
    
    _arrCity=[[NSMutableArray alloc]init];
    _arrCityId=[[NSMutableArray alloc]init];
    
    _arrColorOfHair=[[NSMutableArray alloc]init];
    _arrColorOfEye=[[NSMutableArray alloc]init];
    
    txtCountry.delegate=self;
    txtState.delegate=self;
    
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
    
    [self UIdesignPattern];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.view.backgroundColor=Black;
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"FILTER FOUND CHILD"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backClickFromFilterMissingChild)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    
    
    [self countryWebService];
}

-(void)backClickFromFilterMissingChild
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)sideBarFromFilterMissing
{
    
}

-(void)UIdesignPattern
{
    self.view.backgroundColor=White;
    scrolViewFull=[[UIScrollView alloc]initWithFrame:cgFrame(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //scrolViewFull.backgroundColor=Yellow;
    
    [self.view addSubview:scrolViewFull];
    
    viewOnScroll=[[UIView alloc]initWithFrame:cgFrame(0, 0, self.view.frame.size.width, self.view.frame.size.height+500)];
    //viewOnScroll.backgroundColor=Blue;
    [scrolViewFull addSubview:viewOnScroll];
    
    self.arrGender=[[NSMutableArray alloc] initWithObjects:@"Male",@"Female", nil];
    
    
    
    [self allTextFieldMethod];
    
}

- (void)viewDidLayoutSubviews
{
    scrolViewFull.contentSize = CGSizeMake(self.view.frame.size.width, 750);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

-(void)allTextFieldMethod
{
    
    int heights = 6;
    
    int xPos = 20;
    
    UIColor *txtColor=RGBc(104, 104, 104);
    UIColor *bgColor=RGBc(238, 238, 238);
    
    
    txtCountry=[[UITextField alloc]init];
    txtState=[[UITextField alloc]init];
    txtCity=[[UITextField alloc]init];
    txtSelectGender=[[UITextField alloc]init];
    txtSelectAge=[[UITextField alloc]init];
    txtSelectColorOfEyes=[[UITextField alloc]init];
    txtSelectColorOfHair=[[UITextField alloc]init];
    txtIdentificationMark=[[UITextField alloc]init];
    txtEnterLocation=[[UITextField alloc]init];
    
    
    //delegate
    txtCountry.delegate=self;
    txtState.delegate=self;
    txtCity.delegate=self;
    txtSelectGender.delegate=self;
    txtSelectAge.delegate=self;
    txtSelectColorOfEyes.delegate=self;
    txtSelectColorOfHair.delegate=self;
    txtIdentificationMark.delegate=self;
    txtEnterLocation.delegate=self;
    
    [Alert textFieldplaceholder:txtCountry frame:cgFrame(xPos, 80, kSCREEN_WIDTH-40, 45) placeholder:@"Country" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    [Alert textFieldplaceholder:txtState frame:cgFrame(xPos, txtCountry.frame.size.height + txtCountry.frame.origin.y + heights, kSCREEN_WIDTH-40, 45) placeholder:@"State" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    [Alert textFieldplaceholder:txtCity frame:cgFrame(xPos, txtState.frame.size.height + txtState.frame.origin.y + heights, kSCREEN_WIDTH-40, 45) placeholder:@"City" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];

    
    
    [Alert textFieldplaceholder:txtSelectGender frame:cgFrame(xPos, txtCity.frame.size.height + txtCity.frame.origin.y + heights, kSCREEN_WIDTH-40, 45) placeholder:@"Gender" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    [Alert textFieldplaceholder:txtSelectAge frame:cgFrame(xPos, txtSelectGender.frame.size.height + txtSelectGender.frame.origin.y + heights, kSCREEN_WIDTH-40, 45) placeholder:@"Age" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    [Alert textFieldplaceholder:txtSelectColorOfEyes frame:cgFrame(xPos, txtSelectAge.frame.size.height + txtSelectAge.frame.origin.y + heights, kSCREEN_WIDTH-40, 45) placeholder:@"Select color of Eyes" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    [Alert textFieldplaceholder:txtSelectColorOfHair frame:cgFrame(xPos, txtSelectColorOfEyes.frame.size.height + txtSelectColorOfEyes.frame.origin.y + heights, kSCREEN_WIDTH-40, 45) placeholder:@"Select color of Hair " textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    [Alert textFieldplaceholder:txtIdentificationMark frame:cgFrame(xPos, txtSelectColorOfHair.frame.size.height + txtSelectColorOfHair.frame.origin.y + heights, kSCREEN_WIDTH-40, 45) placeholder:@"Identification Mark" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
    
    
    
    [Alert textFieldplaceholder:txtEnterLocation frame:cgFrame(xPos, txtIdentificationMark.frame.size.height + txtIdentificationMark.frame.origin.y + heights, kSCREEN_WIDTH-40, 45) placeholder:@"Location" textColor:txtColor font:ml16 bg:bgColor cornerRadius:4 paddingValue:20 yesNo:YES];
    
    
//keyboard
    txtCountry.keyboardAppearance=UIKeyboardAppearanceDark;
    txtState.keyboardAppearance=UIKeyboardAppearanceDark;
    txtCity.keyboardAppearance=UIKeyboardAppearanceDark;
    txtSelectGender.keyboardAppearance=UIKeyboardAppearanceDark;
    txtSelectAge.keyboardAppearance=UIKeyboardAppearanceDark;
    txtSelectColorOfEyes.keyboardAppearance=UIKeyboardAppearanceDark;
    txtSelectColorOfHair.keyboardAppearance=UIKeyboardAppearanceDark;
    txtIdentificationMark.keyboardAppearance=UIKeyboardAppearanceDark;
    txtEnterLocation.keyboardAppearance=UIKeyboardAppearanceDark;
    
    txtSelectAge.keyboardType=UIKeyboardTypeNumberPad;
    
    
    btnSearch=[UIButton buttonWithType:UIButtonTypeCustom];
    btnSearch.frame=cgFrame(xPos, txtEnterLocation.frame.size.height + txtEnterLocation.frame.origin.y + heights, kSCREEN_WIDTH-40, 45);
    [btnSearch setTitle:@"SEARCH" forState:UIControlStateNormal];
    btnSearch.titleLabel.font=ms16;
    btnSearch.layer.cornerRadius=4;
    btnSearch.clipsToBounds=YES;
    btnSearch .backgroundColor=Black;
    [btnSearch addTarget:self action:@selector(finalSearchFromSubmitClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    [viewOnScroll addSubview:txtCountry];
    [viewOnScroll addSubview:txtState];
    [viewOnScroll addSubview:txtCity];
    [viewOnScroll addSubview:txtSelectGender];
    [viewOnScroll addSubview:txtSelectAge];
    [viewOnScroll addSubview:txtSelectColorOfEyes];
    [viewOnScroll addSubview:txtSelectColorOfHair];
    [viewOnScroll addSubview:txtIdentificationMark];
    [viewOnScroll addSubview:txtEnterLocation];
    [viewOnScroll addSubview:btnSearch];
    
}










-(void)SearchAddMissingChild
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self showPicker:textField];
    
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
        if(textField==txtSelectGender)
                {
                    if(txtSelectGender.text.length>=1)
                    {
                        [pickerGender selectRow:[self.arrGender indexOfObject:txtSelectGender.text] inComponent:0 animated:NO];
                    }
                }

        else
            if(textField==txtSelectColorOfHair)
            {
                if(txtSelectColorOfHair.text.length>=1)
                {
                    [pickerGender selectRow:[self.arrColorOfHair indexOfObject:txtSelectColorOfHair.text] inComponent:0 animated:NO];
                }
            }
            else
                if(textField==txtSelectColorOfEyes)
                {
                    if(txtSelectColorOfEyes.text.length>=1)
                    {
                        [pickerGender selectRow:[self.arrColorOfEye indexOfObject:txtSelectColorOfEyes.text] inComponent:0 animated:NO];
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
        if(textField==txtSelectGender)
        {
            pickerGender.tag=3;
            //txtGender.text=@"Male";
            txtSelectGender.inputView = pickerGender;
            txtSelectGender.inputAccessoryView = pickerToolbar;
        }
    else
        if(textField==txtCity)
        {
            pickerGender.tag=4;
            //txtGender.text=@"Male";
            txtCity.inputView = pickerGender;
            txtCity.inputAccessoryView = pickerToolbar;
        }
        else
            if(textField==txtSelectColorOfHair)
            {
                pickerGender.tag=6;
                //txtGender.text=@"Male";
                txtSelectColorOfHair.inputView = pickerGender;
                txtSelectColorOfHair.inputAccessoryView = pickerToolbar;
            }
            else
                if(textField==txtSelectColorOfEyes)
                {
                    pickerGender.tag=7;
                    //txtGender.text=@"Male";
                    txtSelectColorOfEyes.inputView = pickerGender;
                    txtSelectColorOfEyes.inputAccessoryView = pickerToolbar;
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
    
    
    //
    //        NSInteger indexSelected = [pickerGender selectedRowInComponent:0];
    //
    //        NSLog(@"indexSelected=====%@",[_arrCity objectAtIndex:indexSelected]);
    //
    //        txtCity.text=[NSString stringWithFormat:@"%@",[_arrCity objectAtIndex:indexSelected]];
    
    
    
    
    
    [txtCountry resignFirstResponder];
    
    [txtState resignFirstResponder];
    
    [txtCity resignFirstResponder];
    
    [txtSelectGender resignFirstResponder];
    
    [txtSelectColorOfHair resignFirstResponder];
    [txtSelectColorOfEyes resignFirstResponder];
    
    
    
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
                if (textField==txtSelectGender)
                {
                    txtSelectGender.text=@"Male";
                    
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
                txtSelectGender.text=[self.arrGender objectAtIndex:row];
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
        if(pickerView.tag==6)
        {
            txtSelectColorOfHair.text = [_arrColorOfHair objectAtIndex:row];
            
        }
        else
            if(pickerView.tag==7)
            {
                txtSelectColorOfEyes.text = [_arrColorOfEye objectAtIndex:row];
                
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
            if(pickerView.tag==6)
            {
                return [self.arrColorOfHair count];
            }
            else
                if(pickerView.tag==7)
                {
                    return [self.arrColorOfEye count];
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
                    if(pickerView.tag==6)
                    {
                        return [_arrColorOfHair objectAtIndex:row];
                    }
                    else
                        if(pickerView.tag==7)
                        {
                            return [_arrColorOfEye objectAtIndex:row];
                        }
    

    return 0;
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



#pragma mark - final search
-(void)finalSearchFromSubmitClick
{
    
    /*
    if ([txtCountry.text isEqualToString:@""])
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
    else if ([txtSelectGender.text isEqualToString:@""])
    {
        [Alert svError:@"Gender should not be empty"];
    }
    else if ([txtSelectAge.text isEqualToString:@""])
    {
        [Alert svError:@"Age should not be empty"];
    }
    else if ([txtSelectColorOfEyes.text isEqualToString:@""])
    {
        [Alert svError:@"Color of eyes should not be empty"];
    }
    else if ([txtSelectColorOfHair.text isEqualToString:@""])
    {
        [Alert svError:@"Color of hair should not be empty"];
    }
    else if ([txtIdentificationMark.text isEqualToString:@""])
    {
        [Alert svError:@"Identification mark should not be empty"];
    }
    else if ([txtEnterLocation.text isEqualToString:@""])
    {
        [Alert svError:@"Location should not be empty"];
    }
    else
    {
    */
    
    _arrCity=nil;
    _arrCityId=nil;
    
    _arrCity=[[NSMutableArray alloc]initWithCapacity:0];
    _arrCityId=[[NSMutableArray alloc]initWithCapacity:0];
    
    [SVProgressHUD showWithStatus:@"Searching..." maskType:SVProgressHUDMaskTypeBlack];
    
    NSDictionary *    myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];


    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{
                                 @"action": @"filterChildren",
                                 @"userId" : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]],
                                 @"country" : txtCountry.text,
                                 @"state" : txtState.text,
                                 @"gender" : txtSelectGender.text,
                                 @"city" : txtCity.text,
                                 @"age" : txtSelectAge.text,
                                 @"eyecolor" : txtSelectColorOfEyes.text,
                                 @"haircolor" : txtSelectColorOfHair.text,
                                 @"idmarks" : txtIdentificationMark.text,
                                 @"location" : txtEnterLocation.text,
                                 @"status" : @"Found"
                                 };
    
    NSLog(@"parameters-------%@",parameters);
    
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]== TRUE)
             
         {
             [SVProgressHUD dismiss];
             
             strIdentificationFilterArray = @"filterString";
             
             arrSearchArray=[dictPhotographerLogin objectForKey:@"response"];
             
             NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
             [userDefaults setObject:arrSearchArray forKey:@"keyStoreFilterFoundChils"];
             [userDefaults synchronize];
             
             
             
             
             
             [[NSNotificationCenter defaultCenter]
              postNotificationName:@"TestNotification"
              object:self];

             
             
             [self.navigationController popViewControllerAnimated:YES];
             
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
    //}
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
             
             //strDelegateOrNot=@"";
             
             [SVProgressHUD dismiss];
             
             
             
             //NSLog(@"[dictPhotographerLogin objectForKey:%@",[dictPhotographerLogin objectForKey:@"response"]);
             
             
             
             NSArray *arrColorEye=[[dictPhotographerLogin objectForKey:@"response"]objectForKey:@"ColorEye"];
             
             for (NSInteger i=0; i<[arrColorEye count]; i++)
             {
                 
                 //NSLog(@"arrColorEye==%@",arrColorEye);
                 
                 NSDictionary *dict=[[[dictPhotographerLogin objectForKey:@"response"]objectForKey:@"ColorEye"]objectAtIndex:i];
                 
                 NSLog(@"dict===%@",dict);
                 
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
             
             //strDelegateOrNot=@"";
             
             [SVProgressHUD dismiss];
             
             
             
             //NSLog(@"[dictPhotographerLogin objectForKey:%@",[dictPhotographerLogin objectForKey:@"response"]);
             
             
             
             NSArray *arrColorEye=[[dictPhotographerLogin objectForKey:@"response"]objectForKey:@"ColorHair"];
             
             for (NSInteger i=0; i<[arrColorEye count]; i++)
             {
                 
                 //NSLog(@"arrColorEye==%@",arrColorEye);
                 
                 NSDictionary *dict=[[[dictPhotographerLogin objectForKey:@"response"]objectForKey:@"ColorHair"]objectAtIndex:i];
                 
                 NSLog(@"dict===%@",dict);
                 
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
