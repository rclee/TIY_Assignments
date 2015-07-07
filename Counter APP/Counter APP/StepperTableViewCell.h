//
//  StepperTableViewCell.h
//  Counter APP
//
//  Created by Apple on 3/17/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StepperTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *stepperCountLabel;
@property (weak, nonatomic) IBOutlet UITextField *stepperTextField;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@end
