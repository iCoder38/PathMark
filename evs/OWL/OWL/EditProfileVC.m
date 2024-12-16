//
//  EditProfileVC.m
//  OWL
//
//  Created by Apple on 7/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "EditProfileVC.h"

@interface EditProfileVC ()
{
    UIDatePicker *datePicker;
    NSDate *theMaximumDate;
    
    UIPickerView *pickerGender;
    UIToolbar *pickerToolbar;
    
    
    
    NSData *imageData;
    UIImage *image ;
    
    NSDictionary *dictGetAllDataFromLoginInEditProfile;
}

@property (strong, nonatomic)NSMutableArray *cardsArray;
@property (strong, nonatomic)NSMutableArray *cardsArrayId;

@property (strong, nonatomic)NSMutableArray *arrState;
@property (strong, nonatomic)NSMutableArray *arrStateId;

@property (strong, nonatomic)NSMutableArray *arrCity;
@property (strong, nonatomic)NSMutableArray *arrCityId;

@end

@implementation EditProfileVC




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _strDelegateOrNot=@"";
    
    _cardsArray=[[NSMutableArray alloc]init];
    _cardsArrayId=[[NSMutableArray alloc]init];
    
    _arrState=[[NSMutableArray alloc]init];
    _arrStateId=[[NSMutableArray alloc]init];
    
    _arrCity=[[NSMutableArray alloc]init];
    _arrCityId=[[NSMutableArray alloc]init];
    
    
     dictGetAllDataFromLoginInEditProfile = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    
    vieww.backgroundColor=Clear;
    
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
    
    [self.view insertSubview:imgBGp atIndex:0];
    
    
    
    imgProfilePicture.userInteractionEnabled = YES;
    if (kSCREEN_HEIGHT == 1024) {
        
         imgProfilePicture.layer.cornerRadius = imgProfilePicture.frame.size.height/2;
    }
    else{
        
         imgProfilePicture.layer.cornerRadius = imgProfilePicture.frame.size.height/2;
    }
   
    imgProfilePicture.clipsToBounds=YES;
    imgProfilePicture.backgroundColor=Clear;
    
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(actionSheetForCameraAndGalleryClick)];
    tapGesture1.numberOfTapsRequired = 1;
    [tapGesture1 setDelegate:self];
    [imgProfilePicture addGestureRecognizer:tapGesture1];
    
    
     [self allTextFieldMethod];
}

- (void)dataFromController:(NSMutableArray *)data
{
    NSLog(@"data===%@",data);
    
    _strDelegateOrNot=@"iamDelegate";
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:data forKey:@"keyIamDelegateUserDefaults"];
    [userDefaults synchronize];
    
    NSUserDefaults *userDefaultsd = [NSUserDefaults standardUserDefaults];
    NSArray *arrayOfImages = [userDefaultsd objectForKey:@"keyIamDelegateUserDefaults"];
    NSLog(@"arrayOfImages===%@",arrayOfImages);
    
    [self allTextFieldMethod];
    
}

