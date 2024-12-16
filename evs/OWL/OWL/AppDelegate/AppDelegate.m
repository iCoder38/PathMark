//
//  AppDelegate.m
//  OWL
//
//  Created by Apple on 7/24/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "AppDelegate.h"
#import "PrivateChatVC.h"
#import <StoreKit/StoreKit.h>
#import "ATAppUpdater.h"

@import Firebase;
@import GoogleMaps;

@interface AppDelegate ()<FIRMessagingDelegate, CLLocationManagerDelegate,ATAppUpdaterDelegate>{
    
    CLLocationManager *locManager;
}

@property (strong, nonatomic) NSDate *lastTimestamp;


@end

@implementation AppDelegate

NSString *const kGCMMessageIDKey = @"gcm.message_id";

+ (AppDelegate *)sharedAppDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


+ (UIStoryboard *)storyBoardType
{
    UIStoryboard *storyboards;
//
//    if (iPhoneVersion == 4)
//    {
//        storyboards = [UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//    }
//    else if (iPhoneVersion == 5)
//    {
//        storyboards = [UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//    }
//    else if (iPhoneVersion == 6)
//    {
        storyboards = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    }
//    else if (iPhoneVersion == 61)
//    {
//        storyboards = [UIStoryboard storyboardWithName:@"Main6p" bundle:nil];
//    }
//    else
//    {
//        storyboards = [UIStoryboard storyboardWithName:@"Mainpad" bundle:nil];
//    }
    return storyboards;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  int count = [[NSUserDefaults standardUserDefaults] integerForKey:@"LaunchCount"];
  if(count < 0) count = 0;
  [[NSUserDefaults standardUserDefaults] setInteger:count+1 forKey:@"LaunchCount"];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    [[ATAppUpdater sharedUpdater] setDelegate:self]; // Optional
    [[ATAppUpdater sharedUpdater] showUpdateWithConfirmation]; // OR [[ATAppUpdater sharedUpdater] 
    
    int count = [[NSUserDefaults standardUserDefaults] integerForKey:@"LaunchCount"];
    if(count < 0) count = 0;
    [[NSUserDefaults standardUserDefaults] setInteger:count+1 forKey:@"LaunchCount"];
    
    [GMSServices provideAPIKey:@"AIzaSyAvi45UoRwCJYvQvh8vKeeuaIh9xOwtKng"];
    // [GMSServices provideAPIKey:@"AIzaSyCMj8jVriKygvrl2EORIGoWjjC0go8kzwo"];
     
     
    
    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *navBarAppearance = [[UINavigationBarAppearance alloc] init];
        [navBarAppearance configureWithOpaqueBackground];
        navBarAppearance.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
        navBarAppearance.backgroundColor = [UIColor blackColor];;
        [UINavigationBar appearance].tintColor = [UIColor whiteColor];;
        [UINavigationBar appearance].standardAppearance = navBarAppearance;
        [UINavigationBar appearance].scrollEdgeAppearance = navBarAppearance;
        
    }  else {
        [UINavigationBar appearance].barTintColor = [UIColor whiteColor];
        [UINavigationBar appearance].tintColor = [UIColor whiteColor];

    }
    
      [self initiateFBNotification:application];
    
//     [FIRApp configure];
    
    NSUserDefaults*defaults=[NSUserDefaults  standardUserDefaults];
    NSDictionary *dictData = [defaults objectForKey:@"keyAllDataOfLoginUserOWL"];
    
    if ([dictData isKindOfClass:[NSDictionary class]])
    {
        if ([[dictData objectForKey:@"id"] isEqualToString:@""] == TRUE)
        {
            [self getLogin];
        }
        else
        {
            [self getAfterLogin];
        }
    }
    else
    {
        [self getLogin];
    }
    
    
    
    return YES;
}

#pragma mark - ATAppUpdater Delegate

#warning When using delegate, remember to add the ATAppUpdaterDelegate protocol: @interface ViewController : UIViewController <ATAppUpdaterDelegate>

- (void)appUpdaterDidShowUpdateDialog
{
    NSLog(@"appUpdaterDidShowUpdateDialog");
}

- (void)appUpdaterUserDidLaunchAppStore
{
    NSLog(@"appUpdaterUserDidLaunchAppStore");
}

- (void)appUpdaterUserDidCancel
{
    NSLog(@"appUpdaterUserDidCancel");
}

