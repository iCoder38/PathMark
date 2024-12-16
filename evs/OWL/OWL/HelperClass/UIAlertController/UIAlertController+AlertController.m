//
//  UIAlertController+AlertController.m
//  NationalAeroStands
//
//  Created by Nitin Kumar on 15/12/16.
//  Copyright © 2016 Nitin Kumar. All rights reserved.
//

#import "UIAlertController+AlertController.h"



@implementation UIAlertController (AlertController)

+ (instancetype)showAlertIn:(UINavigationController *)navigationController
                  WithTitle:(NSString *)title
                    message:(NSString *)message
          cancelButtonTitle:(NSString *)cancelButtonTitle
          otherButtonTitles:(NSString *)otherButtonTitle
                   tapBlock:(UIAlertCompletionBlock)tapBlock {
    
    UIAlertController *alertController = [self alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if(cancelButtonTitle != nil) {
        
        UIAlertAction *cancelButton = [UIAlertAction
                                       actionWithTitle:cancelButtonTitle
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       {
                                           tapBlock(alertController, ALERTACTION_CANCEL); // CANCEL BUTTON CALL BACK ACTION
                                       }];
        [alertController addAction:cancelButton];
        
    }
    
    if(otherButtonTitle != nil) {
        
        UIAlertAction *otherButton = [UIAlertAction
                                      actionWithTitle:otherButtonTitle
                                      style:UIAlertActionStyleDefault
                                      handler:^(UIAlertAction *action)
                                      {
                                          tapBlock(alertController, ALERTACTION_OTHER); // OTHER BUTTON CALL BACK ACTION
                                      }];
        
        [alertController addAction:otherButton];
    }
    
    
     
 UIViewController *rootViewController = [navigationController.viewControllers firstObject];
    
  [rootViewController presentViewController:alertController animated:YES completion:^{
      
  }];
  
    
    return alertController;
}



@end


