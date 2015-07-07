//
//  POIResultsTableViewController.h
//  True Todo
//
//  Created by Apple on 3/27/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoObject.h"

@interface POIResultsTableViewController : UITableViewController

@property (nonatomic, strong) TodoObject *aTask;

@property (nonatomic, strong) NSArray *locationsArray;

@end
