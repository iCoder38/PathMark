//
//  NNMWebService.m
//  Nurse Near Me
//
//  Created by Rameshwar on 07/03/17.
//  Copyright © 2017 RG. All rights reserved.
//

#import "NNMWebService.h"

@implementation NNMWebService

@synthesize delegate;


static NSString *const kSERVER_ISSUE                    = @"Opps! Server connection failed.\n Please try later.";

#pragma mark -  WEB SERVICE USING POST METHODS
-(void)webServicePostString:(NSString *)postString urlString:(NSString *)urlSting methodName:(NSString *)methodName
{
    
    
    NSData *postData = [postString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    NSURL *url = [NSURL URLWithString:urlSting];
    NSLog(@"url String : %@",url );
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    [theRequest setValue:@"key=AIzaSyBvH3e0goQXu3CPihCI8T2tgJiCPfdaFJc" forHTTPHeaderField:@"Authorization"];

    [theRequest setHTTPBody:postData];
    [theRequest setTimeoutInterval:30.0f];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:theRequest
    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                      
        if ([data length] >0 && error == nil){
                                          
            NSDictionary * result =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
           NSLog(@"result =%@",result );
                                          
            if ([result isKindOfClass:[NSNull class]] || result == nil)
            {
              dispatch_async(dispatch_get_main_queue(), ^{
                
                  [delegate webServiceFailWithApplicationServerMSG:kSERVER_ISSUE];
                    });
                    }
            else{
                if ([[result valueForKey:@"success"] intValue]  == 1) {
                
                    dispatch_async(dispatch_get_main_queue(), ^{
                    [delegate getDataFormWebService:result urlStr:urlSting methodName:methodName];
                });
                }
            else
            {
              dispatch_async(dispatch_get_main_queue(), ^{
                                                      
                [delegate webServiceFailWithApplicationServerMSG:[result valueForKey:@"msg"]];
            });
                                                  
            }
         }
        }
        else if ([data length] == 0 && error == nil)
        {
        dispatch_async(dispatch_get_main_queue(), ^{
                                              
            [delegate webServiceFailWithApplicationServerMSG:kSERVER_ISSUE];
            });
        }
        else if (error != nil)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                                              
            [delegate webServiceFail:error];
            });
        }
    }];
    [task resume];
}


#pragma mark -  WEB SERVICE USING GET METHODS
- (void)WebServiceUsingGETMethodURLString:(NSString *)urlSting methodName:(NSString *)methodName
{
    NSURL *url = [NSURL URLWithString:urlSting];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest setTimeoutInterval:30.0f];
    // NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:theRequest
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      
                                      if ([data length] >0 && error == nil)
                                      {
                                          NSDictionary * result =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                          NSLog(@"result =%@",result );
                                          
                                          if ([result isKindOfClass:[NSNull class]] || result == nil)
                                          {
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  [delegate webServiceFailWithApplicationServerMSG:kSERVER_ISSUE];
                                              });
                                          }
                                          else
                                          {
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  
                                                  [delegate getDataFormWebService:result urlStr:urlSting methodName:methodName];
                                              });
                                              BOOL success = [[result valueForKey:@"success"] boolValue];
                                              
                                              if (success)
                                              {
                                                  
                                                  dispatch_async(dispatch_get_main_queue(), ^{
                                                      
                                                      [delegate getDataFormWebService:result urlStr:urlSting methodName:methodName];
                                                  });
                                              }
                                              else
                                              {
                                                  dispatch_async(dispatch_get_main_queue(), ^{
                                                      
                                                      [delegate webServiceFailWithApplicationServerMSG:[result valueForKey:@"msg"]];
                                                  });
                                              }
                                          }
                                      }
                                      else if ([data length] == 0 && error == nil)
                                      {
                                          dispatch_async(dispatch_get_main_queue(), ^{
                                              
                                              [delegate webServiceFailWithApplicationServerMSG:kSERVER_ISSUE];
                                          });
                                      }
                                      else if (error != nil)
                                      {
                                          dispatch_async(dispatch_get_main_queue(), ^{
                                              
                                              [delegate webServiceFail:error];
                                          });
                                      }
                                  }];
    [task resume];
}

#pragma mark -  WEB SERVICE WITH MULTI ENTITY UPLOAD DATA
-(void)webserviceWithPostStr:(NSString *)postString withData:(NSData *)ns_data key:(NSString *)key urlString:(NSString *)urlSting methodName:(NSString *)methodName
{
    
    NSData *postData = [postString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    NSURL *url = [NSURL URLWithString:urlSting];
    NSLog(@"url String : %@",url );
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest setHTTPMethod:@"POST"];
    NSMutableData *body = [NSMutableData data];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [theRequest addValue:contentType forHTTPHeaderField: @"Content-Type"];
    [theRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSString *imageName=[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@.jpg\"\r\n",key,[NSDate date]];
    
    [body appendData:[imageName dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:ns_data]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    //  parameter username
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"data\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    // setting the body of the post to the reqeust
    [theRequest setHTTPBody:body];
    // [theRequest setTimeoutInterval:30.0f];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:theRequest
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      
                                      if ([data length] >0 && error == nil)
                                      {
                                          NSDictionary * result =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                          NSLog(@"result =%@",result );
                                          
                                          if ([result isKindOfClass:[NSNull class]] || result == nil)
                                          {
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  [delegate webServiceFailWithApplicationServerMSG:kSERVER_ISSUE];
                                              });
                                          }
                                          else
                                          {
                                              BOOL success = [[result valueForKey:@"success"] boolValue];
                                              
                                              if (success) {
                                                  
                                                  dispatch_async(dispatch_get_main_queue(), ^{
                                                      
                                                      [delegate getDataFormWebService:result urlStr:urlSting methodName:methodName];
                                                  });
                                              }
                                              else
                                              {
                                                  dispatch_async(dispatch_get_main_queue(), ^{
                                                      
                                                      [delegate webServiceFailWithApplicationServerMSG:[result valueForKey:@"msg"]];
                                                  });
                                                  
                                              }
                                          }
                                      }
                                      else if ([data length] == 0 && error == nil)
                                      {
                                          dispatch_async(dispatch_get_main_queue(), ^{
                                              
                                              [delegate webServiceFailWithApplicationServerMSG:kSERVER_ISSUE];
                                          });
                                      }
                                      else if (error != nil)
                                      {
                                          dispatch_async(dispatch_get_main_queue(), ^{
                                              
                                              [delegate webServiceFail:error];
                                          });
                                      }
                                  }];
    [task resume];
}

#pragma mark Str Status
-(BOOL)successStatusStr:(NSString*)key
{
    if ([key isEqualToString:@"Success"]) {
        
        return YES;
    }
    else
    {
        return NO;
    }
    return NO;
}

@end
