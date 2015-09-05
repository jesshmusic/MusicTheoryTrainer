//
//  MTTViewController.h
//  MusicTheoryDrills
//
//  Created by Jess Hendricks on 9/5/15.
//  Copyright (c) 2015 Jess Hendricks. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MTTViewController : NSViewController
{
    double difficultyLevel;
}

@property (weak) IBOutlet NSSlider *difficultySlider;

- (IBAction)setDifficulty:(id)sender;

@end
