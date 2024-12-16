//
//  DisclaimerVC.h
//  OWL
//
//  Created by Apple on 8/25/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisclaimerVC : UIViewController
<
UITextViewDelegate
>
{
    IBOutlet UITextView *txtViewDisclaimer;
    
    IBOutlet UIButton *btnIagree;
}
@end
