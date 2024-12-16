//
//  Alert.m
//  EVATA
//
//  Created by Apple on 12/6/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "Alert.h"
#import "Utils.h"
#import "Reachability.h"

@implementation Alert

#pragma textFieldName,Placeholder,Color,Font
+(void)textFieldplaceholder :(UITextField *)textField placeholder :(NSString *)placeholder color:(UIColor *)color font :(UIFont *)font{

    textField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: color, NSFontAttributeName : font}];
        }


#pragma textFieldName,Placeholder,Color,Font,background
+(void)textViewplaceholder :(UITextView *)textField frame :(CGRect)frame placeholder :(NSString *)placeholder textColor:(UIColor *)textColor font :(UIFont *)font bg :(UIColor *)bg cornerRadius :(float)cornerRadius paddingValue:(int) paddingValue yesNo :(BOOL)yesNo

{
    textField.backgroundColor=bg;
    
    textField.layer.cornerRadius=cornerRadius;
    textField.clipsToBounds=yesNo;
    
    textField.frame=frame;
    
}

#pragma textFieldName,Placeholder,Color,Font,background
+(void)textFieldplaceholder :(UITextField *)textField placeholder :(NSString *)placeholder placeHolderTextColor:(UIColor *)placeHolderTextColor textColor:(UIColor *)textColor font :(UIFont *)font bg :(UIColor *)bg cornerRadius :(float)cornerRadius paddingValue:(int) paddingValue yesNo :(BOOL)yesNo borderColor :(UIColor *)borderColor borderWidth :(CGFloat)borderWidth secureText :(BOOL)secureText keyboarTypes :(UIKeyboardType) keyboarTypes keyboardApp :(UIKeyboardAppearance) keyboardApp

{
    textField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: placeHolderTextColor, NSFontAttributeName : font}];
    
    textField.backgroundColor=bg;
    textField.textColor=textColor;
    textField.layer.cornerRadius=cornerRadius;
    textField.clipsToBounds=yesNo;
    
    textField.secureTextEntry=secureText;
    textField.keyboardType=keyboarTypes;
    textField.keyboardAppearance=keyboardApp;
    
    UIView *paddingView     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, paddingValue, textField.frame.size.height)];
    textField.leftView      = paddingView;
    textField.leftViewMode  = UITextFieldViewModeAlways;
    
    textField.layer.borderColor=borderColor.CGColor;
    textField.layer.borderWidth=borderWidth;
}

+(void)buttonMethod :(UIButton *)btn btnTitle :(NSString *)btnTitle btnTitleC :(UIColor *)btnTitleC btnFont :(UIFont *)btnFont btnBGcolor :(UIColor *)btnBGcolor btnCornerR :(float) btnCornerR btnClips :(BOOL)btnClips btnBorderC :(UIColor *)btnBorderC btnBorderW :(CGFloat)btnBorderW

{
    [btn setTitle:btnTitle forState:UIControlStateNormal];
    [btn setTitleColor:btnTitleC forState:UIControlStateNormal];
    btn.titleLabel.font=btnFont;
    btn.backgroundColor=btnBGcolor;
    btn.layer.cornerRadius=btnCornerR;
    btn.clipsToBounds=btnClips;
    btn.layer.borderColor=btnBorderC.CGColor;
    btn.layer.borderWidth=btnBorderW;
}

#pragma textFieldName,Placeholder,Color,Font,background
+(void)textFieldplaceholder :(UITextField *)textField frame :(CGRect)frame placeholder :(NSString *)placeholder textColor:(UIColor *)textColor font :(UIFont *)font bg :(UIColor *)bg cornerRadius :(float)cornerRadius paddingValue:(int) paddingValue yesNo :(BOOL)yesNo;

{
    
    textField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: textColor, NSFontAttributeName : font}];
    
    textField.backgroundColor=bg;
    
    textField.layer.cornerRadius=cornerRadius;
    textField.clipsToBounds=yesNo;

    textField.frame=frame;
    
    
    UIView *paddingView     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, paddingValue, textField.frame.size.height)];
    textField.leftView      = paddingView;
    textField.leftViewMode  = UITextFieldViewModeAlways;
    
}


#pragma mark -  add uilabel on TableView BG
+(void)addLabelBGCollectionView:(UICollectionView *)collectionView msg:(NSString*)msg color:(UIColor *)color
{
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, collectionView.bounds.size.width, collectionView.bounds.size.height)];
    
    messageLabel.text = msg;
    messageLabel.textColor = color;
    messageLabel.numberOfLines = 0;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.font = [UIFont fontWithName:@"Palatino-Italic" size:18];
    [messageLabel sizeToFit];
    collectionView.backgroundView = messageLabel;
}


