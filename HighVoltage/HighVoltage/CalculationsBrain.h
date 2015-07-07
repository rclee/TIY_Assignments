//
//  CalculationsBrain.h
//  HighVoltage
//
//  Created by Apple on 3/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum //track the states of priorities
{
    EnergyTypeNone,
    EnergyTypeVolts,
    EnergyTypeAmps,
    EnergyTypeOhms,
    EnergyTypeWatts
} EnergyType;

@interface CalculationsBrain : NSObject

@property (assign) EnergyType energy;

//+ (NSArray *)allEnergyTypes;

- (NSString *)energyAsString;

@end
