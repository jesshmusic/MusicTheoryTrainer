//
//  KeySigGameController.m
//  MusicTheoryTrainer
//
//  Created by Fupduck Central MBP on 3/23/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import "KeySigGameController.h"
#import "KeySignature.h"
#import "MusicTheoryConstants.h"
#import "KeySigAndClef.h"

@implementation KeySigGameController

-(id)initWithDifficultyLevel:(double)difficulty
           numberOfQuestions:(int)numQuestions
{
    [self setDifficultyLevel:difficulty];
    [self setNumberOfQuestions:numQuestions];
    [self setCurrentKey:[KeySignature sharedKeySignature]];
    [self setGameState:START];
    [self setQuestionCount:1];
    [self setCurrentScore:0];
    return self;
}

-(void)startNewGame
{
    [self setKeyAndClefs:[[NSMutableArray alloc] init]];
    [self fillKeyAndClefs];
    [self generateNextKey];
}

-(void)generateNextKey
{
    [self setCurrentClef:[self.keyAndClefs.lastObject clef]];
    [self.currentKey setNewKeySignature:[self.keyAndClefs.lastObject keySignature]];
    [self.keyAndClefs removeLastObject];
    
    //  Change Game State
    [self setGameState:WAITING_FOR_ANSWER];
}

-(bool)checkAnswer:(NSString*)answer
{
    bool isCorrectAnswer;
    if ([answer isEqualToString:self.currentKey.keySignatureName]) {
        [self setCurrentScore:self.currentScore + 10];
        isCorrectAnswer = TRUE;
    } else {
        isCorrectAnswer = FALSE;
    }
    //  Change Game State
    self.questionCount++;
    if (self.questionCount > self.numberOfQuestions) {
        self.gameState = ENDED;
    } else {
        self.gameState = WAITING_FOR_NEXT;
    }
    return isCorrectAnswer;
}

/*
 *  ____________________Set up NSMutableArray to hold the key/clef combos for the quiz.
 */

- (void)fillKeyAndClefs
{
    if (self.difficultyLevel >= EASY) {
        for (int clef = 1; clef <= 2; clef++) {
            NSArray *keysToAdd = [[NSArray alloc] initWithObjects:@"C", @"G", @"F", @"D", @"Bb", nil];
            [self addKeysToKeyAndClefs:keysToAdd clef:clef];
        }
    }
    if (self.difficultyLevel >= MEDIUM) {
        for (int clef = 1; clef <= 2; clef++) {
            NSArray *keysToAdd = [[NSArray alloc] initWithObjects:@"A", @"Eb", @"E", @"Ab",  nil];
            [self addKeysToKeyAndClefs:keysToAdd clef:clef];
        }
    }
    if (self.difficultyLevel >= HARD) {
        for (int clef = 3; clef <= 4; clef++) {
            NSArray *keysToAdd = [[NSArray alloc] initWithObjects:@"C", @"G", @"F", @"D", @"Bb", @"A", @"Eb", @"E", @"Ab", nil];
            [self addKeysToKeyAndClefs:keysToAdd clef:clef];
        }
        
    }
    if (self.difficultyLevel >= EXPERT) {
        for (int clef = 1; clef <= 4; clef++) {
            NSArray *keysToAdd = [[NSArray alloc] initWithObjects:@"B", @"Db", @"F#", @"Gb", @"C#", @"Cb", nil];
            [self addKeysToKeyAndClefs:keysToAdd clef:clef];
        }
    }
    [self shuffleKeysAndClefs];
}

- (void)addKeysToKeyAndClefs:(NSArray *)newKeys clef:(int)clef
{
    for (NSString *keyName in newKeys) {
        [self.keyAndClefs addObject:[self newKeyObject:keyName clef:clef]];
    }
}

- (void)shuffleKeysAndClefs
{
    NSInteger count = self.keyAndClefs.count;
    for (NSInteger i = 0; i < count; ++i) {
        NSInteger nElements = count - i;
        NSInteger n = arc4random_uniform((uint32_t)nElements) + i;
        [self.keyAndClefs exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

- (KeySigAndClef *)newKeyObject:(NSString *)keySig clef:(int)clef
{
    return [[KeySigAndClef alloc] initWithKeySignature:keySig andClef:clef];
}

@end