-(void)allTextFieldMethod
{
    
    UIColor *b=DarkGray;
    
    UIFont *f=ml14;
    
    UIColor *rgb=RGBc(255, 255, 255);
    
    [Alert textFieldplaceholder:txtFirstName placeholder:@"First Name" color:b font:f];
    [Alert setLeftPaddingTextField:txtFirstName paddingValue:20];
    txtFirstName.delegate=self;
    txtFirstName.backgroundColor=rgb;
    //[txtFirstName becomeFirstResponder];
    
    [Alert textFieldplaceholder:txtEmail placeholder:@"Email" color:b font:f];
    [Alert setLeftPaddingTextField:txtEmail paddingValue:20];
    txtEmail.delegate=self;
    txtEmail.backgroundColor=rgb;
    txtEmail.keyboardType=UIKeyboardTypeEmailAddress;
    
    [Alert textFieldplaceholder:txtPhoneNumber placeholder:@"Phone" color:b font:f];
    [Alert setLeftPaddingTextField:txtPhoneNumber paddingValue:20];
    txtPhoneNumber.delegate=self;
    txtPhoneNumber.backgroundColor=rgb;
    txtPhoneNumber.keyboardType=UIKeyboardTypePhonePad;
    
    [Alert textFieldplaceholder:txtPassword placeholder:@"Password" color:b font:f];
    [Alert setLeftPaddingTextField:txtPassword paddingValue:20];
    txtPassword.delegate=self;
    txtPassword.backgroundColor=rgb;
    txtPassword.secureTextEntry=YES;
    
    [Alert textFieldplaceholder:txtConfirmPassword placeholder:@"Re-Password" color:b font:f];
    [Alert setLeftPaddingTextField:txtConfirmPassword paddingValue:20];
    txtConfirmPassword.delegate=self;
    txtConfirmPassword.backgroundColor=rgb;
    txtConfirmPassword.secureTextEntry=YES;
    
    [Alert textFieldplaceholder:txtAddress placeholder:@"Address" color:b font:f];
    [Alert setLeftPaddingTextField:txtAddress paddingValue:20];
    txtAddress.delegate=self;
    txtAddress.backgroundColor=rgb;
    
    
    [Alert textFieldplaceholder:txtZipcode placeholder:@"Postal Code/Zipcode" color:b font:f];
    [Alert setLeftPaddingTextField:txtZipcode paddingValue:20];
    txtZipcode.delegate=self;
    txtZipcode.backgroundColor=rgb;
    
    
    
    btnSignUp.backgroundColor=Black;
    [btnSignUp setTitle:@"SUBMIT" forState:UIControlStateNormal];
    [btnSignUp setTitleColor:rgb forState:UIControlStateNormal];
    [btnSignUp addTarget:self action:@selector(editWebServiceHitHere) forControlEvents:UIControlEventTouchUpInside];
    
    
    //keyboard
    txtFirstName.keyboardAppearance=UIKeyboardAppearanceDark;
    txtEmail.keyboardAppearance=UIKeyboardAppearanceDark;
    txtPhoneNumber.keyboardAppearance=UIKeyboardAppearanceDark;
    txtPassword.keyboardAppearance=UIKeyboardAppearanceDark;
    txtConfirmPassword.keyboardAppearance=UIKeyboardAppearanceDark;
    txtAddress.keyboardAppearance=UIKeyboardAppearanceDark;
    txtZipcode.keyboardAppearance=UIKeyboardAppearanceDark;
    
    txtZipcode.keyboardType=UIKeyboardTypeDefault;
    
    //border
    txtFirstName.layer.cornerRadius=2;
    txtFirstName.clipsToBounds=YES;
    
    
    txtEmail.layer.cornerRadius=2;
    txtEmail.clipsToBounds=YES;
    
    
    
    txtFirstName.text=[NSString stringWithFormat:@"%@",[dictGetAllDataFromLoginInEditProfile objectForKey:@"firstName"]];
    
    txtEmail.text=[NSString stringWithFormat:@"%@",[dictGetAllDataFromLoginInEditProfile objectForKey:@"emailId"]];
    
    txtEmail.backgroundColor=RGBc(241, 241, 241);
    txtEmail.userInteractionEnabled=NO;
    
    txtPhoneNumber.text=[NSString stringWithFormat:@"%@",[dictGetAllDataFromLoginInEditProfile objectForKey:@"mobile"]];
    
    txtPassword.text=[NSString stringWithFormat:@"%@",[dictGetAllDataFromLoginInEditProfile objectForKey:@"********"]];
    txtPassword.userInteractionEnabled=NO;
    txtPassword.backgroundColor=RGBc(241, 241, 241);
    
    txtConfirmPassword.text=[NSString stringWithFormat:@"%@",[dictGetAllDataFromLoginInEditProfile objectForKey:@"********"]];
    txtConfirmPassword.userInteractionEnabled=NO;
    txtConfirmPassword.backgroundColor=RGBc(241, 241, 241);
    
    txtAddress.text=[NSString stringWithFormat:@"%@",[dictGetAllDataFromLoginInEditProfile objectForKey:@"address"]];
    
    txtZipcode.text=[NSString stringWithFormat:@"%@",[dictGetAllDataFromLoginInEditProfile objectForKey:@"zipcode"]];
    
    //_strDelegateOrNot=@"iamDelegate";
    if ([_strDelegateOrNot isEqualToString:@"iamDelegate"])
    {
        //NSLog(@"data===%@",data);
        
        NSUserDefaults *userDefaultsd = [NSUserDefaults standardUserDefaults];
        NSArray *arrayOfImages = [userDefaultsd objectForKey:@"keyIamDelegateUserDefaults"];
        NSLog(@"arrayOfImages===%@",[NSString stringWithFormat:@"%@",arrayOfImages]);
        
        NSString *strImage = [NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",[arrayOfImages objectAtIndex:0]]];
        
        strImage = [strImage stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSURL *imageURL = [[NSURL alloc]initWithString:strImage];
        
        [imgProfilePicture sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
        
        
    }
    else
    {
        NSString *strImage = [dictGetAllDataFromLoginInEditProfile objectForKey:@"image"];
        
        strImage = [strImage stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSURL *imageURL = [[NSURL alloc]initWithString:strImage];
        
        [imgProfilePicture sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
        
    }
    
    imgProfilePicture.layer.borderColor = Black.CGColor;
    imgProfilePicture.layer.borderWidth = 2.0;
    ScrollVieww.delegate=self;
    
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
   // NSLog(@"OldLocation %f %f", oldLocation.coordinate.latitude, oldLocation.coordinate.longitude);
    
   // NSLog(@"NewLocation %f %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
}

- (void)viewDidLayoutSubviews
{
    ScrollVieww.contentSize = CGSizeMake(self.view.frame.size.width, 820);
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
       
    [self.navigationItem setHidesBackButton:YES animated:NO];
    
    [self setTitle:@"EDIT USER PROFILE"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    if ([self.matchFrom isEqualToString:@"map"])
    {
        UIBarButtonItem *leftBarButton1=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backFromMissingDetails)];
              
              self.navigationItem.leftBarButtonItem=leftBarButton1;
          
    }
    else
    {
        UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(lefttBarButtonClickMethodInSetting)];

           self.navigationItem.leftBarButtonItem=leftBarButton;

    }
    
    
   
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
}

-(void)backFromMissingDetails{
    
//    dictGetMissingAndFoundChild = nil;
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)lefttBarButtonClickMethodInSetting
{
    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];
}

-(void)signUpClickMethod
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


#pragma mark - final registration
-(void)editWebServiceHitHere
{
    if ([_strDelegateOrNot isEqualToString:@"iamDelegate"])
    {
        [self yesIamDelegateWebservice];
    }
    else
    {
        [self noIamNotDelegateWebservice];
    }
    
}

-(void)yesIamDelegateWebservice
{
    [SVProgressHUD showWithStatus:@"Please wait..." maskType:SVProgressHUDMaskTypeBlack];
    
    NSUserDefaults *userDefaultsd = [NSUserDefaults standardUserDefaults];
    NSArray *arrayOfImages = [userDefaultsd objectForKey:@"keyIamDelegateUserDefaults"];
    NSLog(@"arrayOfImages===%@",[NSString stringWithFormat:@"%@",arrayOfImages]);
    NSString *strImage = [NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",[arrayOfImages objectAtIndex:0]]];
    
    strImage = [strImage stringByReplacingOccurrencesOfString:@" " withString:@""];
    //NSURL *imageURL = [[NSURL alloc]initWithString:strImage];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    
    parameters = @{
                   @"action"        : @"editprofile",
                   @"userId"        : [dictGetAllDataFromLoginInEditProfile objectForKey:@"id"],
                   @"firstName"     :txtFirstName.text,
                   @"mobile"        : txtPhoneNumber.text,
                   @"address"       : txtAddress.text,
                   @"zipcode"       :txtZipcode.text,
                   @"image"         :strImage,
                   @"latitude"      :@"",
                   @"longitude"     :@""
                   };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         
         
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
         {
             
             [SVProgressHUD dismiss];
             _strDelegateOrNot=@"";
             
             NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
             
             
             [[NSUserDefaults standardUserDefaults] setObject:[dictPhotographerLogin objectForKey:@"response"] forKey:@"keyAllDataOfLoginUserOWL"];
             
             [defaults setObject:nil forKey:@"keyMyCurrentLat"];
             [defaults setObject:@"" forKey:@"keyMyCurrentLong"];
             
             [defaults setObject:@"" forKey:@"keyMyCurrentLat"];
             [defaults setObject:nil forKey:@"keyMyCurrentLong"];
             
             [defaults setObject:@"" forKey:@"keyIamDelegateUserDefaults"];
             [defaults setObject:nil forKey:@"keyIamDelegateUserDefaults"];
             
             [defaults synchronize];

             [self popuEdit];
             
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

-(void)noIamNotDelegateWebservice
{
    
    
    [SVProgressHUD showWithStatus:@"Please wait..." maskType:SVProgressHUDMaskTypeBlack];
    
    NSMutableDictionary* _params = [[NSMutableDictionary alloc] init];
    
    [_params setObject:[NSString stringWithFormat:@"%@",[dictGetAllDataFromLoginInEditProfile objectForKey:@"id"]]        forKey:@"userId"];
    [_params setObject:txtFirstName.text            forKey:@"firstName"];
    [_params setObject:txtPhoneNumber.text      forKey:@"mobile"];
    [_params setObject:txtAddress.text         forKey:@"address"];
    [_params setObject:txtZipcode.text          forKey:@"zipcode"];
    [_params setObject:@""          forKey:@"latitude"];
    [_params setObject:@""            forKey:@"longitude"];
    
    //userId
    //image : url
    
    [_params setObject:@"editprofile"          forKey:@"action"];
    
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
            
            [SVProgressHUD dismiss];
            
            NSLog(@"json====%@",json);
            
            NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
            
            
            [[NSUserDefaults standardUserDefaults] setObject:[json objectForKey:@"response"] forKey:@"keyAllDataOfLoginUserOWL"];
            
            [defaults setObject:nil forKey:@"keyMyCurrentLat"];
            [defaults setObject:@"" forKey:@"keyMyCurrentLong"];
            
            [defaults setObject:@"" forKey:@"keyMyCurrentLat"];
            [defaults setObject:nil forKey:@"keyMyCurrentLong"];
            
            [defaults synchronize];
            
            [self popuEdit];
            
        }
        else
        {
            
            NSLog(@"why?====%@",requestError.description);
        }
    }
}

//

-(void)popuEdit
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert"
                                          
                                                                             message:@"Profile Updated Successfully"
                                          
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    //We add buttons to the alert controller by creating UIAlertActions:
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                               
                                                       style:UIAlertActionStyleDefault
                               
                                                     handler:^(UIAlertAction *Action){
                                                         DashboardVC *Dashh=[self.storyboard instantiateViewControllerWithIdentifier:@"DashboardVCId"];
                                                         [self.navigationController pushViewController:Dashh animated:YES];
                                                     }]; 
    
    [alertController addAction:actionOk];
    
    [self presentViewController:alertController animated:YES completion:nil];
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

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
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

-(void)actionSheetForCameraAndGalleryClick{
    
    UIAlertController*alertAction=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
    {
        [self Open_Camera];
    }];
    
    
    UIAlertAction *action1=[UIAlertAction actionWithTitle:@"Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
    {
        [self Open_Library];
    }];
    
    UIAlertAction *action2=[UIAlertAction actionWithTitle:@"Open via Album" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
    {
      
        PickPhotoFromAppVC *pick=[self.storyboard instantiateViewControllerWithIdentifier:@"PickPhotoFromAppVCId"];
        pick.delegate = self;
        [self.navigationController pushViewController:pick animated:YES];
        
    }];
    
    
    UIAlertAction *cancelAlert=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    
    [alertAction addAction:action];
    [alertAction addAction:action1];
    [alertAction addAction:action2];
    [alertAction addAction:cancelAlert];
    
    if (kSCREEN_HEIGHT == 1024) {
        
        UIButton *btnSender = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btnSender.frame = CGRectMake(kSCREEN_WIDTH/2-90, 90, 180, 180);
        
        [self.view addSubview:btnSender];
        
        [alertAction setModalPresentationStyle:UIModalPresentationPopover];
        
        UIPopoverPresentationController *popPresenter = [alertAction popoverPresentationController];
        
        popPresenter.sourceView = btnSender;
        popPresenter.sourceRect = btnSender.bounds;
        [self presentViewController:alertAction animated:YES completion:nil];
    }
    else{
        
         [self presentViewController:alertAction animated:YES completion:nil];
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

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField==txtPhoneNumber)
    {
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
    if (textField==txtZipcode)
    {
      
        if(range.length + range.location > textField.text.length)
        {
            return NO;
        }
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 6;
        
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



@end

