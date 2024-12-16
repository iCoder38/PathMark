//
//  seeAllUser.m
//  OWL
//
//  Created by Rameshwar on 23/08/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "seeAllUser.h"
#import "AppDelegate.h"
#import "Utils.h"
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"

@interface seeAllUser ()< CLLocationManagerDelegate, MKMapViewDelegate, UISearchBarDelegate, UISearchControllerDelegate>{

    NSMutableArray *arrTotalPatients;
    UIView *loaderView;
    CLLocationManager *locationManager;
    NSString *latitude;
    NSString *longitude;
    MKMapView *mapView;
    NSMutableArray *arrLocationdata, *arrStoreLocationData, *arrStoreSearchData, *arrLatLongSearchData, *arrStoreLatLongSearchData;;
    int annotationImg;
    NSArray *ArrMissingChildOrNot;
    
}


@property (strong, nonatomic) NSDate *lastTimestamp;

@end

@implementation seeAllUser


-(void)viewDidLoad{

//    UIAlertView *alert = [[UIAlertView alloc] init]
    
    [super viewDidLoad];

    self.view.backgroundColor = White;


    arrTotalPatients = [[NSMutableArray alloc]initWithCapacity:0];

    arrLocationdata = [[NSMutableArray alloc]initWithCapacity:0];

    arrStoreLocationData = [[NSMutableArray alloc]initWithCapacity:0];

    arrStoreLatLongSearchData = [[NSMutableArray alloc]initWithCapacity:0];

    annotationImg = 0;

    if(![CLLocationManager locationServicesEnabled])
       {
           //            [self showMessage:@"Please enable location services to detect location!" withTitle:@"Location not enabled"];
       }
       else if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied){
           //Now if the location is denied.
           UIAlertController *alertController = [UIAlertController
                                                 alertControllerWithTitle:@"Enable location permission"
                                                 message:@"This App Requires Location While Using The App"
                                                 preferredStyle:UIAlertControllerStyleAlert];
           
           //            alertController.view.tintColor = AppColor;
           UIAlertAction *cancelAction = [UIAlertAction
                                          actionWithTitle:@"Dismiss"
                                          style:UIAlertActionStyleCancel
                                          handler:^(UIAlertAction *action)
                                          {
               NSLog(@"Cancel action");
           }];
           
           UIAlertAction *goToSettings = [UIAlertAction
                                          actionWithTitle:@"Settings"
                                          style:UIAlertActionStyleDefault
                                          handler:^(UIAlertAction *action)
                                          {
               
               NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
               [[UIApplication sharedApplication] openURL:url];
           }];
           
           [alertController addAction:cancelAction];
           [alertController addAction:goToSettings];
           [self presentViewController:alertController animated:YES completion:^{
               //                alertController.view.tintColor = AppColor;
           }];
       }
       else{
           
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.pausesLocationUpdatesAutomatically = NO;
    [locationManager startUpdatingLocation];
    


#if TARGET_IPHONE_SIMULATOR

    latitude   = @"28.5355";
    longitude  = @"77.3910";

#else

    [locationManager requestWhenInUseAuthorization];
 

    [self getCurrentLocation];

#endif

    [self seeAllUser];
       }

}

-(void)setNavigationBarWithSearch
{

    self.title = @"SEE ALL USERS";

    self.navigationController.navigationBarHidden = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;

    UIButton * menuButton  = [UIButton buttonWithType:UIButtonTypeSystem];
    menuButton.frame = CGRectMake(8, 18, 18, 18);
    [menuButton setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(hitSideMenu:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *accountBarItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    self.navigationItem.leftBarButtonItem = accountBarItem;
    self.navigationItem.rightBarButtonItems =@[[self searchButtonBarItem]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName: mr17}];

    self.navigationController.navigationBar.barTintColor = Black;

}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(IBAction)hitSideMenu:(id)sender
{

    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];

}



-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];

    [self setNavigationBarWithSearch];
}


#pragma mark - Get Current Location

-(CLLocationCoordinate2D) getLocation{



    CLLocation *location = [locationManager location];
    CLLocationCoordinate2D coordinate = [location coordinate];

    return coordinate;

}

- (void)getCurrentLocation{

    CLLocationCoordinate2D coordinate = [self getLocation];
    latitude = [NSString stringWithFormat:@"%f", coordinate.latitude];
    longitude = [NSString stringWithFormat:@"%f", coordinate.longitude];
    
    NSLog(@"Latitude  = %@", latitude);
    NSLog(@"Longitude = %@", longitude);

}



