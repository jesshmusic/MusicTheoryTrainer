//
//  MTTViewController.m
//  MusicTheoryDrills
//
//  Created by Jess Hendricks on 9/5/15.
//  Copyright (c) 2015 Jess Hendricks. All rights reserved.
//

#import "MTTViewController.h"
#import "KeySigIdentViewController.h"
#import "AppDelegate.h"

@interface MTTViewController ()

@end

@implementation MTTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *delegate = (AppDelegate *) [[NSApplication sharedApplication] delegate];
    self.managedObjectContext = delegate.managedObjectContext;
    difficultyLevel = [self.difficultySlider doubleValue];
    currentUser = (User *)[self.mttUserArrayCtrl selection];
    if (currentUser == nil) {
        self.keySigGameButton.enabled = false;
    }
}

- (IBAction)setDifficulty:(id)sender
{
    difficultyLevel = [self.difficultySlider doubleValue];
}

- (IBAction)tableViewClicked:(id)sender {
    currentUser = [[self.mttUserArrayCtrl selectedObjects] firstObject];
    if (currentUser != nil) {
        self.keySigGameButton.enabled = true;
    }
}

-(void)prepareForSegue:(NSStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"KeySigGameView"]) {
        KeySigIdentViewController *keySigGameView = [segue destinationController];
        keySigGameView.difficultyLevel = difficultyLevel;
        keySigGameView.numberOfQuestions = 10;
        keySigGameView.managedObjectContext = self.managedObjectContext;
        keySigGameView.currentUser = currentUser;
    }
}
@end
