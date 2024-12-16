//
//  DashboardVC.m
//  BABQ
//
//  Created by Apple on 7/7/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "DashboardVC.h"
#import <StoreKit/StoreKit.h>
#import "AddMissingChildNewVC.h"



@interface DashboardVC ()<CLLocationManagerDelegate>
{
    UIView *viewFull;
    UITextField *txtGender;
    
    UIPickerView *pickerGender;
    UIToolbar *pickerToolbar;
    
    UIDatePicker *datePicker;
    
    UITextField *txtDOB;
    NSDate *theMaximumDate;
    
    NSDictionary * myDictionary;
    
    UITextField *txtChildName;
    
    NSArray *arrChildList;
    
    NSMutableArray *mutAddArr;
    
    CLLocationManager *locManager;

}
@property (strong, nonatomic)NSMutableArray *arrRadar;
@property (strong, nonatomic) NSDate *lastTimestamp;

@property (strong, nonatomic)NSMutableArray *arrGender;
@end

@implementation DashboardVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [btnFintIt setBackgroundColor:RGBc(250, 127, 64)];
    btnFintIt.layer.cornerRadius=4;
    btnFintIt.clipsToBounds=YES;
    [btnFintIt setTitleColor:White forState:UIControlStateNormal];
    [btnFintIt addTarget:self action:@selector(findUserProfileClick) forControlEvents:UIControlEventTouchUpInside];

    [SKStoreReviewController requestReview];
    
    [btnMissingChild setBackgroundColor:RGBc(39, 214, 158)];
    btnMissingChild.layer.cornerRadius=4;
    btnMissingChild.clipsToBounds=YES;
    [btnMissingChild setTitleColor:White forState:UIControlStateNormal];
    [btnMissingChild addTarget:self action:@selector(missingUserProfileClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    locManager = [[CLLocationManager alloc] init];
    locManager.delegate = self;
    locManager.desiredAccuracy = kCLLocationAccuracyBest;
    locManager.distanceFilter = kCLDistanceFilterNone;
    locManager.pausesLocationUpdatesAutomatically = NO;
    [locManager startUpdatingLocation];
    
    
#if TARGET_IPHONE_SIMULATOR
    
//    latitude   = @"28.5355";
//    longitude  = @"77.3910";
    
#else
    
    [locManager requestWhenInUseAuthorization];
    [locManager requestAlwaysAuthorization];
    
  //  [self getCurrentLocation];
    
#endif
    
}

-(void)findUserProfileClick
{
    seeAllUserOnMapVC *SAU = [[seeAllUserOnMapVC alloc]init];
    [self.navigationController pushViewController:SAU animated:YES];

}

-(void)missingUserProfileClick
{
    MissingChildListVC *up=[self.storyboard instantiateViewControllerWithIdentifier:@"MissingChildListVCId"];
    [self.navigationController pushViewController:up animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    
    FIRDatabaseReference *scoresRef = [[FIRDatabase database] referenceWithPath:@"scores"];
    [[[scoresRef queryOrderedByValue] queryLimitedToLast:4]
     observeEventType:FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot *snapshot)
     {
         NSLog(@"The %@ dinosaur's score is %@", snapshot.key, snapshot.value);
     }];
    
    self.view.backgroundColor=Black;
    
    if([[[NSUserDefaults standardUserDefaults] valueForKey:@"guest"]  isEqual: @"false"])
    {
    
    myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];

    lblName.text=[[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"firstName"]] uppercaseString];
    lblCountry.text=[NSString stringWithFormat:@"%@, %@",[myDictionary objectForKey:@"address"], [myDictionary objectForKey:@"zipcode"]];
    lblCountry.numberOfLines = 0;
    lblCountry.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16];
    lblName.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
    //image
    
    }
    else
    {
        [lblName setHidden:true];
        [lblCountry setHidden:true];
        
    }
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"DASHBOARD"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(lefttBarButtonClickMethod)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    UIBarButtonItem *rightBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"plusi"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClickMethod)];
    
    self.navigationItem.rightBarButtonItem=rightBarButton;
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    
    //[self dashboardClick];
    
}

