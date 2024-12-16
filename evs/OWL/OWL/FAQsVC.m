//
//  FAQsVC.m
//  ZYN
//
//  Created by Apple on 6/2/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "FAQsVC.h"

#import "FakeModelBuilder.h"
@interface FAQsVC ()<UIWebViewDelegate>{
    
    NSDictionary *jsonresult;
    AppDelegate *app;
    UIButton *btnMenu;
    NSArray *arrFAQs;

}

@property (strong, nonatomic) NSArray *menu;
@end

@implementation FAQsVC


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
   [self faqList];
    
    
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
    
    [self.view insertSubview:imgBGp atIndex:0];
    
   
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    
 
    
    self.tbleView.delegate=self;
    self.tbleView.dataSource=self;
    self.tbleView.backgroundColor=Clear;
    self.tbleView.separatorColor=White;
    self.tbleView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    self.tbleView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
//    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self setTitle:@"FAQS"];
//     self.navigationController.navigationBarHidden=NO;
    
    UIBarButtonItem *leftBarButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(menuClickFromAuditDetails)];
    
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
    }];
    self.navigationController.navigationBar.barTintColor = Black;
  

    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    
     [self faqList];

}

-(void)btnGraphgClickMethod
{
    
}

-(void)btnPlusClickMethod
{

}

-(void)menuClickFromAuditDetails
{
    [self.revealViewController revealToggleAnimated:YES];
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(NSArray *)menu
{
    if (_menu == nil) {
        _menu = [FakeModelBuilder buildMenu];
    }
    return _menu;
}

#pragma mark - RRNCollapsableTableView

-(NSString *)sectionHeaderNibName
{
    
    return @"MenuSectionHeaderView";
    
}

-(NSArray *)model
{
    return self.menu;
}

-(UITableView *)collapsableTableView
{
    return self.tbleView;
}

#pragma mark - UITableView

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize constraint = CGSizeMake(kSCREEN_WIDTH-20, 20000.0f);
    CGSize size;
    
    id <RRNCollapsableSectionItemProtocol> mSection = self.menu[indexPath.section];
    id item = mSection.items[indexPath.row];
    
    CGSize boundingBox = [item boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin
             attributes:@{NSFontAttributeName:mr16}context:nil].size;
    
    size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    
    int h;
    
    if (indexPath.row ==1) {
        
        h = 100;
    }
    else{
        
        h = 40;
    }
    return size.height+h;

    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60.0f;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id <RRNCollapsableSectionItemProtocol> mSection = self.menu[indexPath.section];
    id item = mSection.items[indexPath.row];
    
    UITableViewCell *cell;
    
    cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil)
    {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
//    if ([cell subviews])
//    {
//        for (UIView *subview in [cell subviews])
//        {
//            [subview removeFromSuperview];
//        }
//    }
//    
    CGSize constraint = CGSizeMake(kSCREEN_WIDTH-20, 20000.0f);
    CGSize size;
    
    CGSize boundingBox = [item boundingRectWithSize:constraint
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:@{NSFontAttributeName:mr16}
                                            context:nil].size;
    
    size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));

    int h;
    
    if (indexPath.row ==1) {
        
        h = 80;
    }
    else{
        
        h = 20;
    }
    
    UIWebView *aWebView = [[UIWebView alloc] initWithFrame:CGRectMake(10, 10, kSCREEN_WIDTH-20, size.height+h)];
    
    [aWebView loadHTMLString: [NSString stringWithFormat:@"<div id ='foo' align='justify' style='font-size:14px; font-family:helvetica; color:#000000';>%@<div>",item] baseURL:nil];
    
    
    [aWebView setUserInteractionEnabled:NO];
    aWebView.layer.cornerRadius = 3.0;
    aWebView.clipsToBounds = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    [aWebView setBackgroundColor:[UIColor whiteColor]];
    [aWebView setOpaque:NO];
    [cell.contentView addSubview:aWebView];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
        
    return cell;
}


- (UIStatusBarStyle) preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(IBAction)sideBarMenuClick:(id)sender
{
    
    [self.revealViewController revealToggleAnimated:YES];
    
}

/*action: getFaq
 userId*/

-(void)faqList
{
    
    [Alert svProgress:pleaseWait];
    
 
    
    
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        NSDictionary *parameters;
        parameters = @{
                       @"action": @"getFaqs"
                       };
        NSLog(@"parameters-------%@",parameters);
        
        
        [manager POST:[NSString stringWithFormat:@"%@",BaseURLOfOWL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             
             NSDictionary *dictPhotographerLogin=responseObject;
             
             
             if ([[dictPhotographerLogin objectForKey:@"status"] isEqualToString:@"Success"]==TRUE)
             {
                 NSArray *a=[dictPhotographerLogin objectForKey:@"faq"];
                 
                 
                 NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                  [userDefaults setObject:a forKey:@"keyDataFaq"];
                 [userDefaults synchronize];
                 
                 
     
                 [SVProgressHUD dismiss];
                 
                 [_tbleView reloadData];
                 
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
