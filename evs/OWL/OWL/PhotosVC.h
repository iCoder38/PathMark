//
//  PhotosVC.h
//  Pludin
//
//  Created by Apple on 12/29/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotosVC : UIViewController
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UITextFieldDelegate,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
UIScrollViewDelegate
>
{
    IBOutlet UICollectionView *collectionVieww;
    
    IBOutlet UIView *viewwBGG;
    
    IBOutlet UITextField *txtSearchBar;
    
    IBOutlet UIButton *btnUploadMorePhotoButton;
    
    IBOutlet UILabel *lblNavigation;
    
    
    IBOutlet UIButton *btnMenu;
    IBOutlet UIButton *btnDeleteAll;
}

@property(strong,nonatomic)NSString *strFetchBackOrMenu;

@end
