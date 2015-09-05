//
//  JHKeySignature.m
//  MusicTheory
//
//  Created by Fupduck Central MBP on 3/11/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import "KeySignature.h"

@implementation KeySignature
@synthesize keySignatureName, numberOfAccidentals, isSharpKey;

+ (id)sharedKeySignature
{
    static KeySignature *sharedKeySignature = nil;
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^{sharedKeySignature = [[self alloc] init];});
    return sharedKeySignature;
}

- (id)init
{
    //default values
    return self;
}

- (void)setNewKeySignature:(NSString *)newKeySignature
{
    keySignatureName = newKeySignature;
    [self setKeySignatureWithString:keySignatureName];
}

- (void)setKeySignatureWithString:(NSString *)newKeySignature
{
    
    keySignatureName = newKeySignature;
    if ([keySignatureName isEqualToString:@"G"] || [keySignatureName isEqualToString:@"Em"])
    {
        [self setNumberOfAccidentals:1 isSharpKey:true];
    }
    else if([keySignatureName isEqualToString:@"D"] || [keySignatureName isEqualToString:@"Bm"])
    {
        [self setNumberOfAccidentals:2 isSharpKey:true];
    }
    else if([keySignatureName isEqualToString:@"A"] || [keySignatureName isEqualToString:@"F#m"])
    {
        [self setNumberOfAccidentals:3 isSharpKey:true];
    }
    else if([keySignatureName isEqualToString:@"E"] || [keySignatureName isEqualToString:@"C#m"])
    {
        [self setNumberOfAccidentals:4 isSharpKey:true];
    }
    else if([keySignatureName isEqualToString:@"B"] || [keySignatureName isEqualToString:@"G#m"])
    {
        [self setNumberOfAccidentals:5 isSharpKey:true];
    }
    else if([keySignatureName isEqualToString:@"F#"] || [keySignatureName isEqualToString:@"D#m"])
    {
        [self setNumberOfAccidentals:6 isSharpKey:true];
    }
    else if([keySignatureName isEqualToString:@"C#"] || [keySignatureName isEqualToString:@"A#m"])
    {
        [self setNumberOfAccidentals:7 isSharpKey:true];
    }
    else if([keySignatureName isEqualToString:@"F"] || [keySignatureName isEqualToString:@"Dm"])
    {
        [self setNumberOfAccidentals:1 isSharpKey:false];
    }
    else if([keySignatureName isEqualToString:@"Bb"] || [keySignatureName isEqualToString:@"Gm"])
    {
        [self setNumberOfAccidentals:2 isSharpKey:false];
    }
    else if([keySignatureName isEqualToString:@"Eb"] || [keySignatureName isEqualToString:@"Cm"])
    {
        [self setNumberOfAccidentals:3 isSharpKey:false];
    }
    else if([keySignatureName isEqualToString:@"Ab"] || [keySignatureName isEqualToString:@"Fm"])
    {
        [self setNumberOfAccidentals:4 isSharpKey:false];
    }
    else if([keySignatureName isEqualToString:@"Db"] || [keySignatureName isEqualToString:@"Bbm"])
    {
        [self setNumberOfAccidentals:5 isSharpKey:false];
    }
    else if([keySignatureName isEqualToString:@"Gb"] || [keySignatureName isEqualToString:@"Ebm"])
    {
        [self setNumberOfAccidentals:6 isSharpKey:false];
    }
    else if([keySignatureName isEqualToString:@"Cb"] || [keySignatureName isEqualToString:@"Abm"])
    {
        [self setNumberOfAccidentals:7 isSharpKey:false];
    }
    else
    {
        [self setNumberOfAccidentals:0 isSharpKey:false];
    }
}

- (void)setNumberOfAccidentals:(int)numAccidentals isSharpKey:(BOOL)isSharp
{
    numberOfAccidentals = numAccidentals;
    isSharpKey = isSharp;
}


@end
