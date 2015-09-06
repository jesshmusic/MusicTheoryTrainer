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
    for (int i = 1; i < 24; i++) {
        xpTiers[i] = xpTiers[i - 1] * 2;
    }
    return self;
}

- (void) checkLevel
{
    int xpToCheck = [self.xp intValue];
    for (int i = 1; i < 23; i++) {
        if (xpToCheck >= xpTiers[i] && xpToCheck < xpTiers[i + 1]) {
            self.level = [NSNumber numberWithInt:i + 1];
        }
    }
}

//- (NSNumber *)getLevelFromXP
//{
//    int xpToConvert = [self.xp intValue];
//    NSNumber *newLevel = [NSNumber numberWithInt:pow(xpToConvert/500, .5)];
//    return newLevel;
//}

//- (void)setXp:(NSNumber *)xp
//{
//    self.xp = xp;
//    [self setLevel:[self getLevelFromXP]];
//}
@end
