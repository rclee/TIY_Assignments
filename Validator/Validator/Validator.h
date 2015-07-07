//
//  Validator.h
//  Validator
//
//  Created by Apple on 3/9/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

//enum
//{
//    NameFieldTag,
//    AddressFieldTag,
//    CityFieldTag,
//    StateFieldTag,
//    ZipFieldTag,
//    PhoneFieldTag
//    
//}FieldTag;


@interface Validator : NSObject

- (BOOL)validatePhoneNumber:(NSString *)phoneNumberText;
- (BOOL)validateState:(NSString *)stateText;
- (BOOL)validateCity:(NSString *)cityText;
- (BOOL)validateZipCode:(NSString *)zipCode;
- (BOOL)validateAddress:(NSString *)addressText;
- (BOOL)validateNameTextField:(NSString *)nameText;

@end
