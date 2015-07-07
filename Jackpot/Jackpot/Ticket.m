//
//  Ticket.m
//  Jackpot
//
//  Created by Apple on 3/3/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "Ticket.h"

@interface Ticket ()
{
    NSMutableArray *picks;
}

@end

@implementation Ticket

//+ (instancetype)winner
//{
//    if ( == ) {
//
//    }
//}

+ (instancetype)ticketUsingQuickPick
{
    Ticket *aTicket = [[Ticket alloc] init];
    for (int i = 0; i < 6; i++)
    {
        [aTicket createPick];
    }
    return aTicket;
}

+ (instancetype)ticketUsingArray: (NSArray *)winningNumbers;
{
    Ticket *winningTicket = [[Ticket alloc] init];
    if (winningTicket)
    {
        [winningTicket createPicksWithArray:winningNumbers];
    }
    return winningTicket;
}

- (instancetype)init
{
    if (self = [super init])
    {
        picks = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSString *)description
{
    //NSArray *pickArray = picks;
    //NSString *pickDescription = [NSString stringWithFormat:@"%@  %@  %@  %@  %@  %@",pickArray[0],pickArray[1],pickArray[2],pickArray[3],pickArray[4],pickArray[5]];
    return [NSString stringWithFormat:@"%@  %@  %@  %@  %@  %@",picks[0],picks[1],picks[2],picks[3],picks[4],picks[5]];
    //NSNumber *pickDescription = [NSArray arrayWithObjects:picks count:picks];
    //NSSortDescriptor *NumbersAscending = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    //[picks sortUsingDescriptors:@[NumbersAscending]];
    //return pickDescription;
}

- (void)createPick
{
    int pickInt = rand() %52;
    [picks addObject:[NSNumber numberWithInt:pickInt]]; //1-52 needs to be constrained...Order the numbers lowest to highest
    NSSortDescriptor *NumbersAscending = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    [picks sortUsingDescriptors:@[NumbersAscending]];
}

- (void)createPicksWithArray: (NSArray *)winningPicks
{
    picks = [winningPicks mutableCopy];
}

@end
