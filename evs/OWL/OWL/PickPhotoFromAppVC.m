//
//  PickPhotoFromAppVC.m
//  OWL
//
//  Created by Apple on 9/13/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "PickPhotoFromAppVC.h"

@interface PickPhotoFromAppVC ()
{
    NSMutableArray *arrMutAllListingofPhotos;
    
    NSMutableArray *arrMutAddSelectImageData;
}
@end

@implementation PickPhotoFromAppVC
@synthesize strAlbumCheckFromEdit;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    arrMutAllListingofPhotos = [[NSMutableArray alloc]init];
    arrMutAddSelectImageData = [[NSMutableArray alloc]init];
    _data = [[NSMutableArray alloc]init];
    
    clViewPickPhoto.delegate=self;
    clViewPickPhoto.dataSource=self;
    
    
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

    
    //[btnDone addTarget:self action:@selector(donePageMethod) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *rightt=[[UIBarButtonItem alloc]initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(closeClickMethod)];
    
    self.navigationItem.leftBarButtonItem=rightt;
    
    UIBarButtonItem *leftt=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(doneeClickMethod)];
    
    self.navigationItem.rightBarButtonItem=leftt;
    
    [self listingofAllPhotos];
}

-(void)closeClickMethod
{
    goBackDR

}

-(void)doneeClickMethod
{
    if (arrMutAddSelectImageData.count == 0)
    {
        [Alert svError:@"Please select an image"];
    }
    else
    {
        [self passDataBack];
    }
}

- (void)passDataBack
{
    if ([_delegate respondsToSelector:@selector(dataFromController:)])
    {
        [_delegate dataFromController:arrMutAddSelectImageData];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - collection view
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return  arrMutAllListingofPhotos.count;
}

- (NSIndexPath *)indexPathForRowAtPoint:(CGPoint)point
{
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PickPhotoFromAppCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pickPhotoFromAppCollectionCell" forIndexPath:indexPath];
    
    cell.backgroundColor=Clear;
    
    NSDictionary *dictToShowPhotoListing;
    
    dictToShowPhotoListing =[arrMutAllListingofPhotos objectAtIndex:indexPath.row];

    NSString *strURL = [dictToShowPhotoListing objectForKey:@"image"];

    [cell.imgUsername sd_setImageWithURL:[[NSURL alloc]initWithString:strURL] placeholderImage:[UIImage imageNamed:@"logo"]];
    cell.imgUsername.tag = indexPath.row;
 
    cell.imgUsername.layer.cornerRadius=8;
    cell.imgUsername.clipsToBounds=YES;
    
    cell.imgUsername.tag=indexPath.row;
    
    cell.btnSelectUnselect.backgroundColor=Clear;;
    cell.btnSelectUnselect.tintColor=Red;
    
    cell.btnSelectUnselect.tag=indexPath.row;
    [cell.btnSelectUnselect addTarget:self action:@selector(selectUnsselectMethod:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    return cell;
}

-(void)selectUnsselectMethod:(id)sender
{
    UIButton *btnS=sender;
    
    NSLog(@"tag====%ld",(long)btnS.tag);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    arrMutAddSelectImageData = [[NSMutableArray alloc]init];
    [arrMutAddSelectImageData addObject:[[arrMutAllListingofPhotos objectAtIndex:indexPath.row] objectForKey:@"image"]];
    
    [collectionView cellForItemAtIndexPath:indexPath].backgroundColor = Red;
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 20, 10, 20); // top, left, bottom, right
}

#pragma mark - webservice
-(void)listingofAllPhotos
{
    [SVProgressHUD showWithStatus:pleaseWait maskType:SVProgressHUDMaskTypeBlack];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
    NSDictionary *dictLoginDataOfUser = [defaults objectForKey:@"keyAllDataOfLoginUserOWL"];
    
    NSDictionary *parameters = @{
                                 @"action": @"gallery",
                                 @"userId": [dictLoginDataOfUser objectForKey:@"id"],
                                 @"page": @""
                                 };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:BaseURLOfOWL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog(@"operation=====%@",operation);
        NSDictionary *dictOfMessage=responseObject;
        
        if ([[dictOfMessage objectForKey:@"status"]isEqualToString:@"Success"])
        {
            [SVProgressHUD dismiss];
            arrMutAllListingofPhotos=[dictOfMessage objectForKey:@"response"];
            
            
            
            if (arrMutAllListingofPhotos.count == 0)
            {
                [self popUpToGoBack];;
            }
            else
            {
              [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                [clViewPickPhoto reloadData];
            }
            
            
            [clViewPickPhoto reloadData];
            
        }
        else
        {
            NSLog(@"nopes");
            [SVProgressHUD dismiss];
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            
        }
    }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"operation=====%@",operation);
         NSLog(@"failure ERROR===%@",error.description);
         [SVProgressHUD showErrorWithStatus:InternalError];
         [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
         
     }];
}

-(void)popUpToGoBack
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Oops"
                                          
                                                                             message:@"No Image Found."
                                          
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    //We add buttons to the alert controller by creating UIAlertActions:
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                               
                                                       style:UIAlertActionStyleDefault
                               
                                                     handler:^(UIAlertAction *Action){
                                                         [self.navigationController popViewControllerAnimated:YES];
                                                     }]; //You can use a block	 here to handle a press on this button
    
    [alertController addAction:actionOk];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