-(void)getLogin
{
    
    UIStoryboard *storyboards;
    
//    if (iPhoneVersion == 4) {
//
//        storyboards = [UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//    }
//    else if (iPhoneVersion == 5)
//    {
//        storyboards = [UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//    }
//    else if (iPhoneVersion == 6)
//    {
        storyboards = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    }
//    else if (iPhoneVersion == 61)
//    {
//        storyboards = [UIStoryboard storyboardWithName:@"Main6p" bundle:nil];
//    }
//    else
//    {
//        storyboards = [UIStoryboard storyboardWithName:@"Mainpad" bundle:nil];
//    }
    
    SidebarViewController *sidebarmemu =[storyboards instantiateViewControllerWithIdentifier:@"SidebarController"];
    
    ViewController* tabbarController = [storyboards  instantiateViewControllerWithIdentifier:@"ViewControllerId"];
    
    SWRevealViewController *revealController;
    UINavigationController *frontNavigationController;
    UINavigationController *rearNavigationController;
    frontNavigationController =[[UINavigationController alloc]initWithRootViewController:tabbarController];
    rearNavigationController =[[UINavigationController alloc]initWithRootViewController:sidebarmemu];
    revealController = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
    revealController.delegate = self;
    self.swcontroller =revealController;
    self.window.rootViewController =self.swcontroller;
    [self.window makeKeyAndVisible];
}


-(void)getAfterLogin
{
    
    UIStoryboard *storyboards;
    
//    if (iPhoneVersion == 4)
//    {
//        storyboards = [UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//    }
//    else if (iPhoneVersion == 5)
//    {
//        storyboards = [UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//    }
//    else if (iPhoneVersion == 6)
//    {
        storyboards = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    }
//    else if (iPhoneVersion == 61)
//    {
//        storyboards = [UIStoryboard storyboardWithName:@"Main6p" bundle:nil];
//    }
//    else
//    {
//        storyboards = [UIStoryboard storyboardWithName:@"Mainpad" bundle:nil];
//    }
    
    SidebarViewController *sidebarmemu =(SidebarViewController*)[storyboards instantiateViewControllerWithIdentifier:@"SidebarController"];
    
    DashboardVC* tabbarControllers = (DashboardVC*)[storyboards instantiateViewControllerWithIdentifier:@"DashboardVCId"];
    
    SWRevealViewController *revealController;
    UINavigationController *frontNavigationController;
    UINavigationController *rearNavigationController;
    frontNavigationController =[[UINavigationController alloc]initWithRootViewController:tabbarControllers];
    rearNavigationController =[[UINavigationController alloc]initWithRootViewController:sidebarmemu];
    revealController = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
    revealController.delegate = self;
    self.swcontroller =revealController;
    self.window.rootViewController =self.swcontroller;
    
    [self.window makeKeyAndVisible];
}


#pragma mark Firebase Notification Method


-(void)initiateFBNotification:(UIApplication *)application
{
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1) {
        // iOS 7.1 or earlier. Disable the deprecation warnings.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        UIRemoteNotificationType allNotificationTypes =
        (UIRemoteNotificationTypeSound |
         UIRemoteNotificationTypeAlert |
         UIRemoteNotificationTypeBadge);
        [application registerForRemoteNotificationTypes:allNotificationTypes];
#pragma clang diagnostic pop
    } else {
        // iOS 8 or later
        // [START register_for_notifications]
        if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_9_x_Max) {
            UIUserNotificationType allNotificationTypes =
            (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
            UIUserNotificationSettings *settings =
            [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];
            [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        } else {
            // iOS 10 or later
#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
            // For iOS 10 display notification (sent via APNS)
            [UNUserNotificationCenter currentNotificationCenter].delegate = self;
            UNAuthorizationOptions authOptions =
            UNAuthorizationOptionAlert
            | UNAuthorizationOptionSound
            | UNAuthorizationOptionBadge;
            [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:authOptions completionHandler:^(BOOL granted, NSError * _Nullable error) {
            }];
            
            [FIRMessaging messaging].remoteMessageDelegate = self;
#endif
        }
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    
    [FIRApp configure];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tokenRefreshNotification:)
                                                 name:kFIRInstanceIDTokenRefreshNotification object:nil];
    
    
    
    
    
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    
    NSLog(@"userInfo=====%@",userInfo);
    
    
    if (userInfo[kGCMMessageIDKey])
    {
        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    }
    
    NSLog(@"%@", [[[userInfo objectForKey:@"aps"] objectForKey:@"alert"] objectForKey:@"gcm.notification.receiverUserFirbaseId"]);
    
    completionHandler(UIBackgroundFetchResultNewData);
    
    
    NSLog(@"userInfo=====%@",userInfo);
    
    
    
    
    
    
    
    
}

