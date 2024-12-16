//
//  Utils.h
//  sample-chat
//
//  Created by Apple on 11/5/15.
//  Copyright (c) 2015 Igor Khomenko. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



//**************************** DATABASE *************************************

#define kDB_NAME                                                 @"OWL.db"

#define kTABLE_NAME                                              @"StoreData"




#define KUSER_PLACEHOLDER_IMAGE  @"avatar"

//**************************** BASE URL *************************************

//#define BaseURLOfOWL @"http://demo.evirtualservices.com/OWL/site/Webservices"

#define BaseURLOfOWL @"http://owl-oncewaslost.com/app/webservices/"



#define		VIDEO_LENGTH						5


//****************************************************************************

//notifications
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

//Device
#define IS_IPAD_iPad_SCREEN [[UIScreen mainScreen] bounds].size.height == 1024.0f
#define IS_IPHONE_6Plus_SCREEN [[UIScreen mainScreen] bounds].size.height == 736.0f
#define IS_IPHONE_6_SCREEN [[UIScreen mainScreen] bounds].size.height == 667.0f
#define IS_IPHONE_5_SCREEN [[UIScreen mainScreen] bounds].size.height == 568.0f
#define IS_IPHONE_4_SCREEN [[UIScreen mainScreen] bounds].size.height >= 480.0f && [[UIScreen mainScreen] bounds].size.height < 568.0f

#define isNull(value) value == nil || [value isKindOfClass:[NSNull class]]


//********************************* COLORS *****************************************

#define Red         [UIColor redColor]
#define Blue        [UIColor blueColor]
#define Yellow      [UIColor yellowColor]
#define Green       [UIColor greenColor]
#define Clear       [UIColor clearColor]
#define Black       [UIColor blackColor]
#define White       [UIColor whiteColor]
#define LightGray   [UIColor lightGrayColor]
#define DarkGray    [UIColor darkGrayColor]
#define Orange      [UIColor orangeColor]
#define Purple      [UIColor purpleColor]
#define Brown       [UIColor brownColor]
#define magenta     [UIColor magentaColor]

//*********************************************************************************


static NSString *const  kAPPICATION_TITLE                 = @"OWL";

#define INTERNET_MESSAGE             @"Internet connection is not available. Please check your wifi setting or cellular data."
#define LOCATION_INVALID             @"Please enter valid address."
#define SlowInternet                 @"Your internet connection is very slow.PLease tr again later."
#define EmailExisted                 @"Email Id/Username does not exist."
#define EMAIL_VALIDATE               @"Enter valid email id."
#define AccountUnAuthenticated       @"Please enter valid e-mail and password"
#define REQUIRED_FIELDS              @"All fields are mandatory."
#define MOBILE_NUMBER_INVALID        @"Mobile number is not valid."
#define PASSWORD_VALIDTION           @"Password should be minimum of 6 characters."
#define PASSWORD_MATCHES             @"Password & confirm password should be same."
static NSString *const k_OK                                 = @"OK";


//********************************* SCREEN SIZE ************************************

#define kSCREEN_WIDTH  ([[UIScreen mainScreen] bounds].size.width)
#define kSCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)


#define kSTRIPE_TEST_KEY @"pk_test_Ep0jpSFxAoacfB6JvMUfZ2w6"
#define kSTRIPE_LIVE_KEY @"pk_live_fENk8BlzuMy7Gr7bVtrkmZDo"

//********************************* CURRENT VERSION ********************************


#define KVersion [[[UIDevice currentDevice] systemVersion] intValue]


//********************************* COLORS *****************************************





//********************************* FONTS ******************************************

//Montserrat-Regular
#define mr10 [UIFont fontWithName:@"Montserrat-Regular" size:10.0f]
#define mr14 [UIFont fontWithName:@"Montserrat-Regular" size:14.0f]
#define mr15 [UIFont fontWithName:@"Montserrat-Regular" size:15.0f]
#define mr16 [UIFont fontWithName:@"Montserrat-Regular" size:16.0f]
#define mr17 [UIFont fontWithName:@"Montserrat-Regular" size:17.0f]
#define mr18 [UIFont fontWithName:@"Montserrat-Regular" size:18.0f]
#define mr19 [UIFont fontWithName:@"Montserrat-Regular" size:19.0f]
#define mr20 [UIFont fontWithName:@"Montserrat-Regular" size:20.0f]
#define mr21 [UIFont fontWithName:@"Montserrat-Regular" size:21.0f]
#define mr22 [UIFont fontWithName:@"Montserrat-Regular" size:22.0f]
#define mr23 [UIFont fontWithName:@"Montserrat-Regular" size:23.0f]
#define mr24 [UIFont fontWithName:@"Montserrat-Regular" size:24.0f]
#define mr25 [UIFont fontWithName:@"Montserrat-Regular" size:25.0f]
#define mr26 [UIFont fontWithName:@"Montserrat-Regular" size:26.0f]
#define mr27 [UIFont fontWithName:@"Montserrat-Regular" size:27.0f]
#define mr28 [UIFont fontWithName:@"Montserrat-Regular" size:28.0f]
#define mr29 [UIFont fontWithName:@"Montserrat-Regular" size:29.0f]
#define mr30 [UIFont fontWithName:@"Montserrat-Regular" size:30.0f]

