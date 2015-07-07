//
//  CalculationsTableViewController.h
//  HighVoltage
//
//  Created by Apple on 3/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HighVoltageTableViewController.h"

@interface CalculationsTableViewController : UITableViewController

@property (strong, nonatomic) id<HighVoltageTableViewControllerDelegate> delegate;

@property (weak, nonatomic) NSMutableArray *arrayThatDoesNothing;

@end
