//
//  KeySigIdentViewController.m
//  MusicTheoryDrills
//
//  Created by Jess Hendricks on 9/4/15.
//  Copyright (c) 2015 Jess Hendricks. All rights reserved.
//

#import "KeySigIdentViewController.h"
//#import "KeySigIdentification.h"
#import "KeySigGameController.h"
#import "MusicDisplayView.h"
#import "KeySignature.h"
#import "KeySigAndClef.h"
#import "Staff.h"

@interface KeySigIdentViewController ()

@end

@implementation KeySigIdentViewController
@synthesize currentUser, managedObjectContext;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do view setup here.
    [self.instructionalText setStringValue:@"Click button to start the game."];
    [self.mainButton setTitle:@"Start Quiz"];
    [self.answerField setEnabled:false];
    [self.moduleName setStringValue:[NSString stringWithFormat:@"Key Signature Identification Level: %i", (int)self.difficultyLevel]];
    keySigGame = [[KeySigGameController alloc] initWithDifficultyLevel:self.difficultyLevel numberOfQuestions:self.numberOfQuestions];
    [self.mainMusicView setupMusicObjects];
}

- (IBAction)submitAnswer:(id)sender
{
    if (keySigGame.gameState == START) {
        [keySigGame startNewGame];
        [self.answerField setEnabled:true];
        [self.mainButton setTitle:@"Submit Answer"];
        [self.instructionalText setStringValue:@"Identify the key signature.\nMake sure to properly capitalize the key."];
        [self.questionNumberDisplay setStringValue:[NSString stringWithFormat:@"%i out of %i", keySigGame.questionCount, keySigGame.numberOfQuestions]];
        [self addStaffWithClef:keySigGame.currentClef staffWidth:900 staffHeight:80 x:26 y:132];
        [self.answerField becomeFirstResponder];
    } else if (keySigGame.gameState == WAITING_FOR_ANSWER) {
        if ([keySigGame checkAnswer:[self.answerField stringValue]]) {
            if (keySigGame.gameState == WAITING_FOR_NEXT) {
                [self.instructionalText setStringValue:@"CORRECT!\nClick 'Next' to continue."];
                [self.mainButton setTitle:@"Next"];
                [self.answerField setStringValue:@""];
                [self.answerField setEnabled:false];
                [self.scoreDisplay setStringValue: [NSString stringWithFormat:@"%i", keySigGame.currentScore]];
            } else {
                [self.instructionalText setStringValue:@"CORRECT!\nGAME OVER.\nClick 'New Game' to return to the main menu."];
                [self.mainButton setTitle:@"New Game"];
                [self.answerField setStringValue:@""];
                [self.answerField setEnabled:false];
                [self.scoreDisplay setStringValue: [NSString stringWithFormat:@"%i", keySigGame.currentScore]];
                [self calculateUserXP];
            }
            [self.mainButton becomeFirstResponder];
        } else {
            if (keySigGame.gameState == WAITING_FOR_NEXT) {
                [self.instructionalText setStringValue:[NSString stringWithFormat:@"INCORRECT. The correct answer is: %@\nClick 'Next' to continue.", keySigGame.currentKey.keySignatureName]];
                [self.mainButton setTitle:@"Next"];
                [self.answerField setStringValue:@""];
                [self.answerField setEnabled:false];
                [self.scoreDisplay setStringValue: [NSString stringWithFormat:@"%i", keySigGame.currentScore]];
            } else {
                [self.instructionalText setStringValue:@"GAME OVER.\nClick 'New Game' to return to the main menu."];
                [self.mainButton setTitle:@"New Game"];
                [self.answerField setStringValue:@""];
                [self.answerField setEnabled:false];
                [self.scoreDisplay setStringValue: [NSString stringWithFormat:@"%i", keySigGame.currentScore]];
                [self calculateUserXP];
            }
            [self.mainButton becomeFirstResponder];
        }
    } else if (keySigGame.gameState == WAITING_FOR_NEXT) {
        [keySigGame generateNextKey];
        [self.answerField setEnabled:true];
        [self.mainButton setTitle:@"Submit Answer"];
        [self.instructionalText setStringValue:@"Identify the key signature.\nMake sure to properly capitalize the key."];
        [self.questionNumberDisplay setStringValue:[NSString stringWithFormat:@"%i out of %i", keySigGame.questionCount, keySigGame.numberOfQuestions]];
        [self addStaffWithClef:keySigGame.currentClef staffWidth:900 staffHeight:80 x:26 y:132];
        [self.answerField becomeFirstResponder];
    } else {
        [self.instructionalText setStringValue:@"Sending to main menu... eventually."];
        [self dismissViewController:self];
    }
}


- (void)calculateUserXP
{
    int currentUserXP = [currentUser.xp intValue];
    currentUserXP += keySigGame.currentScore;
    [currentUser setXp:[NSNumber numberWithInt:currentUserXP]];
    [currentUser checkLevel];
    NSLog(@"Student level: %@", currentUser.level);
    NSError *error = nil;
    if ([self.managedObjectContext save:&error] == NO)
    {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    NSLog(@"%@ xp: %@", currentUser.name, currentUser.xp);
}

- (void)addStaffWithClef:(int)clef
              staffWidth:(float)width
             staffHeight:(float)height
                       x:(float)xStart
                       y:(float)yStart
{
    Staff *newStaff = [[Staff alloc] initWithWidth:width height:height xStart:xStart yStart:yStart keySignature:keySigGame.currentKey clef:clef];
    [self.mainMusicView drawStaffWithClef:clef staff:newStaff];
}

@end
