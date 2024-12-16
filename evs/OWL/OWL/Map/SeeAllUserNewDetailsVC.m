//
//  SeeAllUserNewDetailsVC.m
//  OWL
//
//  Created by Apple on 9/21/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "SeeAllUserNewDetailsVC.h"

@interface SeeAllUserNewDetailsVC ()

@end

@implementation SeeAllUserNewDetailsVC

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - collection view
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (NSIndexPath *)indexPathForRowAtPoint:(CGPoint)point
{
    return 0;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotosCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photosCell" forIndexPath:indexPath];
    cell.backgroundColor=Clear;
    return cell;
    
}

@end
