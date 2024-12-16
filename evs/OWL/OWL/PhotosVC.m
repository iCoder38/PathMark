//
//  PhotosVC.m
//  Pludin
//
//  Created by Apple on 12/29/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "PhotosVC.h"
#import <SYPhotoBrowser/SYPhotoBrowser.h>
#import "ImageCropView.h"
#define VIEW_FOR_ZOOM_TAG (1)


@interface PhotosVC ()<ImageCropViewControllerDelegate>
{
    UIButton *btnSearch;
    
    NSString *searchTextString;
    NSMutableArray *searchArray;
    BOOL isFilter;
    
    int pageScroll;
    
    UIView *imgEnlargerView;
    UIButton *btnCloseFullIMageView;
    UIScrollView *ScrolViewwView;
    UIImageView *imgShowView;
    
    NSData *imageData;
    UIImage *image ;
    
    NSMutableArray*arrImage, *arrName;
    NSData *dataImg;
    NSMutableArray *arrImageData;
    NSDictionary*dict;
    NSMutableArray *moveArray;
    
    NSMutableArray *arrPhotoListing;
    NSArray *arrStoreData;
    
    int page;
    int totalPages;
    
    
}
@end

@implementation PhotosVC
@synthesize strFetchBackOrMenu;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    arrImage=[[NSMutableArray alloc]initWithCapacity:0];
    arrName=[[NSMutableArray alloc]initWithCapacity:0];
    arrImageData=[[NSMutableArray alloc]initWithCapacity:0];
    moveArray=[[NSMutableArray alloc]initWithCapacity:0];
    
    page =0;
    
    
    self.navigationController.navigationBarHidden=TRUE;
    
    arrPhotoListing = [[NSMutableArray alloc]initWithCapacity:0];
    
    //collection view
    [self collectionViewPhotosClick];
    
    
    
    
    //text field
    [self textFieldMethods];
    
    //button
    [self buttonPhotoMethods];
    
    //search
    [self searchPhotos];
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    
    [self performSelector:@selector(photosListWebservicez) withObject:nil afterDelay:0.0f];
    [SVProgressHUD setFont:ml14];
    [SVProgressHUD showWithStatus:@"Fetching Photos..."];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    
    
    
    
    
    if ([strFetchBackOrMenu isEqualToString:@"abcdefgh"])
    {
        [btnMenu setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [btnMenu addTarget:self action:@selector(backBarFunctionClickwe) forControlEvents:UIControlEventTouchUpInside];

    }
    else
    {

        [btnMenu setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
        [btnMenu addTarget:self action:@selector(leftBarFunctionClickwe) forControlEvents:UIControlEventTouchUpInside];

    }
    
    
}

-(void)backBarFunctionClickwe
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)leftBarFunctionClickwe
{
    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];
    
    
}

-(void)searchPhotos
{
    btnSearch=[UIButton buttonWithType:UIButtonTypeCustom];
    
    btnSearch.frame=CGRectMake(kSCREEN_WIDTH-50, 5, 30, 30);
    
    [btnSearch setBackgroundImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    
    [btnSearch addTarget:self action:@selector(searchActionClick) forControlEvents:UIControlEventTouchUpInside];
    
    // [viewwBGG addSubview:btnSearch];
}
-(void)searchActionClick
{
    
    if (btnSearch.tag==0)
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        collectionVieww.frame=CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+110, self.view.frame.size.width, self.view.frame.size.height-110);
        [UIView commitAnimations];
        
        btnSearch.tag=1;
        
    }
    
    else if(btnSearch.tag==1)
        
    {
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        collectionVieww.frame=CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+63, self.view.frame.size.width, self.view.frame.size.height-63);
        [UIView commitAnimations];
        
        btnSearch.tag=0;
    }
    
}

-(void)buttonPhotoMethods
{
    btnUploadMorePhotoButton.backgroundColor=[UIColor colorWithRed:244.0/255.0 green:0.0/255.0 blue:84.0/255.0 alpha:1];
    
    btnUploadMorePhotoButton.layer.cornerRadius=4;
    btnUploadMorePhotoButton.clipsToBounds=YES;
    
}

-(void)textFieldMethods

