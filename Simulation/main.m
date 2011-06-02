//
//  main.m
//  Simulation
//
//  Created by Jeffrey Varner on 6/2/11.
//  Copyright 2011 Chemical and Biomolecular Engineering. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    // This creates the autorelease pool -
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    NSLog(@"Hello, World!");

    
    // Get ready to shut down - drain the autorelease pool -
    [pool drain];
    return 0;
}

