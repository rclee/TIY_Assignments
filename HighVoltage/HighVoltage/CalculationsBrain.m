//
//  CalculationsBrain.m
//  HighVoltage
//
//  Created by Apple on 3/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved. //
//

#import "CalculationsBrain.h"

@implementation CalculationsBrain

//+ (NSArray *)allEnergyTypes;
//{
//    return @[@"Volts(V)", @"Amps(A)", @"Ohms(Ω)",
//             @"Watts(W)"]; //could be made as an enum
//}

- (instancetype)init //instancetype generic keyword for instance of any class
{
    self = [super init];
    if (self)
    {
        _energy = EnergyTypeNone;
    }
    return self;
}


- (NSString *)energyAsString
{
    NSString *rc;
    
    switch (self.energy)
    {
        case EnergyTypeVolts:
            rc = @"Low";
            break;
            
        case EnergyTypeAmps:
            rc = @"Medium";
            break;
            
        case EnergyTypeOhms:
            rc = @"High";
            break;
            
        case EnergyTypeWatts:
            rc = @"High";
            break;
            
        default:
            rc = @"";
            break;
    }
    
    return rc;
}


@end
