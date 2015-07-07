//
//  KitchenSinkTests.m
//  KitchenSinkTests
//
//  Created by Apple on 4/22/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TIYAddition.h"

@interface KitchenSinkTests : XCTestCase
{
    TIYAddition *addition;
}

@end

@implementation KitchenSinkTests

- (void)setUp
{
    [super setUp];
    addition = [[TIYAddition alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAdditionClassExists
{
    XCTAssertNotNil(addition, @"TIYAddition class exists.");
}

- (void)testAddTwoPlusTwo
{
    int sum = [addition addNumber:2 withNumber:2];
    XCTAssertEqual(sum, 4, @"Addition of 2 + 2 is 4.");
}

- (void)testAddTwoPlusSeven
{
    int sum = [addition addNumber:2 withNumber:7];
    XCTAssertEqual(sum, 9, @"Addition of 2 + 7 is 9.");
}

@end
