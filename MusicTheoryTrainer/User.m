//
//  User.m
//  MusicTheoryTrainer
//
//  Created by Fupduck Central MBP on 3/23/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import "User.h"


@implementation User


@dynamic name;
@dynamic level;
@dynamic xp;
@dynamic password;

- (id)init
{
    xpTiers[0] = 500;
    for (NSInteger i = 1; i < 24; i++) {
        xpTiers[i] = xpTiers[i - 1] * 2;
    }
    return self;
}

- (NSNumber *)getLevelFromXP
{
    int xpToConvert = [self.xp intValue];
    NSNumber *newLevel = [NSNumber numberWithInt:pow(xpToConvert/500, .5)];
    return newLevel;
}

- (void)setXp:(NSNumber *)xp
{
    self.xp = xp;
    [self setLevel:[self getLevelFromXP]];
}
@end