{
    txtSearchBar.backgroundColor=White;
    txtSearchBar.layer.cornerRadius=4;
    txtSearchBar.clipsToBounds=YES;
    txtSearchBar.delegate=self;
    
    [Alert textFieldplaceholder:txtSearchBar placeholder:@"Search Photos here..." color:LightGray font:ml14];
    [Alert setLeftPaddingTextField:txtSearchBar paddingValue:20];
    [txtSearchBar addTarget:self action:@selector(textFieldDidChangePhotos:) forControlEvents:UIControlEventEditingChanged];
    
}

 -(void)collectionViewPhotosClick
{
    collectionVieww.delegate=self;
    collectionVieww.dataSource=self;
    collectionVieww.backgroundColor=White;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return arrPhotoListing.count + 1;
}

- (NSIndexPath *)indexPathForRowAtPoint:(CGPoint)point
{
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotosCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photosCell" forIndexPath:indexPath];
    
    cell.backgroundColor=Clear;
    
    
    
        NSDictionary *dictToShowPhotoListing;
    

    if (arrPhotoListing.count == 0)
    {
        cell.imgView.image=[UIImage imageNamed:@"plusG"];
        [cell.btnDelete setHidden:true];

        return cell;
    }
    
    if (indexPath.row == arrPhotoListing.count)
    {
        
        [cell.btnDelete setHidden:true];

        cell.imgView.image=[UIImage imageNamed:@"plusG"];
//        cell.btnDelete.hidden=YES;
        
        
        return cell;
    }
    
    
        
        dictToShowPhotoListing =[arrPhotoListing objectAtIndex:indexPath.row];
        
        NSString *strURL = [dictToShowPhotoListing objectForKey:@"image"];
    
    
    
    /*  created = 1502458068;
     galleryId = 171;
     image = "http://demo.evirtualservices.com/OWL/site//img/gallery/1502458068image.jpg";*/
    
    
    
        [cell.imgView sd_setImageWithURL:[[NSURL alloc]initWithString:strURL] placeholderImage:[UIImage imageNamed:@"logo"]];
        cell.imgView.tag = indexPath.row;
        
    
    
    cell.imgView.layer.cornerRadius=8;
    cell.imgView.clipsToBounds=YES;
    if(indexPath.row < arrPhotoListing.count)
    {
    cell.btnDelete.tag=indexPath.row;
    
    cell.btnDelete.backgroundColor=Clear;
    cell.btnDelete.tintColor=Red;
    

    
    [cell.btnDelete setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    cell.btnDelete.backgroundColor=Red;
    cell.btnDelete.tintColor=Red;
    cell.btnDelete.layer.cornerRadius=10;
    cell.btnDelete.clipsToBounds=YES;
    [cell.btnDelete addTarget:self action:@selector(deletePhotoClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btnDelete setHidden:false];

    }
  
    return cell;
}

-(IBAction)deletePhotoClick : (id)sender
{
    UIButton *btn=sender;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert!"
                                          
                                                                             message:@"Are you sure you want to delete?"
                                          
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Delete"
                               
                                                       style:UIAlertActionStyleDestructive
                               
                                                     handler:^(UIAlertAction *alert)
                               {
                                   
                                   [self deletePhotoFromServer:btn.tag];
                                   
                                   
                               }];
    
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"Cancel"
                               
                                                       style:UIAlertActionStyleDefault
                               
                                                     handler:^(UIAlertAction *alert)
                               {
                                   
                                   
                                   
                                   
                               }];
    
    [alertController addAction:actionCancel];
    [alertController addAction:actionOk];
    
    [self presentViewController:alertController animated:YES completion:nil];

    
}

-(void)deletePhotoFromServer:(NSInteger)tag
{
    [SVProgressHUD setFont:ml14];
    [SVProgressHUD showWithStatus:@"Deleting..."];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    NSDictionary *dictDelPhotoData=[arrPhotoListing objectAtIndex:tag];
    NSLog(@"dictDelPhotoData====%@",dictDelPhotoData);
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];

    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters = @{
                                 @"action": @"deletegallery",
                                 @"galleryId":[dictDelPhotoData objectForKey:@"galleryId"],
                                 @"userId" : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]]
                                 };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:BaseURLOfOWL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"operation===%@",operation);
         NSDictionary *dictOfLogin=responseObject;
         
         
         if ([[dictOfLogin objectForKey:@"status"]isEqualToString:@"Success"])
         {
             
             NSLog(@"done");
             
             NSLog(@"dictOfMessage====%@",dictOfLogin);
             
             [self performSelector:@selector(photosListWebservicez) withObject:nil afterDelay:0.0f];
         }
         else
         {
             
             NSLog(@"nopes");
             
             [SVProgressHUD showErrorWithStatus:somethingIssue];
             
         }
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"operation===%@",operation);
         NSLog(@"failure ERROR===%@",error.description);
         [SVProgressHUD showErrorWithStatus:InternalError];
         
     }];
    
}

