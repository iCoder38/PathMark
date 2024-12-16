//
//  PhotosCell.h
//  Pludin
//
//  Created by Apple on 12/29/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotosCell : UICollectionViewCell
@property(strong,nonatomic) IBOutlet UIImageView *imgView;
@property(strong,nonatomic) IBOutlet UIButton *btnDelete;
@end
