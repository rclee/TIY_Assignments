//
//  StepperTableViewCell.m
//  Counter APP
//
//  Created by Apple on 3/17/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "StepperTableViewCell.h"



double value;

@implementation StepperTableViewCell



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)stepperValueChanged:(UIStepper *)sender
{
    value = [sender value];
    
    [self.stepperCountLabel setText:[NSString stringWithFormat:@"%d", (int)value]];
}



@end
