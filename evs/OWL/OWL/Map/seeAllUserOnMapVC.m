#import "seeAllUserOnMapVC.h"
#import "AppDelegate.h"
#import "Utils.h"
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"
#import <GoogleMaps/GoogleMaps.h>
#import "EditProfileVC.h"
#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>

@interface CustomAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *imageURL;
@property (nonatomic, copy) NSString *missing;

@end

@implementation CustomAnnotation
@end

@interface seeAllUserOnMapVC ()<MKMapViewDelegate, CLLocationManagerDelegate, UISearchBarDelegate>{
    NSMutableArray *arrTotalUsers, *arrStoreLatLong, *arrSTorePreviousData, *arrStoreSearchData;
    MKMapView *mapView;
    NSTimer *timer;
    BOOL updateLocation;
    NSString *strCurrentLat;
    NSString *strCurrentLong;
}

@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) MKMapView *mapView;
//@property (nonatomic, strong) NSArray<User *> *users;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, strong) NSDate *lastTimestamp;

@property (nonatomic, strong) NSString *latitudeString;
@property (nonatomic, strong) NSString *longitudeString;
@property (nonatomic, strong) UIActivityIndicatorView *loadingIndicator;

@end

@implementation seeAllUserOnMapVC

@synthesize locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    /*// Setup search bar
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.delegate = self;
        searchBar.searchBarStyle = UISearchBarStyleMinimal; // Use minimal style to have a white background
        searchBar.barTintColor = [UIColor blackColor];
        
        // Remove back button text
        UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButtonItem;
        
        // Extend search bar to full width
        [searchBar sizeToFit];
        UIView *searchBarWrapper = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(searchBar.frame))];
        searchBarWrapper.backgroundColor = [UIColor whiteColor];
        [searchBarWrapper addSubview:searchBar];
        self.navigationItem.titleView = searchBarWrapper;*/
    
    
    [self getUserLatLong];
    
    
}

- (void)getUserLatLong {
    
    if (@available(iOS 13.0, *)) {
        self.loadingIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    } else {
        // Fallback on earlier versions
    }
    self.loadingIndicator.color = [UIColor whiteColor];
    self.loadingIndicator.center = self.view.center;
    [self.view addSubview:self.loadingIndicator];
    [self.loadingIndicator startAnimating];
    
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    
    // Initialize the map view and add it to the view hierarchy
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView.delegate = self;
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([CLLocationManager locationServicesEnabled]) {
            [self.locationManager requestWhenInUseAuthorization];
            [self.locationManager startUpdatingLocation];
        }
//    });
    // Request location permissions
    
}

// CLLocationManagerDelegate method to update user location
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations lastObject];
    if (location) {
        double latitude = location.coordinate.latitude;
        double longitude = location.coordinate.longitude;
        
        NSLog(@"Current Location: Latitude: %f, Longitude: %f", latitude, longitude);
        
        // Convert latitude and longitude to NSString
        NSString *latitudeString = [NSString stringWithFormat:@"%f", latitude];
        NSString *longitudeString = [NSString stringWithFormat:@"%f", longitude];
        
        NSLog(@"Current Location: Latitude: %@, Longitude: %@", latitudeString, longitudeString);
        
        // Convert latitude and longitude to NSString
        self.latitudeString = [NSString stringWithFormat:@"%f", latitude];
        self.longitudeString = [NSString stringWithFormat:@"%f", longitude];
        
        // Stop updating location to save battery life
        [self.locationManager stopUpdatingLocation];
        
//        [self.loadingIndicator stopAnimating];
        
        // Initialize the map view
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self seeAllUserOnMap];
            });
    }
}

// Handle location permission status
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusAuthorizedAlways) {
        [self.locationManager startUpdatingLocation];
    } else {
        // Handle the case where permission is denied
        NSLog(@"Location permissions denied");
    }
}

