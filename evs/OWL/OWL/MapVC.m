//
//  MapVC.m
//  PennyBox
//
//  Created by Apple on 6/8/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "MapVC.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface MapVC ()
{
    CLLocation* _currentLocaton;
    CLLocation* _previousLocaton;
    CLLocationManager* _cLLocationManager;
    CLLocationCoordinate2D *currentLocation;
    UIButton *LeftMenu;
}

@end

@implementation MapVC
@synthesize  locationManager;
- (id)init
{
    self = [super init];
    if(self != nil)
    {
    
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIBarButtonItem *rightLoginBar=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backClickFromMap)];
    self.navigationItem.leftBarButtonItem = rightLoginBar;

    
    self.title=@"Birthday Party";
    
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;

    
    if ([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)])
        [locationManager requestAlwaysAuthorization];
    [locationManager startUpdatingLocation];
    
    
    
    
    _mapView.showsUserLocation = YES;
    _mapView.mapType = MKMapTypeStandard;
    _mapView.delegate = self;

    
    [self showMap];
    
    
    
    
    [btnInterested addTarget:self action:@selector(yesIamInterestedClickInMapScreen) forControlEvents:UIControlEventTouchUpInside];

    
    [btnNotInterested addTarget:self action:@selector(noIamNotInterestedClickInMapScreen) forControlEvents:UIControlEventTouchUpInside];

}

-(void)yesIamInterestedClickInMapScreen
{
    
    //[FTIndicator showSuccessWithMessage:@"Your req has been sent."];
    
}

-(void)noIamNotInterestedClickInMapScreen
{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sure ?"
                                          
                                                                             message:@"This event will never visible in your events."
                                          
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                               
                                                       style:UIAlertActionStyleDestructive
                               
                                                     handler:nil];
    
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"Cancel"
                               
                                                       style:UIAlertActionStyleDefault
                               
                                                         handler:nil];
    
    
    
    [alertController addAction:actionOk];
    [alertController addAction:actionCancel];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

-(void)backClickFromMap
{
    //DgoBack
}

-(void)showMap
{
    
    if(IS_OS_8_OR_LATER)
    {
        [self.locationManager requestAlwaysAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
    
//    float strlatitude = [[_dict objectForKey:@"latitude"] floatValue];
//    float strlongitude = [[_dict objectForKey:@"longitude"] floatValue];

    
    
//MY CURRENT LOCATION
    CLLocationCoordinate2D coordinate = [self getLocation];
    
    NSString *myLatitude = [NSString stringWithFormat:@"%f", coordinate.latitude];
    NSString *myLongitude = [NSString stringWithFormat:@"%f", coordinate.longitude];
    
    NSLog(@"*dLatitude : %@", myLatitude);
    NSLog(@"*dLongitude : %@",myLongitude);
    
    
    
    
    
//destination location
    float strlatitude = 15.8700;//19.0760;
    float strlongitude = 100.9925;//72.8777;
 
    
    
    
    
    NSLog(@"Staring Point latitude : %f", strlatitude);
    NSLog(@"Staring Point longitude: %f", strlongitude);
    
    
    
    
    
    
    
    CLLocation *currentlocation = [[CLLocation alloc] initWithLatitude:[myLatitude doubleValue]  longitude:[myLongitude doubleValue]];
    CLLocation *destination = [[CLLocation alloc] initWithLatitude:strlatitude longitude:strlongitude];
    CLLocationDistance meters = [currentlocation distanceFromLocation:destination];
    CLLocationDistance kilometers = meters / 1000.0;
    int num=kilometers;
    
    lblTotalDistance.text=[NSString stringWithFormat:@"This event is %d km away from you.",num];
    lblTotalDistance.numberOfLines=0;
    
    
//polyline
    CLLocationCoordinate2D coordinateArray[2];
    coordinateArray[0] = CLLocationCoordinate2DMake([myLatitude doubleValue], [myLongitude doubleValue]);
    coordinateArray[1] = CLLocationCoordinate2DMake(strlatitude, strlongitude);
    
    
    self.routeLine = [MKPolyline polylineWithCoordinates:coordinateArray count:2];
    [self.mapView setVisibleMapRect:[self.routeLine boundingMapRect]]; //If you want the route to be visible
    
    [self.mapView addOverlay:self.routeLine];
    
    
    
    
    
    
    
 
    
    
    
//zoom
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    CLLocationCoordinate2D location;
    location.latitude = strlatitude;
    location.longitude = strlongitude;
    region.span = span;
    region.center = location;
    [_mapView setRegion:region animated:YES];
 
    
    
    
    MyAnnotation *ann = [[MyAnnotation alloc] init];
    ann.title=@"Dishant";
    ann.coordinate = region.center;
    [_mapView addAnnotation:ann];
    
}


#pragma mark - polyline method
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView
            rendererForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    renderer.strokeColor = Black;
    renderer.lineWidth = 2.0;
    return renderer;
}



-(CLLocationCoordinate2D) getLocation
{
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    CLLocation *location = [locationManager location];
    CLLocationCoordinate2D coordinate = [location coordinate];
    
    return coordinate;
}




- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    // MKAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"loc"];
    
    MKPinAnnotationView* annotationView = [[MKPinAnnotationView alloc]
                                           initWithAnnotation:annotation reuseIdentifier:@"loc"];
    annotationView.animatesDrop = YES;
    
    UIView *leftCAV;// =
    
    if (self.view.frame.size.height==667) {
        
        leftCAV= [[UIView alloc] initWithFrame:CGRectMake(0,0,325,70)];
    }
    else if (self.view.frame.size.height==736){
        leftCAV= [[UIView alloc] initWithFrame:CGRectMake(0,0,425,70)];
    }
    else if (self.view.frame.size.height==1024){
        leftCAV= [[UIView alloc] initWithFrame:CGRectMake(0,0,525,70)];
    }
    else{
        leftCAV= [[UIView alloc] initWithFrame:CGRectMake(0,0,300,70)];
    }
    
    
  
//    NSString *str2 = [_dict objectForKey:@"name"];

//    NSString *str3 = [_dict objectForKey:@"location"];

    
    
    
    
    
    NSString *str2 = @"Dishant";
    
    NSString *str3 = @"India Gate";

    
    
    
    
    NSString *strMessage = [NSString stringWithFormat:@" %@, %@", str2, str3];
    
    UILabel *lbl4;
    if (self.view.frame.size.height==667) {
        
        lbl4= [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 55)];
    }
    else if (self.view.frame.size.height==736){
        lbl4= [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 330, 55)];
    }
    else if (self.view.frame.size.height==1024){
        lbl4= [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 350, 55)];
    }
    else{
        lbl4= [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 45)];
    }
    
    
    lbl4.backgroundColor = [UIColor clearColor];
    lbl4.numberOfLines =0;
    lbl4.text = strMessage;
    lbl4.textAlignment = NSTextAlignmentCenter;
    lbl4.textColor = [UIColor blackColor];
    lbl4.backgroundColor = [UIColor whiteColor];
    lbl4.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0];
    [leftCAV addSubview : lbl4];
    annotationView.leftCalloutAccessoryView = leftCAV;
    annotationView.canShowCallout = YES;
    
    return annotationView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