#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0


- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    
    // Print message ID.
    NSDictionary *userInfo = notification.request.content.userInfo;
    NSLog(@"userInfo====%@",userInfo);
    
    completionHandler(UNNotificationPresentationOptionAlert);
    if (userInfo[kGCMMessageIDKey])
    {
        
        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    }
    
    if( [UIApplication sharedApplication].applicationState == UIApplicationStateActive ){

    }
    
    completionHandler(UNNotificationPresentationOptionNone);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response11 withCompletionHandler:(void (^)(void))completionHandler
{
    NSDictionary *userInfo = response11.notification.request.content.userInfo;
    NSLog(@"userInfo====%@",userInfo);
    
    if (userInfo[kGCMMessageIDKey])
    {
        
        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    }
    
 
    NSUserDefaults*defaults=[NSUserDefaults  standardUserDefaults];
    NSDictionary *dictData = [defaults objectForKey:@"keyAllDataOfLoginUserOWL"];
    
    if ([dictData isKindOfClass:[NSDictionary class]])
    {
        if ([[dictData objectForKey:@"id"] isEqualToString:@""] == TRUE)
        {
            [self getLogin];
        }
        else
        {
            if ([[userInfo objectForKey:@"type"] isEqualToString:@"Admin Notification"] == TRUE)
            {
                
                 [self openNotificationPage];
            }
            else{
                
                [self openChattingScreen:userInfo];
            }
        }
    }
    else
    {
        [self getLogin];
    }
    
    completionHandler();
}
#endif

#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0

- (void)applicationReceivedRemoteMessage:(FIRMessagingRemoteMessage *)remoteMessage {
    
    NSLog(@"%@", [remoteMessage.appData objectForKey:@"notification"]);
       
}


#endif

- (void)tokenRefreshNotification:(NSNotification *)notification {
    
    
    NSString *refreshedToken = [[FIRInstanceID instanceID] token];
    NSLog(@"InstanceID token: %@", refreshedToken);
    
    [[NSUserDefaults standardUserDefaults] setObject: refreshedToken forKey:@"deviceID"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [self connectToFcm];
}


- (void)connectToFcm {
    
    if (![[FIRInstanceID instanceID] token])
    {
        return;
    }
    
    [[FIRMessaging messaging] disconnect];
    
    [[FIRMessaging messaging] connectWithCompletion:^(NSError * _Nullable error) {
        
        if (error != nil) {
            NSLog(@"Unable to connect to FCM. %@", error);
        } else {
            NSLog(@"Connected to FCM.");
        }
    }];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    NSLog(@"Unable to register for remote notifications: %@", error);
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
   
    
    NSString *refreshedToken = [[FIRInstanceID instanceID] token];
    
    [self sendProviderDeviceToken:refreshedToken];
    NSLog(@"InstanceID token: %@", refreshedToken);
    [[NSUserDefaults standardUserDefaults] setObject: refreshedToken forKey:@"firebaseID"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [self connectToFcm];
}


- (void) sendProviderDeviceToken:(NSData*)token{
    
    NSString* tokenStr = [[token description] stringByReplacingOccurrencesOfString:@"<" withString:@""];
    tokenStr = [tokenStr stringByReplacingOccurrencesOfString:@">" withString:@""];
    NSArray* words = [tokenStr componentsSeparatedByCharactersInSet :
                      [NSCharacterSet whitespaceCharacterSet]];
    tokenStr = [words componentsJoinedByString:@""];
    
    NSLog(@"APNs token retrieved: %@", tokenStr);
    
#if TARGET_IPHONE_SIMULATOR
    
    [[NSUserDefaults standardUserDefaults] setObject: @"f6a165bf39a0aa14c1909bc62396eb6981f6fa67bd1735958a9445eb88a6e1b3" forKey:@"deviceID"];
    
#else
    
    [[NSUserDefaults standardUserDefaults] setObject:tokenStr forKey:@"deviceID"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
#endif
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [self connectToFcm];
    
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"LaunchCount"] == 5) {
       [self DisplayReviewController];
        
    }
    NSLog(@"app is actvie now");
}

- (void)DisplayReviewController {
    
    if([SKStoreReviewController class]){
       [SKStoreReviewController requestReview] ;
    }
    
//    if (@available(iOS 10.3, *))
//    {
//        [SKStoreReviewController requestReview];
//        
//    }
//    else
//    {
//        NSURL *reviewUrl = [NSURL URLWithString:@"https://apps.apple.com/us/app/owl-once-was-lost/id1301259934?ls=1?action=write-review"];
//        [[UIApplication sharedApplication] openURL:reviewUrl];
//    }
}
- (void)applicationDidEnterBackground:(UIApplication *)application
{
  //  [[FIRMessaging messaging] disconnect];
    NSLog(@"Disconnected from FCM");
    
    __block UIBackgroundTaskIdentifier backgroundTaskIdentifier = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        
        NSLog(@"Background Time:%f",[[UIApplication sharedApplication] backgroundTimeRemaining]);
        
        [[UIApplication sharedApplication] endBackgroundTask:backgroundTaskIdentifier];
        
        backgroundTaskIdentifier = UIBackgroundTaskInvalid;
        
        locManager = [[CLLocationManager alloc] init];
        locManager.delegate = self;
        locManager.distanceFilter = kCLDistanceFilterNone;
        locManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        [locManager startUpdatingLocation];
        
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



- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"app is not actvie now");
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
         
         [self hitServerForLocationUpdate:bestLocation strCurrentAddress:[NSString stringWithFormat:@"%@", strCompleteAddress]];
         
     }];
    
    return @"";
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