-(void)rightBarButtonClickMethod
{
    if([[[NSUserDefaults standardUserDefaults] valueForKey: @"guest"]   isEqual: @"false"])
    {
    UIStoryboard *Stor;
//    if (iPhoneVersion == 5 )
//    {
//        Stor=[UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//    }
//    else
//        if (iPhoneVersion == 6 )
//        {
            Stor=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        }
//    else
//        if (iPhoneVersion == 61)
//        {
//            Stor=[UIStoryboard storyboardWithName:@"Main6p" bundle:nil];
//        }
//    else
//    {
//        Stor=[UIStoryboard storyboardWithName:@"Mainpad" bundle:nil];
//    }
    
    AddMissingChildNewVC  *hp=[AddMissingChildNewVC new];
    hp.StrCheckFromSideBarOrNot=@"fromDashboard";
    [self.navigationController pushViewController:hp animated:YES];
    }
    else
    {
        [Alert svError:@"Please Register/Login to use this Functionality"];
    }

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)nextClickMethod
{
//    ViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerId"];
//    [self.navigationController pushViewController:vc animated:YES];
}



-(void)btnGraphgClickMethod
{
    NSArray *array;
    array = [[[NSUserDefaults standardUserDefaults] objectForKey:@"keyStoreAllGraphDigits"] mutableCopy];
    
 
    
    if (array.count == 0)
    {
        [self alertNoValue];
    }
    else
    {
    
//    UIViewController *vc;
//    vc = [[RadarChartViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:true];
    }
}

-(void)btnPlusClickMethod
{
//    MyBabyCanVC *mbc=[self.storyboard instantiateViewControllerWithIdentifier:@"MyBabyCanVCId"];
//    [self.navigationController pushViewController:mbc animated:YES];
}


-(void)lefttBarButtonClickMethod
{
    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];
}


#pragma mark - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    return  arrChildList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"dashboardCell";
    DashboardCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[DashboardCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *dictLocalGetChildList=[arrChildList objectAtIndex:indexPath.row];
    
    cell.lblName.text=[NSString stringWithFormat:@"%@",[dictLocalGetChildList objectForKey:@"name"]];
    
    cell.lblDobAndGender.text=[NSString stringWithFormat:@"%@ |",[dictLocalGetChildList objectForKey:@"dob"]];
    
    
    
    NSString *StrFirstLetterFromGender=[NSString stringWithFormat:@"%@",[dictLocalGetChildList objectForKey:@"gender"]];
    
    
    NSString *firstLetter = [StrFirstLetterFromGender substringToIndex:1];
    cell.lblGender.text=firstLetter;
    
    
    if ([[NSString stringWithFormat:@"%@",[dictLocalGetChildList objectForKey:@"gender"]]isEqualToString:@"Male"])
    {
        cell.lblGender.textColor=RGBc(28, 178, 237);
    }
    else
    {
        cell.lblGender.textColor=RGBc(246,29,133);
    }
    
    cell.cellView.layer.cornerRadius=4;
    cell.cellView.clipsToBounds=YES;
    
    cell.cellView.backgroundColor=[UIColor colorWithRed:228.0/255.0 green:228.0/255.0 blue:228.0/255.0 alpha:1];
    
    cell.backgroundColor=Clear;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //  NSLog(@"log====%@",[arrChildList objectAtIndex:indexPath.row]);
    
}

