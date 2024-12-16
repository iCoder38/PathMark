//
//  MissingChildVC.m
//  OWL
//
//  Created by Apple on 7/24/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "MissingChildVC.h"

@interface MissingChildVC ()
{
    NSMutableArray *arrAllMissingChildList;
}
@end

@implementation MissingChildVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    arrAllMissingChildList=[[NSMutableArray alloc]init];
    
    tbleView.delegate=self;
    tbleView.dataSource=self;
    
    imgAddMissingChild.userInteractionEnabled = YES;
    imgAddMissingChild.layer.cornerRadius=60;
    imgAddMissingChild.clipsToBounds=YES;
//    imgAddMissingChild.backgroundColor=Black;
    
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(addMissingChildClick:)];
    tapGesture1.numberOfTapsRequired = 1;
    [tapGesture1 setDelegate:self];
    [imgAddMissingChild addGestureRecognizer:tapGesture1];
}

-(void)addMissingChildClick : (id)sender
{
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"DASHBOARD"];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:White,
       NSFontAttributeName:mr14}];
    DnavColor
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(sideBarFromMissingChild)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    
    [self getAllMissingChildAddedByMe];
    
}

-(void)sideBarFromMissingChild
{
    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (arrAllMissingChildList.count>0)
    {
        
        tbleView.backgroundView = nil;
        return arrAllMissingChildList.count;
    }
    else{
        
        [Alert addLabelBGTableView:tbleView msg:@"No record found" color:DarkGray];
        return  0;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 70;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *strCellIdentifier = @"Cell";
    
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:strCellIdentifier];
    if (cell == nil)
    {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCellIdentifier];
    }
    
    for (UIView *cellView in [cell subviews]){
        
        [cellView removeFromSuperview];
    }
    
    NSDictionary *dictLocalToGetAllMissingChildList=[arrAllMissingChildList objectAtIndex:indexPath.row];
    
    
    UIImageView *imgProfileView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
    imgProfileView.image = [UIImage imageNamed:@""];
    imgProfileView.layer.cornerRadius = 25.0;
    imgProfileView.clipsToBounds = TRUE;
    imgProfileView.layer.borderColor = [UIColor grayColor].CGColor;
    imgProfileView.layer.borderWidth = 1.0;
    
    
    [imgProfileView sd_setImageWithURL:[dictLocalToGetAllMissingChildList objectForKey:@"image"] placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
    [cell addSubview:imgProfileView];
    
    
    UILabel *lblName = [[UILabel alloc]initWithFrame:CGRectMake(70, 5, kSCREEN_WIDTH-80, 45)];
    lblName.text = [NSString stringWithFormat:@"%@",[dictLocalToGetAllMissingChildList objectForKey:@"first_name"]];
    lblName.textColor = DarkGray;
    lblName.font = mr16;
    lblName.textAlignment = NSTextAlignmentLeft;
    [cell addSubview:lblName];
    
    
    
    UILabel *lblAddress = [[UILabel alloc]initWithFrame:CGRectMake(70, 50, kSCREEN_WIDTH-80, 25)];
    lblAddress.text = [NSString stringWithFormat:@"%@",[dictLocalToGetAllMissingChildList objectForKey:@"address"]];
    lblAddress.textColor = DarkGray;
    lblAddress.font = ml14;
    lblAddress.textAlignment = NSTextAlignmentLeft;
    [cell addSubview:lblAddress];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIStoryboard *ss=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    IFoundMyChildVC *ifo=[ss instantiateViewControllerWithIdentifier:@"IFoundMyChildVCId"];
    ifo.dictGetMissingChildList=[arrAllMissingChildList objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:ifo animated:YES];
    
}

#pragma mark - getAllMissingChildAddedByMe

-(void)getAllMissingChildAddedByMe
{
    
    
    [Alert svProgress:pleaseWait];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters;
    
    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];
    
    parameters = @{
                   @"action"            : @"findchild",
                   @"userId"           : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]]
                   };
    
    NSLog(@"parameters-------%@",parameters);
    
    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary *dictPhotographerLogin=responseObject;
         [SVProgressHUD dismiss];
         
         
         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
         {
             
             arrAllMissingChildList=[dictPhotographerLogin objectForKey:@"response"];
             
             [tbleView reloadData];
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
