//
//  TodoDetailTableViewController.h
//  True Todo
//
//  Created by Apple on 3/27/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoObject.h"
#import "POIResultsTableViewController.h"

@import MapKit;

@interface TodoDetailTableViewController : UITableViewController


@property (nonatomic, weak) IBOutlet UIButton *checkmarkTappedFromMainVCButton;
@property (nonatomic) NSMutableArray *TodoStore;
@property (nonatomic) TodoObject *aTask;
@property (nonatomic) POIResultsTableViewController *POIVC;

@property (weak,nonatomic) MKLocalSearchResponse *results;

-(void)performSearch:(MKCoordinateRegion)aRegion;

@end
