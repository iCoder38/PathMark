//
//  SeeAllUserDetailsCollectionCell.m
//  OWL
//
//  Created by Apple on 8/23/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "SeeAllUserDetailsCollectionCell.h"

@implementation SeeAllUserDetailsCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.tbleDataView.delegate = self;
    self.tbleDataView.dataSource = self;
    self.tbleDataView.backgroundColor = [UIColor clearColor];
    [self.tbleDataView reloadData];
    // Initialization code
}

-(void)reloadTableView:(NSDictionary *)dict
{
    
    _dictGetMissingAndFoundChild = dict;
    
    NSLog(@"_dictGetMissingAndFoundChild =%@",_dictGetMissingAndFoundChild);
    
    [self.tbleDataView reloadData];
}
#pragma mark - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 17;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    static NSString *CellIdentifier = @"missingChildListDetailsCell";
//
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//
//    if (cell == nil)
//    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//
//    for (UIView *cellView in cell.subviews){
//
//        [cellView removeFromSuperview];
//    }
    static NSString *CellIdentifier = @"missingChildListDetailsCell";
    MissingChildListDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[MissingChildListDetailsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSLog(@"table View data %@", _dictGetMissingAndFoundChild);
    
//    UILabel *lblHeading = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, kSCREEN_WIDTH-20, 25)];
//    lblHeading.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:17];
//    lblHeading.textColor = [UIColor blackColor];
//    [cell addSubview:lblHeading];
//
//    UILabel *lblHeadingValue = [[UILabel alloc]initWithFrame:CGRectMake(10, 25, kSCREEN_WIDTH-20, 45)];
//  cell.lblSubtitle.numberOfLines = 0;
//  cell.lblSubtitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
//  cell.lblSubtitle.textColor = [UIColor grayColor];
//    [cell addSubview:lblHeadingValue];
//
    
    if (indexPath.row == 0)
    {
        cell.lblTitle.text=@"Date of Disappearance";
      cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[_dictGetMissingAndFoundChild objectForKey:@"date_of_disappearance"]];
    }
    else if (indexPath.row == 1)
    {
        cell.lblTitle.text=@"Time of Disappearance";
      cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[_dictGetMissingAndFoundChild objectForKey:@"place_disappearance"]];
    }
    else if (indexPath.row == 2)
    {
        cell.lblTitle.text=@"Father's name";
      cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[_dictGetMissingAndFoundChild objectForKey:@"father_name"]];
    }
    else if (indexPath.row == 3)
    {
        cell.lblTitle.text=@"Mother's name";
      cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[_dictGetMissingAndFoundChild objectForKey:@"mother_name"]];
    }
    else if (indexPath.row == 4)
    {
        cell.lblTitle.text=@"Parents Mobile Number";
      cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[_dictGetMissingAndFoundChild objectForKey:@"parents_mobile_number"]];
    }
    else if (indexPath.row == 5)
    {
        cell.lblTitle.text=@"Address";
      cell.lblSubtitle.text=[NSString stringWithFormat:@"%@,%@,%@,%@",[_dictGetMissingAndFoundChild objectForKey:@"address"],[_dictGetMissingAndFoundChild objectForKey:@"city"],[_dictGetMissingAndFoundChild objectForKey:@"state"],[_dictGetMissingAndFoundChild objectForKey:@"country"]];
    }
    else if (indexPath.row == 6)
    {
        cell.lblTitle.text=@"Postal code/Zipcode";
      cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[_dictGetMissingAndFoundChild objectForKey:@"pincode"]];
    }
    else if (indexPath.row == 7)
    {
        cell.lblTitle.text=@"Identification mark";
      cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[_dictGetMissingAndFoundChild objectForKey:@"identification_marks"]];
    }
    else if (indexPath.row == 8)
    {
        cell.lblTitle.text=@"Height - Weight";
      cell.lblSubtitle.text=[NSString stringWithFormat:@"%@ inch & %@ pounds",[_dictGetMissingAndFoundChild objectForKey:@"height"],[_dictGetMissingAndFoundChild objectForKey:@"weight"]];
    }
    else if (indexPath.row == 9)
    {
        cell.lblTitle.text=@"Color of Eyes";
      cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[_dictGetMissingAndFoundChild objectForKey:@"color_of_eyes"]];
    }
    else if (indexPath.row == 10)
    {
        cell.lblTitle.text=@"Color of Hair";
      cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[_dictGetMissingAndFoundChild objectForKey:@"color_of_hair"]];
    }
    else if (indexPath.row == 11)
    {
        cell.lblTitle.text=@"Is the Child lost reason";
      cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[_dictGetMissingAndFoundChild objectForKey:@"is_the_child_lost_reason"]];
    }
    
    else if (indexPath.row == 12)
    {
        cell.lblTitle.text=@"Any Suspicion/ Specific Details";
      cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[_dictGetMissingAndFoundChild objectForKey:@"any_suspicion"]];
    }
    else if (indexPath.row == 13)
    {
        cell.lblTitle.text=@"Wear Glasses/Lens";
      cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[_dictGetMissingAndFoundChild objectForKey:@"is_wear_glasses_lens"]];
    }
    else if (indexPath.row == 14)
    {
        cell.lblTitle.text=@"Last seen wearing";
      cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[_dictGetMissingAndFoundChild objectForKey:@"last_seen_wearing"]];
    }
    else if (indexPath.row == 15)
    {
        cell.lblTitle.text=@"Alert Initiated by";
      cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[_dictGetMissingAndFoundChild objectForKey:@"complained_by"]];
    }
    else if (indexPath.row == 16)
    {
        cell.lblTitle.text=@"Last seen location";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[_dictGetMissingAndFoundChild objectForKey:@"last_seen_location"]];
    }
    else if (indexPath.row == 17)
    {
        cell.lblTitle.text=@"Reward offer";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[_dictGetMissingAndFoundChild objectForKey:@"prize_money"]];
    }
    else if (indexPath.row == 18)
    {
        cell.lblTitle.text=@"Reward Information";
        cell.lblSubtitle.text=[NSString stringWithFormat:@"%@",[_dictGetMissingAndFoundChild objectForKey:@"prize_msg"]];
    }
    
    cell.backgroundColor=Clear;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
