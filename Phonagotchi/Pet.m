//
//  Pet.m
//  Phonagotchi
//
//  Created by Tye Blackie on 2017-08-03.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "Pet.h"

@implementation Pet

-(instancetype) init{
        self = [super init];
        if (self) {
            _isGrumpy = NO;
        }
        return(self);
    }

-(BOOL) pettingVelocity:(CGPoint)velocity{
    if (velocity.x > 650) {
        _isGrumpy = YES;
    }else{
         _isGrumpy = NO;
    }
    return _isGrumpy;
}


@end