-(void)loadUI:(NSArray *)arrNurseData{


    [mapView removeFromSuperview];

    mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, kSCREEN_HEIGHT)];
    mapView.delegate=self;
    [self.view addSubview:mapView];

    NSLog(@"%@", [arrNurseData objectAtIndex:0]);

    float latitudeFirst =   [[[arrNurseData objectAtIndex:0]objectForKey:@"lat"]floatValue];

    float longitudeFirst =   [[[arrNurseData objectAtIndex:0]objectForKey:@"long"]floatValue];

    NSLog(@"first index lat ----->%f",latitudeFirst);
    NSLog(@"first index lat ----->%f",longitudeFirst);



    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = latitudeFirst ;
    region.center.longitude = longitudeFirst;


    region.span.longitudeDelta = 0.15f;
    region.span.latitudeDelta = 0.15f;
    [mapView setRegion:region animated:YES];

    [self addMultipleCustomPinOnMap:[arrNurseData mutableCopy]];


}

-(void)addMultipleCustomPinOnMap:(NSArray *)arrNurseData{

    [mapView removeAnnotations:mapView.annotations];


    NSLog(@"arrday data count---->%ld",(unsigned long)[arrNurseData count]);
    
    CLLocationCoordinate2D pointsCoordinate[arrNurseData.count];
    NSString *iconimage;


    for ( int i=0; i<[arrNurseData count]; i++)
    {
        CLLocationCoordinate2D coord;

        coord.latitude=[[NSString stringWithFormat:@"%@",[[arrNurseData objectAtIndex:i]objectForKey:@"lat"]]floatValue];

        coord.longitude=[[NSString stringWithFormat:@"%@",
                          [[arrNurseData objectAtIndex:i]objectForKey:@"long"]]floatValue];

        pointsCoordinate[i] = CLLocationCoordinate2DMake(coord.latitude,coord.longitude);


        MyAnnotation *annotation =[[MyAnnotation alloc]initWithCoordinates: pointsCoordinate[i] image:iconimage];
        
//        MyAnnotation *annotation =[[MyAnnotation alloc]initWithCoordinate:pointsCoordinate[i] title:@"Ricky" subTitle:@"EVS" time:@"12:23 PM"];

        annotation.tag = i;

        NSString *strName =[[arrTotalPatients objectAtIndex:i]objectForKey:@"firstName"];

        NSString *strLocation =[[arrTotalPatients objectAtIndex:i]objectForKey:@"currentAddress"];

        
        CLLocation *serverLocation = [[CLLocation alloc] initWithLatitude:[[[arrTotalPatients objectAtIndex:i]objectForKey:@"latitude"] floatValue] longitude:[[[arrTotalPatients objectAtIndex:i]objectForKey:@"longitude"] floatValue]];
        
        CLLocation *currentLocation = [[CLLocation alloc] initWithLatitude:[latitude floatValue] longitude:[longitude floatValue]];
        
        NSString *strDistance =  [self calculateDistance:serverLocation locationCurrent:currentLocation];
        
        annotation.title =[NSString stringWithFormat:@"%@ %@",strName,strDistance];
        
        
        long timeStamp = [[[arrTotalPatients objectAtIndex:i]objectForKey:@"updatelatlong"] integerValue];
        
        NSDate * date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
        
        
        if (timeStamp == 0) {

            annotation.subtitle =[NSString stringWithFormat:@"%@",strLocation];
            
        }
        else{
            
            NSDateFormatter *dateFS = [[NSDateFormatter alloc]init];
            [dateFS setDateFormat:@"HH:mm a"];

            NSLog(@"%ff is the time difference",[[NSDate date] timeIntervalSinceDate:date]);
            
            annotation.subtitle =[NSString stringWithFormat:@"%@  %.2f ago",strLocation, [[NSDate date] timeIntervalSinceDate:date]];
            
        }
       
        
        
        mapView.tag = i;
        [mapView addAnnotation:annotation];

    }

    [self zoomToFitMapAnnotations:mapView];
}


#pragma mark MKMapView delegate

