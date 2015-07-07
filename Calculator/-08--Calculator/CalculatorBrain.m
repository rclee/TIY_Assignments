//
//  CalculatorBrain.m
//  -08--Calculator
//
//  Created by Apple on 3/5/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "CalculatorBrain.h"
#import "ViewController.h"

@implementation CalculatorBrain





- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _operand1String = [[NSMutableString alloc] init];
        _operand2String = [[NSMutableString alloc] init];
        _operand1 = 0.0f;
        _operand2 = 0.0f;
        _userIsTypingANumber = NO;
        _operatorType = OperatorTypeNone;
    }
    return self;
    
}

//- (float)addNumbers
//{
//    self.operand1 = [self.operand1String floatValue];
//    self.operand2 = [self.operand2String floatValue];
//    float returnValue = self.operand1 + self.operand2;
//    return returnValue;
//}
- (NSString *)operandLogic:(NSString *)digit
{
    NSString *rc;
    if (self.operatorType == OperatorTypeNone)
    {
        [self.operand1String appendString:digit];
        rc = self.operand1String;
        
    }
    else
    {
        [self.operand2String appendString:digit];
        rc = self.operand2String;
    }
         return rc;
}


- (float)calculateAnswers
{
    
    float returnValue;
    switch (self.operatorType)
    {
        case OperatorTypeAddition: //addition
            self.operand1 = [self.operand1String floatValue];
            self.operand2 = [self.operand2String floatValue];
            returnValue = self.operand1 + self.operand2;
            break;
        case OperatorTypeSubtraction: //subtraction
            self.operand1 = [self.operand1String floatValue];
            self.operand2 = [self.operand2String floatValue];
            returnValue = self.operand1 - self.operand2;
            break;
        case OperatorTypeMulitplication: //multiplication
            self.operand1 = [self.operand1String floatValue];
            self.operand2 = [self.operand2String floatValue];
            returnValue = self.operand1 * self.operand2;
            break;
        case OperatorTypeDivision: //Division
            self.operand1 = [self.operand1String floatValue];
            self.operand2 = [self.operand2String floatValue];
            returnValue = self.operand1 / self.operand2;
            if (self.operand2 == 0)
            {
                returnValue = 0;
            }
            else
            {
                returnValue = self.operand1 / self.operand2;
            }

            break;
        case OperatorTypeSignChange:
            self.operand1 = [self.operand1String floatValue];
            self.operand2 = [self.operand2String floatValue];
            
            if (self.operatorType == OperatorTypeNone)
              {
                returnValue = self.operand1 * -1;
              }
            else
            {
                returnValue = self.operand2 * -1;
            }
        default:
            break;
    }
    return returnValue;
}

- (NSString *)addDecimalFromBrain
{
    NSString *rc;
    if (self.operatorType == OperatorTypeNone)
    {
      
        if (![self.operand1String containsString:@"."])
        {
            [self.operand1String appendString:@"0."];
        }
        
        rc = self.operand1String;
        
    }
    else if ([self.operand2String isEqualToString:@""])
    {
        self.operand2String = [@"0." mutableCopy];
        
        rc = self.operand2String;
    }
    else if (self.operand2String)
    {
        if (![self.operand2String containsString:@"."])
        {
        [self.operand2String appendString:@"."];
        }
        rc = self.operand2String;
    }
        return rc;
}

- (NSString *)percentageFromBrain

{
    NSString *rc;
    if (self.operatorType == OperatorTypeNone)
    {
        self.operand1 = [self.operand1String floatValue];
        float percentReturn = self.operand1;
        rc = [NSString stringWithFormat:@"%.2f",percentReturn * .01];
        [self.operand1String setString:rc];
    }
    else
    {
        self.operand2 = [self.operand2String floatValue];
        float percentReturn = self.operand2;
        rc = [NSString stringWithFormat:@"%.2f",percentReturn * .01];
        [self.operand2String setString:rc];
    }
    return rc;
}

- (NSString *)changeSign

{
    NSString *rc;
    if (self.operatorType == OperatorTypeNone)
    {
        self.operand1 = [self.operand1String floatValue];
        float percentReturn = self.operand1;
        rc = [NSString stringWithFormat:@"%g",percentReturn * -1];
        [self.operand1String setString:rc];
    }
    else
    {
        self.operand2 = [self.operand2String floatValue];
        float percentReturn = self.operand2;
        rc = [NSString stringWithFormat:@"%g",percentReturn * -1];
        [self.operand2String setString:rc];
    }
    return rc;
}


//    if (self.operatorType == OperatorTypeNone)
//    {
//        self.operand1 = [self.operand1String floatValue];
//        self.returnValue = self.operand1 / 100;
//        self.returnString = [NSString stringWithFormat:@"%.2f", self.returnValue];
//        [self.operand1String setString:self.returnString];
//    }
//    else
//    {
//        self.operand2 = [self.operand2String floatValue];
//        self.returnValue = self.operand2 / 100;
//        self.returnString = [NSString stringWithFormat:@".2f", self.returnValue];
//        [self.operand2String setString:self.returnString];
//}

//- (void)signChange
//{
//    if (self.operatorType == OperatorTypeNone)
//    {
//        self.operand1 = [self.operand1String floatValue];
//        self.returnValue = self.operand1 * -1.0;
//        self.returnString = [NSString stringWithFormat:@"%g", self.returnValue];
//        [self.operand1String setString:self.returnString];
//    }
//    else
//    {
//        self.operand2 = [self.operand2String floatValue];
//        self.returnValue = self.operand2 * -1.0;
//        self.returnString = [NSString stringWithFormat:@"%g", self.returnValue];
//        [self.operand2String setString:self.returnString];
//    }
//    if (![self.operand1String isEqualToString:@""])
//    {
//        self.operand1 = [self.operand1String floatValue];
//        self.operand2 = [self.operand2String floatValue];
//        float changeReturn = self.operand1;
//        rc = [NSString stringWithFormat:@"%g",changeReturn * -1];
//    }
//    return rc;
    
//        self.operand1 = [self.operand1String floatValue];
//        self.operand2 = [self.operand2String floatValue];
//    float newValue = self.operand1 * -1;
//    if ([self.operand1String containsString:@"-"])
//    {
//        newValue = self.operand1String mutableCopy;
//    }
//    
//    return newValue;
//}





@end