- (void)seeAllUserOnMap {
    strCurrentLat = [[NSUserDefaults standardUserDefaults] stringForKey:@"AllFetchUserLat"];
    strCurrentLong = [[NSUserDefaults standardUserDefaults] stringForKey:@"AllFetchUserLong"];
    
    arrTotalUsers = [[NSMutableArray alloc]initWithCapacity:0];
    arrStoreLatLong = [[NSMutableArray alloc]initWithCapacity:0];
    arrSTorePreviousData = [[NSMutableArray alloc]initWithCapacity:0];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    parameters = @{
                   @"action"    : @"allUserList",
                   @"userId"    : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]],
                   // @"lat"       : @"38.6681", // self.latitudeString,
                  // @"long"      : @"-86.7914", // self.longitudeString
                    @"lat"       : self.latitudeString,
                    @"long"      : self.longitudeString
                   };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
         
         NSDictionary *dictPhotographerLogin = responseObject;
          
         arrTotalUsers = [[responseObject objectForKey:@"response"] mutableCopy];
         
         if ([[responseObject objectForKey:@"status"] isEqualToString:@"Success"]) {
             
//             for (int i = 0; i < arrTotalUsers.count; i++) {
//                 NSDictionary *dict = @{
//                   @"lat":[[arrTotalUsers objectAtIndex:i] objectForKey:@"latitude"],
//                   @"long":[[arrTotalUsers objectAtIndex:i] objectForKey:@"longitude"],
//                   @"firstName":[[arrTotalUsers objectAtIndex:i] objectForKey:@"firstName"],
//                   @"currentAddress":[[arrTotalUsers objectAtIndex:i] objectForKey:@"currentAddress"],
//                   @"image":[[arrTotalUsers objectAtIndex:i] objectForKey:@"image"],
//                   // @"missing":[[arrTotalUsers objectAtIndex:i] objectForKey:@"image"],
//                   };
//                 
//                 [arrStoreLatLong addObject:dict];
//             }
             for (int i = 0; i < arrTotalUsers.count; i++) {
                 NSDictionary *userDict = [arrTotalUsers objectAtIndex:i];
                 
                 NSString *latitude = [userDict objectForKey:@"latitude"] ?: @"";
                 NSString *longitude = [userDict objectForKey:@"longitude"] ?: @"";
                 NSString *firstName = [userDict objectForKey:@"firstName"] ?: @"";
                 NSString *currentAddress = [userDict objectForKey:@"currentAddress"] ?: @"";
                 NSString *image = [userDict objectForKey:@"image"] ?: @"";
                 
                 // Check if the 'Child' key exists and is not empty
                 NSString *missing = @"no";
                 NSArray *childArray = [userDict objectForKey:@"Child"];
                 if (childArray && childArray.count > 0) {
                     missing = @"yes";
                 }
                 
                 NSDictionary *dict = @{
                     @"lat": latitude,
                     @"long": longitude,
                     @"firstName": firstName,
                     @"currentAddress": currentAddress,
                     @"image": image,
                     @"missing": missing
                 };
                 
                 [arrStoreLatLong addObject:dict];
             }
             
              NSLog(@"%@", arrTotalUsers);
               NSLog(@"%@", arrStoreLatLong);
             
             updateLocation = YES;
             arrSTorePreviousData = [arrTotalUsers mutableCopy];
             [self initMapToDisplay];
         }
         else {
             [SVProgressHUD showErrorWithStatus:[dictPhotographerLogin objectForKey:@"msg"] maskType:SVProgressHUDMaskTypeBlack];
         }
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
     }];
}

- (void)initMapToDisplay {
    // Initialize the map view
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView.delegate = self; // Set the delegate
    
    // Set initial region (optional)
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(28.59920927323401, 77.32992572709918);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1); // Adjust as needed
    MKCoordinateRegion region = MKCoordinateRegionMake(centerCoordinate, span);
    [self.mapView setRegion:region animated:YES];
    
    // Add the map view to your view hierarchy
    [self.view addSubview:self.mapView];
    
    // Add annotations for each coordinate in arrStoreLatLong
    for (NSDictionary *coordinateDict in arrStoreLatLong) {
        NSLog(@"%@", coordinateDict);
        double latitude = [coordinateDict[@"lat"] doubleValue];
        double longitude = [coordinateDict[@"long"] doubleValue];
        NSString *name = coordinateDict[@"firstName"];
        NSString *currentAddress = coordinateDict[@"currentAddress"];
        NSString *imageURL = coordinateDict[@"image"];
        NSString *missing = coordinateDict[@"missing"];
        
        CustomAnnotation *annotation = [[CustomAnnotation alloc] init];
        annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        annotation.title = name;
        annotation.subtitle = currentAddress;
        annotation.imageURL = imageURL;
        annotation.missing = missing;
        
        // Add annotation to map
        [self.mapView addAnnotation:annotation];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[CustomAnnotation class]]) {
        static NSString *identifier = @"CustomAnnotation";
        MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (!annotationView) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            annotationView.canShowCallout = YES;
            annotationView.frame = CGRectMake(0, 0, 40, 40); // Set size of annotation view
            
            // Add detail disclosure button to callout
            UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [detailButton addTarget:self action:@selector(showDetailsForAnnotation:) forControlEvents:UIControlEventTouchUpInside];
            annotationView.rightCalloutAccessoryView = detailButton;
        } else {
            annotationView.annotation = annotation;
        }
        
        // Async image loading
        CustomAnnotation *customAnnotation = (CustomAnnotation *)annotation;
        // NSLog(@"%@", customAnnotation.missing);
        
        if ([customAnnotation.missing  isEqual: @"yes"]) {
            NSURL *imageUrl = [NSURL URLWithString:customAnnotation.imageURL];
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
                UIImage *image = [UIImage imageWithData:imageData];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (image) {
                        
                        UIImage *roundedImage = [self roundedImageWithImage:image cornerRadius:20.0 size:CGSizeMake(40, 40) borderColor:[UIColor redColor]];
                        annotationView.image = roundedImage;
                    } else {
                        UIImage *placeholderImage = [UIImage imageNamed:@"location_logo_red"];
                        UIImage *borderedImage = [self resizedPlaceholderImage:placeholderImage size:CGSizeMake(60, 60) borderColor:[UIColor clearColor] borderWidth:4.0];
                        annotationView.image = borderedImage;
                    }
                });
            });
        } else {
            NSURL *imageUrl = [NSURL URLWithString:customAnnotation.imageURL];
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
                UIImage *image = [UIImage imageWithData:imageData];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (image) {
                        UIImage *roundedImage = [self roundedImageWithImage:image cornerRadius:20.0 size:CGSizeMake(40, 40) borderColor:[UIColor blackColor]];
                        annotationView.image = roundedImage;
                    } else {
                        UIImage *placeholderImage = [UIImage imageNamed:@"location_logo"];
                        UIImage *borderedImage = [self resizedPlaceholderImage:placeholderImage size:CGSizeMake(60, 60) borderColor:[UIColor clearColor] borderWidth:4.0];
                        annotationView.image = borderedImage;
                    }
                });
            });
        }
        
        
        return annotationView;
    }
    return nil;
}

