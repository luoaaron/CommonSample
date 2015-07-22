//
//  NSObject+TypeChecking.m
//  GZLibrary
//
//  Created by situ on 28/2/2014.
//
//

#import "NSObject+TypeChecking.h"

@implementation NSObject (TypeChecking)

-(BOOL)isNSDictionary
{
    return [self isKindOfClass:[NSDictionary class]];
}

-(BOOL)isNSArray
{
    return [self isKindOfClass:[NSArray class]];
}

/*
 * return true if is nil or NSNull
 * Becasue JSON object may be NSNull, should check NSNull before using the object.
 */
-(BOOL)isNilOrNSNull
{
    if (self == nil || [self isKindOfClass:[NSNull class]])
        return YES;
    else
        return NO;
}

-(BOOL)isNotNilOrNSNull
{
    return ![self isNilOrNSNull];
}

@end
