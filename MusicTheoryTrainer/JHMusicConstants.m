//
//  JHMusicUnicodes.m
//  KeySignatureQuiz
//
//  Created by Fupduck Central MBP on 1/18/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import "JHMusicConstants.h"

@implementation JHMusicConstants



//Unicodes for Music Items
unichar const TREBLE_CLEF = 0xE060;
unichar const BASS_CLEF = 0xE06F;
unichar const ALTO_CLEF = 0xE06B;
unichar const TENOR_CLEF = 0xE06B;

//unichar const STAFF = 0xE024;

unichar const SHARP_SIGN = 0x266F;
unichar const FLAT_SIGN = 0x266D;


//Clef Constants
int const TREBLE = 1;
int const BASS = 2;
int const ALTO = 3;
int const TENOR = 4;


//Game Setting Constants
double const EASY = 1.0;          //changed from 100.0 for new array idea
double const MEDIUM = 2.0;            //changed from 125.0 for new array idea
double const HARD = 3.0;    //changed from 150.0 for new array idea
double const EXPERT = 4.0;          //changed from 200.0 for new array idea

//Game States
int const START = 1;
int const WAITING_FOR_ANSWER = 2;
int const WAITING_FOR_NEXT = 3;
int const ENDED = 4;

@end