#pragma padding left and right
+(void) setLeftPaddingTextField:(UITextField *)textField paddingValue:(int) paddingValue
{
    UIView *paddingView     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, paddingValue, textField.frame.size.height)];
    textField.leftView      = paddingView;
    textField.leftViewMode  = UITextFieldViewModeAlways;
}

+(void) setRightPaddingTextField:(UITextField *)textField paddingValue:(int) paddingValue
{
    UIView *paddingView     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, paddingValue, textField.frame.size.height)];
    textField.rightView = paddingView;
    textField.rightViewMode = UITextFieldViewModeAlways;
}

#pragma mark - Alert Contoller for push
+(void)alertControllerTitle:(NSString *)title msg:(NSString*)msg ok:(NSString *)ok cancel:(NSString *)cancel controller:(UINavigationController *)contoller
{
    NSLog(@"cancel==%@",cancel);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:msg
        preferredStyle:UIAlertControllerStyleAlert];
    
//ok button
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:ok style:UIAlertActionStyleDefault handler:nil];
    
//cancel button
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:ok style:UIAlertActionStyleDefault handler:nil];

    
    [alertController addAction:actionOk];
    [alertController addAction:actionCancel];

    [contoller presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - Alert Contoller for non-push
+(void)alertControllerTitle:(NSString *)title msg:(NSString*)msg ok:(NSString *)ok controller:(UINavigationController *)contoller
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:msg
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
//ok button
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:ok style:UIAlertActionStyleDefault handler:nil];
    
    
    [alertController addAction:actionOk];
    
    [contoller presentViewController:alertController animated:YES completion:nil];
}


#pragma mark - date
+(long)date
{
    time_t unixTime = (time_t) [[NSDate date] timeIntervalSince1970];
    
    return unixTime;
  
}

#pragma mark get height of text


+(CGSize)findHeightForText:(NSString *)text havingWidth:(CGFloat)widthValue andFont:(UIFont *)font {
    CGSize size = CGSizeZero;
    if (text) {
        //iOS 7
        CGRect frame = [text boundingRectWithSize:CGSizeMake(widthValue, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:font } context:nil];
        size = CGSizeMake(frame.size.width, frame.size.height + 1);
    }
    return size;
}

#pragma mark Current Date & Time

+(NSString *)getCurrentDate{
    
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    NSLog(@"%@",[dateFormatter stringFromDate:[NSDate date]]);
    
    return [dateFormatter stringFromDate:[NSDate date]];
    
}
+(NSString *)getCurrentTime{
    
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSLog(@"%@",[dateFormatter stringFromDate:[NSDate date]]);
    
    
    return [dateFormatter stringFromDate:[NSDate date]];
    
}

#pragma mark - Draw line.........
+(void)drawLineUsingFrameOnview:(UIView *)view strokeColor:(UIColor *)strokeColor fillColor:(UIColor *)fillColor frame:(CGRect)frame
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [UIBezierPath bezierPathWithRect:frame].CGPath;
    shapeLayer.strokeColor = strokeColor.CGColor;
    shapeLayer.fillColor = fillColor.CGColor;
    shapeLayer.lineWidth = frame.size.height;
    [view.layer addSublayer:shapeLayer];
    
}


#pragma mark Keyboard Up & Down


+(void)moveUpView:(UIView *)view{
    
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        CGRect frame = view.frame;
        if (kSCREEN_HEIGHT == 1024) {
            frame.origin.y = (-365);
        }
        else
            if (kSCREEN_HEIGHT == 568) {
                frame.origin.y = (-220);
            }
            else{
                frame.origin.y = (-215);
            }
        frame.origin.x =0;
        view.frame = frame;
        
    }completion:^(BOOL finished){
        
        
    }];
    
}



+(void)moveDownView:(UIView *)view{
    
    [UIView animateWithDuration:0.0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        
        CGRect frame = view.frame;
        frame.origin.y = 0;
        frame.origin.x =0;
        view.frame = frame;
        
    }completion:^(BOOL finished){
        
         
    }];
    
}


#pragma mark - Create Label


+(UILabel *)createCustomLabel:(CGRect)frameSet labelTitle:(NSString *)labelTitle labelTitleColor:(UIColor *)labelColor labelBackgroundColor:(UIColor *)labelBackgroundColor labelFont:(UIFont *)labelFont cornerRadius:(float)cornerRadius textAlignment:(NSTextAlignment)textAlignment{
    
    UILabel *labelView = [[UILabel alloc] initWithFrame:frameSet];
    labelView.numberOfLines = 0;
    labelView.text = labelTitle;
    labelView.font = labelFont;
    labelView.textColor = labelColor;
    labelView.textAlignment = textAlignment;
    labelView.backgroundColor = labelBackgroundColor;
    labelView.layer.cornerRadius = cornerRadius;
    labelView.clipsToBounds = YES;
    return labelView;
}


