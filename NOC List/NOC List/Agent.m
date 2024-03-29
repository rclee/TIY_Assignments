//
//  Agent.m
//  NOC List
//
//  Created by Ben Gohlke on 2/4/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "Agent.h"

@implementation Agent

+ (Agent *)agentWithDictionary:(NSDictionary *)agentDict
{
    Agent *anAgent = nil;
    if (agentDict)
    {
        anAgent = [[Agent alloc] init];
        anAgent.coverName = [agentDict objectForKey:@"coverName"];
        anAgent.realName = [agentDict objectForKey:@"realName"];
        anAgent.accessLevel = [[agentDict objectForKey:@"accessLevel"] integerValue];
        //NSLog(@"%ld", (long)anAgent.accessLevel);
        
        //
        // 1. The real name needs to be extracted from the dictionary and set to this model object's real name property
        //
        
        
        //
        // 2. The agent's access level needs to be extracted from the dictionary and set to this model object's access level
        //    property. Note: The access level property is an NSInteger, so it can't be assigned in exactly the same way as
        //    the strings were above.
        //
    }
    return anAgent;
}

@end