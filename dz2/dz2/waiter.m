//
//  waiter.m
//  dz2
//
//  Created by Арсений Ермилов   on 29/09/2019.
//  Copyright © 2019 ArsIndustries. All rights reserved.
//

#import "waiter.h"

@implementation waiter
-(void) acceptOrderFromGuest
{
    NSLog(@"WAITER : order has been accepted from guest!\n");
    [[self kitDelegate] acceptOrderFromWaiter];
}
-(void) receiveOrderFromKitchen
{
    NSLog(@"WAITER: order from kitchen was received to waiter !\n");
    [[self guestDelegate] acceptOrderFromWaiter];
}
-(void) acceptChaevyi : (NSNumber *) money
{
    NSLog(@"WAITER: chaevie is very big , thanks ");
}
@end
