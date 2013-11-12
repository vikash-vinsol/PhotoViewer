//
//  SecondCollectionViewController.m
//  PhotoViewer
//
//  Created by Vikash Soni on 09/11/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import "SecondCollectionViewController.h"
#import "SecondCollectionViewCell.h"
#import "TestViewController.h"
#import "Singleton.h"

@interface SecondCollectionViewController ()
{
     UIImage *viewImage;
}
@end

@implementation SecondCollectionViewController
@synthesize secondCollectionViewCell;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
      self.detailArray = [[Singleton theSingle]sharedArray];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"%d",self.detailArray.count);
    return [self.detailArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SecondCollectionViewCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    myCell.imageViewTwo.image = [UIImage imageNamed:self.detailArray[indexPath.row]];
    return myCell;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.collectionView scrollToItemAtIndexPath:self.indexTwo
                                atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                        animated:YES];
    
}

- (IBAction)shareButtonClicked:(id)sender
{
    [self makeImage];
    NSArray *activityItems = @[viewImage];
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
}

-(UIImage*) makeImage
{
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *sourceImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //now we will position the image, X/Y away from top left corner to get the portion we want
    UIGraphicsBeginImageContext(self.view.frame.size);
    [sourceImage drawAtPoint:CGPointMake(0,-50)];
    viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"SegueTwo"])
    {
        TestViewController *testViewController = [segue destinationViewController];        
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        NSIndexPath *index = [indexPaths objectAtIndex:0];
        testViewController.indexThree = index;
    }
}
@end
