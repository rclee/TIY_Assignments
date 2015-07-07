//
//  ViewController.h
//  Age Calculator
//
//  Created by Apple on 3/2/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AgeDatePickerDelegate

- (void)birthDateWasChosen:(NSDate *)birthDate;

@end

@interface ViewController : UIViewController <AgeDatePickerDelegate>


@end

