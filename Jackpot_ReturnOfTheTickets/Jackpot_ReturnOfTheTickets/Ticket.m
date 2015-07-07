//
//  QuickPickTicket.m
//  Jackpot_ReturnOfTheTickets
//
//  Created by Apple on 4/22/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "Ticket.h"

@implementation Ticket
{
    NSMutableArray *picks;
    NSNumber *aNumber;
}



+ (instancetype)generateRandomQuickPick
{
    Ticket *aTicket = [[Ticket alloc] init];
    if (aTicket)
    {
        for (int i= 0; i < 6; i++)
        {
            [aTicket createPick];
        }
    }
    
    return aTicket;
}

//+ (instancetype)ticketUsingArray: (NSArray *)winningNumbers;
//{
//    QuickPickTicket *winningTicket = [[QuickPickTicket alloc] init];
//    if (winningNumbers)
//    {
//        [winningNumbers createPicksWithArray:winningNumbers];
//    }
//    return winningNumbers;
//}

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
    return [NSString stringWithFormat:@"%@  %@  %@  %@  %@  %@",picks[0],picks[1],picks[2],picks[3],picks[4],picks[5]];
}

- (void)createPick
{
    int pickInt = arc4random() % 53 + 1;
    aNumber = [NSNumber numberWithInt:pickInt];
    [picks addObject:aNumber];
    NSSortDescriptor *NumbersAscending = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    [picks sortUsingDescriptors:@[NumbersAscending]];
}

- (void)createPicksWithArray: (NSArray *)winningPicks
{
    picks = [winningPicks mutableCopy];
}


@end