#pragma mark -  add uilabel on TableView BG
+(void)addLabelBGTableView:(UITableView *)tableView msg:(NSString*)msg color:(UIColor *)color
{
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, tableView.bounds.size.height)];
    
    messageLabel.text = msg;
    messageLabel.textColor = color;
    messageLabel.numberOfLines = 0;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.font = [UIFont fontWithName:@"Futura" size:18];
    [messageLabel sizeToFit];
    tableView.backgroundView = messageLabel;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}




#pragma mark - sv progress
+(void)svError :(NSString *)str
{
    [SVProgressHUD showErrorWithStatus:str maskType:SVProgressHUDMaskTypeBlack];
}

+(void)svSuccess :(NSString *)str
{
    [SVProgressHUD showSuccessWithStatus:str maskType:SVProgressHUDMaskTypeBlack];
}

+(void)svProgress :(NSString *)str
{
    [SVProgressHUD showWithStatus:str maskType:SVProgressHUDMaskTypeBlack];
}

+(void)border :(UITextField *)textField color:(UIColor *)color width:(float)width
{
    textField.layer.borderColor=color.CGColor;
    textField.layer.borderWidth=width;
}

+(void)corner :(UITextField *)textField cornerRadius :(float)cornerRadius yesNo :(BOOL)yesNo
{
    textField.layer.cornerRadius=cornerRadius;
    textField.clipsToBounds=yesNo;
}

#pragma mark - Phone Number Format (USA)

+(NSString *)formatNumber:(NSString *)mobileNumber{

    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];


    int length = (int)[mobileNumber length];
    if(length > 10)
    {
        mobileNumber = [mobileNumber substringFromIndex: length-10];

    }

    return mobileNumber;
}


+ (int)getLength:(NSString *)mobileNumber{

    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];

    int length = (int)[mobileNumber length];

    return length;
}

#pragma mark - ValidateTextFieldValidate
+(BOOL)ValidateTextFieldValidate:(UITextField *)textField andLenght:(int)textlenght
{
    if ([textField.text length] > textlenght)
    {
        //do your work

        return YES;
    }
    else
    {
        //through error
        return NO;
    }
}
#pragma mark - ValidateTextFieldValidate
+(BOOL)validateTextView:(UITextView *)textView andLenght:(int)textlenght
{
    if ([textView.text length] > textlenght)
    {
        //do your work

        return YES;
    }
    else
    {
        //through error
        return NO;
    }
}
#pragma mark - isPasswordMatch or not
+(BOOL)isPasswordMatch:(NSString *)pwd withConfirmPwd:(NSString *)cnfPwd
{
    //asume pwd and cnfPwd has not whitespace
    if([pwd length]>0 && [cnfPwd length]>0){
        if([pwd isEqualToString:cnfPwd]){
            NSLog(@"Hurray! Password matches ");
            return YES;
        }else{
            NSLog(@"Oops! Password does not matches");
            return NO;
        }
    }else{
        NSLog(@"Password field can not be empty ");
        return NO;
    }
    return NO;
}

#pragma mark - reachability .......
+(BOOL)networkStatus
{
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];

    return networkStatus;
}

#pragma mark - validationEmail
+(BOOL)validationEmail:(NSString *)checkString{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

#pragma mark - Compress Image

+(NSData *)compressImage:(UIImage *)image{


    float actualHeight = image.size.height;
    float actualWidth = image.size.width;
    float maxHeight = 500.0;
    float maxWidth = 500.0;
    float imgRatio = actualWidth/actualHeight;
    float maxRatio = maxWidth/maxHeight;
    float compressionQuality = 0.5;

    if(imgRatio < maxRatio){

        actualWidth = maxWidth;
        actualHeight = maxHeight;
    }
    else if(imgRatio > maxRatio){

        actualHeight = maxHeight;
        actualWidth = maxWidth;
    }
    else{
        actualHeight = maxHeight;
        actualWidth = maxWidth;
    }
    NSLog(@"Actual height :%f and Width :%f",actualHeight,actualWidth);
    CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
    UIGraphicsBeginImageContext(rect.size);
    [image drawInRect:rect];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    NSData *imageData = UIImageJPEGRepresentation(img, compressionQuality);
    UIGraphicsEndImageContext();

    return imageData;
}


@end
