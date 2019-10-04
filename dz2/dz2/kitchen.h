//
//  kitchen.h
//  dz2
//
//  Created by Арсений Ермилов   on 29/09/2019.
//  Copyright © 2019 ArsIndustries. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "protocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface kitchen : NSObject
@property (nonatomic, weak) id <waiterProtocol> waiterDelegate;
- (void) acceptOrderFromWaiter ;
@end

NS_ASSUME_NONNULL_END