- (MKAnnotationView *)mapView:(MKMapView *)sender viewForAnnotation:(id < MKAnnotation >)annotation{

    static NSString *reuseId = @"StandardPin";

    MKAnnotationView *aView = (MKAnnotationView *)[sender
    dequeueReusableAnnotationViewWithIdentifier:reuseId];

    if (aView == nil)
    {
        aView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseId];
        aView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoDark];
        aView.canShowCallout = YES;
        // aView.tag = annotationImg;

    }

    NSLog(@"%ld", (long)sender.tag);

    UIView *viewAnnotation = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 70, 70)];
    viewAnnotation.backgroundColor = Clear;
    [aView addSubview:viewAnnotation];

    MyAnnotation *theAnnotation = (MyAnnotation *) aView.annotation;

    UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 50, 50)];

    NSDictionary *dictNurseData = [arrTotalPatients objectAtIndex:theAnnotation.tag];

    NSString *strImage = [dictNurseData objectForKey:@"image"];
    strImage = [strImage stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (strImage.length >0) {

        NSURL *imageURL = [[NSURL alloc]initWithString:strImage];
        [imgV sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"name"]];
    }
    else{

        imgV.image = [UIImage imageNamed:@"name"];
    }

    imgV.backgroundColor = White;
    imgV.layer.cornerRadius = 25;
    imgV.clipsToBounds = TRUE;
    [viewAnnotation addSubview:imgV];


    UIImageView *imgLocator = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 70, 70)];
    imgLocator.userInteractionEnabled = TRUE;
    
        
    NSArray *arrTotal = [[arrTotalPatients objectAtIndex:theAnnotation.tag] objectForKey:@"Child"];
    
    NSDictionary *dictUserData = [arrTotalPatients objectAtIndex:theAnnotation.tag];
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    
    if ([[dictUserData objectForKey:@"id"] isEqualToString:[myDictionary objectForKey:@"id"]] == TRUE) {
        
         imgLocator.image = [UIImage imageNamed:@"locaterblack"];
        
        [self changeImageColor:@"locaterblack" imageView:imgLocator andColor:[UIColor greenColor]];
        
    }
    else{
        
        if (arrTotal.count ==0)
        {
            NSLog(@"zero");
            imgLocator.image = [UIImage imageNamed:@"locaterblack"];
        }
        else
        {
            NSLog(@"one");
            imgLocator.image = [UIImage imageNamed:@"locater"];
        }
        
    }
    
    [viewAnnotation addSubview:imgLocator];

    aView.image = [UIImage imageNamed:@"transparent.png"];


    aView.tag = theAnnotation.tag;
    aView.annotation = annotation;
    aView.calloutOffset = CGPointMake(0, -5);
    aView.draggable = YES;
    aView.enabled = YES;

    annotationImg++;

    return aView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    MyAnnotation *theAnnotation = (MyAnnotation *) view.annotation;

    NSDictionary *dictData = [arrTotalPatients objectAtIndex:theAnnotation.tag];
    
//     if (iPhoneVersion == 5)
//    {
//    UIStoryboard *STO=[UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//
//    SeeAllUsersDetailsVC *seealluser=[STO instantiateViewControllerWithIdentifier:@"SeeAllUsersDetailsVCId"];
//    seealluser.dictGetAllDataFromMapUser=dictData;
//    [self.navigationController pushViewController:seealluser animated:YES];
//    }
//     else if (iPhoneVersion == 6)
//     {
        UIStoryboard *STO=[UIStoryboard storyboardWithName:@"Main" bundle:nil];

        SeeAllUsersDetailsVC *seealluser=[STO instantiateViewControllerWithIdentifier:@"SeeAllUsersDetailsVCId"];
        seealluser.dictGetAllDataFromMapUser=dictData;
        [self.navigationController pushViewController:seealluser animated:YES];
