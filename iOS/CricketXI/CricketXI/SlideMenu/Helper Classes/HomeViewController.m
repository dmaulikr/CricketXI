//
//  HomeViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "HomeViewController.h"
#import "LeftMenuViewController.h"

#define kNumberOfPages      3

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 503);
	self.portraitSlideOffsetSegment.selectedSegmentIndex = [self indexFromPixels:[SlideNavigationController sharedInstance].portraitSlideOffset];
	self.landscapeSlideOffsetSegment.selectedSegmentIndex = [self indexFromPixels:[SlideNavigationController sharedInstance].landscapeSlideOffset];
	self.panGestureSwitch.on = [SlideNavigationController sharedInstance].enableSwipeGesture;
	self.shadowSwitch.on = [SlideNavigationController sharedInstance].enableShadow;
	self.limitPanGestureSwitch.on = ([SlideNavigationController sharedInstance].panGestureSideOffset == 0) ? NO : YES;
	self.slideOutAnimationSwitch.on = ((LeftMenuViewController *)[SlideNavigationController sharedInstance].leftMenu).slideOutAnimationEnabled;
    _viewControllers = [[NSMutableArray alloc] init];
    [self initialisingScoreBoardVC];
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
	return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
	return YES;
}

#pragma mark - IBActions -

- (IBAction)bounceMenu:(id)sender
{
	static Menu menu = MenuLeft;
	
	[[SlideNavigationController sharedInstance] bounceMenu:menu withCompletion:nil];
	
	menu = (menu == MenuLeft) ? MenuRight : MenuLeft;
}

- (IBAction)slideOutAnimationSwitchChanged:(UISwitch *)sender
{
	((LeftMenuViewController *)[SlideNavigationController sharedInstance].leftMenu).slideOutAnimationEnabled = sender.isOn;
}

- (IBAction)limitPanGestureSwitchChanged:(UISwitch *)sender
{
	[SlideNavigationController sharedInstance].panGestureSideOffset = (sender.isOn) ? 50 : 0;
}

- (IBAction)changeAnimationSelected:(id)sender
{
	[[SlideNavigationController sharedInstance] openMenu:MenuRight withCompletion:nil];
}

- (IBAction)shadowSwitchSelected:(UISwitch *)sender
{
	[SlideNavigationController sharedInstance].enableShadow = sender.isOn;
}

- (IBAction)enablePanGestureSelected:(UISwitch *)sender
{
	[SlideNavigationController sharedInstance].enableSwipeGesture = sender.isOn;
}

- (IBAction)portraitSlideOffsetChanged:(UISegmentedControl *)sender
{
	[SlideNavigationController sharedInstance].portraitSlideOffset = [self pixelsFromIndex:sender.selectedSegmentIndex];
}

- (IBAction)landscapeSlideOffsetChanged:(UISegmentedControl *)sender
{
	[SlideNavigationController sharedInstance].landscapeSlideOffset = [self pixelsFromIndex:sender.selectedSegmentIndex];
}

#pragma mark - Helpers -

- (NSInteger)indexFromPixels:(NSInteger)pixels
{
	if (pixels == 60)
		return 0;
	else if (pixels == 120)
		return 1;
	else
		return 2;
}

- (NSInteger)pixelsFromIndex:(NSInteger)index
{
	switch (index)
	{
		case 0:
			return 60;
			
		case 1:
			return 120;
			
		case 2:
			return 200;
			
		default:
			return 0;
	}
}

- (void) initialisingScoreBoardVC{

    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < kNumberOfPages; i++) {
        [controllers addObject:[NSNull null]];
    }
    _viewControllers = controllers;
    
    _matchScoreCardScrollView.pagingEnabled = YES;
    _matchScoreCardScrollView.contentSize = CGSizeMake(_matchScoreCardScrollView.frame.size.width * kNumberOfPages, _matchScoreCardScrollView.frame.size.height);
    _matchScoreCardScrollView.showsHorizontalScrollIndicator = NO;
    _matchScoreCardScrollView.showsVerticalScrollIndicator = NO;
    _matchScoreCardScrollView.scrollsToTop = NO;
    _matchScoreCardScrollView.delegate = self;
    
    
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];

}



- (void)loadScrollViewWithPage:(int)page {
    if (page < 0) return;
    if (page >= kNumberOfPages) return;
    
    MatchLiveScoreBoardViewController *controller = [_viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null]) {
        controller = [[MatchLiveScoreBoardViewController alloc] initWithPageNumber:page];
        [_viewControllers replaceObjectAtIndex:page withObject:controller];
    }
    
    if (nil == controller.view.superview) {
        CGRect frame = _matchScoreCardScrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        [_matchScoreCardScrollView addSubview:controller.view];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)sender {
    if (pageControlUsed) {
        return;
    }
    CGFloat pageWidth = _matchScoreCardScrollView.frame.size.width;
    int page = floor((_matchScoreCardScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlUsed = NO;
}

@end
