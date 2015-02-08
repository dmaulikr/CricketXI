//
//  MatchLiveScoreBoardViewController.h
//  CricketXI
//
//  Created by GAUTAM TIWARI on 08/02/15.
//  Copyright (c) 2015 RAGA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MatchLiveScoreBoardViewController : UIViewController{

    int pageNumber;
}
@property (nonatomic, retain) IBOutlet UILabel *pageNumberLabel;

- (id)initWithPageNumber:(int)page;


@end





