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
//@synthesize currentKeySignature;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do view setup here.
    [self.instructionalText setStringValue:@"Click button to start the game."];
    [self.mainButton setTitle:@"Start Quiz"];
    [self.answerField setEnabled:false];
    keySigGame = [[KeySigGameController alloc] initWithDifficultyLevel:self.difficultyLevel numberOfQuestions:self.numberOfQuestions];
    
    //  TESTING
    //    [self setCurrentClef:3];
    //    [self setCurrentKeySignature:[KeySignature sharedKeySignature]];
    //    [currentKeySignature setNewKeySignature:@"C"];
    //    [self addStaffWithClef:self.currentClef staffWidth:900 staffHeight:80.0 x:26 y:132.0];
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
            }
            [self.mainButton becomeFirstResponder];
        } else {
            if (keySigGame.gameState == WAITING_FOR_NEXT) {
                [self.instructionalText setStringValue:@"INCORRECT.\nClick 'Next' to continue."];
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
    }
}


- (void)addStaffWithClef:(int)clef
              staffWidth:(float)width
             staffHeight:(float)height
                       x:(float)xStart
                       y:(float)yStart
{
    Staff *newStaff = [[Staff alloc] initWithWidth:width height:height xStart:xStart yStart:yStart keySignature:keySigGame.currentKey clef:clef];
    //    NSLog(@"%@", newStaff.description);
    [self.mainMusicView drawStaffWithClef:clef staff:newStaff];
}



// For TESTING:
//- (IBAction)changeClef:(id)sender
//{
//    switch (_currentClef) {
//        case 1:
//            [self setCurrentClef:2];
//            break;
//        case 2:
//            [self setCurrentClef:3];
//            break;
//        case 3:
//            [self setCurrentClef:4];
//            break;
//        case 4:
//            [self setCurrentClef:1];
//            break;
//
//        default:
//            break;
//    }
//    [self addStaffWithClef:self.currentClef staffWidth:900 staffHeight:80.0 x:26 y:132.0];
//}
//
//- (IBAction)changeKey:(id)sender {
//    NSString *newKeyName = currentKeySignature.keySignatureName;
//    if ([currentKeySignature.keySignatureName isEqualToString:@"C"]) {
//        newKeyName = @"G";
//    } else if ([currentKeySignature.keySignatureName isEqualToString:@"G"]) {
//        newKeyName = @"D";
//    } else if ([currentKeySignature.keySignatureName isEqualToString:@"D"]) {
//        newKeyName = @"A";
//    } else if ([currentKeySignature.keySignatureName isEqualToString:@"A"]) {
//        newKeyName = @"E";
//    } else if ([currentKeySignature.keySignatureName isEqualToString:@"E"]) {
//        newKeyName = @"B";
//    } else if ([currentKeySignature.keySignatureName isEqualToString:@"B"]) {
//        newKeyName = @"F#";
//    } else if ([currentKeySignature.keySignatureName isEqualToString:@"F#"]) {
//        newKeyName = @"C#";
//    } else if ([currentKeySignature.keySignatureName isEqualToString:@"C#"]) {
//        newKeyName = @"Cb";
//    } else if ([currentKeySignature.keySignatureName isEqualToString:@"Cb"]) {
//        newKeyName = @"Gb";
//    } else if ([currentKeySignature.keySignatureName isEqualToString:@"Gb"]) {
//        newKeyName = @"Db";
//    } else if ([currentKeySignature.keySignatureName isEqualToString:@"Db"]) {
//        newKeyName = @"Ab";
//    } else if ([currentKeySignature.keySignatureName isEqualToString:@"Ab"]) {
//        newKeyName = @"Eb";
//    } else if ([currentKeySignature.keySignatureName isEqualToString:@"Eb"]) {
//        newKeyName = @"Bb";
//    } else if ([currentKeySignature.keySignatureName isEqualToString:@"Bb"]) {
//        newKeyName = @"F";
//    } else if ([currentKeySignature.keySignatureName isEqualToString:@"F"]) {
//        newKeyName = @"C";
//    }
//    [currentKeySignature setNewKeySignature:newKeyName];
//    [self addStaffWithClef:self.currentClef staffWidth:900 staffHeight:80.0 x:26 y:132.0];
//}

@end
