//
//  protocols.h
//  dz2
//
//  Created by Арсений Ермилов   on 29/09/2019.
//  Copyright © 2019 ArsIndustries. All rights reserved.
//



#ifndef protocols_h
#define protocols_h

@protocol guestProtocol <NSObject>

-(void) makeOrder;
-(void) acceptOrderFromWaiter;

@end

@protocol waiterProtocol <NSObject>

-(void) acceptOrderFromGuest ;
-(void) receiveOrderFromKitchen;
-(void) acceptChaevyi : (NSNumber *) money;

@end

@protocol kitchenProtocol <NSObject>

- (void) acceptOrderFromWaiter ;

@end

#endif /* protocols_h */
