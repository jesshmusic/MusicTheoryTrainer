//
//  MTTViewController.m
//  MusicTheoryDrills
//
//  Created by Jess Hendricks on 9/5/15.
//  Copyright (c) 2015 Jess Hendricks. All rights reserved.
//

#import "MTTViewController.h"
#import "KeySigIdentViewController.h"

@interface MTTViewController ()

@end

@implementation MTTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    difficultyLevel = [self.difficultySlider doubleValue];
}

- (IBAction)setDifficulty:(id)sender
{
    difficultyLevel = [self.difficultySlider doubleValue];
}

-(void)prepareForSegue:(NSStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"KeySigGameView"]) {
        KeySigIdentViewController *keySigGameView = [segue destinationController];
        keySigGameView.difficultyLevel = difficultyLevel;
        keySigGameView.numberOfQuestions = 10;
    }
}
@end
