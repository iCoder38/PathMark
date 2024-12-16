//
//  RegistrationVC.m
//  BABQ
//
//  Created by Apple on 7/6/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "RegistrationVC.h"
#import "Utils.h"
#import "UIAlertController+AlertController.h"

typedef enum {
    CurrentImageCategoryAvatar = 0,
    CurrentImageCategoryCover
}CurrentImageCategory;

@interface RegistrationVC ()

{
    UIDatePicker *datePicker;
    NSDate *theMaximumDate;
    
    UIPickerView *pickerGender;
    UIToolbar *pickerToolbar;
    
    UIPopoverController *popover;

    NSData *imageData;
    UIImage *image ;
    
    NSData *imageIdData;
    UIImage *imageId ;
    
    int imgTag;
    
 }

@property (strong, nonatomic)NSMutableArray *cardsArray;
@property (strong, nonatomic)NSMutableArray *cardsArrayId;

@property (strong, nonatomic)NSMutableArray *arrState;
@property (strong, nonatomic)NSMutableArray *arrStateId;

@property (strong, nonatomic)NSMutableArray *arrCity;
@property (strong, nonatomic)NSMutableArray *arrCityId;

@end

@implementation RegistrationVC




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    
    
    
    if ([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)])
        [locationManager requestAlwaysAuthorization];
    [locationManager startUpdatingLocation];
    
    _mapView.showsUserLocation = YES;
    _mapView.mapType = MKMapTypeStandard;
    _mapView.delegate = self;
    
    
   
    
    _cardsArray=[[NSMutableArray alloc]init];
    _cardsArrayId=[[NSMutableArray alloc]init];
    
    _arrState=[[NSMutableArray alloc]init];
    _arrStateId=[[NSMutableArray alloc]init];
    
    _arrCity=[[NSMutableArray alloc]init];
    _arrCityId=[[NSMutableArray alloc]init];
    
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
    imgProfilePicture.layer.cornerRadius=imgProfilePicture.frame.size.height/2;
    imgProfilePicture.clipsToBounds=YES;
    imgProfilePicture.backgroundColor=Clear;
    imgProfilePicture.layer.borderColor = White.CGColor;
    imgProfilePicture.layer.borderWidth = 2.0;

    /*
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(actionSheetForCameraAndGalleryClick:)];
    tapGesture1.numberOfTapsRequired = 1;
    [tapGesture1 setDelegate:self];
    [imgProfilePicture addGestureRecognizer:tapGesture1];
    */
    [self allTextFieldMethod];
    
}