- (void)showDetailsForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[CustomAnnotation class]]) {
        CustomAnnotation *customAnnotation = (CustomAnnotation *)annotation;
        
        NSDictionary *userData = @{
                    @"name": customAnnotation.title,
                    @"address": customAnnotation.subtitle,
                    @"imageURL": customAnnotation.imageURL,
                    // Add other data fields as needed
                };
        
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main5" bundle:nil];
        SeeAllUsersDetailsVC *detailVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"SeeAllUsersDetailsVCId"];
        detailVC.dictGetAllDataFromMapUser = userData;
        [self.navigationController pushViewController:detailVC animated:YES];
        
        // Show details screen or navigate to the next screen with detailed information
        // [self navigateToDetailScreenWithAnnotation:customAnnotation];
    }
}

- (void)navigateToDetailScreenWithAnnotation:(CustomAnnotation *)annotation {
    CustomAnnotation *customAnnotation = (CustomAnnotation *)annotation;
    NSDictionary *userData = @{
                @"firstName": customAnnotation.title,
                @"address": customAnnotation.subtitle,
                @"image": customAnnotation.imageURL,
                // Add other data fields as needed
            };
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SeeAllUsersDetailsVC *detailVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"SeeAllUsersDetailsVCId"];
    detailVC.dictGetAllDataFromMapUser = userData;
    [self.navigationController pushViewController:detailVC animated:YES];
    
 
}

- (UIImage *)roundedImageWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius size:(CGSize)size borderColor:(UIColor *)borderColor {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);

    // Begin a new image context
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);

    // Create a path for the rounded rectangle
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    [path addClip];

    // Draw the image
    [image drawInRect:rect];

    // Draw the border
    [borderColor setStroke];
    path.lineWidth = 4.0; // Adjust this value to change the border width
    [path stroke];

    // Get the new image
    UIImage *roundedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return roundedImage;
}

- (UIImage *)resizedPlaceholderImage:(UIImage *)placeholderImage size:(CGSize)size borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);

    // Begin a new image context
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);

    // Draw the placeholder image scaled to fit the size
    [placeholderImage drawInRect:rect];

    // Create a path for the rounded rectangle
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:size.width / 2];
    [path addClip];

    // Draw the border
    [borderColor setStroke];
    path.lineWidth = borderWidth;
    [path stroke];

    // Get the new image
    UIImage *borderedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return borderedImage;
}




- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    if ([view.annotation isKindOfClass:[CustomAnnotation class]]) {
        CustomAnnotation *annotation = (CustomAnnotation *)view.annotation;
        
        // Show popup or navigate to next screen with detailed information
        UIAlertController *popup = [UIAlertController alertControllerWithTitle:@"User Details"
                                                                        message:[NSString stringWithFormat:@"Name: %@\nAddress: %@", annotation.title, annotation.subtitle]
                                                                 preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
            // Navigate to next screen with detailed information
           [self navigateToDetailScreenWithAnnotation:annotation];
        }];
        [popup addAction:okAction];
        [self presentViewController:popup animated:YES completion:nil];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder]; // Hide the keyboard
    
    NSString *searchText = searchBar.text;
    [self filterAnnotationsWithSearchText:searchText];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder]; // Hide the keyboard
    
    // Clear search and reload all annotations
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self initMapToDisplay];
}

