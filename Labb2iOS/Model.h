//
//  Model.h
//  Labb2iOS
//
//  Created by Marcus on 2016-02-04.
//  Copyright © 2016 Marcus Cehlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

-(NSArray*)questionTime;

-(NSArray*) checkAnswer:(NSString*)guess;

-(void)nextRound;

@end
