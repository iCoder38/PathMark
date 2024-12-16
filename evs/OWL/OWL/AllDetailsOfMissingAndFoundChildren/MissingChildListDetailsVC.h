//
//  MissingChildListDetailsVC.h
//  OWL
//
//  Created by Apple on 7/26/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MyAnnotation.h"

@protocol backFromSeeAllUserDelegate <NSObject>
@required
- (void)checkForBack:(NSString *)data;
@end

@interface MissingChildListDetailsVC : UIViewController
<
UIScrollViewDelegate,
CLLocationManagerDelegate,
MKMapViewDelegate,
UIGestureRecognizerDelegate,
UITableViewDelegate,
UITableViewDataSource
>
{
    IBOutlet UIScrollView *ScrollVieww;
    
    IBOutlet UIView *ContentVieww;
    
    IBOutlet UIImageView *imgProfile;
    
    IBOutlet UILabel *lblFirstName;
    IBOutlet UILabel *lblMotherName;
    IBOutlet UILabel *lblAddress;
    IBOutlet UILabel *lblParentsNumer;
    IBOutlet UILabel *lblIdenficationMark;
    IBOutlet UILabel *lblHeightAndWeight;
    IBOutlet UILabel *lblDateOfBirth;
    IBOutlet UILabel *lblDateOfDisapeance;
    IBOutlet UILabel *lblAgeAndGender;
    
    IBOutlet UIButton *btnDelete;
    IBOutlet UIButton *btnPrice;
    IBOutlet UIButton *btnPleaseHelpMeToFindAchild;
    
    IBOutlet UITableView *tbleView;
}
@property(nonatomic,strong) NSString *strCheckForDelete;
@property (nonatomic, weak) id<backFromSeeAllUserDelegate> delegate;

@property (nonatomic,strong) NSString *strCheckFoundOrMissing;
@property(nonatomic, weak) IBOutlet MKMapView* mapView;
@property (nonatomic, strong) locationBlock _locationBlock;
@property (nonatomic,copy)CLLocationManager *locationManager;
@property (nonatomic)CLLocationCoordinate2D coordinate;
@property (nonatomic,strong) NSString *current_Lat;
@property (nonatomic,strong) NSString *current_Long;

@property(strong,nonatomic) NSDictionary *dictGetMissingAndFoundChild;


@end
