//
//  Pet.h
//  Phonagotchi
//
//  Created by Tye Blackie on 2017-08-03.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pet : NSObject

@property (nonatomic, readonly) BOOL isGrumpy;


-(BOOL) pettingVelocity:(CGPoint)pettingVelocity;
@end
