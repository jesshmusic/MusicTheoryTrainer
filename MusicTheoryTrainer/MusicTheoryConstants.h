//
//  JHMusicUnicodes.h
//  KeySignatureQuiz
//
//  Created by Fupduck Central MBP on 1/18/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MusicTheoryConstants : NSObject


extern unichar const TREBLE_CLEF;
extern unichar const BASS_CLEF;
extern unichar const ALTO_CLEF;
extern unichar const TENOR_CLEF;

extern unichar const STAFF_LINES;

extern unichar const SHARP_SIGN;
extern unichar const FLAT_SIGN;

//Clef Constants
extern int const TREBLE;
extern int const BASS;
extern int const ALTO;
extern int const TENOR;


//Game Setting Constants
extern double const EASY;
extern double const MEDIUM;
extern double const HARD;
extern double const EXPERT;

//Game States
extern int const START;
extern int const WAITING_FOR_ANSWER;
extern int const WAITING_FOR_NEXT;
extern int const ENDED;

@end
