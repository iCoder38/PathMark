//
//  PrivateChat.h
//  ScholarSuccess
//
//  Created by Lalit on 21/12/16.
//  Copyright © 2016 Lalit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrivateChatVC : UIViewController<UITableViewDataSource, UITableViewDelegate, UITextViewDelegate>
{
    IBOutlet UILabel *lblTyping;
}

@property(nonatomic, retain)NSString *username1;
@property(nonatomic, retain)NSString *username2;
@property(nonatomic, retain)NSString *strNotification;


@property (nonatomic, retain) NSDictionary *dictMyInfo;
@property (nonatomic, retain) NSDictionary *dictChatUserInfo;

@property (nonatomic, retain) NSString *strToken;
@property (nonatomic, strong) NSString *strUserID;


@property (nonatomic, retain) NSString *chatUserName;
@property (nonatomic, strong) NSString *chatUserImage;


@property(nonatomic, strong)NSString *strComingFrom;
@property(nonatomic, strong)NSString *strChatUserImage;




@end