- (void)filterAnnotationsWithSearchText:(NSString *)searchText {
    // Filter arrStoreLatLong based on searchText
    NSMutableArray *filteredAnnotations = [[NSMutableArray alloc] init];
    
    for (NSDictionary *coordinateDict in arrStoreLatLong) {
        NSString *name = coordinateDict[@"firstName"];
        if ([name rangeOfString:searchText options:NSCaseInsensitiveSearch].location != NSNotFound) {
            double latitude = [coordinateDict[@"lat"] doubleValue];
            double longitude = [coordinateDict[@"long"] doubleValue];
            NSString *currentAddress = coordinateDict[@"currentAddress"];
            NSString *imageURL = coordinateDict[@"image"];
            
            CustomAnnotation *annotation = [[CustomAnnotation alloc] init];
            annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
            annotation.title = name;
            annotation.subtitle = currentAddress;
            annotation.imageURL = imageURL;
            
            [filteredAnnotations addObject:annotation];
        }
    }
    
    // Remove all existing annotations and add filtered ones
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotations:filteredAnnotations];
}

@end



/*
// CLLocationManagerDelegate method
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusAuthorizedAlways) {
        [self.locationManager startUpdatingLocation];
    }
}
- (void)addAnnotations {
    // Create annotations
    MKPointAnnotation *brazilAnnotation = [[MKPointAnnotation alloc] init];
    brazilAnnotation.coordinate = CLLocationCoordinate2DMake(-14.2350, -51.9253); // Brazil
    brazilAnnotation.title = @"Brazil";
    
    MKPointAnnotation *londonAnnotation = [[MKPointAnnotation alloc] init];
    londonAnnotation.coordinate = CLLocationCoordinate2DMake(51.5074, -0.1278); // London
    londonAnnotation.title = @"London";
    
    MKPointAnnotation *delhiAnnotation = [[MKPointAnnotation alloc] init];
    delhiAnnotation.coordinate = CLLocationCoordinate2DMake(28.6139, 77.2090); // Delhi
    delhiAnnotation.title = @"Delhi";
    
    // Add annotations to map
    [self.mapView addAnnotations:@[brazilAnnotation, londonAnnotation, delhiAnnotation]];
}

#pragma mark - GMSMapViewDelegate

- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    NSLog(@"Tapped at coordinate: (%f, %f)", coordinate.latitude, coordinate.longitude);
}

- (void)mapView:(GMSMapView *)mapView didChangeCameraPosition:(GMSCameraPosition *)position {
    NSLog(@"Camera position changed: (%f, %f)", position.target.latitude, position.target.longitude);
}

- (void)mapView:(GMSMapView *)mapView didFailWithError:(NSError *)error {
    NSLog(@"Map failed to load with error: %@", error.localizedDescription);

    // Handle specific error cases if needed
     
}
*/




//
//  seeAllUserOnMapVC.m
//  OWL
//
//  Created by Rameshwar on 9/21/17.
//  Copyright © 2017 Apple. All rights reserved.
//

