//
//  JHKeyAndClef.m
//  MusicTheory
//
//  Created by Fupduck Central MBP on 3/15/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import "JHKeyAndClef.h"

@implementation JHKeyAndClef

- (id)initWithKeySignature:(NSString *)keySignature andClef:(int)clef
{
    self.keySignature = keySignature;
    self.clef = clef;
    return self;
}

@end
