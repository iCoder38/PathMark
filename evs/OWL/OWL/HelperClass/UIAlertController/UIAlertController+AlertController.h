//
//  UIAlertController+AlertController.h
//  NationalAeroStands
//
//  Created by Nitin Kumar on 15/12/16.
//  Copyright © 2016 Nitin Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ALERTACTION_CANCEL  0

#define ALERTACTION_OTHER   1


typedef void (^UIAlertCompletionBlock) (UIAlertController *alertViewController, NSInteger buttonIndex);
@interface UIAlertController (AlertController)


+ (instancetype)showAlertIn:(UINavigationController *)navigationController
                  WithTitle:(NSString *)title
                    message:(NSString *)message
          cancelButtonTitle:(NSString *)cancelButtonTitle
          otherButtonTitles:(NSString *)otherButtonTitle
                   tapBlock:(UIAlertCompletionBlock)tapBlock;
@end