-(void)allTextFieldMethod
{
    
    UIColor *b=DarkGray;
    
    UIFont *f=ml14;
    
    UIColor *rgb=RGBc(255, 255, 255);
    
    [Alert textFieldplaceholder:txtFirstName placeholder:@"Name*" color:b font:f];
    [Alert setLeftPaddingTextField:txtFirstName paddingValue:20];
    txtFirstName.delegate=self;
    txtFirstName.backgroundColor=rgb;
    [txtFirstName becomeFirstResponder];
    
    [Alert textFieldplaceholder:txtEmail placeholder:@"Email*" color:b font:f];
    [Alert setLeftPaddingTextField:txtEmail paddingValue:20];
    txtEmail.delegate=self;
    txtEmail.backgroundColor=rgb;
    txtEmail.keyboardType=UIKeyboardTypeEmailAddress;
    
    [Alert textFieldplaceholder:txtPhoneNumber placeholder:@"Phone" color:b font:f];
    [Alert setLeftPaddingTextField:txtPhoneNumber paddingValue:20];
    txtPhoneNumber.delegate=self;
    txtPhoneNumber.backgroundColor=rgb;
    txtPhoneNumber.keyboardType=UIKeyboardTypePhonePad;
    
    [Alert textFieldplaceholder:txtPassword placeholder:@"Password*" color:b font:f];
    [Alert setLeftPaddingTextField:txtPassword paddingValue:20];
    txtPassword.delegate=self;
    txtPassword.backgroundColor=rgb;
    txtPassword.secureTextEntry=YES;
    
    [Alert textFieldplaceholder:txtConfirmPassword placeholder:@"Re-Password*" color:b font:f];
    [Alert setLeftPaddingTextField:txtConfirmPassword paddingValue:20];
    txtConfirmPassword.delegate=self;
    txtConfirmPassword.backgroundColor=rgb;
    txtConfirmPassword.secureTextEntry=YES;
    
    [Alert textFieldplaceholder:txtAddress placeholder:@"Address" color:b font:f];
    [Alert setLeftPaddingTextField:txtAddress paddingValue:20];
    txtAddress.delegate=self;
    txtAddress.backgroundColor=rgb;
    
    
    [Alert textFieldplaceholder:txtZipcode placeholder:@"Zip code/Postalcode" color:b font:f];
    [Alert setLeftPaddingTextField:txtZipcode paddingValue:20];
    txtZipcode.delegate=self;
    txtZipcode.backgroundColor=rgb;
    
    
    [Alert textFieldplaceholder:txtUpload placeholder:@"Upload ID Proof" color:b font:f];
    [Alert setLeftPaddingTextField:txtUpload paddingValue:20];
    txtUpload.delegate=self;
    txtUpload.backgroundColor=rgb;
    txtUpload.userInteractionEnabled = TRUE;
    
    
    btnSignUp.backgroundColor=Black;
    [btnSignUp setTitleColor:rgb forState:UIControlStateNormal];
    [btnSignUp addTarget:self action:@selector(hitSignup:) forControlEvents:UIControlEventTouchUpInside];
    
    [btnSignIn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    [btnSignIn addTarget:self action:@selector(backToSignInPage) forControlEvents:UIControlEventTouchUpInside];
    
    
//keyboard
    txtFirstName.keyboardAppearance=UIKeyboardAppearanceDark;
    txtEmail.keyboardAppearance=UIKeyboardAppearanceDark;
    txtPhoneNumber.keyboardAppearance=UIKeyboardAppearanceDark;
    txtPassword.keyboardAppearance=UIKeyboardAppearanceDark;
    txtConfirmPassword.keyboardAppearance=UIKeyboardAppearanceDark;
    txtAddress.keyboardAppearance=UIKeyboardAppearanceDark;
    txtZipcode.keyboardAppearance=UIKeyboardAppearanceDark;
    txtUpload.keyboardAppearance=UIKeyboardAppearanceDark;
    
    
//border
    txtFirstName.layer.cornerRadius=2;
    txtFirstName.clipsToBounds=YES;
    
    
    txtEmail.layer.cornerRadius=2;
    txtEmail.clipsToBounds=YES;
    
    
    ScrollVieww.delegate=self;
}

- (void)viewDidLayoutSubviews
{
    ScrollVieww.contentSize = CGSizeMake(self.view.frame.size.width, 820);
}




- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
  //  NSLog(@"OldLocation %f %f", oldLocation.coordinate.latitude, oldLocation.coordinate.longitude);
    
   // NSLog(@"NewLocation %f %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
}






-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    
    if (status == kCLAuthorizationStatusDenied)
    {
        NSLog(@"denied");
    }
    else if (status == kCLAuthorizationStatusAuthorizedAlways)
    {
        [self showMap];
    }
}