//     }
//    else if (iPhoneVersion == 61)
//    {
//        UIStoryboard *STO=[UIStoryboard storyboardWithName:@"Main6p" bundle:nil];
//        
//        SeeAllUsersDetailsVC *seealluser=[STO instantiateViewControllerWithIdentifier:@"SeeAllUsersDetailsVCId"];
//        seealluser.dictGetAllDataFromMapUser=dictData;
//        [self.navigationController pushViewController:seealluser animated:YES];
//    }
//    else
//    {
//        UIStoryboard *STO=[UIStoryboard storyboardWithName:@"Mainpad" bundle:nil];
//        
//        SeeAllUsersDetailsVC *seealluser=[STO instantiateViewControllerWithIdentifier:@"SeeAllUsersDetailsVCId"];
//        seealluser.dictGetAllDataFromMapUser=dictData;
//        [self.navigationController pushViewController:seealluser animated:YES];
//    }
}
- (void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error{
    NSLog(@"didFailToLocateUserWithError %@", error.description);
}

- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error{
    NSLog(@"mapViewDidFailLoadingMap %@", error.description);
}
-(void)zoomToFitMapAnnotations:(MKMapView*)aMapView
{
    if([aMapView.annotations count] == 0)
        return;

    CLLocationCoordinate2D topLeftCoord;
    topLeftCoord.latitude = -90;
    topLeftCoord.longitude = 180;

    CLLocationCoordinate2D bottomRightCoord;
    bottomRightCoord.latitude = 90;
    bottomRightCoord.longitude = -180;

    for(MyAnnotation *annotation in mapView.annotations)
    {
        topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
        topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);

        bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
        bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
    }

    MKCoordinateRegion region;
    region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.0;
    region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.0;
    region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 0.2;
    region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 0.2;
    region = [aMapView regionThatFits:region];
    [mapView setRegion:region animated:YES];
    
}


