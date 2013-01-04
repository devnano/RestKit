//
//  NSSet+KartjubaDuplicatesFilter.m
//  RestKit
//
//  Created by Mariano Heredia on 1/4/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import "NSSet+KartjubaDuplicatesFilter.h"

__strong static NSMutableDictionary * duplicatesCheckBlocksDictionary = nil;



@implementation NSSet (KartjubaDuplicatesFilter)

- (NSArray*)allObjectsCheckingDuplicatesWithTargetSet:(NSSet*)targetSet;
{
    NSObject* anyObject = [targetSet anyObject];
    NSArray* allObjects = [self allObjects];

    if (!anyObject ) {
        return allObjects;
    }
    NSString* className = NSStringFromClass([anyObject class]);
    NSArray* (^filterBlock)(NSArray* source, NSSet* target) = [duplicatesCheckBlocksDictionary objectForKey:className];
    
    if(!filterBlock)
        return allObjects;

    
    return filterBlock(allObjects, targetSet);
}

+ (void)addDuplicatesFilterBlock:(NSArray* (^)(NSArray* source, NSSet* target))filterBlock forClassName:(NSString*)className;
{
    if(!duplicatesCheckBlocksDictionary) {
        duplicatesCheckBlocksDictionary = [NSMutableDictionary dictionary];
    }
    [duplicatesCheckBlocksDictionary setObject:filterBlock forKey:className];
}

@end