//delete all photos
-(void)deleteAllPhotosFromServer
{
    
    [SVProgressHUD setFont:ml14];
    [SVProgressHUD showWithStatus:@"Deleting..."];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
    NSDictionary *dictLoginDataOfUser = [defaults objectForKey:@"keyPludin"];
    
    NSDictionary *parameters = @{
                                 @"action": @"deletegalleryAll",
                                 @"userId": [dictLoginDataOfUser objectForKey:@"id"],
                                 @"type": [NSNumber numberWithBool:1],
                                 
                                 };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:BaseURLOfOWL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject){
         NSDictionary *dictDeletePhotos=responseObject;
        
        
        if ([[dictDeletePhotos objectForKey:@"status"]isEqualToString:@"Success"])
        {
            

            NSLog(@"dictDeletePhotos====%@",dictDeletePhotos);
            
            [self performSelector:@selector(photosListWebservicez) withObject:nil afterDelay:0.0f];
            
        }
        else
        {
            [SVProgressHUD showErrorWithStatus:@"Old password is not correct."];
        }
    }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"operation===%@",operation);
         NSLog(@"failure ERROR===%@",error.description);
         [SVProgressHUD showErrorWithStatus:InternalError];
         
     }];
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (arrPhotoListing.count == 0)
    {
        
        [self uploadImageButtonClick];
        
        return;
        
    }
    
    if (indexPath.row == arrPhotoListing.count)
    {
        [self uploadImageButtonClick];
        
        return;
        
    }
    
    [self openImages:indexPath];
    
}

-(void)openImages:(NSIndexPath *)indexPath
{
    NSMutableArray *urlArray = [[NSMutableArray alloc]init];
    
       for (int i=0; i<arrPhotoListing.count; i++) {
           NSString *strImage  =[NSString stringWithFormat:@"%@", [[arrPhotoListing objectAtIndex:i] objectForKey:@"image"]];
           NSLog(@"strImage===%@",strImage );
           
           NSString *strURL=[strImage stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
           
           NSURL* urlAddress1 = [[NSURL alloc] initWithString:strURL];
           [urlArray addObject:urlAddress1];
           
       }
    
    
    SYPhotoBrowser *photoBrowser = [[SYPhotoBrowser alloc] initWithImageSourceArray:urlArray caption:@"" delegate:self];
    photoBrowser.initialPageIndex = indexPath.row;
    photoBrowser.pageControlStyle = SYPhotoBrowserPageControlStyleLabel;
    [self presentViewController:photoBrowser animated:YES completion:nil];
}

- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"gestureRecognizer===%@",gestureRecognizer);
    if (btnCloseFullIMageView.hidden == TRUE)
    {
        
        btnCloseFullIMageView.hidden = FALSE;
        
//        UIView *addStatusBar = [[UIView alloc] init];
//        addStatusBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 20);
//        addStatusBar.backgroundColor = navColor;
//        [self.view addSubview:addStatusBar];
    }
    else
    {
        btnCloseFullIMageView.hidden = TRUE;
        UIView *addStatusBar = [[UIView alloc] init];
        addStatusBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 20);
        addStatusBar.backgroundColor = Black;
        [self.view addSubview:addStatusBar];
    }
}