#pragma Mark - search Button BarItem
-(UIBarButtonItem*)searchButtonBarItem
{
    UIButton * search = [[UIButton alloc] init];
    search.frame=CGRectMake(0,0,24,24);
    [search setBackgroundImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [search addTarget:self action:@selector(searchButtonClick:) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithCustomView:search];

    return searchButton;


}

#pragma mark - Search
-(IBAction)searchButtonClick:(id)sender
{
    BOOL network = [Alert networkStatus];

    if (network) {


        if (_isSearchBarShow == NO)
        {

            [self searchBarShowNurses];

            _isSearchBarShow = YES;
        }
        else
        {
            self.navigationItem.titleView = nil;
            self.title = @"SEE ALL USER";
            _isSearchBarShow = NO;
        }
    }
    else
    {
        //  Internet Problem
    }
}



#pragma mark - show Search bar
-(void)searchBarShowNurses{
    
    self.navigationItem.titleView = nil;

    _serachBar = [[UISearchBar alloc] initWithFrame:self.navigationItem.titleView.frame];
    _serachBar.barTintColor = [UIColor clearColor];
    _serachBar.backgroundColor= [UIColor clearColor];
    _serachBar.placeholder =@"Search users";
    _serachBar.returnKeyType =UIReturnKeySearch;
    _serachBar.delegate = self;
    self.navigationItem.titleView = _serachBar ;
    
}


#pragma mark- Search Bar Delgate Methods


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar_{
    [searchBar_ setShowsCancelButton:NO animated:YES];
}


- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar_{

    [searchBar_ setShowsCancelButton:NO animated:YES];
    [searchBar_ resignFirstResponder];
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar_{

    [mapView removeAnnotations:mapView.annotations];
    arrTotalPatients = [arrStoreLocationData mutableCopy];
    [self loadUI:arrStoreLatLongSearchData];

}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar_{

    [self.serachBar resignFirstResponder];

}


- (void)searchBarCancelled{

    self.serachBar.text = @"";
    self.serachBar.placeholder = @"Search Patients";
    [self.serachBar resignFirstResponder];

}


-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{


    if([searchText isEqualToString:@""] || searchText==nil)
    {


        [mapView removeAnnotations:mapView.annotations];

        arrTotalPatients = [arrStoreLocationData mutableCopy];

        [self loadUI:arrStoreLatLongSearchData];

    }

    if(searchBar.text.length>0){

        arrStoreSearchData = [[NSMutableArray alloc]initWithCapacity:0];
        NSPredicate *name = [NSPredicate predicateWithFormat:@"firstName contains[c] %@", searchText];

        NSPredicate *location = [NSPredicate predicateWithFormat:@"currentAddress contains[c] %@", searchText];


        NSPredicate *predicate = [NSCompoundPredicate orPredicateWithSubpredicates:@[name, location]];


        arrTotalPatients = [[arrStoreLocationData filteredArrayUsingPredicate:predicate] mutableCopy];
        if (arrTotalPatients.count == 0) {

            [mapView removeAnnotations:mapView.annotations];
            return;
        }


        [mapView removeAnnotations:mapView.annotations];

        arrLatLongSearchData = [[NSMutableArray alloc]initWithCapacity:0];

        for (int i = 0; i<arrTotalPatients.count; i++) {


            NSDictionary *dict= @{

                                  @"lat":[[arrTotalPatients objectAtIndex:i] objectForKey:@"latitude"],
                                  @"long":[[arrTotalPatients objectAtIndex:i] objectForKey:@"longitude"]

                                  };
            
            [arrLatLongSearchData addObject:dict];

        }

        [self loadUI:[arrLatLongSearchData mutableCopy]];
    }

}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    if ([searchBar.text isEqualToString:@""]|| searchBar.text == nil) {

        [mapView removeAnnotations:mapView.annotations];

        arrTotalPatients = [arrStoreLocationData mutableCopy];

        [self loadUI:arrStoreLatLongSearchData];

    }
    else{
    }

    return YES;
}

-(void)seeAllUser{

    [Alert svProgress:pleaseWait];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    NSDictionary *parameters;

    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];

    parameters = @{

                   @"action"    : @"allUserList",
                   @"userId"    : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]]
                   };

    NSLog(@"parameters-------%@",parameters);

    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {

         NSDictionary *dictPhotographerLogin=responseObject;
       //  [SVProgressHUD dismiss];


             arrTotalPatients = [[responseObject objectForKey:@"response"] mutableCopy];


             if ([[responseObject objectForKey:@"status"] isEqualToString:@"Success"] == TRUE)
             {

                 
           
                 //response , Child
                 
                 //ArrMissingChildOrNot
                 
                 ArrMissingChildOrNot=[responseObject objectForKey:@"response"];
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 for (int i = 0; i<arrTotalPatients.count; i++)
                 {

                     NSDictionary *dict= @{

                        @"lat":[[arrTotalPatients objectAtIndex:i] objectForKey:@"latitude"],
                        @"long":[[arrTotalPatients objectAtIndex:i] objectForKey:@"longitude"]

                        };

                     [arrLocationdata addObject:dict];
                 }

                 arrStoreLocationData = [arrTotalPatients mutableCopy];

                 arrStoreLatLongSearchData = [arrLocationdata mutableCopy];

                 [self loadUI:[arrLocationdata mutableCopy]];

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
        if ([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)])
        {
            [locationManager requestAlwaysAuthorization];
        }
        // for iOS 9
        if ([locationManager respondsToSelector:@selector(setAllowsBackgroundLocationUpdates:)])
        {
            [locationManager setAllowsBackgroundLocationUpdates:YES];
        }
        [locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *mostRecentLocation = locations.lastObject;
    NSLog(@"Current location: %@ %@", @(mostRecentLocation.coordinate.latitude), @(mostRecentLocation.coordinate.longitude));
    
    NSDate *now = [NSDate date];
    NSTimeInterval interval = self.lastTimestamp ? [now timeIntervalSinceDate:self.lastTimestamp] : 0;
    
    if (!self.lastTimestamp || interval >= 5 * 60){
        
        self.lastTimestamp = now;
        
        [self getAddressFromLatLon:mostRecentLocation];
       
    }
}


-(void)hitServerForLocationUpdate:(CLLocation *)mostRecentLocation strCurrentAddress:(NSString *)strCurrentAddress{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    parameters = @{
                   
                   @"action"    : @"updateLatlong",
                   @"userId"    : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]],
                   @"latitude"    : [NSString stringWithFormat:@"%f", mostRecentLocation.coordinate.latitude],
                   @"longitude"    : [NSString stringWithFormat:@"%f", mostRecentLocation.coordinate.longitude],
                   @"currentAddress": strCurrentAddress
                   
                   };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin;
         
         dictPhotographerLogin=responseObject;
         [SVProgressHUD dismiss];
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     
     {
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
         
     }];
    
    
}


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
         
         [self hitServerForLocationUpdate:bestLocation strCurrentAddress:[NSString stringWithFormat:@"%@", strCompleteAddress]];
         
     }];
    
    return @"";
}

-(NSString *)calculateDistance:(CLLocation *)locationServer locationCurrent:(CLLocation *)locationCurrent{
    
  
    CLLocationDistance distance = [locationServer distanceFromLocation:locationCurrent];
    
    return [NSString stringWithFormat:@"%.1f Mi",(distance/1609.344)];
}


#pragma mark -  Change Image Color Which is Randring on View.
-(void)changeImageColor:(NSString *)imageName imageView:(UIImageView *)imageView andColor:(UIColor *)yourColor
{
    UIImage *image = [UIImage imageNamed:imageName];
    imageView.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [imageView setTintColor: yourColor];
}

@end
