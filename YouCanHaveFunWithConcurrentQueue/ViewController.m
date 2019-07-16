//
//  ViewController.m
//  YouCanHaveFunWithConcurrentQueue
//
//  Created by Марк on 16/07/2019.
//  Copyright © 2019 Agranat Mark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) dispatch_queue_t concurrentQueue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.concurrentQueue = dispatch_queue_create("MyConcurrentQueue",
                                                 DISPATCH_QUEUE_CONCURRENT);
    
    // After some time you can face deadlock.
    for (int i = 0; i < 10000; i++) {
        dispatch_async(self.concurrentQueue, ^{
            for (int i = 0; i < 10; i++) {
                dispatch_sync(self.concurrentQueue, ^{
                    sleep(0.001);
                    NSLog(@"%d" , i);
                });
            }
        });
    }
    
    dispatch_after(10, self.concurrentQueue, ^{
        // This line will not be printed.
        NSLog(@"Goodbye world! :-(");
    });
}

@end
