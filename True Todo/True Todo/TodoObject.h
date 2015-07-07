//
//  TodoObject.h
//  True Todo
//
//  Created by Apple on 3/16/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@import MapKit;

@interface TodoObject : NSObject


@property (strong, nonatomic) NSString *todoObjectString;
@property (assign) BOOL done;

- (instancetype)initWithResponse:(MKLocalSearchResponse *)localSearchInit;
- (instancetype)initWithDate:(NSDate*)date;
- (instancetype)init;

@property (nonatomic) NSDate *dueDate;
@property (strong,nonatomic) MKLocalSearchResponse *locationSearchMapItems;

@end
