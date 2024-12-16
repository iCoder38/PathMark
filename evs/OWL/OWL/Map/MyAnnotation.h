//
//  MyAnnotation.h
//  GovSummit
//
//  Created by Rameshwar Gupta on 19/01/15.
//  Copyright (c) 2015 Rameshwar Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject<MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    
    NSString *title;
    
    NSString *subTitle;
    
    NSString *time;
    
    NSInteger tag;
}

@property (nonatomic)CLLocationCoordinate2D coordinate;
@property (nonatomic, copy,readwrite) NSString *title;
@property (nonatomic, readwrite, copy) NSString *subtitle;
@property (nonatomic) NSInteger tag;
@property (nonatomic,copy) NSString *time;
@property (nonatomic, copy) NSString *mPinColor;

@property (nonatomic, copy, readonly) NSString *image;

-(id)initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString *) t subTitle:(NSString *)timed time:(NSString *)tim;
-(id)initWithCoordinates:(CLLocationCoordinate2D) paramCoordinates
                   image:(NSString *) paramImage;

@end

