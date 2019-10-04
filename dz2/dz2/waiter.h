//
//  waiter.h
//  dz2
//
//  Created by Арсений Ермилов   on 29/09/2019.
//  Copyright © 2019 ArsIndustries. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "protocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface waiter : NSObject
@property (nonatomic , weak) id <kitchenProtocol> kitDelegate;
@property (nonatomic , weak) id <guestProtocol>  guestDelegate;
-(void) acceptOrderFromGuest ;
-(void) receiveOrderFromKitchen;
-(void) acceptChaevyi : (NSNumber *) money;
@end

NS_ASSUME_NONNULL_END
