//
//  TestViewController.m
//  PhotoViewer
//
//  Created by Vikash Soni on 11/11/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import "TestViewController.h"
#import "Singleton.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    currentImage = self.indexThree.row + self.indexThree.section;
    self.imgView.image = [UIImage imageNamed:[self.thirdArray objectAtIndex:currentImage]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    timer = [NSTimer scheduledTimerWithTimeInterval: 3.0
                                             target: self
                                           selector: @selector(handleTimer:)
                                           userInfo: nil
                                            repeats: YES];
    self.thirdArray= [[Singleton theSingle]sharedArray];
}

- (void) handleTimer: (NSTimer *) timer
{
    if (currentImage >= self.thirdArray.count-1)
    
    currentImage = -1;
    currentImage ++;
    NSLog(@"%d",currentImage);
    
    //Create an animation with pulsating effect
    CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    theAnimation.fromValue=[NSNumber numberWithFloat:1.0];
    theAnimation.toValue=[NSNumber numberWithFloat:0.5];
    theAnimation.duration=0.5;
    theAnimation.autoreverses=YES;
    [self performSelector:@selector(abcd) withObject:Nil afterDelay:0.5];
    [_imgView.layer addAnimation:theAnimation forKey:@"animateOpacity"];
    
}
-(void)abcd
{
    _imgView.image =  [UIImage imageNamed:[self.thirdArray objectAtIndex:currentImage]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidDisappear:(BOOL)animated
{
    [timer invalidate];
    timer = nil;
}


@end
