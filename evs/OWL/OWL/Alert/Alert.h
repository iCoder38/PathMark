
//  Alert.h
//  EVATA

//  Created by Apple on 12/6/16.
//  Copyright © 2016 Apple. All rights reserved.


#import <Foundation/Foundation.h>

@interface Alert : NSObject

//FOR textfield placeholder,color, and font
+(void)textFieldplaceholder :(UITextField *)textField placeholder :(NSString *)placeholder color:(UIColor *)color font :(UIFont *)font;

+(void)buttonMethod :(UIButton *)btn btnTitle :(NSString *)btnTitle btnTitleC :(UIColor *)btnTitleC btnFont :(UIFont *)btnFont btnBGcolor :(UIColor *)btnBGcolor btnCornerR :(float) btnCornerR btnClips :(BOOL)btnClips btnBorderC :(UIColor *)btnBorderC btnBorderW :(CGFloat)btnBorderW;

+(void)textFieldplaceholder :(UITextField *)textField placeholder :(NSString *)placeholder placeHolderTextColor:(UIColor *)placeHolderTextColor textColor:(UIColor *)textColor font :(UIFont *)font bg :(UIColor *)bg cornerRadius :(float)cornerRadius paddingValue:(int) paddingValue yesNo :(BOOL)yesNo borderColor :(UIColor *)borderColor borderWidth :(CGFloat)borderWidth secureText :(BOOL)secureText keyboarTypes :(UIKeyboardType) keyboarTypes keyboardApp :(UIKeyboardAppearance) keyboardApp;

+(void)textViewplaceholder :(UITextView *)textField frame :(CGRect)frame placeholder :(NSString *)placeholder textColor:(UIColor *)textColor font :(UIFont *)font bg :(UIColor *)bg cornerRadius :(float)cornerRadius paddingValue:(int) paddingValue yesNo :(BOOL)yesNo;

+(CGSize)findHeightForText:(NSString *)text havingWidth:(CGFloat)widthValue andFont:(UIFont *)font;
+(void)addLabelBGCollectionView:(UICollectionView *)collectionView msg:(NSString*)msg color:(UIColor *)color;

+(NSData *)compressImage:(UIImage *)image;

+(void)moveDownView:(UIView *)view;
    
    +(void)moveUpView:(UIView *)view;

+(UILabel *)createCustomLabel:(CGRect)frameSet labelTitle:(NSString *)labelTitle labelTitleColor:(UIColor *)labelColor labelBackgroundColor:(UIColor *)labelBackgroundColor labelFont:(UIFont *)labelFont cornerRadius:(float)cornerRadius textAlignment:(NSTextAlignment)textAlignment;

+(void)textFieldplaceholder :(UITextField *)textField frame :(CGRect)frame placeholder :(NSString *)placeholder textColor:(UIColor *)textColor font :(UIFont *)font bg :(UIColor *)bg cornerRadius :(float)cornerRadius paddingValue:(int) paddingValue yesNo :(BOOL)yesNo;

+(void)drawLineUsingFrameOnview:(UIView *)view strokeColor:(UIColor *)strokeColor fillColor:(UIColor *)fillColor frame:(CGRect)frame;

//=============================================================

// Padding on UitextField
//left
+(void) setLeftPaddingTextField:(UITextField *)textField paddingValue:(int) paddingValue;
//right
+(void) setRightPaddingTextField:(UITextField *)textField paddingValue:(int) paddingValue;

//=============================================================

//alert view controller - push
+(void)alertControllerTitle:(NSString *)title msg:(NSString*)msg ok:(NSString *)ok cancel:(NSString *)cancel controller:(UINavigationController *)contoller;
//=============================================================

//alert view controller - non-push
+(void)alertControllerTitle:(NSString *)title msg:(NSString*)msg ok:(NSString *)ok controller:(UINavigationController *)contoller;

//=============================================================
+(long)date;
+(NSString *)getCurrentDate;
+(NSString *)getCurrentTime;
+(void)addLabelBGTableView:(UITableView *)tableView msg:(NSString*)msg color:(UIColor *)color;


+(void)svError :(NSString *)str;
+(void)svSuccess :(NSString *)str;
+(void)svProgress :(NSString *)str;

+(void)border :(UITextField *)textField color:(UIColor *)color width:(float)width;

+(void)corner :(UITextField *)textField cornerRadius :(float)cornerRadius yesNo :(BOOL)yesNo;
+ (int)getLength:(NSString *)mobileNumber;
+(NSString *)formatNumber:(NSString *)mobileNumber;
+(BOOL)isPasswordMatch:(NSString *)pwd withConfirmPwd:(NSString *)cnfPwd;
+(BOOL)validateTextView:(UITextView *)textView andLenght:(int)textlenght;
+(BOOL)ValidateTextFieldValidate:(UITextField *)textField andLenght:(int)textlenght;
+(BOOL)validationEmail:(NSString *)checkString;
+(BOOL)networkStatus;
@end