-(void)showMap
{
    
    if(IS_OS_8_OR_LATER)
    {
        [self.locationManager requestAlwaysAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
    
    //    float strlatitude = [[_dict objectForKey:@"latitude"] floatValue];
    //    float strlongitude = [[_dict objectForKey:@"longitude"] floatValue];
    
    
    
    //MY CURRENT LOCATION
    CLLocationCoordinate2D coordinate = [self getLocation];
    
    NSString *myLatitude = [NSString stringWithFormat:@"%f", coordinate.latitude];
    NSString *myLongitude = [NSString stringWithFormat:@"%f", coordinate.longitude];
    
    NSLog(@"*dLatitude : %@", myLatitude);
    NSLog(@"*dLongitude : %@",myLongitude);
    
    NSString *lati = [NSString stringWithFormat:@"%@",myLatitude];
    [[NSUserDefaults standardUserDefaults] setObject:lati forKey:@"keyMyCurrentLat"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    NSString *longi = [NSString stringWithFormat:@"%@",myLongitude];
    [[NSUserDefaults standardUserDefaults] setObject:longi forKey:@"keyMyCurrentLong"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
     [[NSUserDefaults standardUserDefaults] setObject:lati forKey:@"AllFetchUserLat"];
     [[NSUserDefaults standardUserDefaults] synchronize];
    
     [[NSUserDefaults standardUserDefaults] setObject:longi forKey:@"AllFetchUserLong"];
                      
     [[NSUserDefaults standardUserDefaults] synchronize];
                      
    
    //destination location
    float strlatitude = 15.8700;//19.0760;
    float strlongitude = 100.9925;//72.8777;
    
    //zoom
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    CLLocationCoordinate2D location;
    location.latitude = strlatitude;
    location.longitude = strlongitude;
    region.span = span;
    region.center = location;
    [_mapView setRegion:region animated:YES];
    
    
    MyAnnotation *ann = [[MyAnnotation alloc] init];
    ann.title=@"Dishant";
    ann.coordinate = region.center;
    [_mapView addAnnotation:ann];
    
}


#pragma mark - polyline method
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView
            rendererForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    renderer.strokeColor = Black;
    renderer.lineWidth = 2.0;
    return renderer;
    
}



-(CLLocationCoordinate2D) getLocation
{
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    CLLocation *location = [locationManager location];
    CLLocationCoordinate2D coordinate = [location coordinate];
    
    return coordinate;
}




- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    
    MKPinAnnotationView* annotationView = [[MKPinAnnotationView alloc]
                                           initWithAnnotation:annotation reuseIdentifier:@"loc"];
    annotationView.animatesDrop = YES;
    
    UIView *leftCAV;// =
    
    if (self.view.frame.size.height==667)
    {
        leftCAV= [[UIView alloc] initWithFrame:CGRectMake(0,0,325,70)];
    }
    else if (self.view.frame.size.height==736)
    {
        leftCAV= [[UIView alloc] initWithFrame:CGRectMake(0,0,425,70)];
    }
    else if (self.view.frame.size.height==1024)
    {
        leftCAV= [[UIView alloc] initWithFrame:CGRectMake(0,0,525,70)];
    }
    else
    {
        leftCAV= [[UIView alloc] initWithFrame:CGRectMake(0,0,300,70)];
    }
    
    
    
    NSString *str2 = @"";
    
    NSString *str3 = @"";
    
    
    
    NSString *strMessage = [NSString stringWithFormat:@" %@, %@", str2, str3];
    
    UILabel *lbl4;
    if (self.view.frame.size.height==667) {
        
        lbl4= [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 55)];
    }
    else if (self.view.frame.size.height==736){
        lbl4= [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 330, 55)];
    }
    else if (self.view.frame.size.height==1024){
        lbl4= [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 350, 55)];
    }
    else{
        lbl4= [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 45)];
    }
    
    
    lbl4.backgroundColor = [UIColor clearColor];
    lbl4.numberOfLines = 0;
    lbl4.text = strMessage;
    lbl4.textAlignment = NSTextAlignmentCenter;
    lbl4.textColor = [UIColor blackColor];
    lbl4.backgroundColor = [UIColor whiteColor];
    lbl4.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0];
    [leftCAV addSubview : lbl4];
    annotationView.leftCalloutAccessoryView = leftCAV;
    annotationView.canShowCallout = YES;
    
    return annotationView;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"REGISTER"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(lefttBarButtonClickMethodInNewAudit)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
}

