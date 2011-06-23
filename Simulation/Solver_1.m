//
//  Solver_1.m
//  Simulation
//
//  Created by Anirikh Chakrabarti on 6/7/11.
//  Copyright 2011 Chemical and Biomolecular Engineering. All rights reserved.
//

#import "Solver.h"
#import "MassBalance.h"


@implementation Solver

@synthesize tStep = _tStep;
@synthesize tStop = _tStop;
@synthesize tStart = _tStart;
@synthesize dataFile = _dataFile;


- (id)init {
    self = [super init];
    if (self) {
        
        // Code to initialize the object -
        [self setup];
        
    }
    return self;
}

-(void)setup
{
    // 
}

- (void)dealloc {
    
    // Clean up my iVars -
    self.dataFile = nil;
    [super dealloc];
    
}


- (void) obtainDataFileValues
{   
    // We need to add the resize bit to all of these
    rateConstantVector = [Utill convertNSArrayToFloat:[self.dataFile valueForkey:"RateConstantVector"]];
    initialConditionsVector = [Utill convertNSArrayToFloat:[self.dataFile valueForkey:"InitialConditionsVector"]];
    stoichiometricMatrix = [Utill convertNSArrayToFloat:[self.dataFile valueForkey:"StoichiometricMatrix"]];
    measurementIndexVector = [Utill convertNSArrayToFloat:[self.dataFile valueForkey:"MeasurementIndexVector"]];
    
}

-(NSMutableDictionary*) calculateSolution 
{
    // This is where our main solution scheme works
    NSMutableDictionary *solution = [[NSMutableDictionary alloc] initWithCapacity:10];
    
    NSMutableArray *xOutputMatrix = [[NSMutableArray alloc] initWithCapacity:10];
    NSMutableArray *timeOutputVector = [[NSMutableArray alloc] initWithCapacity:10];
    float xdot, x0, xtilde;
    int neqn, iteration;
    // Step 1: Get the initial conditions, To, Tf, Ts, Number of steps
    int numberOfSteps = (_tStop - _tStart)/_tStep;
    
    // Step 2: Preset some things for simulation
    
    x0 = initialConditionsVector;
    neqn = Count(x0);
    xOutputMatrix(1:neqn,1) = x0;
    t0 = _tStart;
    
    // Step 3: Actual part of the code
    for iteration = 1:numberOfSteps
        
        evaluateMassBalance(float xdot, float x0, float stoichiometricMatrix);
    massBalanceFirstCall = xdot;
    
    xtilde = x0 + (_tStep/2)*massBalanceFirstCall;
    timeSecondEval = t0 + (_tStep/2);
    
    evaluateMassBalance(float xdot, float xtilde, float stoichiometricMatrix);
    massBalanceSecondCall = xdot;
    x0 = x0 + massBalanceSecondCall;
    
    t0 = t0 + _tStep;
    
    // Append solution to the xCompile 
    xOutputMatrix(1:neqn,iteration+1) = x0;
    
    end
    
    // Logic to construct dataFile -
    [solution setObject:xOutputMatrix forKey:@"xMatrix"];
    [solution setObject:timeOutputVector forKey:@"timeVector"];
    
    // Now take care of memory management
    
    // Return to caller -
    [release pool];
    
    return [solution autorelease];
    
    
}



@end