-(void)openImageOnFullView:(NSIndexPath *)indexPath
{
    ScrolViewwView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0, kSCREEN_WIDTH, kSCREEN_HEIGHT)];
    
    ScrolViewwView.pagingEnabled=YES;
    ScrolViewwView.delegate=self;
    
    
    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [ScrolViewwView addGestureRecognizer:gr];
    
    int x=0;
    
    CGRect innerScrollFrame = ScrolViewwView.bounds;
    
    for (int i=0; i<arrPhotoListing.count; i++) {
        
        imgShowView=[[UIImageView alloc]initWithFrame:CGRectMake(x, 60, kSCREEN_WIDTH,kSCREEN_HEIGHT-90)];
        
        NSString *strImage  =[NSString stringWithFormat:@"%@", [[arrPhotoListing objectAtIndex:i] objectForKey:@"image"]];
        NSLog(@"strImage===%@",strImage );
        
        NSString *strURL=[strImage stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
        NSURL* urlAddress1 = [[NSURL alloc] initWithString:strURL];
        
        [imgShowView  sd_setImageWithURL:urlAddress1 placeholderImage:[UIImage imageNamed:@""]];
        
        imgShowView.contentMode = UIViewContentModeScaleAspectFit;
        
        imgShowView.tag = VIEW_FOR_ZOOM_TAG;
        
        UIScrollView *pageScrollView = [[UIScrollView alloc]
                                        initWithFrame:innerScrollFrame];
        pageScrollView.minimumZoomScale = 1.0f;
        pageScrollView.maximumZoomScale = 6.0f;
        pageScrollView.zoomScale = 1.0f;
        pageScrollView.contentSize = imgShowView.bounds.size;
        pageScrollView.delegate = self;
        pageScrollView.showsHorizontalScrollIndicator = NO;
        pageScrollView.showsVerticalScrollIndicator = NO;
        [pageScrollView addSubview:imgShowView];
        [ScrolViewwView addSubview:imgShowView];
        
        x=x+kSCREEN_WIDTH;
        
        if (i < 2)
        {
            innerScrollFrame.origin.x += innerScrollFrame.size.width;
        }
        
    }
    
    float sizeOfContent = 0;
    UIView *lLast = [ScrolViewwView.subviews lastObject];
    NSInteger wd = lLast.frame.origin.y;
    NSInteger ht = lLast.frame.size.height;
    
    sizeOfContent = wd+ht;
    
    ScrolViewwView.contentSize = CGSizeMake(x, ScrolViewwView.frame.size.height );
    
    ScrolViewwView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:ScrolViewwView];
    
    
    [ScrolViewwView setContentOffset:CGPointMake(ScrolViewwView.frame.size.width*indexPath.row, 0.0f) animated:NO];
    
    
    btnCloseFullIMageView = [[UIButton alloc]initWithFrame:CGRectMake(kSCREEN_WIDTH-80, 75, 70, 25)];
    [btnCloseFullIMageView setTitle:@"Close" forState:UIControlStateNormal];
    [btnCloseFullIMageView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnCloseFullIMageView.backgroundColor = [UIColor blackColor];
    btnCloseFullIMageView.layer.borderColor = [UIColor whiteColor].CGColor;
    btnCloseFullIMageView.layer.borderWidth = 0.5;
    btnCloseFullIMageView.layer.cornerRadius = 3.0;
    btnCloseFullIMageView.clipsToBounds = TRUE;
    
    [btnCloseFullIMageView addTarget:self action:@selector(closeFullImageView:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnCloseFullIMageView];
    
    
}

-(IBAction)closeFullImageView:(id)sender
{
    NSLog(@"sender===%@",sender);
    ScrolViewwView.frame = CGRectMake(0, 0, 0, 0);
    btnCloseFullIMageView.frame = CGRectMake(0, 0, 0, 0);
    
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView1
{
    pageScroll = scrollView1.contentOffset.x / scrollView1.frame.size.width;
}


-(void)closeImgEnlargerImage
{
    
    self.navigationController.navigationBarHidden=TRUE;
    imgEnlargerView.hidden=YES;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
 
    return 10.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{

    return 10.0;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"textField===%@",textField);
    [self.view endEditing:YES];
    return YES;
}


- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20,20,20,20);
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"PHOTO GALLERY"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(lefttBarButtonClickMethod)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    
    //[self dashboardClick];
    
}

-(void)lefttBarButtonClickMethod
{
    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];
}



-(void)photosListWebservicez
{
    // page++;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
    NSDictionary *dictLoginDataOfUser = [defaults objectForKey:@"keyAllDataOfLoginUserOWL"];
    
    NSDictionary *parameters = @{
                                 @"action": @"gallery",
                                 @"userId": [dictLoginDataOfUser objectForKey:@"id"],
                                 @"page": @""
                                 };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:BaseURLOfOWL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject){
        NSLog(@"operation=====%@",operation);
        NSDictionary *dictOfMessage=responseObject;
        
        //status = Success;
        
        if ([[dictOfMessage objectForKey:@"status"]isEqualToString:@"Success"])
        {
            
        
            
            NSLog(@"done");
            
            
            
            NSLog(@"dictOfMessage====%@",dictOfMessage);
             
            
            lblNavigation.text=[NSString stringWithFormat:@"PHOTOS(%@)",[dictOfMessage objectForKey:@"countImage"]];
            
            arrPhotoListing = [dictOfMessage objectForKey:@"response"];
            
            
            
            [collectionVieww reloadData];
            
            [SVProgressHUD dismiss];
            
        }
        else
        {
            NSLog(@"nopes");
            [SVProgressHUD dismiss];
            
        }
    }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"operation=====%@",operation);
         NSLog(@"failure ERROR===%@",error.description);
         [SVProgressHUD showErrorWithStatus:InternalError];
         
     }];
}