-(void)lefttBarButtonClickMethodInNewAudit
{
    goBackDR
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

    if (textField==txtPhoneNumber) {

        int length = (int)[Alert getLength:textField.text];

        if(length == 10)
        {
            if(range.length == 0)
                return NO;
        }

        if(length == 3){

            NSString *num = [Alert formatNumber:textField.text];
            textField.text = [NSString stringWithFormat:@"(%@) ",num];

            if(range.length > 0)

                textField.text = [NSString stringWithFormat:@"%@",[num substringToIndex:3]];
        }
        else if(length == 6)
        {
            NSString *num = [Alert formatNumber:textField.text];
            textField.text = [NSString stringWithFormat:@"(%@) %@-",[num  substringToIndex:3],[num substringFromIndex:3]];

            if(range.length > 0)
                textField.text = [NSString stringWithFormat:@"(%@) %@",[num substringToIndex:3],[num substringFromIndex:3]];
        }
    }
    
    
    if(textField==txtFirstName)
    {
        
        NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "];
        
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

-(BOOL)isValidPinCode:(NSString*)pincode
{
    NSString *pinRegex = @"^[0-9]{6}$";
    NSPredicate *pinTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pinRegex];
    
    BOOL pinValidates = [pinTest evaluateWithObject:pincode];
    return pinValidates;
}



- (IBAction)uploadPP:(id)sender{
    
    imgTag = 1;
    
    [self galleryOrCamera];
}


-(void)galleryOrCamera{
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil  message:nil  preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Camera"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
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
                                }];
    
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"Gallery"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
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


- (IBAction)changeCoverPage:(id)sender{
  
    imgTag = 2;
    
    [self galleryOrCameraForId];
}

-(void)galleryOrCameraForId{
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil  message:nil  preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Camera"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
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
                                }];
    
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"Gallery"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
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
        
        btnSender.frame = txtUpload.frame;//CGRectMake(kSCREEN_WIDTH/2-90, 0, 180, 180);
        
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


# pragma mark - Image picker controller delegate methods

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    if(imgTag == 2)
    {
        // Set image to avatar
        //imgIdProof.image = chosenImage;
        
        UIImage *img =   [info objectForKey:UIImagePickerControllerOriginalImage];
        imgIdProof.image =img;
        NSLog(@"image user png is -----<%@",imgIdProof.image);
        
        if(imgIdProof==nil)
        {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"OOPS" message:@"No Image Foundy "
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:actionOk];
            [self presentViewController:alertController animated:YES completion:nil];
            
        }
        else
        {
            imageIdData=[self compressImageForIdProof:img];
            
            if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone) {
                [picker dismissViewControllerAnimated:YES completion:nil];
            } else {
                [popover dismissPopoverAnimated:YES];
            }
            imgIdProof.image = [info objectForKey:UIImagePickerControllerOriginalImage];
//            [picker dismissViewControllerAnimated:YES completion:nil];
            
        }

    }
    else if(imgTag == 1)
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
            imageData=[self compressImageForImage:img];
            
            if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone) {
                [picker dismissViewControllerAnimated:YES completion:nil];
            } else {
                [popover dismissPopoverAnimated:YES];
            }
            imgProfilePicture.image = [info objectForKey:UIImagePickerControllerOriginalImage];
//            [picker dismissViewControllerAnimated:YES completion:nil];
            
        }
    }
    
    
    
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - compress image for id proof
-(NSData *)compressImageForIdProof:(UIImage *)image1Id
{
    
    float actualHeight = image1Id.size.height;
    float actualWidth = image1Id.size.width;
    float compressionQuality = 0.5;
    
    CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
    UIGraphicsBeginImageContext(rect.size);
    [image1Id drawInRect:rect];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    imageIdData = UIImageJPEGRepresentation(img, compressionQuality);
    UIGraphicsEndImageContext();
    
    return imageIdData;
}

