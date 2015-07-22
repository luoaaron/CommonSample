//
//  NSObject+TypeChecking.h
//  GZLibrary
//
//  Created by situ on 28/2/2014.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (TypeChecking)

-(BOOL)isNSDictionary;

-(BOOL)isNSArray;

-(BOOL)isNilOrNSNull;

-(BOOL)isNotNilOrNSNull;

@end
