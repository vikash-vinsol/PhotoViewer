//
//  TestViewController.h
//  PhotoViewer
//
//  Created by Vikash Soni on 11/11/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController
{
    NSTimer *timer;
    int currentImage;
}
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak,nonatomic) IBOutlet NSArray *thirdArray;
@property (weak,nonatomic) IBOutlet  NSIndexPath *indexThree;


@end