#pragma mark - compress for profile picture
-(NSData *)compressImageForImage:(UIImage *)image1image
{
    
    float actualHeight = image1image.size.height;
    float actualWidth = image1image.size.width;
    float compressionQuality = 0.5;
    
    CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
    UIGraphicsBeginImageContext(rect.size);
    [image1image drawInRect:rect];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    NSData *imageData12 = UIImageJPEGRepresentation(img, compressionQuality);
    UIGraphicsEndImageContext();
    
    return imageData12;
    
}

#pragma mark - back screen
-(void)backToSignInPage
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}

#pragma mark - validations before registration 
-(IBAction)hitSignup:(id)sender{
    
    if ([txtFirstName.text isEqualToString:@""])
    {
        [Alert svError:@"First Name should not be empty"];
    }
    else  if ([txtEmail.text isEqualToString:@""])
    {
        [Alert svError:@"Email should not be empty"];
    }
  
    else if ([txtPassword.text isEqualToString:@""])
    {
        [Alert svError:@"Password should not be empty"];
    }
    else
        if ([txtConfirmPassword.text isEqualToString:@""])
        {
            [Alert svError:@"Confirm Password should not be empty"];
        }
    
        else
            if (![txtPassword.text isEqualToString:txtConfirmPassword.text])
            {
                [Alert svError:@"Password not match"];
            }
   
                else
                {
                    [self signUpRegistrationClickMethod];
                }
    
    }


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

#pragma mark - firebase registration
-(void)signUpRegistrationClickMethod
{
    [Alert svProgress:@"Registering..."];
    [[FIRAuth auth]
     createUserWithEmail:txtEmail.text
     password:txtPassword.text
     completion:^(FIRUser *_Nullable user,
                  NSError *_Nullable error)
     {
         if (error)
         {
             
             if (FIRAuthErrorDomain)
             {
                 
                 if (error.code==17026)
                 {
                     [Alert svError:@"Password should be at least 6 characters"];
                 }
                 else if (error.code==17007)
                     
                 {
                     [Alert svError:@"The email address is already in use by another account"];
                 }
                  else if (error.code==17008)
                  {
                      [Alert svError:@"The email address is not in proper format"];

                  }
                 
                 
             }
         }
         else
         {
             NSLog(@"%@ created", user.email);
             NSLog(@"%@ created", user);
             NSLog(@"%@ providerID", user.providerID);
             NSLog(@"%@ uid", user.uid);//uid
             
             [self registrationWebserviceOfOwl:user.uid];
             
             
         }
         
     }];
 
}

