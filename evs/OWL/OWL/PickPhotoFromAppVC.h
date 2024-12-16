//
//  PickPhotoFromAppVC.h
//  OWL
//
//  Created by Apple on 9/13/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PickPhotoFromAppDelegate <NSObject>
@required
- (void)dataFromController:(NSMutableArray *)data;
@end

@interface PickPhotoFromAppVC : UIViewController
<
UICollectionViewDelegate,
UICollectionViewDataSource
>
{
    IBOutlet UICollectionView *clViewPickPhoto;
    
    IBOutlet UIButton *btnClose;
    IBOutlet UIButton *btnDone;
}
@property (nonatomic, retain) NSMutableArray *data;
@property (nonatomic, weak) id<PickPhotoFromAppDelegate> delegate;
@property(strong,nonatomic)NSString *strAlbumCheckFromEdit;
@end