//Montserrat-Light
#define ml14 [UIFont fontWithName:@"Montserrat-Light" size:14.0f]
#define ml15 [UIFont fontWithName:@"Montserrat-Light" size:15.0f]
#define ml16 [UIFont fontWithName:@"Montserrat-Light" size:16.0f]
#define ml17 [UIFont fontWithName:@"Montserrat-Light" size:17.0f]
#define ml18 [UIFont fontWithName:@"Montserrat-Light" size:18.0f]
#define ml19 [UIFont fontWithName:@"Montserrat-Light" size:19.0f]
#define ml20 [UIFont fontWithName:@"Montserrat-Light" size:20.0f]
#define ml21 [UIFont fontWithName:@"Montserrat-Light" size:21.0f]
#define ml22 [UIFont fontWithName:@"Montserrat-Light" size:22.0f]
#define ml23 [UIFont fontWithName:@"Montserrat-Light" size:23.0f]
#define ml24 [UIFont fontWithName:@"Montserrat-Light" size:24.0f]
#define ml25 [UIFont fontWithName:@"Montserrat-Light" size:25.0f]
#define ml26 [UIFont fontWithName:@"Montserrat-Light" size:26.0f]
#define ml27 [UIFont fontWithName:@"Montserrat-Light" size:27.0f]
#define ml28 [UIFont fontWithName:@"Montserrat-Light" size:28.0f]
#define ml29 [UIFont fontWithName:@"Montserrat-Light" size:29.0f]
#define ml30 [UIFont fontWithName:@"Montserrat-Light" size:30.0f]

//Montserrat-SemiBold
#define ms14 [UIFont fontWithName:@"Montserrat-SemiBold" size:14.0f]
#define ms15 [UIFont fontWithName:@"Montserrat-SemiBold" size:15.0f]
#define ms16 [UIFont fontWithName:@"Montserrat-SemiBold" size:16.0f]
#define ms17 [UIFont fontWithName:@"Montserrat-SemiBold" size:17.0f]
#define ms18 [UIFont fontWithName:@"Montserrat-SemiBold" size:18.0f]
#define ms19 [UIFont fontWithName:@"Montserrat-SemiBold" size:19.0f]
#define ms20 [UIFont fontWithName:@"Montserrat-SemiBold" size:20.0f]
#define ms21 [UIFont fontWithName:@"Montserrat-SemiBold" size:21.0f]
#define ms22 [UIFont fontWithName:@"Montserrat-SemiBold" size:22.0f]
#define ms23 [UIFont fontWithName:@"Montserrat-SemiBold" size:23.0f]
#define ms24 [UIFont fontWithName:@"Montserrat-SemiBold" size:24.0f]
#define ms25 [UIFont fontWithName:@"Montserrat-SemiBold" size:25.0f]
#define ms26 [UIFont fontWithName:@"Montserrat-SemiBold" size:26.0f]
#define ms27 [UIFont fontWithName:@"Montserrat-SemiBold" size:27.0f]
#define ms28 [UIFont fontWithName:@"Montserrat-SemiBold" size:28.0f]
#define ms29 [UIFont fontWithName:@"Montserrat-SemiBold" size:29.0f]
#define ms30 [UIFont fontWithName:@"Montserrat-SemiBold" size:30.0f]








//********************************* METHODS ****************************************

#define goBackDR            [self.navigationController popViewControllerAnimated:YES];
#define dismissKeyboardDR   [self.view endEditing:YES];
#define sideBarmenuDR       [self.revealViewController revealToggleAnimated:YES];

//**************************  BASIC VALIDATIONS ************************************

