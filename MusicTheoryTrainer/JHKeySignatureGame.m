//
//  JHKeySignatureGame.m
//  KeySignatureQuiz
//
//  Created by Fupduck Central MBP on 1/19/14.
//  Copyright (c) 2014 Jess Hendricks. All rights reserved.
//

#import "JHKeySignatureGame.h"
#import "JHMusicView.h"
#import "KeySignature.h"
#import "JHKeyAndClef.h"

@implementation JHKeySignatureGame
@synthesize currentKeySignature;

- (id)initWithView:(JHMusicView *)newMainMusicView
   instructionText:(NSTextField *)instructionText
            button:(NSButton *)mainButton
       qNumDisplay:(NSTextField *)questionNumberDisplay
      scoreDisplay:(NSTextField *)scoreDisplay
       answerField:(NSTextField *)answerField
        difficulty:(double)difficulty
     questionCount:(int)numberOfQuestions
        staffWidth:(float)width
       staffHeight:(float)height
{
    [self setMainButton:mainButton];
    [self setAnswerField:answerField];
    [self setMainMusicView:newMainMusicView];
    [self setInstructionalText:instructionText];
    [self setQuestionNumberDisplay:questionNumberDisplay];
    [self setScoreDisplay:scoreDisplay];
    
    [self setGameState:START];
    [self setCurrentKeySignature:[KeySignature sharedKeySignature]];
    [self setCurrentClef:TREBLE];
    [self setStaffHeight:height];
    [self setStaffWidth:width];
    [self setMusicFontSize:self.staffHeight + (self.staffHeight * .03)];
    [self setDifficultyLevel:difficulty];
    [self setNumberOfQuestions:numberOfQuestions];
    [self setQuestionCount:0];
    [self setCurrentScore:0];
    [self.instructionalText setStringValue:@"Click button to start the game."];
    [self.mainButton setTitle:@"Start Quiz"];
    
    //[self newGame];
    
    return self;
}



/*
 *  ____________________Set up NSMutableArray to hold the key/clef combos for the quiz.
 */

