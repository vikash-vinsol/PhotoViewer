//
//  Singleton.h
//  PhotoViewer
//
//  Created by Vikash Soni on 11/11/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject
{
}

@property (strong,nonatomic) NSArray *singletonArray;
@property (strong,nonatomic) NSMutableArray *sharedArray;

+(Singleton *) theSingle;

@end