-(void)openNotificationPage{
    
    UIStoryboard *storyboards;
    
//    if (iPhoneVersion == 4)
//    {
//        storyboards = [UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//    }
//    else if (iPhoneVersion == 5)
//    {
//        storyboards = [UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//    }
//    else if (iPhoneVersion == 6)
//    {
        storyboards = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    }
//    else if (iPhoneVersion == 61)
//    {
//        storyboards = [UIStoryboard storyboardWithName:@"Main6p" bundle:nil];
//    }
//    else
//    {
//        storyboards = [UIStoryboard storyboardWithName:@"Mainpad" bundle:nil];
//    }
    
    SidebarViewController *sidebarmemu =[storyboards instantiateViewControllerWithIdentifier:@"SidebarController"];
    
    OWLNotificationVC *tabbarController = [[OWLNotificationVC alloc]init];
    
    SWRevealViewController *revealController;
    UINavigationController *frontNavigationController;
    UINavigationController *rearNavigationController;
    
    frontNavigationController =[[UINavigationController alloc]initWithRootViewController:tabbarController];
    
    rearNavigationController =[[UINavigationController alloc]initWithRootViewController:sidebarmemu];
    
    revealController = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
    revealController.delegate = self;
    self.swcontroller =revealController;
    self.window.rootViewController =self.swcontroller;
    [self.window makeKeyAndVisible];
    
}

-(void)openChattingScreen:(NSDictionary *)dictData{
    NSUserDefaults*defaults=[NSUserDefaults  standardUserDefaults];
    
    NSDictionary *dictData1 = [defaults objectForKey:@"keyAllDataOfLoginUserOWL"];
    
    

    
    PrivateChatVC * rvc = [[PrivateChatVC alloc]init];
    rvc.strComingFrom = @"AD";
    
    rvc.username1 = [NSString stringWithFormat:@"%@+%@",[dictData1 valueForKey:@"firebaseId"],[dictData objectForKey:@"person_firebaseid"]];
    rvc.username2 = [NSString stringWithFormat:@"%@+%@",[dictData objectForKey:@"person_firebaseid"],[dictData1 valueForKey:@"firebaseId"]];
    rvc.strUserID = [dictData objectForKey:@"person_firebaseid"];
    rvc.chatUserName = [[[dictData objectForKey:@"aps"] objectForKey:@"alert"] objectForKey:@"title"];
    rvc.chatUserImage = [dictData objectForKey:@"person_image"];
    
//    NSData *data1 = [[dictData objectForKey:@"gcm.notification.chatSenderData"] dataUsingEncoding:NSUTF8StringEncoding];
//    
//    id json1 = [NSJSONSerialization JSONObjectWithData:data1 options:0 error:nil];
    
    rvc.dictChatUserInfo=dictData;
    
    UINavigationController * navigationController = [[UINavigationController alloc]initWithRootViewController:rvc];
    
    
    self.window.rootViewController = navigationController;
}

@end
