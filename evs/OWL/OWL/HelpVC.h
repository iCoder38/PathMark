//
//  HelpVC.h
//  PTC
//
//  Created by Apple on 7/4/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface HelpVC : UIViewController
<
MFMailComposeViewControllerDelegate
>
{
    IBOutlet UIButton *btnCall;
    IBOutlet UIButton *btnMail;
    
    IBOutlet UILabel *lblEmail;
}
@end
