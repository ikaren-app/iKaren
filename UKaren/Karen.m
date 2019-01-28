//
//  Karen.m
//  UKaren
//
//  Created by Ehkalu Moo on 11/26/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import "Karen.h"

@implementation Karen

@synthesize name;

@synthesize description;

@synthesize detail;




-(id) initWithName:(NSString *)theName andDescription:(NSString *)theDescription detail:(NSString *)Detail
{
    self = [super init];
    if(self)
        
    {
        self.name = theName;
        self.description = theDescription;
        self.detail = Detail;
       
    }
    
    return self;
}


@end
