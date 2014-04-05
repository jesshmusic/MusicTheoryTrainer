//
//  JHKeyAndClef.h
//  MusicTheory
//
//  Created by Fupduck Central MBP on 3/15/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import "AppDelegate.h"

@interface KeySigAndClef : NSObject

@property int clef;
@property NSString *keySignature;

- (id)initWithKeySignature:(NSString *)keySignature andClef:(int)clef;

@end
