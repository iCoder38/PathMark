//
//  NNMWebService.h
//  Nurse Near Me
//
//  Created by Rameshwar on 07/03/17.
//  Copyright © 2017 RG. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "AppConstant.h"

@protocol NNMWebServiceDelegate <NSObject>

-(void) getDataFormWebService:(NSDictionary *)jsonResults urlStr:(NSString *)urlStr methodName:(NSString *)methodName;
-(void) webServiceFail:(NSError *)error;
-(void) webServiceFailWithApplicationServerMSG:(NSString *)msg;

@end


@interface NNMWebService : NSObject

{
    id <NNMWebServiceDelegate> delegate;
}


@property (nonatomic, strong) id <NNMWebServiceDelegate> delegate;
-(void)webServicePostString:(NSString *)postString urlString:(NSString *)urlSting methodName:(NSString *)methodName;
- (void)WebServiceUsingGETMethodURLString:(NSString *)urlSting methodName:(NSString *)methodName;
-(void)webserviceWithPostStr:(NSString *)postString withData:(NSData *)ns_data key:(NSString *)key urlString:(NSString *)urlSting methodName:(NSString *)methodName;

@end