/*
#import "seeAllUserOnMapVC.h"
#import "AppDelegate.h"
#import "Utils.h"
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"
#import <GoogleMaps/GoogleMaps.h>
#import "EditProfileVC.h"


@interface seeAllUserOnMapVC ()<GMSMapViewDelegate, CLLocationManagerDelegate, UISearchBarDelegate>{
    
    NSMutableArray *arrTotalUsers, *arrStoreLatLong, *arrSTorePreviousData, *arrStoreSearchData;
    GMSMapView *mapView;
    GMSMarker *marker;
    NSTimer *timer;
    BOOL updateLocation;
    NSString *strCurrentLat;;
    NSString *strCurrentLong;
}

@property(nonatomic,retain) CLLocationManager *locationManager;
@property (strong, nonatomic) NSDate *lastTimestamp;

@end

@implementation seeAllUserOnMapVC

@synthesize locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    

//     strCurrentLat = [[NSUserDefaults standardUserDefaults]
//                                    stringForKey:@"keyMyCurrentLat"];
//     strCurrentLong = [[NSUserDefaults standardUserDefaults]
 //                                    stringForKey:@"keyMyCurrentLong"];
    
    strCurrentLat = [[NSUserDefaults standardUserDefaults]
                                         stringForKey:@"AllFetchUserLat"];
    strCurrentLong = [[NSUserDefaults standardUserDefaults]
                                          stringForKey:@"AllFetchUserLong"];
    
//     UIAlertController * alert=   [UIAlertController
//                                  alertControllerWithTitle:@"OWL"
//                                  message:@"OWL would like to use your location to display it on the app. It is secure and private."
//                                  preferredStyle:UIAlertControllerStyleAlert];
//
//    UIAlertAction* cancel = [UIAlertAction
//                             actionWithTitle:@"Cancel"
//                             style:UIAlertActionStyleDefault
//                             handler:^(UIAlertAction * action)
//                             {
//                                [self.navigationController popViewControllerAnimated:true];
//
//                               }];
//
//    UIAlertAction* ok = [UIAlertAction
//                         actionWithTitle:@"Ok"
//                         style:UIAlertActionStyleDefault
//                         handler:^(UIAlertAction * action)
//                         {
//                             // code here...
//
//
//                         }];
//
//
//
//    [alert addAction:ok] ;
//    [alert addAction:cancel];
//    [self presentViewController:alert animated:YES completion:nil];
//
    // [GMSServices provideAPIKey:@"AIzaSyAvi45UoRwCJYvQvh8vKeeuaIh9xOwtKng"];
    self.view.backgroundColor = [UIColor whiteColor];
    
  //  timer = [NSTimer scheduledTimerWithTimeInterval:300.0 target:self selector:@selector(tiemrHitLocationUpdateService) userInfo:nil repeats:YES];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    
    [super viewWillAppear:YES];
    [self setNavigationBarWithSearch];
    
    
    if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied){
        //Now if the location is denied.
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"OWL"
                                              message:@"OWL would like to use your location to display it on the app. It is secure and private."
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        //            alertController.view.tintColor = AppColor;
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:@"Dismiss"
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       {
            
            [self.revealViewController revealToggleAnimated:YES];
            
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
            //        if ([locationManager respondsToSelector:@selector(setAllowsBackgroundLocationUpdates:)])
            //        {
            //            // [locationManager setAllowsBackgroundLocationUpdates:YES];
            //        }
            
        }
        
        [locationManager startUpdatingLocation];
        
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:locationManager.location.coordinate.latitude longitude:locationManager.location.coordinate.longitude zoom:15];
        
        mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        mapView.delegate = self;
        mapView.myLocationEnabled = YES;
        mapView.settings.compassButton = YES;
        mapView.settings.myLocationButton = YES;
        
        self.view = mapView;
    }
    //  [mapView moveCamera:[GMSCameraUpdate setTarget:<CLLocationCoordinate2DMake>]];
    
}




- (void) mapView: (GMSMapView *)mapView
     didChangeCameraPosition: (GMSCameraPosition *)position
{
    double latitude = mapView.camera.target.latitude;
    double longitude = mapView.camera.target.longitude;
    
    
    NSString *myLatitude = [NSString stringWithFormat:@"%f",latitude];
    NSString *myLongitude = [NSString stringWithFormat:@"%f",longitude];
          
          NSLog(@"*dLatitude : %@", myLatitude);
          NSLog(@"*dLongitude : %@",myLongitude);
          
         
    
    CLLocation *loc1 = [[CLLocation alloc] initWithLatitude:[strCurrentLat floatValue] longitude:[strCurrentLong floatValue]];

    CLLocation *loc2 = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];

    CLLocationDistance distance = [loc1 distanceFromLocation:loc2]/ 1000;;
    
    NSLog(@"regionchnaged%f" ,distance );
    if(distance < 400)
     {
         
 
      // under 1 mile
    
     }
     else
    {
        NSString *lati = [NSString stringWithFormat:@"%@",myLatitude];
        [[NSUserDefaults standardUserDefaults] setObject:lati forKey:@"AllFetchUserLat"];
        NSString *longi = [NSString stringWithFormat:@"%@",myLongitude];
        [[NSUserDefaults standardUserDefaults] setObject:longi forKey:@"AllFetchUserLong"];
        [[NSUserDefaults standardUserDefaults] synchronize];
                 
        
        [self seeAllUserOnMap];
        
        
     // out of 1 mile
     }
    
     NSLog(@"regionchnaged");
    // now do something with latitude and longitude
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
    
      [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
      }];
    self.navigationController.navigationBar.barTintColor = Black;
    
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
    _serachBar.barTintColor = [UIColor whiteColor];
    _serachBar.backgroundColor= [UIColor clearColor];
    
    _serachBar.placeholder =@"Search users";
    _serachBar.returnKeyType =UIReturnKeySearch;
    _serachBar.delegate = self;
    
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setDefaultTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
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

    [mapView clear];
    arrTotalUsers = [arrSTorePreviousData mutableCopy];
    [self loadConfigView];
    
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar_{
    
    [self.serachBar resignFirstResponder];
    
}


- (void)searchBarCancelled{
    
    self.serachBar.text = @"";
    self.serachBar.placeholder = @"Search Users";
    [self.serachBar resignFirstResponder];
    
}


-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if([searchText isEqualToString:@""] || searchText==nil){
        
        [mapView clear];
        
        arrTotalUsers = [arrSTorePreviousData mutableCopy];
        
        [self loadConfigView];
        
    }
    
    if(searchBar.text.length>0){
        
        arrStoreSearchData = [[NSMutableArray alloc]initWithCapacity:0];
        NSPredicate *name = [NSPredicate predicateWithFormat:@"firstName contains[c] %@", searchText];
        
        NSPredicate *location = [NSPredicate predicateWithFormat:@"currentAddress contains[c] %@", searchText];
        
        
        NSPredicate *predicate = [NSCompoundPredicate orPredicateWithSubpredicates:@[name, location]];
        
        
        arrTotalUsers = [[arrSTorePreviousData filteredArrayUsingPredicate:predicate] mutableCopy];
        if (arrTotalUsers.count == 0) {
            
            [mapView clear];
            return;
        }
        
        
        [mapView clear];
        
        [self loadSearchConfigView];
    }
    
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    if ([searchBar.text isEqualToString:@""]|| searchBar.text == nil) {
        
        [mapView clear];
        
        arrTotalUsers = [arrSTorePreviousData mutableCopy];
        
        [self loadConfigView];
        
    }
    else{
    }
    
    return YES;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(IBAction)hitSideMenu:(id)sender
{
    
    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];
    
}







- (void)loadConfigView {
    
    [mapView clear];
    
    
   
    
   
    
    // Creates a marker in the center of the map.
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    for ( int i=0; i<[arrTotalUsers count]; i++){
        
        UIView *mapCustomView = [[UIView alloc]init];
        mapCustomView.frame = CGRectMake(0, 0, 80, 80);
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 7, 60, 60)];
        imgView.layer.cornerRadius = 30;
        imgView.clipsToBounds = TRUE;
        [mapCustomView addSubview:imgView];
        
        
        NSString *strImage = [[arrTotalUsers objectAtIndex:i] objectForKey:@"image"];
        strImage = [strImage stringByReplacingOccurrencesOfString:@" " withString:@""];
        if (strImage.length >0) {
            
            NSURL *imageURL = [[NSURL alloc]initWithString:strImage];
            [imgView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"logo"]];
            imgView.contentMode = UIViewContentModeScaleAspectFit;
            imgView.backgroundColor = [UIColor blackColor];
        }
        else{
            
            imgView.image = [UIImage imageNamed:@"logo"];
            imgView.backgroundColor = [UIColor whiteColor];
            imgView.contentMode = UIViewContentModeScaleAspectFit;

        }
        
        UIImageView *imgLocator = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        imgLocator.userInteractionEnabled = TRUE;
        [mapCustomView addSubview:imgLocator];
        
        NSArray *arrTotal = [[arrTotalUsers objectAtIndex:i] objectForKey:@"Child"];
        
        
        if ([[[arrTotalUsers objectAtIndex:i] objectForKey:@"id"] isEqualToString:[myDictionary objectForKey:@"id"]] == TRUE) {
            
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
        
        marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake([[[arrTotalUsers objectAtIndex:i]objectForKey:@"latitude"] floatValue], [[[arrTotalUsers objectAtIndex:i]objectForKey:@"longitude"] floatValue]);
        
        CLLocation *serverLocation = [[CLLocation alloc] initWithLatitude:[[[arrTotalUsers objectAtIndex:i]objectForKey:@"latitude"] floatValue] longitude:[[[arrTotalUsers objectAtIndex:i]objectForKey:@"longitude"] floatValue]];
        
        CLLocation *currentLocation = [[CLLocation alloc] initWithLatitude:locationManager.location.coordinate.latitude longitude:locationManager.location.coordinate.longitude];
        
        NSString *strDistance =  [self calculateDistance:serverLocation locationCurrent:currentLocation];
        
        NSString *strName =[[arrTotalUsers objectAtIndex:i]objectForKey:@"firstName"];
        
        
        marker.title = [NSString stringWithFormat:@"%@ %@",strName,strDistance];
        
        long timeStamp = [[[arrTotalUsers objectAtIndex:i]objectForKey:@"updatelatlong"] integerValue];
        
        NSDate * date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
        
        
        if (timeStamp == 0) {
            
            marker.snippet = [[arrTotalUsers objectAtIndex:i]objectForKey:@"currentAddress"];
            
        }
        else{
            
            NSDateFormatter *dateFS = [[NSDateFormatter alloc]init];
            [dateFS setDateFormat:@"HH:mm a"];
            
            NSLog(@"%ff is the time difference",[[NSDate date] timeIntervalSinceDate:date]);
            
            NSString *strLocation =[[arrTotalUsers objectAtIndex:i]objectForKey:@"currentAddress"];
            
            NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:date];
            
            int hours = (int)interval / 3600;
            int minutes = (interval - (hours*3600)) / 60;
            
            
            marker.snippet = [NSString stringWithFormat:@"%@  %d hour %d min ago",strLocation, hours, minutes];
            
        }
        
        marker.iconView = mapCustomView;
       // marker.appearAnimation = kGMSMarkerAnimationPop;
        marker.userData = [arrTotalUsers objectAtIndex:i];
        marker.map = mapView;
        
    }
}

- (void)loadSearchConfigView {
    
     [mapView clear];
    
//
//    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:locationManager.location.coordinate.latitude longitude:locationManager.location.coordinate.longitude zoom:10];
//
//
//    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
//    mapView.delegate = self;
//    mapView.myLocationEnabled = YES;
//    self.view = mapView;
    
    // Creates a marker in the center of the map.
    
     NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    for ( int i=0; i<[arrTotalUsers count]; i++){
        
        UIView *mapCustomView = [[UIView alloc]init];
        mapCustomView.frame = CGRectMake(0, 0, 80, 80);
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 7, 60, 60)];
        imgView.layer.cornerRadius = 30;
        imgView.clipsToBounds = TRUE;
        [mapCustomView addSubview:imgView];
        
        
        NSString *strImage = [[arrTotalUsers objectAtIndex:i] objectForKey:@"image"];
        strImage = [strImage stringByReplacingOccurrencesOfString:@" " withString:@""];
        if (strImage.length >0) {
            
            NSURL *imageURL = [[NSURL alloc]initWithString:strImage];
            [imgView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"logo"]];
            imgView.contentMode = UIViewContentModeScaleAspectFit;
            imgView.backgroundColor = [UIColor blackColor];
        }
        else{
            
            imgView.image = [UIImage imageNamed:@"logo"];
            imgView.backgroundColor = [UIColor whiteColor];
        }
        
        UIImageView *imgLocator = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        imgLocator.userInteractionEnabled = TRUE;
        [mapCustomView addSubview:imgLocator];
        
        NSArray *arrTotal = [[arrTotalUsers objectAtIndex:i] objectForKey:@"Child"];
        
        
        if ([[[arrTotalUsers objectAtIndex:i] objectForKey:@"id"] isEqualToString:[myDictionary objectForKey:@"id"]] == TRUE) {
            
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
        
        
        
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[[[arrTotalUsers objectAtIndex:i]objectForKey:@"latitude"] floatValue] longitude:[[[arrTotalUsers objectAtIndex:i]objectForKey:@"longitude"] floatValue] zoom:5];
        
        
        mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        mapView.delegate = self;
        mapView.myLocationEnabled = YES;
        self.view = mapView;
        
        marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake([[[arrTotalUsers objectAtIndex:i]objectForKey:@"latitude"] floatValue], [[[arrTotalUsers objectAtIndex:i]objectForKey:@"longitude"] floatValue]);
        
        
        CLLocation *serverLocation = [[CLLocation alloc] initWithLatitude:[[[arrTotalUsers objectAtIndex:i]objectForKey:@"latitude"] floatValue] longitude:[[[arrTotalUsers objectAtIndex:i]objectForKey:@"longitude"] floatValue]];

        CLLocation *currentLocation = [[CLLocation alloc] initWithLatitude:locationManager.location.coordinate.latitude longitude:locationManager.location.coordinate.longitude];

        NSString *strDistance =  [self calculateDistance:serverLocation locationCurrent:currentLocation];

        NSString *strName =[[arrTotalUsers objectAtIndex:i]objectForKey:@"firstName"];


        marker.title = [NSString stringWithFormat:@"%@ %@",strName,strDistance];
        
        long timeStamp = [[[arrTotalUsers objectAtIndex:i]objectForKey:@"updatelatlong"] integerValue];
        
        NSDate * date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
        
        
        if (timeStamp == 0) {
            
          marker.snippet = [[arrTotalUsers objectAtIndex:i]objectForKey:@"currentAddress"];
            
        }
        else{
            
            NSDateFormatter *dateFS = [[NSDateFormatter alloc]init];
            [dateFS setDateFormat:@"HH:mm a"];
            
            NSLog(@"%ff is the time difference",[[NSDate date] timeIntervalSinceDate:date]);
            
            NSString *strLocation =[[arrTotalUsers objectAtIndex:i]objectForKey:@"currentAddress"];
            
            NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:date];

            int hours = (int)interval / 3600;
            int minutes = (interval - (hours*3600)) / 60;

            
            marker.snippet = [NSString stringWithFormat:@"%@  %d hour %d min ago",strLocation, hours, minutes];
            
        }
        
        marker.iconView = mapCustomView;
        marker.appearAnimation = kGMSMarkerAnimationPop;
        marker.map = mapView;
        marker.userData = [arrTotalUsers objectAtIndex:i];
       
    }
}



- (void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker {
    
    NSDictionary *dictindex = marker.userData;
    
     NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    NSString *strUserId = [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]];
    
    if([[dictindex objectForKey:@"id"] isEqualToString:strUserId] == FALSE){
        
          [self moveOnDetails:dictindex];
        
    }
    else
    {
        if([[[NSUserDefaults standardUserDefaults] valueForKey: @"guest"]   isEqual: @"false"])
                   {
                       
                       UIStoryboard *STO=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
                       
                       EditProfileVC *seealluser=[STO instantiateViewControllerWithIdentifier:@"EditProfileVCId"];
                      seealluser.matchFrom=@"map";
                       [self.navigationController pushViewController:seealluser animated:YES];
//                   EditProfileVC *epvc=[self.storyboard instantiateViewControllerWithIdentifier:@"EditProfileVCId"];
//
////                   UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:epvc];
////
////                   [navController setViewControllers: @[epvc] animated: YES];
////                   [
//                   [self.navigationController pushViewController:epvc animated:YES];
                   }
                   else
                   {
                        [Alert svError:@"Please Register/Login to use this Functionality"];
                   }
    }

}

- (void)mapView:(GMSMapView *)mapView didFailToLocateUserWithError:(NSError *)error{
    NSLog(@"didFailToLocateUserWithError %@", error.description);
}

- (void)mapViewDidFailLoadingMap:(GMSMapView *)mapView withError:(NSError *)error{
    NSLog(@"mapViewDidFailLoadingMap %@", error.description);
}

-(void)moveOnDetails:(NSDictionary *)dictData{
    
//    if (iPhoneVersion == 5)
//    {
//        UIStoryboard *STO=[UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//
//        SeeAllUsersDetailsVC *seealluser=[STO instantiateViewControllerWithIdentifier:@"SeeAllUsersDetailsVCId"];
//        seealluser.dictGetAllDataFromMapUser=dictData;
//        [self.navigationController pushViewController:seealluser animated:YES];
//    }
//    else if (iPhoneVersion == 6)
//    {
        UIStoryboard *STO=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        SeeAllUsersDetailsVC *seealluser=[STO instantiateViewControllerWithIdentifier:@"SeeAllUsersDetailsVCId"];
        seealluser.dictGetAllDataFromMapUser=dictData;
        [self.navigationController pushViewController:seealluser animated:YES];
//    }
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

-(void)seeAllUserOnMap{
    
    
    strCurrentLat = [[NSUserDefaults standardUserDefaults]
                                      stringForKey:@"AllFetchUserLat"];
    strCurrentLong = [[NSUserDefaults standardUserDefaults]
                                       stringForKey:@"AllFetchUserLong"];
    
  
    arrTotalUsers = [[NSMutableArray alloc]initWithCapacity:0];
    arrStoreLatLong = [[NSMutableArray alloc]initWithCapacity:0];
    arrSTorePreviousData = [[NSMutableArray alloc]initWithCapacity:0];
  
    
  //  [Alert svProgress:pleaseWait];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    parameters = @{
                   
                   @"action"    : @"allUserList",
                   @"userId"    : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]],
                    @"lat"    : strCurrentLat,
                    @"long"    : strCurrentLong
                     };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
     //    [SVProgressHUD dismiss];
         
         
         arrTotalUsers = [[responseObject objectForKey:@"response"] mutableCopy];
         
         
         if ([[responseObject objectForKey:@"status"] isEqualToString:@"Success"] == TRUE)
         {
             
            
             for (int i = 0; i<arrTotalUsers.count; i++)
             {
                 
                 NSDictionary *dict= @{
                                       
                   @"lat":[[arrTotalUsers objectAtIndex:i] objectForKey:@"latitude"],
                   @"long":[[arrTotalUsers objectAtIndex:i] objectForKey:@"longitude"]
                                       
               };
                 
                 [arrStoreLatLong addObject:dict];
             }
             
             updateLocation = YES;
             
             arrSTorePreviousData = [arrTotalUsers mutableCopy];
         
             [self loadConfigView];
             
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

#pragma mark -  Change Image Color Which is Randring on View.
-(void)changeImageColor:(NSString *)imageName imageView:(UIImageView *)imageView andColor:(UIColor *)yourColor
{
    UIImage *image = [UIImage imageNamed:imageName];
    imageView.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [imageView setTintColor: yourColor];
}

-(void)tiemrHitLocationUpdateService
{
   [locationManager startUpdatingLocation];

}


- (void)startUpdatingLocation
{
//    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
//
//    if (status == kCLAuthorizationStatusDenied)
//    {
//        NSLog(@"Location services are disabled in settings.");
//    }
//    else
//    {
//        // for iOS 8
//        if ([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)])
//        {
//            [locationManager requestAlwaysAuthorization];
//        }
//        // for iOS 9
////        if ([locationManager respondsToSelector:@selector(setAllowsBackgroundLocationUpdates:)])
////        {
////            [locationManager setAllowsBackgroundLocationUpdates:YES];
////        }
////        [locationManager startUpdatingLocation];
//    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    [locationManager stopUpdatingLocation];
    CLLocation *mostRecentLocation = [locations objectAtIndex:0];
    
   // NSDate *now = [NSDate date];
//    NSTimeInterval interval = self.lastTimestamp ? [now timeIntervalSinceDate:self.lastTimestamp] : 0;
//
//    if (!self.lastTimestamp || interval >= 5 * 60){
    
     //   CLLocation *mostRecentLocation = locations.lastObject;
      //  NSLog(@"Current location: %@ %@", @(mostRecentLocation.coordinate.latitude), @(mostRecentLocation.coordinate.longitude));
        
      //  updateLocation = YES;
        
      //  self.lastTimestamp = now;
        
       // [self getAddressFromLatLon:mostRecentLocation];
        
  //  }
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
       //  [SVProgressHUD dismiss];
         
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

@end
*/
