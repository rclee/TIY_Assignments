//
//  Validator.m
//  Validator
//
//  Created by Apple on 3/9/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "Validator.h"
#import "ViewController.h"

@implementation Validator


- (BOOL)validateZipCode:(NSString *)zipCode
{
    BOOL rc = NO;
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
    if ([zipCode length] == 5 && [zipCode rangeOfCharacterFromSet:set].location != NSNotFound)
    {
        rc = YES;
    }

    return rc;
}

- (BOOL)validateCity:(NSString *)cityText
{
    BOOL rc = NO;
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvuxyzABCDEFGHIJKLMNOPQRSTUVUXYZ"];
    
    if ( [cityText rangeOfCharacterFromSet:set].location != NSNotFound)
    {
        rc = YES;
    }
    
    return rc;
}

- (BOOL)validateState:(NSString *)stateText
{
    BOOL rc = NO;
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvuxyz"];
    
    if ([stateText length] == 2 && [stateText rangeOfCharacterFromSet:set].location != NSNotFound)
    {
        rc = YES;
    }
    
    return rc;
}

- (BOOL)validatePhoneNumber:(NSString *)phoneNumberText
{
    __block BOOL rc = NO;
    
    if (![phoneNumberText isEqualToString:@""])
    {
        NSError *error = nil;
        NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypePhoneNumber error:&error];
        
        [detector enumerateMatchesInString:phoneNumberText 
                                   options:kNilOptions
                                     range:NSMakeRange(0, [phoneNumberText length])
                                usingBlock:
         ^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop)
         {
             rc = YES;
         }];
        
    }
    
    
    return rc;
}

- (BOOL)validateAddress:(NSString *)addressText
{
    __block BOOL rc = NO;
    
    if (![addressText isEqualToString:@""])
    {
         // validate each textField in methods(brain) w/ BOOL. Next - become firstResponder
        
            NSError *error = nil;
            NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeAddress error:&error]; //HW
            
            [detector enumerateMatchesInString:addressText // same as self.agentNameTextField.text
                                       options:kNilOptions // constant
                                         range:NSMakeRange(0, [addressText length]) //checking the range of text
                                    usingBlock:
             ^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) //HW:
             {
                 rc = YES;
             }];
        
    }

    
    return rc;
}


- (BOOL)validateNameTextField:(NSString *)nameText
{
    BOOL rc = NO;
    if (![nameText isEqualToString:@""])
    
    {
    
    
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvuxyzABCDEFGHIJKLMNOPQRSTUVUXYZ"];
    
    if ([nameText length] == 20 && [nameText rangeOfCharacterFromSet:set].location != NSNotFound && [nameText isEqualToString:@" "])
    {
        rc = YES;
    }
    
    
    }
    return rc;
}




@end
