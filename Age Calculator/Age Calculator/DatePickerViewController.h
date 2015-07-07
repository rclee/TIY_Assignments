//
//  DatePickerViewController.h
//  Age Calculator
//
//  Created by Apple on 3/2/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface DatePickerViewController : UIViewController

@property (strong, nonatomic) id<AgeDatePickerDelegate> delegate;

@end
