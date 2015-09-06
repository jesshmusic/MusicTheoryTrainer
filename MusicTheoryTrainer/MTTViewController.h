//
//  MTTViewController.h
//  MusicTheoryDrills
//
//  Created by Jess Hendricks on 9/5/15.
//  Copyright (c) 2015 Jess Hendricks. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "User.h"

@interface MTTViewController : NSViewController
{
    double difficultyLevel;
    User *currentUser;
}

@property (weak) IBOutlet NSSlider *difficultySlider;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong) IBOutlet NSArrayController *mttUserArrayCtrl;
@property (weak) IBOutlet NSButton *keySigGameButton;

- (IBAction)setDifficulty:(id)sender;
- (IBAction)tableViewClicked:(id)sender;

@end
