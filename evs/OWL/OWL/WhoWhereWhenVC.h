//
//  WhoWhereWhenVC.h
//  OWL
//
//  Created by Apple on 9/4/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WhoWhereWhenVC : UIViewController
<
UITextFieldDelegate
>
{
    IBOutlet UITextField *txtWho;
    IBOutlet UITextField *txtWhere;
    IBOutlet UITextField *txtWhen;
}
@property(strong,nonatomic)NSDictionary *dictGetAllDataOfIFoundMyChild;
@end
