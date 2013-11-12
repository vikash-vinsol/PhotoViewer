//
//  MyCollectionViewController.h
//  PhotoViewer
//
//  Created by Vikash Soni on 08/11/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCollectionCell.h"
#import "SecondCollectionViewController.h"

@interface MyCollectionViewController : UICollectionViewController

@property (strong,nonatomic) MyCollectionCell *myCollectionViewCell;
@property (strong,nonatomic) NSMutableArray *finalArray;
@property (nonatomic, strong) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,weak) SecondCollectionViewController *secondViewController;

@end
