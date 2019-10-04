//
//  guest.m
//  dz2
//
//  Created by Арсений Ермилов   on 29/09/2019.
//  Copyright © 2019 ArsIndustries. All rights reserved.
//

#import "guest.h"

@implementation guest

-(void) makeOrder
{
    NSLog(@"GUEST : guest is choosing food to eat");
    [[self waiterDelegate] acceptOrderFromGuest];
}
-(void) acceptOrderFromWaiter
{
    NSLog(@"GUEST: order was received from waiter and it is very tasty");
    [[self waiterDelegate] acceptChaevyi : [NSNumber numberWithInteger:10]];
}
@end
