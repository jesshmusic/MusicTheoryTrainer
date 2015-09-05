//
//  KeySigGameController.h
//  MusicTheoryTrainer
//
//  Created by Fupduck Central MBP on 3/23/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <math.h>

@class KeySignature;

@interface KeySigGameController : NSObject

@property KeySignature *currentKey;
@property int gameState;
@property int numberOfQuestions;
@property int questionCount;
@property int currentScore;

@property (assign) int currentClef;
@property double difficultyLevel;
@property NSMutableArray *keyAndClefs;

@property NSString *currentAnswer;
@property NSString *instructionText;

-(id)initWithDifficultyLevel:(double)difficulty
           numberOfQuestions:(int)numQuestions;

-(void)startNewGame;

-(void)generateNextKey;

-(bool)checkAnswer:(NSString*)answer;

//-(void)ChangeGameState;

@end
