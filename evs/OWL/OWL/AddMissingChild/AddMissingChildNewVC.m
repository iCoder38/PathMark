//
//  AddMissingChildNewVC.m
//  OWL
//
//  Created by Rameshwar on 21/08/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "AddMissingChildNewVC.h"
#import "AddMissingChildFormVC.h"
#import "AddMissingChildEmptyFormVC.h"
@interface AddMissingChildNewVC ()<UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>{

    UITableView *tbleMissingChild;
    NSMutableArray *arrAllMissingChildList;
    
    UIView *addView;
}

@end

@implementation AddMissingChildNewVC
@synthesize StrCheckFromSideBarOrNot;


- (void)viewDidLoad{

    [super viewDidLoad];

     self.view.backgroundColor = [UIColor whiteColor];

    
    addView = [[UIView alloc]initWithFrame:CGRectMake(0, 80, kSCREEN_WIDTH, 230)];
    [self.view addSubview:addView];

    
    tbleMissingChild = [[UITableView alloc]init];
    tbleMissingChild.frame =CGRectMake(0, addView.frame.size.height+addView.frame.origin.y-30, kSCREEN_WIDTH, kSCREEN_HEIGHT-(addView.frame.size.height+addView.frame.origin.y-30));

    
    UIImageView *imgAddMembersView = [[UIImageView alloc]initWithFrame:CGRectMake(kSCREEN_WIDTH/2-75, 0, 150, 150)];
    imgAddMembersView.image = [UIImage imageNamed:@"admiss"];
    imgAddMembersView.contentMode = UIViewContentModeScaleAspectFit;
    imgAddMembersView.backgroundColor = Clear;
    [addView addSubview:imgAddMembersView];
    
    imgAddMembersView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapGesture:)];
    
    tapGesture1.numberOfTapsRequired = 1;
    
    [tapGesture1 setDelegate:self];
    
    [imgAddMembersView addGestureRecognizer:tapGesture1];
    
   
}

-(void)viewWillAppear:(BOOL)animated{

 
    [super viewWillAppear:animated];
    [self customizeNavigationBar];
    
    [self getAllMissingChildAddedByMe];

}


-(void)customizeNavigationBar{

    self.navigationController.navigationBarHidden = TRUE;
    
    UIView *navView ;
    
    UIButton *btnMenu;
    
    if ([StrCheckFromSideBarOrNot isEqualToString:@"fromDashboard"])
    {
        navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 65)];
        navView.backgroundColor=Black;
        [self.view addSubview:navView];
        btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
        btnMenu.frame = CGRectMake(10, 30, 24, 24);
        [btnMenu setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [btnMenu addTarget:self action:@selector(hitbackFromAdd:) forControlEvents:UIControlEventTouchUpInside];

    }
    else
    {
        navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 65)];
        navView.backgroundColor=Black;
        [self.view addSubview:navView];
        btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
        btnMenu.frame = CGRectMake(10, 30, 24, 24);
        [btnMenu setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
        [btnMenu addTarget:self action:@selector(hitMenu:) forControlEvents:UIControlEventTouchUpInside];

    }
    [navView addSubview:btnMenu];

    UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(35, 20, kSCREEN_WIDTH-70, 45)];
    lblTitle.text = @"ADD CHILD/PERSON INFO";
    lblTitle.textColor = White;
    lblTitle.font = mr16;
    lblTitle.textAlignment = NSTextAlignmentCenter;
    [navView addSubview:lblTitle];

}

-(IBAction)hitMenu:(id)sender
{
    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];
}

-(IBAction)hitbackFromAdd:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)loadUI
{

    UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(20, 150, kSCREEN_WIDTH-40, 45)];
    lblTitle.text = @"ADD CHILD/PERSON INFO";
    lblTitle.textColor = DarkGray;
    lblTitle.font = mr16;
    lblTitle.textAlignment = NSTextAlignmentCenter;
    [addView addSubview:lblTitle];

  
   
    tbleMissingChild.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
    tbleMissingChild.delegate = self;
    tbleMissingChild.dataSource = self;
    tbleMissingChild.separatorColor = Clear;
    [self.view addSubview:tbleMissingChild];
    [tbleMissingChild reloadData];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if (arrAllMissingChildList.count>0)
    {
        tbleMissingChild.backgroundView = nil;
        return arrAllMissingChildList.count;
    }
    else
    {
        [Alert addLabelBGTableView:tbleMissingChild msg:@"No record found" color:DarkGray];
        return  0;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 80;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *strCellIdentifier = @"Cell";

    UITableViewCell *cell;

    cell = [tableView dequeueReusableCellWithIdentifier:strCellIdentifier];
    if (cell == nil) {

        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCellIdentifier];
    }

    for (UIView *cellView in [cell subviews]){

        [cellView removeFromSuperview];
    }

    NSDictionary *dictLocalToGetAllMissingChildList=[arrAllMissingChildList objectAtIndex:indexPath.row];


    UIImageView *imgProfileView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 50, 50)];
    imgProfileView.image = [UIImage imageNamed:@""];
    imgProfileView.layer.cornerRadius = 25.0;
    imgProfileView.clipsToBounds = TRUE;
    imgProfileView.layer.borderColor = [UIColor grayColor].CGColor;
    imgProfileView.layer.borderWidth = 1.0;


    [imgProfileView sd_setImageWithURL:[dictLocalToGetAllMissingChildList objectForKey:@"image"] placeholderImage:[UIImage imageNamed:KUSER_PLACEHOLDER_IMAGE]];
    [cell addSubview:imgProfileView];


    UILabel *lblName = [[UILabel alloc]initWithFrame:CGRectMake(70, 5, kSCREEN_WIDTH-80, 45)];
    lblName.text = [NSString stringWithFormat:@"%@ %@",[dictLocalToGetAllMissingChildList objectForKey:@"first_name"],[dictLocalToGetAllMissingChildList objectForKey:@"last_name"]];
    
    lblName.textColor = DarkGray;
    lblName.font = mr16;
    lblName.textAlignment = NSTextAlignmentLeft;
    [cell addSubview:lblName];



    UILabel *lblAddress = [[UILabel alloc]initWithFrame:CGRectMake(70, 40, kSCREEN_WIDTH-80, 25)];
    lblAddress.text = [NSString stringWithFormat:@"%@",[[dictLocalToGetAllMissingChildList objectForKey:@"addedBy"] objectForKey:@"address"]];
    lblAddress.textColor = DarkGray;
    lblAddress.font = ml14;
    lblAddress.textAlignment = NSTextAlignmentLeft;
    [cell addSubview:lblAddress];

    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIStoryboard *sto;