- (void)fillKeyAndClefs
{
    if (self.difficultyLevel >= EASY) {
        for (int clef = 1; clef <= 2; clef++) {
            [self.keyAndClefs addObject:[self newKeyObject:@"C" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"G" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"F" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"D" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"Bb" clef:clef]];
        }
    }
    if (self.difficultyLevel >= MEDIUM) {
        for (int clef = 1; clef <= 2; clef++) {
            [self.keyAndClefs addObject:[self newKeyObject:@"A" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"Eb" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"E" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"Ab" clef:clef]];
        }
    }
    if (self.difficultyLevel >= HARD) {
        for (int clef = 3; clef <= 4; clef++) {
            [self.keyAndClefs addObject:[self newKeyObject:@"C" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"G" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"F" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"D" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"Bb" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"A" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"Eb" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"E" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"Ab" clef:clef]];
        }
        
    }
    if (self.difficultyLevel >= EXPERT) {
        for (int clef = 1; clef <= 4; clef++) {
            [self.keyAndClefs addObject:[self newKeyObject:@"B" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"Db" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"F#" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"Gb" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"C#" clef:clef]];
            [self.keyAndClefs addObject:[self newKeyObject:@"Cb" clef:clef]];
        }
    }
    [self shuffleKeysAndClefs];
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

- (JHKeyAndClef *)newKeyObject:(NSString *)keySig clef:(int)clef
{
    return [[JHKeyAndClef alloc] initWithKeySignature:keySig andClef:clef];
}

- (void)changeDifficulty:(int)newDifficulty
{
    if (self.keyAndClefs.count > 0) {
        [self.keyAndClefs removeAllObjects];
    }
    [self setDifficultyLevel:newDifficulty];
    [self fillKeyAndClefs];
}

- (void)setNewKeyAndClef
{
    [self setCurrentClef:[self.keyAndClefs.lastObject clef]];
    [currentKeySignature setCurrentClef:self.currentClef];
    [currentKeySignature setNewKeySignature:[self.keyAndClefs.lastObject keySignature]];
    [self setupStaffAndClef];
    
}


- (void)setupStaffAndClef
{
    [self.mainMusicView drawStaffWithClef:self.currentClef
                               staffWidth:self.staffWidth
                              staffHeight:self.staffHeight
                            musicFontSize:self.musicFontSize];
    
    [currentKeySignature setLineAndStaffWithStaffWidth:self.staffWidth
                                           staffHeight:self.staffHeight
                                         view_x_Center:self.mainMusicView.musicView_x_center
                                         view_y_Center:self.mainMusicView.musicView_y_center
                                             flatWidth:self.mainMusicView.flatWidth
                                            sharpWidth:self.mainMusicView.sharpWidth
                                             clefWidth:self.mainMusicView.clefWidth];
}

- (void)newGame
{
    [self.keyAndClefs removeAllObjects];
    [self setQuestionCount:0];
    [self setCurrentScore:0];
    [self.scoreDisplay setStringValue:[NSString stringWithFormat:@"%i", self.currentScore]];
    [self setupStaffAndClef];
    [self setKeyAndClefs:[[NSMutableArray alloc] init]];
    [self fillKeyAndClefs];
    [self.mainMusicView setNeedsDisplay:true];
}

- (bool)checkAnswer
{
    if ([[self.answerField stringValue] isEqualToString:[[self.keyAndClefs lastObject] keySignature]]) {
        [self setCurrentScore:self.currentScore + 10];
        [self.scoreDisplay setStringValue:[NSString stringWithFormat:@"%i", self.currentScore]];
        return TRUE;
    } else {
        return FALSE;
    }
}



- (void)newQuestionWithState:(int)state
                   getNewKey:(BOOL)getNewKey
             answerFieldText:(NSString *)answerText
                  buttonText:(NSString *)buttonText
                instructions:(NSString *)instructions
          answerFieldEnabled:(BOOL)enabled
{
    [self setGameState:state];
    if (getNewKey) {
        [self setNewKeyAndClef];
    }
    [self.answerField setStringValue:answerText];
    [self.mainButton setTitle:buttonText];
    [self.instructionalText setStringValue:instructions];
    [self.answerField setEnabled:enabled];
}

- (void)incrementQuestionCount
{
    self.questionCount++;
    [self.questionNumberDisplay setStringValue:[NSString stringWithFormat:@"%i out of %i", self.questionCount, self.numberOfQuestions]];
}



- (void)changeGameState
{
    if (self.gameState == START)
    {
        [self newGame];
        [self incrementQuestionCount];
        [self newQuestionWithState:WAITING_FOR_ANSWER
                         getNewKey:TRUE
                   answerFieldText:@""
                        buttonText:@"Submit Answer"
                      instructions:@"Identify the key signature.\nMake sure to properly capitalize the key."
                answerFieldEnabled:TRUE];
        [self.answerField becomeFirstResponder];
    }
    else if (self.gameState == WAITING_FOR_ANSWER)
    {
        if ([self checkAnswer]) {
            [self newQuestionWithState:WAITING_FOR_NEXT
                             getNewKey:FALSE
                       answerFieldText:@""
                            buttonText:@"Next"
                          instructions:@"Correct!\nClick 'Next' to continue."
                    answerFieldEnabled:FALSE];
            [self.mainButton becomeFirstResponder];
            
        } else {
            [self newQuestionWithState:WAITING_FOR_NEXT
                             getNewKey:FALSE
                       answerFieldText:@""
                            buttonText:@"Next"
                          instructions:@"Incorrect.\nClick 'Next' to continue."
                    answerFieldEnabled:FALSE];
            [self.mainButton becomeFirstResponder];
        }
    }
    else if (self.gameState == WAITING_FOR_NEXT)
    {
        [self.keyAndClefs removeLastObject];
        if (self.questionCount != self.numberOfQuestions) {
            [self newQuestionWithState:WAITING_FOR_ANSWER
                             getNewKey:TRUE
                       answerFieldText:@""
                            buttonText:@"Submit Answer"
                          instructions:@"Identify the key signature.\nMake sure to properly capitalize the key."
                    answerFieldEnabled:TRUE];
            [self.answerField becomeFirstResponder];
            [self incrementQuestionCount];
        } else {
            [self newQuestionWithState:ENDED
                             getNewKey:FALSE
                       answerFieldText:@""
                            buttonText:@"New Game"
                          instructions:@"Game over.\nClick 'New Game' to play again."
                    answerFieldEnabled:FALSE];
            [self.mainButton becomeFirstResponder];
            
        }
    }
    else if (self.gameState == ENDED)
    {
        [self newGame];
        [self incrementQuestionCount];
        [self newQuestionWithState:WAITING_FOR_ANSWER
                         getNewKey:TRUE
                   answerFieldText:@""
                        buttonText:@"Submit Answer"
                      instructions:@"Identify the key signature.\nMake sure to properly capitalize the key."
                answerFieldEnabled:TRUE];
        [self.answerField becomeFirstResponder];
    }
}





@end
