//
//  ColdCaseDetailViewController.m
//  OWL
//
//  Created by santosh kumar singh on 30/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "ColdCaseDetailViewController.h"

@interface ColdCaseDetailViewController ()
{
    //NSDictionary *dictToGetMissingChildDetails;
    NSArray *imageArray;
}
@end

@implementation ColdCaseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backFromMissingDetails)];
    
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //dictToGetMissingChildDetails = [userDefaults objectForKey:@"keyTransferMissingChildPerson"];
    [self allDataFromServer];
    // Do any additional setup after loading the view.
}
-(void)backFromMissingDetails
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)allDataFromServer{
    
    contentTextView.text = [NSString stringWithFormat:@"%@",[self.coldCaseDataDict objectForKey:@"content"]];
//    [btnDelete setTitle:[NSString stringWithFormat:@"Delete - %@ %@",[dictToGetMissingChildDetails objectForKey:@"first_name"],[dictToGetMissingChildDetails objectForKey:@"last_name"]] forState:UIControlStateNormal];
//    [btnDelete addTarget:self action:@selector(areYourSureAlert) forControlEvents:UIControlEventTouchUpInside];
    
    lblFirstName.text=[NSString stringWithFormat:@"%@",[self.coldCaseDataDict objectForKey:@"name"]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *startD = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",[self.coldCaseDataDict objectForKey:@"year"]]];
    NSDate *endD = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:unitFlags fromDate:startD toDate:endD options:0];
    
    NSInteger year  = [components year];
    NSInteger month  = [components month];
    NSInteger day  = [components day];
    
    lblAgeAndGender.text=[NSString stringWithFormat:@"Age : %ldY - %ldM  | Gender:%@",(long)year,(long)month,[self.coldCaseDataDict objectForKey:@"gender"]];
    
    if (iPhoneVersion==5)
    {
        lblAgeAndGender.font=ml14;
    }
    else
    {
        lblAgeAndGender.font=ml16;
    }
    
   // lblDateOfDisapeance.text=[NSString stringWithFormat:@"%@",[dictToGetMissingChildDetails objectForKey:@"date_of_disappearance"]];
    
    [imgProfile sd_setImageWithURL:[self.coldCaseDataDict objectForKey:@"image_1"]
                  placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
    
    imgProfile.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] init];
    
    [tapRecognizer addTarget:self action:@selector(bigButtonTapped:)];
    [imgProfile addGestureRecognizer:tapRecognizer];
    [imgProfile setAccessibilityLabel:@"OWL"];
    imgProfile.layer.cornerRadius = 40.0f;
    imgProfile.clipsToBounds=YES;
    
    imageArray = [self.coldCaseDataDict objectForKey:@"image"];
}

- (void)bigButtonTapped:(id)sender
{
        // Create image info
        JTSImageInfo *imageInfo = [[JTSImageInfo alloc] init];
#if TRY_AN_ANIMATED_GIF == 1
        imageInfo.imageURL = [NSURL URLWithString:@"http://media.giphy.com/media/O3QpFiN97YjJu/giphy.gif"];
#else
        imageInfo.image = imgProfile.image;
#endif
        imageInfo.referenceRect = imgProfile.frame;
        imageInfo.referenceView = imgProfile.superview;
        imageInfo.referenceContentMode = imgProfile.contentMode;
        imageInfo.referenceCornerRadius = imgProfile.layer.cornerRadius;
        
        // Setup view controller
        JTSImageViewController *imageViewer = [[JTSImageViewController alloc]
                                               initWithImageInfo:imageInfo
                                               mode:JTSImageViewControllerMode_Image
                                               backgroundStyle:JTSImageViewControllerBackgroundOption_Scaled];
        
        [imageViewer showFromViewController:self transition:JTSImageViewControllerTransition_FromOriginalPosition];
}

-(IBAction)hitContactUsNow:(id)sender
{
    
}


#pragma mark - collection view
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return  imageArray.count;
}

- (NSIndexPath *)indexPathForRowAtPoint:(CGPoint)point
{
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PickPhotoFromAppCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pickPhotoFromAppCollectionCell" forIndexPath:indexPath];
    
    cell.backgroundColor=Clear;
    
    NSString *dictToShowPhotoListing;
    
    dictToShowPhotoListing =[imageArray objectAtIndex:indexPath.row];

//    NSString *strURL = [dictToShowPhotoListing objectForKey:@"image"];

    [cell.imgUsername sd_setImageWithURL:[[NSURL alloc]initWithString:dictToShowPhotoListing] placeholderImage:[UIImage imageNamed:@"logo"]];
    cell.imgUsername.tag = indexPath.row;
 
    cell.imgUsername.layer.cornerRadius=8;
    cell.imgUsername.clipsToBounds=YES;
    
    cell.imgUsername.tag=indexPath.row;
    
    cell.btnSelectUnselect.backgroundColor=Clear;;
    cell.btnSelectUnselect.tintColor=Red;
    
    cell.btnSelectUnselect.tag=indexPath.row;
    //[cell.btnSelectUnselect addTarget:self action:@selector(selectUnsselectMethod:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    return cell;
}

@end
