//
//  HighVoltageTableViewController.h
//  HighVoltage
//
//  Created by Apple on 3/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HighVoltageTableViewControllerDelegate

-(void)energyTypeWasSelected:(NSMutableArray *)energyString;

@end

@interface HighVoltageTableViewController : UITableViewController <HighVoltageTableViewControllerDelegate>

@end
