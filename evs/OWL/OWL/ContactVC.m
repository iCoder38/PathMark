//
//  ContactVC.m
//  OWL
//
//  Created by Apple on 8/22/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "ContactVC.h"

@interface ContactVC ()
{
    NSData *imageData;
    UIImage *image ;
    
    IBOutlet UIImageView *imgProfilePicture;
}
@end

@implementation ContactVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=White;
    
    txtName.backgroundColor=RGBc(238, 238, 238);
    txtEmail.backgroundColor=RGBc(238, 238, 238);
    txtEnterSubect.backgroundColor=RGBc(238, 238, 238);
    txtUploadImage.backgroundColor=RGBc(238, 238, 238);
    
    txtName.layer.borderColor=DarkGray.CGColor;
    txtName.layer.borderWidth=1.0f;
    
    txtEmail.layer.borderColor=DarkGray.CGColor;
    txtEmail.layer.borderWidth=0.80f;
    txtEmail.keyboardType=UIKeyboardTypeEmailAddress;
    
    txtEnterSubect.layer.borderColor=DarkGray.CGColor;
    txtEnterSubect.layer.borderWidth=0.80f;
    
    txtUploadImage.layer.borderColor=DarkGray.CGColor;
    txtUploadImage.layer.borderWidth=0.80f;
    
    txtMessage.backgroundColor=RGBc(238, 238, 238);
    txtMessage.layer.borderColor=DarkGray.CGColor;
    txtMessage.layer.borderWidth=0.80f;
    
    UIColor *cc=RGBc(83, 83, 83);
    [Alert textFieldplaceholder:txtName placeholder:@"Name" color:cc font:ml14];
    [Alert textFieldplaceholder:txtEmail placeholder:@"Email" color:cc font:ml14];
    [Alert textFieldplaceholder:txtUploadImage placeholder:@"Upload image" color:cc font:ml14];
    [Alert textFieldplaceholder:txtEnterSubect placeholder:@"Subject" color:cc font:ml14];
    
    
    [Alert setLeftPaddingTextField:txtName paddingValue:20];
    [Alert setLeftPaddingTextField:txtEmail paddingValue:20];
    [Alert setLeftPaddingTextField:txtUploadImage paddingValue:20];
    [Alert setLeftPaddingTextField:txtEnterSubect paddingValue:20];
    
        
    btnSubmit.layer.cornerRadius=2;
    btnSubmit.clipsToBounds=YES;
    [btnSubmit addTarget:self action:@selector(submitContactRequest) forControlEvents:UIControlEventTouchUpInside];
    
    txtMessage.layer.cornerRadius=2;
    txtMessage.clipsToBounds=YES;
    
    txtUploadImage.layer.cornerRadius=2;
    txtUploadImage.clipsToBounds=YES;
    
    txtEnterSubect.layer.cornerRadius=2;
    txtEnterSubect.clipsToBounds=YES;
    
    txtEmail.layer.cornerRadius=2;
    txtEmail.clipsToBounds=YES;
    
    txtName.layer.cornerRadius=2;
    txtName.clipsToBounds=YES;
    
    txtMessage.text = @"  Message";
    txtMessage.textColor = cc;
    txtMessage.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"CONTACT"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(leftMenuBarInContact)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    
}

-(void)leftMenuBarInContact
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    txtMessage.textColor = [UIColor blackColor];
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    
    if(txtMessage.text.length == 0)
    {
        txtMessage.textColor = [UIColor lightGrayColor];
        txtMessage.text = @"  Message";
        [txtMessage resignFirstResponder];
    }
}

-(void)Open_Camera
{
    
#if TARGET_IPHONE_SIMULATOR
    
    NSLog(@"No Camera is set up in Simulator");
    
#else
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:NULL];
    
#endif
    
}

-(void)Open_Library
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate=self;
    imagePicker.navigationBar.tintColor=Black;
    imagePicker.allowsEditing = YES;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
    else
    {
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

-(void)selectphoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    
    UIImage *img =   [info objectForKey:UIImagePickerControllerOriginalImage];
    imgProfilePicture.image =img;
    NSLog(@"image user png is -----<%@",imgProfilePicture.image);
    
    if(imgProfilePicture==nil)
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"OOPS" message:@"No Image Foundy "
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:actionOk];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    else
    {
        imageData=[self compressImage:img];
        
        [picker dismissViewControllerAnimated:YES completion:nil];
        
    }
    return;
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(NSData *)compressImage:(UIImage *)image1
{
    
    float actualHeight = image1.size.height;
    float actualWidth = image1.size.width;
    float compressionQuality = 0.5;
    
    
    CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
    UIGraphicsBeginImageContext(rect.size);
    [image1 drawInRect:rect];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    imageData = UIImageJPEGRepresentation(img, compressionQuality);
    UIGraphicsEndImageContext();
    
    return imageData;
}

-(IBAction)actionSheetForCameraAndGalleryClick:(id)sender
{
    UIAlertController*alertAction=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        [self Open_Camera];
    }];
    
    
    UIAlertAction *action1=[UIAlertAction actionWithTitle:@"Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        [self Open_Library];
    }];
    
    
    UIAlertAction *cancelAlert=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    
    [alertAction addAction:action];
    [alertAction addAction:action1];
    [alertAction addAction:cancelAlert];
    
    [self presentViewController:alertAction animated:YES completion:nil];
}

- (BOOL)validateEmailWithString:(NSString*)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}



-(void)submitContactRequest
{
    
    
    NSDictionary * myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    

    
    
    NSMutableDictionary* _params = [[NSMutableDictionary alloc] init];
   
    [_params setObject:txtEnterSubect.text        forKey:@"subject"];
    [_params setObject:[NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]]            forKey:@"user_id"];
    [_params setObject:txtName.text      forKey:@"name"];
    [_params setObject:txtEmail.text         forKey:@"email"];
    [_params setObject:txtMessage.text          forKey:@"body"];
    
    
    [_params setObject:@"contact"          forKey:@"action"];
    
    NSString *BoundaryConstant = @"----------V2ymHFg03ehbqgZCaKO6jy";
    NSString* FileParamConstant = @"image";
    
    NSURL* requestURL = [NSURL URLWithString:BaseURLOfOWL];
    
    
    // create request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setHTTPShouldHandleCookies:NO];
    [request setTimeoutInterval:30];
    [request setHTTPMethod:@"POST"];
    
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", BoundaryConstant];
    [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    // post body
    NSMutableData *body = [NSMutableData data];
    
    // add params (all params are strings)
    for (NSString *param in _params)
    {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@\r\n", [_params objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    // add image data
    if (imageData) {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.jpg\"\r\n", FileParamConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageData];
        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // setting the body of the post to the reqeust
    [request setHTTPBody:body];
    
    // set the content-length
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[body length]];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    // set URL
    [request setURL:requestURL];
    
    NSURLResponse *response = nil;
    NSError *requestError = nil;
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&requestError];
    
    
    
    
    
    
    
    if (requestError == nil)
    {
        
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&requestError];
        
        
        
        
        
        if ([[json objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
        {
            
            [Alert svSuccess:@"Done"];
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        else
        {
            NSLog(@"why?====%@",requestError.description);
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
