//
//  NSSet+KartjubaDuplicatesFilter.h
//  RestKit
//
//  Created by Mariano Heredia on 1/4/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet (KartjubaDuplicatesFilter)
- (NSArray*)allObjectsCheckingDuplicatesWithTargetSet:(NSSet*)targetSet;

+ (void)addDuplicatesFilterBlock:(NSArray* (^)(NSArray* source, NSSet* target))filterBlock forClassName:(NSString*)className;

@end
