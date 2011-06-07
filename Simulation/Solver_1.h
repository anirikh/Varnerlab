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
    id RHS;
    double tStart;
    double tStop;
    double tStep;
    NSMutableArray* xInitial;
    NSDictionary* pArams;
    
}

-(void) print;
// Display
-(void) setTstart: (double) Ts0;
-(void) setTstop: (double) Ts1;
-(void) setTstep: (double) Tst;
-(void) setParams: (NSDictionary*) Params;
-(void) setX0: (NSMutableArray*) X0;
-(void) setRHS: (id) RHS;
-(NSArray*) solve;

@end