-(void)textFieldDidChangePhotos:(UITextField*)textField
{
    searchTextString = textField.text;
    
    [self updateSearchArray:searchTextString];
}

-(void)updateSearchArray:(NSString *)searchText

{
    
    if (searchText.length > 0)
    {
        isFilter=YES;
        
        searchArray = [NSMutableArray array];
        searchText = [NSString stringWithFormat:@"%@",searchText];
        
        for ( NSDictionary* item in arrPhotoListing )
        {
            //NSLog(@"contacts ----->%@",[item objectForKey:@"city"]);
            
            if ([[[item objectForKey:@"name"] lowercaseString] rangeOfString:[searchText lowercaseString]].location != NSNotFound)
            {
                
                [searchArray addObject:item];
            }
        }
        
    }
    
    if (!searchText || searchText.length == 0)
    {
        isFilter=NO;
        searchArray = [arrPhotoListing mutableCopy];
    }
    else
    {
        if ([searchArray count] == 0)
        {
            [SVProgressHUD showErrorWithStatus:@"No Photo found"];
        }
    }
    // NSLog(@"search array ====>%@",searchArray);
    [collectionVieww reloadData];
    
}
-(void)uploadImageButtonClick
{
     [self performSelector:@selector(actionSheetForCameraAndGalleryClick:) withObject:nil afterDelay:0.0f];
}
-(IBAction)actionSheetForCameraAndGalleryClick:(id)sender
{
    NSLog(@"sender=====%@",sender);
    UIAlertController*alertAction=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action1=[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                            {
                                NSLog(@"action=====%@",action);
                                [self Open_Camera];
                            }];
    
    
    UIAlertAction *actioncam=[UIAlertAction actionWithTitle:@"Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                              {
                                  NSLog(@"action=====%@",action);
                                  [self DR_Open_Library];
                              }];
    
    
    
    UIAlertAction *cancelAlert=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                {
                                    NSLog(@"action=====%@",action);
                                    
                                    [self dismissViewControllerAnimated:YES completion:nil];
                                }];
    
    
    
    
    
    [alertAction addAction:action1];
    [alertAction addAction:actioncam];
    [alertAction addAction:cancelAlert];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        
        
        // iPad support
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
        {
            UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:alertAction];
            CGRect popoverRect = CGRectMake(10, 10, self.view.frame.size.width, 200);
            [popover presentPopoverFromRect:popoverRect inView:btnUploadMorePhotoButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
            
            
            
        }
    }
    else
    {
        [self presentViewController:alertAction animated:YES completion:nil];
    }
    
}
-(void)Open_Camera{
    
#if TARGET_IPHONE_SIMULATOR
    
    NSLog(@"No Camera is set up in Simulator");
    
#else
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:NULL];
    
#endif
    
}


-(void)DR_Open_Library
{
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate=self;
    imagePicker.navigationBar.tintColor=[UIColor blackColor];
    imagePicker.allowsEditing = NO;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
    else{
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

-(void)selectphoto{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert!"
                                          
                                                                             message:@"Do you want to crop the Image?"
                                          
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Yes"
                               
                                                       style:UIAlertActionStyleDestructive
                               
                                                     handler:^(UIAlertAction *alert)
                               {

                                   [self cropImage:chosenImage];
                                   
                                   
                               }];
    
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"No"
                                   
                                                           style:UIAlertActionStyleDefault
                                   
                                                         handler:^(UIAlertAction *alert)
                                   {
                                       
                                       [arrImage addObject:chosenImage];
                                       [moveArray addObject:chosenImage];
                                       
                                       dataImg=[self compressImage:chosenImage];
                                       
                                       [arrImageData addObject:dataImg];
                                       
                                       
                                       [picker dismissViewControllerAnimated:YES completion:NULL];
                                       
                                       
                                       [self objectuplaod];
                                       
                                       
                                   }];
    
    [alertController addAction:actionCancel];
    [alertController addAction:actionOk];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    
    
    //     dispatch_async(dispatch_get_main_queue(),^{
    //
    //
    //         [self performSelector:@selector(objectuplaod) withObject:nil afterDelay:1.0];
    //    });
    
    
    
}

