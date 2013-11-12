//
//  SecondCollectionViewController.h
//  PhotoViewer
//
//  Created by Vikash Soni on 09/11/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondCollectionViewCell.h"

@interface SecondCollectionViewController : UICollectionViewController
{
        NSTimer *timer;
        int currentImage;
}

@property (nonatomic,strong) NSArray *detailArray;
@property (nonatomic, strong) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (strong,nonatomic) SecondCollectionViewCell *secondCollectionViewCell;
@property (strong,nonatomic)   NSIndexPath *indexTwo;
- (IBAction)shareButtonClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imgVIew;



@end
