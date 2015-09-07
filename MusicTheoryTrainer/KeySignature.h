//
//  JHKeySignature.h
//  MusicTheory
//
//  Created by Jess Hendricks on 3/11/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import "AppDelegate.h"
#import "MusicTheoryConstants.h"


@interface KeySignature : NSObject 

@property NSString *keySignatureName;
@property int numberOfAccidentals;

+ (id)sharedKeySignature;

- (void)setNewKeySignature:(NSString *)newKeySignature;

@end