- (void)cropImage:(UIImage *)image{
    ImageCropViewController *controller = [[ImageCropViewController alloc] initWithImage:image];
    controller.delegate = self;
    
    [[self navigationController] pushViewController:controller animated:YES];
}
- (void)ImageCropViewControllerSuccess:(UIViewController *)controller didFinishCroppingImage:(UIImage *)croppedImage{
    image = croppedImage;
    [arrImage addObject:image];
    [moveArray addObject:image];
    
    dataImg=[self compressImage:image];
    
    [arrImageData addObject:dataImg];
    
    
    
    
    [self objectuplaod];
    [[self navigationController] popViewControllerAnimated:YES];
}
- (void)ImageCropViewControllerDidCancel:(ImageCropViewController *)controller{
    [[self navigationController] popViewControllerAnimated:YES];
}

-(void)objectuplaod
{
    [SVProgressHUD setFont:ml14];
    [SVProgressHUD showWithStatus:@"Uploading..."];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    dispatch_async(dispatch_get_main_queue(),^
                   {
                       [self performSelector:@selector(uploadPhotoFromGallery) withObject:nil afterDelay:1.0];
                       
                   });
    
    //    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
    //     dispatch_async(dispatch_get_main_queue(), ^{
    //
    //     [self uploadPhotoFromGallery];
    //    });
    //    });
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

-(NSData *)compressImage:(UIImage *)image1 {
    
    float actualHeight = image1.size.height;
    float actualWidth = image1.size.width;
    float compressionQuality = 0.5;
    
    CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
    UIGraphicsBeginImageContext(rect.size);
    [image1 drawInRect:rect];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    imageData = UIImageJPEGRepresentation(img, compressionQuality);
    UIGraphicsEndImageContext();
    
    return imageData;
}

//upload photo
-(void)uploadPhotoFromGallery
{
    
    
    
    //login user id
    NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
    NSDictionary *dictLoginDataOfUser = [defaults objectForKey:@"keyAllDataOfLoginUserOWL"];
    /*action: uploadImages
     user_id
     file*/
    NSMutableDictionary* _params = [[NSMutableDictionary alloc] init];
    
    [_params setObject:[dictLoginDataOfUser objectForKey:@"id"]  forKey:@"user_id"];
    
    
    
    
     
    [_params setObject:@"uploadImages"  forKey:@"action"];
    
    NSString *BoundaryConstant = @"----------V2ymHFg03ehbqgZCaKO6jy";
    NSString* FileParamConstant = @"file";
    
    NSURL* requestURL = [NSURL URLWithString:BaseURLOfOWL];
    
    // create request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setHTTPShouldHandleCookies:NO];
    [request setTimeoutInterval:30];
    [request setHTTPMethod:@"POST"];
    
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", BoundaryConstant];
    [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    // post body
    NSMutableData *body = [NSMutableData data];
    
    // add params (all params are strings)
    for (NSString *param in _params)
    {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@\r\n", [_params objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    if (imageData)
    {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.jpg\"\r\n", FileParamConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageData];
        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // setting the body of the post to the reqeust
    [request setHTTPBody:body];
    
    // set the content-length
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[body length]];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    // set URL
    [request setURL:requestURL];
    
    NSURLResponse *response = nil;
    NSError *requestError = nil;
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&requestError];
    
    
    if (requestError == nil)
    {
        
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&requestError];
        
        if ([[json objectForKey:@"status"]isEqualToString:@"Success"])
        {
            
                 NSLog(@"yes=======%@",json);
            
            
            
            [self performSelector:@selector(photosListWebservicez) withObject:nil afterDelay:0.0f];
            
            
            
        }
        
        else
        {
            NSLog(@"no");
            [SVProgressHUD dismiss];
        }
        
    }
}


+(void)addLabelBGTableView:(UITableView *)tableView msg:(NSString*)msg color:(UIColor *)color{
    
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, tableView.bounds.size.height)];
    
    messageLabel.text = msg;
    messageLabel.textColor = color;
    messageLabel.numberOfLines = 0;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.font = [UIFont fontWithName:@"Palatino-Italic" size:18];
    [messageLabel sizeToFit];
    tableView.backgroundView = messageLabel;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

@end
