//
//  ViewController.m
//  dz2
//
//  Created by Арсений Ермилов   on 29/09/2019.
//  Copyright © 2019 ArsIndustries. All rights reserved.
//

#import "ViewController.h"
#import "guest.h"
#import "waiter.h"
#import "kitchen.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    guest *firstGuest = [[guest alloc] init];
    waiter *waiterArseniy = [[waiter alloc] init];
    kitchen *kitchenSberBank = [[kitchen alloc] init];
    firstGuest.waiterDelegate = waiterArseniy ;
    waiterArseniy.guestDelegate = firstGuest;
    waiterArseniy.kitDelegate = kitchenSberBank ;
    kitchenSberBank.waiterDelegate = waiterArseniy ;
    [firstGuest makeOrder];
    // Do any additional setup after loading the view.
}


@end
