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

    
    // Code to perform the simulation goes here ....
    // We'll need to create and setup a "datafile" instance
    // We'll need to create and setup an instance of the mass balances
    // We'll need to create and setup an instance of the solver ..
    NSLog(@"Test monkey");
    NSLog(@"Ani made this change");
    
    
    // Get ready to shut down - drain the autorelease pool -
    [pool drain];
    return 0;
}

