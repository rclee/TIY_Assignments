//
//  ViewController.m
//  -08--Calculator
//
//  Created by Apple on 3/5/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController ()
{
    CalculatorBrain *brain;
}

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

- (IBAction)operandTapped:(UIButton *)sender;
- (IBAction)additionTapped:(UIButton *)sender;
- (IBAction)multiplicationTapped:(UIButton *)sender;
- (IBAction)divisionTapped:(UIButton *)sender;
- (IBAction)subtractionTapped:(UIButton *)sender;
- (IBAction)equalTapped:(UIButton *)sender;
- (IBAction)decimalTapped:(UIButton *)sender;
- (IBAction)clearTapped:(UIButton *)sender;
- (IBAction)plusMinus:(UIButton *)sender;
- (IBAction)percentage:(UIButton *)sender;



@end

@implementation ViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Calculator";
   self.displayLabel.text = @"0";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)operandTapped:(UIButton *)sender
{
    if (!brain)
    {
        brain = [[CalculatorBrain alloc] init];
    }
        brain.userIsTypingANumber = YES;
    self.displayLabel.text = [brain operandLogic:sender.titleLabel.text];
}

- (IBAction)additionTapped:(UIButton *)sender
{
    brain.operatorType = OperatorTypeAddition;
    brain.userIsTypingANumber = NO;
}

- (IBAction)subtractionTapped:(UIButton *)sender
{
    brain.operatorType = OperatorTypeSubtraction;
    brain.userIsTypingANumber = NO;
}

- (IBAction)divisionTapped:(UIButton *)sender
{
    brain.operatorType = OperatorTypeDivision;
    brain.userIsTypingANumber = NO;
}

- (IBAction)multiplicationTapped:(UIButton *)sender
{
    brain.operatorType = OperatorTypeMulitplication;
    brain.userIsTypingANumber = NO;
}

- (IBAction)equalTapped:(UIButton *)sender
{
    float calcDisplay = [brain calculateAnswers];
    
    if (brain.operatorType == OperatorTypeDivision && brain.operand2 == 0)
    {
        self.displayLabel.text = [NSString stringWithFormat:@"Error"];
    }
    else
    {
        self.displayLabel.text = [NSString stringWithFormat:@"%g", calcDisplay];
    }
    brain = nil;
}

- (IBAction)decimalTapped:(UIButton *)sender

{
    if (!brain)
    {
        brain = [[CalculatorBrain alloc] init];
    }
       self.displayLabel.text = [brain addDecimalFromBrain];
}


- (IBAction)clearTapped:(UIButton *)sender
{
    self.displayLabel.text = @"0";
    brain = nil;
}

- (IBAction)plusMinus:(UIButton *)sender
{
    self.displayLabel.text = [brain changeSign];
}
//    float calcDisplay = [brain signChange];
//    self.displayLabel.text = [NSString stringWithFormat:@"%g", calcDisplay];
//    float calcDisplay = [brain signChange];
//    self.displayLabel.text = [brain signChange];


- (IBAction)percentage:(UIButton *)sender
{
    self.displayLabel.text = [brain percentageFromBrain];
}
@end
