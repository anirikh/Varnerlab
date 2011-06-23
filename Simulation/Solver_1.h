//
//  Solver_1.h
//  Simulation
//
//  Created by Anirikh Chakrabarti on 6/7/11.
//  Copyright 2011 Chemical and Biomolecular Engineering. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Solver : NSObject 
{
    //   id RHS;
@protected
    double _tStart;
    double _tStop;
    double _tStep;
    float **rateConstantVector;
    float **initialConditionsVector;
    float **stoichiometricMatrix;
    float **measurementIndexVector;
    NSMutableDictionary* _dataFile;
    
    
}

-(void) print;
// Display
@property (assign) double tStep;
@property (assign) double tStart;
@property (assign) double tStop;
@property (retain) NSMutableDictionary *dataFile;

-(void) obtainDataFileValues;

// -(NSArray*) solve;

@end