#pragma mark - webservice registration without id proof
-(void)registrationWebserviceOfOwl :(NSString *)strFirebaseId{
    
    NSString *strCurrentLat;
    NSString *strCurrentLong;
    
#if TARGET_IPHONE_SIMULATOR
    
    strCurrentLat = @"28.77310";
    strCurrentLong = @"77.2831";
    
#else
    
    strCurrentLat = [[NSUserDefaults standardUserDefaults]
                               stringForKey:@"keyMyCurrentLat"];
    strCurrentLong = [[NSUserDefaults standardUserDefaults]
                                stringForKey:@"keyMyCurrentLong"];
    
#endif

    if([strCurrentLat isKindOfClass:[NSString class]] == FALSE)
    {
        strCurrentLat = @"";
    }
    
    if([strCurrentLong isKindOfClass:[NSString class]] == FALSE)
    {
        strCurrentLong = @"";
    }
    
    NSMutableDictionary* _params = [[NSMutableDictionary alloc] init];
    
    [_params setObject:txtFirstName.text        forKey:@"firstName"];
    [_params setObject:txtEmail.text            forKey:@"emailId"];
    [_params setObject:txtPhoneNumber.text      forKey:@"mobile"];
    [_params setObject:txtPassword.text         forKey:@"password"];
    [_params setObject:txtAddress.text          forKey:@"address"];
    [_params setObject:txtZipcode.text          forKey:@"zipcode"];
    [_params setObject:strCurrentLat            forKey:@"latitude"];
    [_params setObject:strCurrentLong           forKey:@"longitude"];
    [_params setObject:@"ios"                   forKey:@"device"];
    [_params setObject:[[FIRInstanceID instanceID] token]      forKey:@"deviceToken"];
    [_params setObject:strFirebaseId            forKey:@"firebaseId"];
    
    [_params setObject:@"registration"          forKey:@"action"];
    
    NSString *BoundaryConstant = @"----------V2ymHFg03ehbqgZCaKO6jy";
    NSString* FileParamConstant = @"image";
    
    NSURL* requestURL = [NSURL URLWithString:BaseURLOfOWL];
    
    
    // create request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setHTTPShouldHandleCookies:NO];
    [request setTimeoutInterval:120];
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
    
    NSError __block *requestError = NULL;
    NSURLResponse __block *response;
    
    
//    NSError __block *err = NULL;
//    NSData __block *data;
//    BOOL __block reqProcessed = false;
//    NSURLResponse __block *resp;
//
//    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable _data, NSURLResponse * _Nullable _response, NSError * _Nullable _error) {
//
//        resp = _response;
//        err = _error;
//        data = _data;
//        reqProcessed = true;
//
//            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];
//
//
//            if ([[json objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
//            {
//
//                [Alert svSuccess:@"Successfully registered..."];
//
//
//                [self lastRegistrationWithId:[json objectForKey:@"response"]];
//            }
//            else
//            {
//                NSLog(@"why?====%@",err.description);
//            }
//
//    }] resume];
//
//
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&requestError];

    if (requestError == nil)
    {

        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&requestError];

        if ([[json objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
        {

            [Alert svSuccess:@"Successfully registered..."];


            [self lastRegistrationWithId:[json objectForKey:@"response"]];
        }
        else
        {
            [Alert svError:@"Unable to Register!!!"];

            NSLog(@"why?====%@",requestError.description);
        }
    }
}


#pragma mark - last registration with id proof
-(void)lastRegistrationWithId :(NSDictionary *)dictGetFullValue{
    
    NSMutableDictionary* _params = [[NSMutableDictionary alloc] init];
    
    [_params setObject:[NSString stringWithFormat:@"%@",[dictGetFullValue objectForKey:@"id"]]        forKey:@"userId"];
    
    [_params setObject:@"changeIDProofPic"          forKey:@"action"];
    
    NSString *BoundaryConstant = @"----------V2ymHFg03ehbqgZCaKO6jy";
    NSString* FileParamConstant = @"IDProof";
    
    NSURL* requestURL = [NSURL URLWithString:BaseURLOfOWL];
    
    
    // create request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setHTTPShouldHandleCookies:NO];
    [request setTimeoutInterval:120];
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
    if (imageIdData)
    {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.jpg\"\r\n", FileParamConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageIdData];
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
            
       //     NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
            
//            [defaults setObject:nil forKey:@"keyMyCurrentLat"];
//            [defaults setObject:@"" forKey:@"keyMyCurrentLong"];
//
//            [defaults setObject:@"" forKey:@"keyMyCurrentLat"];
//            [defaults setObject:nil forKey:@"keyMyCurrentLong"];
            
           // [defaults synchronize];
            
            [self popUpAlert];
        }
        else
        {
            [Alert svError:@"Unable to Register!!!"];

            NSLog(@"why?====%@",requestError.description);
        }
    }
}

-(void)popUpAlert
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert"
                                          
                                                                             message:@"Registered Successfully"
                                          
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    //We add buttons to the alert controller by creating UIAlertActions:
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                               
                                                       style:UIAlertActionStyleDefault
                               
                                                     handler:^(UIAlertAction *Action){
                                                         [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];

                                                     }];
    
    [alertController addAction:actionOk];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
