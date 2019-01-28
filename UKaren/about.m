//
//  about.m
//  UKaren
//
//  Created by Ehkalu Moo on 3/29/15.
//  Copyright (c) 2015 Ehkalu Moo. All rights reserved.
//

#import "about.h"

@interface about ()

@end

@implementation about

@synthesize myLabel;


- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (IBAction)myURL:(id)sender {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:@"https://www.facebook.com/UKarenApp/"];
    [application openURL:URL options:@{} completionHandler:^(BOOL success) {
        if (success) {
            NSLog(@"Opened url");
        }
    }];

}

- (IBAction)webURL:(id)sender {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:@"http://halveorange.com/"];
    [application openURL:URL options:@{} completionHandler:^(BOOL success) {
        if (success) {
            NSLog(@"Opened url");
        }
    }];
}

@end
