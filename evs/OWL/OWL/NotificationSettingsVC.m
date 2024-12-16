//
//  NotificationSettingsVC.m
//  OWL
//
//  Created by Apple on 8/2/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "NotificationSettingsVC.h"

@interface NotificationSettingsVC ()
{
    NSString *strEnableDisableNotifications;
    NSString *strMute;
    NSDictionary *dictGetLoginDetailsForSettings;
    UIPickerView *pickerGender;
    UIToolbar *pickerToolbar;
}

@property (strong, nonatomic)NSMutableArray *cardsArray;
@property (strong, nonatomic)NSMutableArray *cardsArrayId;

@property (strong, nonatomic)NSMutableArray *arrState;
@property (strong, nonatomic)NSMutableArray *arrStateId;

@end

@implementation NotificationSettingsVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    _cardsArray=[[NSMutableArray alloc]init];
    _cardsArrayId=[[NSMutableArray alloc]init];
    
    _arrState=[[NSMutableArray alloc]init];
    _arrStateId=[[NSMutableArray alloc]init];
    
    txtCountry.delegate=self;
    txtState.delegate=self;

    txtCountry.layer.cornerRadius=4;
    txtCountry.clipsToBounds=YES;
    
    txtState.layer.cornerRadius=4;
    txtState.clipsToBounds=YES;
    
    txtCountry.layer.borderColor=DarkGray.CGColor;
    txtCountry.layer.borderWidth=0.80f;
    
    txtState.layer.borderColor=DarkGray.CGColor;
    txtState.layer.borderWidth=0.80f;
    
    [Alert textFieldplaceholder:txtCountry placeholder:@"Select Country" color:DarkGray font:[UIFont fontWithName:@"Futura" size:14.0f]];
    
    [Alert textFieldplaceholder:txtState placeholder:@"Select State" color:DarkGray font:[UIFont fontWithName:@"Futura" size:14.0f]];

    [Alert setLeftPaddingTextField:txtCountry paddingValue:20];
    [Alert setLeftPaddingTextField:txtState paddingValue:20];
    
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
    
    
    UIImageView *imgFullView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    imgFullView.backgroundColor=RGBc(53, 60, 78);
    imgFullView.alpha=0.70f;
    [self.view insertSubview:imgFullView atIndex:0];
    [self.view insertSubview:imgBGp atIndex:0];
    
    

    view1.backgroundColor=RGBc(30, 36, 49);

    view2.backgroundColor=RGBc(30, 36, 49);

    view3.backgroundColor=RGBc(30, 36, 49);

    view4.backgroundColor=RGBc(30, 36, 49);
    
    
    
    
    swEnableNotification.tintColor=Red;
    [swEnableNotification setOnTintColor:Green];
    
    
    [swEnableNotification addTarget:self
              action:@selector(switchIsChangedEnableDisable:)
    forControlEvents:UIControlEventValueChanged];
    
    
    
    
    
    
    swMute.tintColor=Red;
    [swMute setOnTintColor:Green];
    
    
    [swMute addTarget:self
                             action:@selector(switchIsChangedMute:)
                   forControlEvents:UIControlEventValueChanged];
    
    
    
    
    dictGetLoginDetailsForSettings = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    if ([[dictGetLoginDetailsForSettings objectForKey:@"notification"] isEqualToString:@"1"] == TRUE)
    {
        
        swEnableNotification.on = TRUE;
    }
    else
    {
        swEnableNotification.on = FALSE;
        
    }
    
    
    
    if ([[dictGetLoginDetailsForSettings objectForKey:@"mute"] isEqualToString:@"1"] == TRUE) {
        
        swMute.on = TRUE;
    }
    else{
        swMute.on = FALSE;
        
    }


    
    
    
}
- (void) switchIsChangedMute:(UISwitch *)paramSender
{
    UISwitch *sw = paramSender;
    
    //VISIBILTY
    if ([sw isOn])
    {
        
        
        strMute = @"1";
        
    } else
    {
        
        strMute = @"0";
    }
    
    [self settingClick:@"muteSound"];
}

- (void) switchIsChangedEnableDisable:(UISwitch *)paramSender
{
    
    UISwitch *sw = paramSender;
    
//VISIBILTY
    if ([sw isOn])
    {
        
        
        strEnableDisableNotifications = @"1";
        
    } else
    {
        
        strEnableDisableNotifications = @"0";
    }
    
    [self settingClick:@"enableDisableNotifications"];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"Setting"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(lefttBarButtonClickMethodInSetting)];

    self.navigationItem.leftBarButtonItem=leftBarButton;

    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    
    [self countryWebServicess];
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
    
    
    
    return 0;
}





-(void)lefttBarButtonClickMethodInSetting
{
    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];
}


-(void)settingClick:(NSString *)strStatus
{
    
    NSLog(@"strStatus====%@",strStatus);
    
    /*
    "action: setting
    notification ( 0 = OFF 1== ON)
    mute ( 0 = OFF 1== ON)
    specificState
    specificCountry"
    */
    
    
    [Alert svProgress:pleaseWait];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    
    
    if ([strStatus isEqualToString:@"enableDisableNotifications"] == TRUE)
    {
        parameters = @{
                       @"action"            : @"setting",
                       @"userId"           : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]],
                       @"notification" : strEnableDisableNotifications,
                       @"mute" : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"mute"]],
                       @"specificState" : @"",
                       @"specificCountry" : @""
                       };

    
    }
    else
        if ([strStatus isEqualToString:@"muteSound"] == TRUE)
        {
            parameters = @{
                           @"action"            : @"setting",
                           @"userId"           : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]],
                           @"notification" : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"notification"]],
                           @"mute" : strMute,
                           @"specificState" : @"",
                           @"specificCountry" : @""

                           };

        }
    
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         [SVProgressHUD dismiss];
         
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
         {
             
             [[NSUserDefaults standardUserDefaults] setObject:[dictPhotographerLogin objectForKey:@"response"] forKey:@"keyAllDataOfLoginUserOWL"];
             
//             arrAllMissingChildList=[dictPhotographerLogin objectForKey:@"response"];
//             
//             [self loadTableView];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}


#pragma mark - country,state,city

#pragma mark - country
-(void)countryWebServicess
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
             
             
             //             txtCountry.text=[NSString stringWithFormat:@"%@",[[[dictPhotographerLogin objectForKey:@"response"]objectAtIndex:0] objectForKey:@"name"]];
             
             //             [self stateWebService:[NSString stringWithFormat:@"%@",[[[dictPhotographerLogin objectForKey:@"response"]objectAtIndex:0] objectForKey:@"id"]]];
             
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

@end
