//
//  HelpVC.m
//  PTC
//
//  Created by Apple on 7/4/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "HelpVC.h"

@interface HelpVC ()

@end

@implementation HelpVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[btnCall setTitle:@"" forState:UIControlStateNormal];
   
    
    [btnCall addTarget:self action:@selector(callMethod) forControlEvents:UIControlEventTouchUpInside];
    
    [btnMail addTarget:self action:@selector(mailMethod) forControlEvents:UIControlEventTouchUpInside];

    
    [self aboutUs];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"HELP"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(lefttBarButtonClickMethodInHelp)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;

    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
}


-(void)backClickFromMyBabyCan
{
    [self.navigationController popViewControllerAnimated:YES];
}



-(void)lefttBarButtonClickMethodInHelp
{
    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    
}

-(void)callMethod
{
    NSDictionary *    dictForPhone = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfAbout"];
    
    
    NSString *s=[NSString stringWithFormat:@"%@",[dictForPhone objectForKey:@"contactno"]];
    
    NSString *one = [s
                     stringByReplacingOccurrencesOfString:@"(" withString:@""];
    NSString *two = [one
                     stringByReplacingOccurrencesOfString:@")" withString:@""];
    
    NSString *three = [two
                       stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *four = [three
                      stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    UIApplication *application = [UIApplication sharedApplication];
//    NSString *phoneNumber = [@"tel://" stringByAppendingString:four];
    [application openURL:[NSURL URLWithString:@"https://owl-oncewaslost.com/"] options:@{} completionHandler:nil];
}

-(void)mailMethod
{
    
    /*name of the company must be real as that will help you get recognition*/
    NSString *emailTitle = @"OWL";
    // Email Content
    NSString *messageBody = @"OWL";
    // To address
    
    NSDictionary *    dictForEmail = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfAbout"];

    
    
    NSArray *toRecipents = [NSArray arrayWithObject:[dictForEmail objectForKey:@"contactemail"]];
    
//    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
//    mc.mailComposeDelegate = self;
//    [mc.navigationBar setTintColor:Black];
//    [mc setSubject:emailTitle];
//    [mc setMessageBody:messageBody isHTML:NO];
//    [mc setToRecipients:toRecipents];
//    [self presentModalViewController:mc animated:YES];
//    // Present mail view controller on screen
// //   [self presentViewController:mc animated:YES completion:NULL];


     MFMailComposeViewController   * mailComposer = [[MFMailComposeViewController alloc]init];

        if ([MFMailComposeViewController canSendMail] && mailComposer) {

           mailComposer.navigationBar.tintColor = [UIColor blackColor];
           [mailComposer.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
           mailComposer.mailComposeDelegate = self;

         //  [mailComposer setSubject:@"Corner - Contact Us"];
            [mailComposer setSubject:emailTitle];
             
           [mailComposer setToRecipients:toRecipents];

           [mailComposer setMessageBody:messageBody isHTML:NO];

          [self presentViewController:mailComposer animated:YES completion:nil];
    }
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - about webservice

-(void)aboutUs
{
    [Alert svProgress:pleaseWait];
    
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        NSDictionary *parameters;
        parameters = @{
                       @"action": @"help",

                       
                       };
        NSLog(@"parameters-------%@",parameters);
        
        
        [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             
             NSDictionary *dictPhotographerLogin=responseObject;
                          if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
             {
              //   [btnMail setTitle:[NSString stringWithFormat:@"%@",[[dictPhotographerLogin objectForKey:@"response"] objectForKey:@"contactemail"]] forState:UIControlStateNormal];
                 
                  [btnMail setTitle:@"owloncewaslostglobal@gmail.com" forState:UIControlStateNormal];

                 [[NSUserDefaults standardUserDefaults] setObject:[dictPhotographerLogin objectForKey:@"response"] forKey:@"keyAllDataOfAbout"];

                 [SVProgressHUD dismiss];;
                 
             }
             else
             {
                 
                 [SVProgressHUD dismiss];;
                 
             }
             
         }
              failure:^(AFHTTPRequestOperation *operation, NSError *error)
         
         {
             [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
             
         }];
        
        
    }


@end
