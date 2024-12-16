//
//  AppDelegate.h
//  OWL
//
//  Created by Apple on 7/24/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SWRevealViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate : UIResponder<
UIApplicationDelegate,SWRevealViewControllerDelegate, UNUserNotificationCenterDelegate>{
    
    UNNotificationResponse *response;
    
}


+ (AppDelegate *)sharedAppDelegate;
+ (UIStoryboard *)storyBoardType;

 
@property (strong, nonatomic) UIWindow *window;

@property(strong,nonatomic)SWRevealViewController*swcontroller;

-(void)getAfterLogin;

@end

