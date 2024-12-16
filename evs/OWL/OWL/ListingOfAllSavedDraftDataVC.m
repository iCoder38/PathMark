//
//  ListingOfAllSavedDraftDataVC.m
//  OWL
//
//  Created by Apple on 9/13/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "ListingOfAllSavedDraftDataVC.h"

@interface ListingOfAllSavedDraftDataVC ()
{
    NSMutableArray *arrOfListingSaveDraft;
}
@end

@implementation ListingOfAllSavedDraftDataVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *imgBGp=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    if (IS_IPHONE_5_SCREEN)
    {
        imgBGp.image=bgImageFor5;
    }
    else
        if (IS_IPHONE_6_SCREEN)
        {
            imgBGp.image=bgImageFor6;
        }
        else
            if (IS_IPHONE_6Plus_SCREEN)
            {
                imgBGp.image=bgImageFor6plus;
            }
            else
                if (IS_IPAD_iPad_SCREEN)
                {
                    imgBGp.image=bgImageForipad;
                }
    
    imgBGp.alpha=0.60f;
    
    //[self.view insertSubview:imgBGp atIndex:0];

    
    tbleeView.delegate=self;
    tbleeView.dataSource=self;
    tbleeView.backgroundColor = White;
    tbleeView.separatorColor=Black;
    
    [self listingOfAllSaveDraftData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"SAVED DETAILS"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    UIBarButtonItem *rightt=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(backClickMethod)];
    
    self.navigationItem.leftBarButtonItem=rightt;
}

-(void)backClickMethod
{
    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return arrOfListingSaveDraft.count;
    
    if (arrOfListingSaveDraft.count>0)
    {
        tbleeView.backgroundView = nil;
        return arrOfListingSaveDraft.count;
    }
    else
    {
        [Alert addLabelBGTableView:tbleeView msg:@"No data saved" color:Black];
        
        return 0;
    }

    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (kSCREEN_HEIGHT == 1024 || kSCREEN_HEIGHT == 736) {
        
        return 80;
    }
    else{
        return 60;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"listingOfAllSavedTableCell";
    ListingOfAllSavedTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[ListingOfAllSavedTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSDictionary *dictLocalToShowDraftData=[arrOfListingSaveDraft objectAtIndex:indexPath.row];
    
    if ([[dictLocalToShowDraftData objectForKey:@"first_name"] isEqualToString:@""])
    {
        
        cell.lblUsername.font=ms18;
    }
    else
    {
    cell.lblUsername.text=[NSString stringWithFormat:@"%@ %@",[dictLocalToShowDraftData objectForKey:@"first_name"],[dictLocalToShowDraftData objectForKey:@"last_name"]];
    }
    
    cell.lblUsername.textColor=Black;
    
    cell.lblEditedAt.text=[NSString stringWithFormat:@"Last edited : %@",[NSString stringWithFormat:@"%@",[dictLocalToShowDraftData objectForKey:@"created"]]];
    cell.lblEditedAt.font=mr16;
    
    [cell.imgView sd_setImageWithURL:[dictLocalToShowDraftData objectForKey:@"image"] placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
    
//    if (kSCREEN_HEIGHT == 1024 || kSCREEN_HEIGHT == 736) {
//
//         cell.imgView.layer.cornerRadius=20;
//    }
//    else{
        
         cell.imgView.layer.cornerRadius=20;
  //  }
   
    cell.imgView.clipsToBounds=YES;
    
    cell.backgroundColor=Clear;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MakeFullFormOfSavedDetailsVC *makee=[self.storyboard instantiateViewControllerWithIdentifier:@"MakeFullFormOfSavedDetailsVCId"];
    makee.dictGetAllValueOfClickedSavedChild=[arrOfListingSaveDraft objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:makee animated:YES];
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return YES - we will be able to delete all rows
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Perform the real delete action here. Note: you may need to check editing style
    //   if you do not perform delete only.
    

   
    
    NSLog(@"Deleted row.");
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
    
    NSDictionary *parameters = @{
                                 @"action": @"deletDraftchild",
                                 @"childId": [NSString stringWithFormat:@"%@",[[arrOfListingSaveDraft objectAtIndex:indexPath.row] objectForKey:@"id"]]
                                 };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:BaseURLOfOWL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"operation=====%@",operation);
         NSDictionary *dictOfMessage=responseObject;
         [SVProgressHUD dismiss];
         if ([[dictOfMessage objectForKey:@"status"]isEqualToString:@"Success"])
         {
             [arrOfListingSaveDraft removeObjectAtIndex:indexPath.row];
             [tbleeView reloadData];
             
             [SVProgressHUD dismiss];
             [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
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
#pragma mark - webservice
-(void)listingOfAllSaveDraftData
{
    [SVProgressHUD showWithStatus:@"Please wait..." maskType:SVProgressHUDMaskTypeBlack];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
    NSDictionary *dictLoginDataOfUser = [defaults objectForKey:@"keyAllDataOfLoginUserOWL"];
    
    NSDictionary *parameters = @{
                                 @"action": @"getDraftsChildren",
                                 @"userId": [NSString stringWithFormat:@"%@",[dictLoginDataOfUser objectForKey:@"id"]]
                                 };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:BaseURLOfOWL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"operation=====%@",operation);
         NSDictionary *dictOfMessage=responseObject;
         [SVProgressHUD dismiss];
         if ([[dictOfMessage objectForKey:@"status"]isEqualToString:@"Success"])
         {
             arrOfListingSaveDraft = [[NSMutableArray alloc]init];
             arrOfListingSaveDraft=[[dictOfMessage objectForKey:@"response"] mutableCopy];
             
             [tbleeView reloadData];
             
             [SVProgressHUD dismiss];
             [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
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

@end
