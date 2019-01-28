//
//  Karen.h
//  UKaren
//
//  Created by Ehkalu Moo on 11/26/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Karen : NSObject

@property (nonatomic, retain) NSString* name;

@property (nonatomic, retain) NSString* description;

@property (nonatomic, retain) NSString* detail;

-(id) initWithName:(NSString*) theName andDescription:(NSString*)theDescription detail:(NSString *)Detail;


@end
