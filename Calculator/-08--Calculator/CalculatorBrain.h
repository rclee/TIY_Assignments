//
//  CalculatorBrain.h
//  -08--Calculator
//
//  Created by Apple on 3/5/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    OperatorTypeNone,     //Swtich ref in Jackpot
    OperatorTypeAddition,
    OperatorTypeSubtraction,
    OperatorTypeMulitplication,
    OperatorTypeDivision,
    OperatorTypeSignChange
}OperatorType;

@interface CalculatorBrain : NSObject //<----Superclass


@property (strong, nonatomic) NSMutableString *operand1String;
@property (strong, nonatomic) NSMutableString *operand2String;

@property (assign) NSString *returnString;
@property (assign) float returnValue;
@property (assign) float operand1;
@property (assign) float operand2;
@property (assign) OperatorType operatorType; // operatorType = 1,2,3,4 = OperatorTypeAddition?
@property (assign) BOOL userIsTypingANumber;
@property (assign) NSString *stringResult;

- (NSString *)operandLogic:(NSString *)digit;
- (float)calculateAnswers;
- (NSString *)addDecimalFromBrain;
- (NSString *)percentageFromBrain;
- (NSString *)changeSign;
//- (double)addNumbers;

@end