#pragma mark - dashboard
-(void)dashboardClick
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

        [SVProgressHUD showWithStatus:pleaseWait maskType:SVProgressHUDMaskTypeBlack];
    
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        NSDictionary *parameters;
        parameters = @{
                       @"action"            : @"profile",
                       @"userId"            : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]],
                                              };
        NSLog(@"parameters-------%@",parameters);
        
        
        [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             
             NSDictionary *dictPhotographerLogin=responseObject;
             
             NSString *strInt=[[dictPhotographerLogin objectForKey:@"status"]stringValue];
             
             if ([strInt isEqualToString:@"1"]== TRUE)
             {

                 [SVProgressHUD dismiss];
                 
                 [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

             }
             else
             {
                 
                 [SVProgressHUD showErrorWithStatus:[dictPhotographerLogin objectForKey:@"msg"] maskType:SVProgressHUDMaskTypeBlack];
                
                 
                 [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                 
             }
             
         }
              failure:^(AFHTTPRequestOperation *operation, NSError *error)
         
         {
             [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
             
         }];
        
}




#pragma mark - child list



#pragma mark - no graph points
-(void)alertNoValue
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error!" message:@"No Data Found" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:actionOk];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}


- (void)startUpdatingLocation
{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    if (status == kCLAuthorizationStatusDenied)
    {
        NSLog(@"Location services are disabled in settings.");
    }
    else
    {
        // for iOS 8
        if ([locManager respondsToSelector:@selector(requestAlwaysAuthorization)])
        {
            [locManager requestAlwaysAuthorization];
        }
        // for iOS 9
        if ([locManager respondsToSelector:@selector(setAllowsBackgroundLocationUpdates:)])
        {
            [locManager setAllowsBackgroundLocationUpdates:YES];
        }
        [locManager startUpdatingLocation];
    }
}


#pragma MARK - UPDATE USER LAT LONG


-(NSString *)getAddressFromLatLon:(CLLocation *)bestLocation{
    
    NSLog(@"%f %f", bestLocation.coordinate.latitude, bestLocation.coordinate.longitude);
    CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
    
    [geocoder reverseGeocodeLocation:bestLocation completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (error){
             NSLog(@"Geocode failed with error: %@", error);
             return;
         }
         
         CLPlacemark *placemark = [placemarks objectAtIndex:0];
         NSString *strCompleteAddress = [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@", [placemark.addressDictionary objectForKey:@"Name"],[placemark.addressDictionary objectForKey:@"SubLocality"],[placemark.addressDictionary objectForKey:@"City"],[placemark.addressDictionary objectForKey:@"State"],[placemark.addressDictionary objectForKey:@"ZIP"],[placemark.addressDictionary objectForKey:@"Country"]];
         
         if([[[NSUserDefaults standardUserDefaults] valueForKey: @"guest"]   isEqual: @"false"])
         {
         [self hitServerForLocationUpdate:bestLocation strCurrentAddress:[NSString stringWithFormat:@"%@", strCompleteAddress]];
         }
         
     }];
    
    return @"";
}


-(void)hitServerForLocationUpdate:(CLLocation *)mostRecentLocation strCurrentAddress:(NSString *)strCurrentAddress{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    
    NSDictionary *myDictionary12 = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    parameters = @{
                   
                   @"action"    : @"updateLatlong",
                   @"userId"    : [NSString stringWithFormat:@"%@",[myDictionary12 objectForKey:@"id"]],
                   @"latitude"    : [NSString stringWithFormat:@"%f", mostRecentLocation.coordinate.latitude],
                   @"longitude"    : [NSString stringWithFormat:@"%f", mostRecentLocation.coordinate.longitude],
                   @"currentAddress": strCurrentAddress
                   
                   };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         [SVProgressHUD dismiss];
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     
     {
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
         
     }];
    
    
}



- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [manager stopUpdatingLocation];
    CLLocation *mostRecentLocation = locations.lastObject;
    NSLog(@"Current location: %@ %@", @(mostRecentLocation.coordinate.latitude), @(mostRecentLocation.coordinate.longitude));
    
    
        NSString *myLatitude = [NSString stringWithFormat:@"%f",mostRecentLocation.coordinate.latitude];
       NSString *myLongitude = [NSString stringWithFormat:@"%f",mostRecentLocation.coordinate.longitude];
       
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
                      
  
    NSDate *now = [NSDate date];
    NSTimeInterval interval = self.lastTimestamp ? [now timeIntervalSinceDate:self.lastTimestamp] : 0;
    
    if (!self.lastTimestamp || interval >= 5 * 60){
        
        self.lastTimestamp = now;
        
        [self getAddressFromLatLon:mostRecentLocation];
        
    }
}

@end