//    if (iPhoneVersion == 5)
//    {
//        sto=[UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//    }
//    else
//        if (iPhoneVersion == 6)
//    {
        sto=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    }
//        else
//            if (kSCREEN_HEIGHT == 736)
//            {
//                sto=[UIStoryboard storyboardWithName:@"Main6p" bundle:nil];
//            }
//            else
//                if (kSCREEN_HEIGHT == 1024)
//                {
//                    sto=[UIStoryboard storyboardWithName:@"Mainpad" bundle:nil];
//                }
//
    IFoundMyChildVC *ms=[sto instantiateViewControllerWithIdentifier:@"IFoundMyChildVCId"];
    ms.dictGetMissingChildList=[arrAllMissingChildList objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:ms animated:YES];
}

#pragma mark - getAllMissingChildAddedByMe
-(void)getAllMissingChildAddedByMe{

    [Alert svProgress:pleaseWait];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    NSDictionary *parameters;

    NSDictionary *myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"keyAllDataOfLoginUserOWL"];

    
    parameters = @{
                   @"action"            : @"Userchild",
                   @"userId"           : [NSString stringWithFormat:@"%@",[myDictionary objectForKey:@"id"]]
                   };

    NSLog(@"parameters-------%@",parameters);

    [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {

         NSDictionary *dictPhotographerLogin=responseObject;
         [SVProgressHUD dismiss];


         if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
         {
              arrAllMissingChildList = [[NSMutableArray alloc]initWithCapacity:0];

             arrAllMissingChildList=[dictPhotographerLogin objectForKey:@"response"];

             [self loadUI];
         }
         else
         {

             [SVProgressHUD showErrorWithStatus:@"Something went wrong.Please try again later" maskType:SVProgressHUDMaskTypeBlack];

         }

     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)

     {
         [SVProgressHUD showErrorWithStatus:error.localizedDescription maskType:SVProgressHUDMaskTypeBlack];

     }];


}

-(void)tapGesture:(UITapGestureRecognizer *)tap
{
//    if (iPhoneVersion == 5)
//    {
//    UIStoryboard *stor=[UIStoryboard storyboardWithName:@"Main5" bundle:nil];
//    AddMissingChildEmptyFormVC *Amcef=[stor instantiateViewControllerWithIdentifier:@"AddMissingChildEmptyFormVCId"];
//    [self.navigationController pushViewController:Amcef animated:YES];
//    }
//    else if (iPhoneVersion == 6)
//    {
    UIStoryboard *stor=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddMissingChildEmptyFormVC *Amcef=[stor instantiateViewControllerWithIdentifier:@"AddMissingChildEmptyFormVCId"];
    [self.navigationController pushViewController:Amcef animated:YES];
//    }
//    else if (kSCREEN_HEIGHT == 736)
//    {
//        UIStoryboard *stor=[UIStoryboard storyboardWithName:@"Main6p" bundle:nil];
//        AddMissingChildEmptyFormVC *Amcef=[stor instantiateViewControllerWithIdentifier:@"AddMissingChildEmptyFormVCId"];
//        [self.navigationController pushViewController:Amcef animated:YES];
//    }
//    else if (kSCREEN_HEIGHT == 1024)
//    {
//        UIStoryboard *stor=[UIStoryboard storyboardWithName:@"Mainpad" bundle:nil];
//        AddMissingChildEmptyFormVC *Amcef=[stor instantiateViewControllerWithIdentifier:@"AddMissingChildEmptyFormVCId"];
//        [self.navigationController pushViewController:Amcef animated:YES];
//    }
}

@end
