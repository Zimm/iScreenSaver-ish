#import <objc/runtime.h>
#import <SpringBoard/SpringBoard.h>


%hook SpringBoard

- (void)didIdle
{
	%orig;
	[UIView beginAnimations:nil context:NULL];
	[[[%c(SBIconController) sharedInstance] contentView] setAlpha:0.0f];
	[UIView commitAnimations];
}


-(void)resetIdleTimerAndUndim
{
	%orig;
	[UIView beginAnimations:nil context:NULL];
	[[[%c(SBIconController) sharedInstance] contentView] setAlpha:1.0f];
	[UIView commitAnimations];
}

-(double)nextLockTimeDuration
{
	return %orig + 30;
}

%end

%hook SBAwayController

-(void)unlockWithSound:(BOOL)sound
{
	%orig;
	[[[%c(SBIconController) sharedInstance] contentView] setAlpha:1.0f];
}

%end
