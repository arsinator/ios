//
//  kitchen.m
//  dz2
//
//  Created by Арсений Ермилов   on 29/09/2019.
//  Copyright © 2019 ArsIndustries. All rights reserved.
//

#import "kitchen.h"

@implementation kitchen
- (void) acceptOrderFromWaiter
{
    NSLog(@"KITCHEN : order From Waiter was accepted !\nMaking order....\n");
    [[self waiterDelegate] receiveOrderFromKitchen];
}
@end
