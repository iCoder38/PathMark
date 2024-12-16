//
//  MyAnnotation.m
//  GovSummit
//
//  Created by Rameshwar Gupta on 19/01/15.
//  Copyright (c) 2015 Rameshwar Gupta. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

@synthesize coordinate;

@synthesize title;
@synthesize tag;

@synthesize time;

@synthesize subtitle;
@synthesize mPinColor;


-(id)initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString *) t subTitle:(NSString *)timed time:(NSString *)tim

{
    
    self.coordinate=c;
    
    self.time=tim;
    
    self.subtitle=timed;
    
    self.title=t;
    
    return self;
    
}

- (NSString *)pincolor
{
    return mPinColor;
}

- (void) setpincolor:(NSString*) String1
{
    mPinColor = String1;
}

-(id)initWithCoordinates:(CLLocationCoordinate2D)paramCoordinates image:(NSString *)paramImage
{
    self = [super init];
    if(self != nil)
    {
        self.coordinate = paramCoordinates;
        _image = paramImage;
             
    }
    return (self);
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString *)tit subTitle:(NSString *)timed

{
    
    self.coordinate=c;
    
    self.title=tit;
    self.subtitle=timed;

    
    return self;
    
}

@end

