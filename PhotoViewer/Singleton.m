//
//  Singleton.m
//  PhotoViewer
//
//  Created by Vikash Soni on 11/11/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
@synthesize sharedArray,singletonArray;


+(Singleton *) theSingle
{
    static Singleton *theSingle = nil;
    if (!theSingle)
    {
        theSingle = [[super allocWithZone:nil] init];
    }
    return theSingle;
}

+(id)allocWithZone:(NSZone *)zone
{
    return [self theSingle];
}

- (id)init
{
    //If sharedInstance is nil, +initialize is our caller, so initialze the instance.
    //If it is not nil, simply return the instance without re-initializing it.
    self = [super init];
    if (self)
    {
          singletonArray = [[NSArray alloc] initWithObjects:@"cute_nature-HD.jpg",@"download (1).jpeg",@"download.jpeg",@"eight.jpg",@"five.jpg",@"four.jpg",@"images.jpeg",@"index.jpg",@"six.jpg",@"two.jpg",nil];
        
        sharedArray = [[NSMutableArray alloc]init];

        int i;
        for (i=0; i<=self.singletonArray.count-1; i++)
        {
            [self.sharedArray addObject:[self.singletonArray objectAtIndex:i]];
        }
        
        NSLog(@"share %@",sharedArray);
        
        //    myArray = [[NSArray alloc] initWithObjects:@"cute_nature-HD.jpg",@"download (1).jpeg",@"download.jpeg",@"eight.jpg",@"five.jpg",@"four.jpg",@"images.jpeg",@"index.jpg",@"six.jpg",@"two.jpg",nil];
        //    int i;
        //
        //    finalArray = [[NSMutableArray alloc]init];
        //    for (i=0; i<=myArray.count-1; i++)
        //    {
        //        [finalArray addObject:[myArray objectAtIndex:i]];
        //    }
        
    }
    return self;
}




@end
