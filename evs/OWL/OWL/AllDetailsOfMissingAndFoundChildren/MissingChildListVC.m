//
//  MissingChildListVC.m
//  OWL
//
//  Created by Apple on 7/25/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "MissingChildListVC.h"

@interface MissingChildListVC ()
{
    NSArray *arrAllMissingChildList;
}
@end

@implementation MissingChildListVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    self.view.backgroundColor=White;
    
    [self missingChildListWebservice];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"MISSING CHILD/PERSON"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(menuClickMethodFromMissingChild)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    UIBarButtonItem *SETTINGBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"filter"] style:UIBarButtonItemStylePlain target:self action:@selector(settingClickMethod)];
    
    self.navigationItem.rightBarButtonItem=SETTINGBarButton;
    
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    
    NSString *strOnlyForCheck = [[NSUserDefaults standardUserDefaults]
                                 stringForKey:@"keyOnlyForCheck"];
    
    
    
    if ([strOnlyForCheck isEqualToString:@"onlyForCheck"])
    {
        [self missingChildListWebservice];
    }
    else
    {
        
    }
    
    
    

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"TestNotification"
                                               object:nil];
}

- (void)checkForBack:(NSString *)data
{
    
    [self  missingChildListWebservice];
}

- (void) receiveTestNotification:(NSNotification *) notification
{
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        arrAllMissingChildList = [userDefaults objectForKey:@"keyStoreFilterMissingChils"];
        
        if ([[notification name] isEqualToString:@"TestNotification"])
        {
            NSLog (@"Successfully received the test notification!");
            
            [tbleView reloadData];
            
        }
        else
        {
            [tbleView reloadData];
        }
        
}

-(void)loadTableView
{
    tbleView.delegate=self;
    tbleView.dataSource=self;
    tbleView.separatorColor=LightGray;
    tbleView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    tbleView.backgroundColor=Clear;
    [tbleView reloadData];
}

-(void)settingClickMethod
{
    FilterMissingChildVC *fmc=[self.storyboard instantiateViewControllerWithIdentifier:@"FilterMissingChildVCId"];
    [self.navigationController pushViewController:fmc animated:YES];
}

-(void)menuClickMethodFromMissingChild
{
    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (arrAllMissingChildList.count>0)
    {

        tbleView.backgroundView = nil;
        return arrAllMissingChildList.count;
    }
    else
    {

        [Alert addLabelBGTableView:tbleView msg:@"No missing child found" color:White];
        return  0;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    static NSString *CellIdentifier = @"missingChildCell";
    MissingChildCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[MissingChildCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *dictLocalToGetAllMissingChildList=[arrAllMissingChildList objectAtIndex:indexPath.row];
    
    NSLog(@"dictLocalToGetAllMissingChildList==%@",dictLocalToGetAllMissingChildList);
    
    
    
    [cell.imgProfile sd_setImageWithURL:[dictLocalToGetAllMissingChildList objectForKey:@"image"]
               placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];

    cell.imgProfile.layer.cornerRadius=25;
    cell.imgProfile.clipsToBounds=YES;    
    cell.lblUsername.text=[NSString stringWithFormat:@"%@ %@",[dictLocalToGetAllMissingChildList objectForKey:@"first_name"],[dictLocalToGetAllMissingChildList objectForKey:@"last_name"]];
    cell.lblUsername.font=mr17;
    cell.lblUsername.textColor=Black;
    
    cell.lblCountry.text=[NSString stringWithFormat:@"%@",[[dictLocalToGetAllMissingChildList objectForKey:@"addedBy"] objectForKey:@"address"]];
    
    cell.lblCountry.font=mr14;
    cell.lblCountry.textColor= LightGray;
    
    
    if ([[NSString stringWithFormat:@"%@",[dictLocalToGetAllMissingChildList objectForKey:@"prize_money"]]isEqualToString:@""])
    {
        cell.imgPrice.hidden=YES;
    }
    else
    {
        cell.imgPrice.hidden=NO;
        cell.imgPrice.image=[UIImage imageNamed:@"ribbon"];
    }
    
    cell.lblPrice.text=[NSString stringWithFormat:@"%@",[dictLocalToGetAllMissingChildList objectForKey:@"prize_money"]];

    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    cell.backgroundColor=Clear;


    UILabel *lblLine = [[UILabel alloc]initWithFrame:CGRectMake(10, 79, kSCREEN_WIDTH-20, 1)];
    lblLine.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
    [cell addSubview:lblLine];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MissingChildListDetailsVC *mcld=[self.storyboard instantiateViewControllerWithIdentifier:@"MissingChildListDetailsVCId"];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
     [userDefaults setObject:[arrAllMissingChildList objectAtIndex:indexPath.row] forKey:@"keyTransferMissingChildPerson"];
    [userDefaults synchronize];
    
    NSDictionary *dictLocalBlockOrNot=[arrAllMissingChildList objectAtIndex:indexPath.row];
    
    NSUserDefaults *extraKeyForBlock = [NSUserDefaults standardUserDefaults];
    [extraKeyForBlock setObject:[[dictLocalBlockOrNot objectForKey:@"addedBy"] objectForKey:@"blockMe"] forKey:@"keyisItBlockOrNot"];
    [extraKeyForBlock synchronize];
    
    mcld.dictGetMissingAndFoundChild=[arrAllMissingChildList objectAtIndex:indexPath.row];
    
    mcld.delegate=self;
    [self.navigationController pushViewController:mcld animated:YES];
}

#pragma mark - missing child list webservice
-(void)missingChildListWebservice
{
    
    NSString *strTest=@"onlyForCheck1";
    NSUserDefaults *checkk = [NSUserDefaults standardUserDefaults];
    [checkk setObject:strTest forKey:@"keyOnlyForCheck"];
    [checkk synchronize];
    
    [Alert svProgress:pleaseWait];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            
    NSDictionary *parameters;
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
            parameters = @{
                           @"action" : @"findchild",
                           @"userId" : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]]
                           };
            
            NSLog(@"parameters-------%@",parameters);
            
            [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
             {
                 NSDictionary *dictPhotographerLogin=responseObject;
                 
                 if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
                 {
                     [SVProgressHUD dismiss];
                     
                     arrAllMissingChildList=[dictPhotographerLogin objectForKey:@"response"];
                     
                     [self loadTableView];
                 }
                 else
                 {
                     [SVProgressHUD showErrorWithStatus:[dictPhotographerLogin objectForKey:@"msg"] maskType:SVProgressHUDMaskTypeBlack];
                 }
                 
             }
                  failure:^(AFHTTPRequestOperation *operation, NSError *error)
             
             {
                 [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];
                 
             }];
}

@end
