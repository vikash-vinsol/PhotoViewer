//
//  MyCollectionViewController.m
//  PhotoViewer
//
//  Created by Vikash Soni on 08/11/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import "MyCollectionViewController.h"
#import "MyCollectionCell.h"
#import "Singleton.h"


@interface MyCollectionViewController ()
{
    NSArray *myArray;
}

@end

@implementation MyCollectionViewController
@synthesize finalArray;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [Singleton theSingle];
    finalArray = [[Singleton theSingle]sharedArray];
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
    return [finalArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    myCell.imageView.image = [UIImage imageNamed:finalArray[indexPath.row]];
    return myCell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Segue"])
    {
        SecondCollectionViewController *detailViewController = [segue destinationViewController];        
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        NSIndexPath *index = [indexPaths objectAtIndex:0];
        detailViewController.indexTwo = index;
    }
}


@end
