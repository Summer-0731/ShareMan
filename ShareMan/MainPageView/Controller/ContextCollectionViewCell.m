//
//  ContextCollectionViewCell.m
//  ShareMan
//
//  Created by apple on 2017/9/1.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ContextCollectionViewCell.h"
#import "RecyclingCollectionViewCell.h"
@interface ContextCollectionViewCell ()<UICollectionViewDelegate, UICollectionViewDataSource, RecyclingCollectionViewCellDelegate>
/** <#注释#> */
@property(nonatomic, strong) UICollectionView * collectionView;
@end
static NSString * const RecyclingCell = @"RecyclingCollectionViewCell";
@implementation ContextCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 64);
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) collectionViewLayout:flowLayout];
        self.collectionView.backgroundColor = [UIColor clearColor];
        self.collectionView.bounces = NO;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.pagingEnabled = YES;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self.contentView addSubview:_collectionView];
        [self.collectionView registerClass:[RecyclingCollectionViewCell class] forCellWithReuseIdentifier:RecyclingCell];

    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RecyclingCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:RecyclingCell forIndexPath:indexPath];
    cell.delegate = self;
    return cell;
}
- (void)didButtonAlertView
{
    if ([self.delegate respondsToSelector:@selector(didButtonAlertView)]) {
        [self.delegate didButtonAlertView];
    }
}
@end
