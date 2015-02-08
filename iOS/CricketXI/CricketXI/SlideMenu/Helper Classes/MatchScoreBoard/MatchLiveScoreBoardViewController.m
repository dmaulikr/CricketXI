//
//  MatchLiveScoreBoardViewController.m
//  CricketXI
//
//  Created by GAUTAM TIWARI on 08/02/15.
//  Copyright (c) 2015 RAGA. All rights reserved.
//

#import "MatchLiveScoreBoardViewController.h"

static NSArray *__pageControlColorList = nil;

#define kFlagBackgroundColor     [UIColor colorWithRed:215.0/255.0 green:215.0/255.0 blue:215.0/255.0 alpha:1.0]

@interface MatchLiveScoreBoardViewController ()

@end

@implementation MatchLiveScoreBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _pageNumberLabel.text = [NSString stringWithFormat:@"Page %d", pageNumber + 1];
    self.view.backgroundColor = kFlagBackgroundColor;
    
//    UIButton *fullScoreCardButton = [UIButton but]
    
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (id)initWithPageNumber:(int)page {
    if (self = [super initWithNibName:@"MatchLiveScoreBoardViewController" bundle:nil])    {
        pageNumber = page;
    }
    return self;
}

@end
