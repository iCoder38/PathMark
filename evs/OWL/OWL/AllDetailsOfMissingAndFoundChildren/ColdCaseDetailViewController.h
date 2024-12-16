//
//  ColdCaseDetailViewController.h
//  OWL
//
//  Created by santosh kumar singh on 30/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColdCaseDetailViewController : UIViewController<UICollectionViewDelegate,
UICollectionViewDataSource>
{
    IBOutlet UILabel *lblAgeAndGender;
    IBOutlet UIImageView *imgProfile;
    IBOutlet UILabel *lblFirstName;
    IBOutlet UITextView *contentTextView;
    IBOutlet UICollectionView *collectionVieww;
    
}
@property (nonatomic, strong) NSDictionary *coldCaseDataDict;
@end

NS_ASSUME_NONNULL_END
