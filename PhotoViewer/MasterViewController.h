//
//  MasterViewController.h
//  PhotoViewer
//
//  Created by Vikash Soni on 07/11/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