#define firstNameV                  @"First Name address should not be empty"
#define lastNameV                   @"Last Name should not be empty"
#define emailV                      @"Email address should not be empty"
#define phonenumberV                @"Phone Number address should not be empty"
#define passwordV                   @"Password should not be empty"
#define dobV                        @"DOB should not be empty"
#define cityV                       @"City should not be empty"
#define stateV                      @"State should not be empty"
#define passwordNotMatch            @"Password not match."
#define countryV                    @"Country should not be empty"
#define zipcodeV                    @"Zipcode should not be empty"
#define InternalError               @"There is an error.Please try again."
#define InternetMessage             @"Internet connection is not available. Please check your wifi setting or cellular data."

//#define SlowInternet                @"Your internet connection is very slow.PLease try again later."

#define EmailExisted                @"Email Id/Username does not exist."
#define AccountUnAuthenticated      @"Please enter valid e-mail and password"
#define somethingIssue              @"Something went wrong. Please try again."
#define DuniqueIdAlreadyTaken       @"This Unique ID is already been taken."
#define DnotYourUniqueID            @"This is not your UniqueID"
#define alreadyTaken                @"This Email address has already been taken..."
#define correctEmailPlease          @"Oops ! This is not your registered Email. Please type correct email address."

#define ageRestriction              @"Your age should be greater than 13 to use this application."

#define pleaseWait                  @"Please wait..."
#define cancelled                   @"Cancelled"
#define unblocking                  @"Unblocking..."
#define refreshing                  @"Refreshing..."
#define firebaseError               @"The password is invalid or the user does not have a password."

//**********************************************************************************







//********************************* BASIC BG IMAGE *********************************

#define bgImageFor6             [UIImage imageNamed:@"bg750.png"]
#define bgImageFor6plus         [UIImage imageNamed:@"bg1242.png"]
#define bgImageFor5             [UIImage imageNamed:@"bg640.png"]
#define bgImageForipad          [UIImage imageNamed:@"bg768.png"]
#define bgImageForipad2         [UIImage imageNamed:@"bg1536.png"]



//********************************* GRADIENT COLOR *********************************

#define gradientFrameFromBottom CGRectMake(0.0f, self.view.frame.origin.y+250, self.view.frame.size.width, kSCREEN_HEIGHT-250);

//********************************* RedGreenBlue ******************************************

#define RGBc(r, g, b)	 [UIColor colorWithRed: (r) / 255.0 green: (g) / 255.0 blue: (b) / 255.0 alpha : 1]

//********************************* RedGreenBlue ******************************************


//********************************* FRAME **************************************



#define cgFrame(x,y,w,h) CGRectMake(x, y, w, h)


//******************************************************************************


//************************** MAIN APP COLOR*************************************

#define mainColor [UIColor colorWithRed:245.0/255.0 green:28.0/255.0 blue:132.0/255.0 alpha:1]

//******************************************************************************


#define iPhoneVersion ([[UIScreen mainScreen] bounds].size.height == 568 ? 5 : ([[UIScreen mainScreen] bounds].size.height == 480 ? 4 : ([[UIScreen mainScreen] bounds].size.height == 667 ? 6 : ([[UIScreen mainScreen] bounds].size.height == 736 ? 61 : 999))))



//************************** SMALL METHODS ************************************

#define DnavColor self.navigationController.navigationBar.barTintColor = [UIColor blackColor];

//******************************************************************************



//************************** PUSH WITHOUT PASSING ANY DATA ***********************

#define MAIN_STORYBOARD_R1 (UIStoryboard *) [UIStoryboard storyboardWithName:@"Main" bundle:nil]

#define MAKE_STORY_OBJ_R1(Identifier) [MAIN_STORYBOARD_R1 instantiateViewControllerWithIdentifier:Identifier]

#define PVC(Identifier)  [self.navigationController pushViewController:MAKE_STORY_OBJ_R1(Identifier) animated:YES];//USE THIS LINE

#define PUSH_STORY_OBJ(obj)  [self.navigationController pushViewController:obj animated:YES]

//******************************************************************************

@interface Utils : NSObject

+ (void)getAlert:(NSString*)message view:(id)view;
+(void)setViewMovedUp:(BOOL)movedUp view:(UIView*)view;
+ (BOOL) checkNetworkConnection;

//+(void)loginBtnClicked:(NSString*)email password:(NSString*)password;
+(void)loginBtnClicked:(void (^)(NSMutableDictionary *responseDictionary))callback email:(NSString*)email password:(NSString*)password;


+(BOOL)isNetworkAvailable;

@end
