//
//  MapVC.h
//  PennyBox
//
//  Created by Apple on 6/8/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>


#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MyAnnotation.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface MapVC : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate>

{
    IBOutlet MKMapView*mapVieww;
    
     CLLocationManager *locationManager;
    
    NSArray* routes;
    BOOL isUpdatingRoutes;
    
    IBOutlet UILabel*longitudeLabel;
    IBOutlet UILabel*latitudeLabel;
    
    
    
    IBOutlet UIView *viewStatus;
    IBOutlet UILabel *lblTotalDistance;
    
    IBOutlet UIButton *btnInterested;
    IBOutlet UIButton *btnNotInterested;
}






@property (nonatomic, retain) MKPolyline *routeLine; //your line
@property (nonatomic, retain) MKPolylineView *routeLineView; //overlay view



@property(nonatomic, weak) IBOutlet MKMapView* mapView;
@property(nonatomic,retain)CLLocationManager* locationManager;

@property(nonatomic, retain)NSDictionary *dictData;

@property(nonatomic, retain)NSDictionary *dict;
@property(nonatomic, retain)NSString *strID;



@end
