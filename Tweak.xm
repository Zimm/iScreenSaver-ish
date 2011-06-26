#import <objc/runtime.h>
#import <SpringBoard/SpringBoard.h>


%hook SpringBoard

- (void)didIdle
{
	%orig;
	[UIView beginAnimations:nil context:NULL];
	[[[objc_getClass("SBIconController") sharedInstance] contentView] setAlpha:0.0f];
	[UIView commitAnimations];
}


-(void)resetIdleTimerAndUndim
{
	%orig;
	[UIView beginAnimations:nil context:NULL];
	[[[objc_getClass("SBIconController") sharedInstance] contentView] setAlpha:1.0f];
	[UIView commitAnimations];
}

%end

%hook SBAwayController

-(void)unlockWithSound:(BOOL)sound
{
	%orig;
	[[[objc_getClass("SBIconController") sharedInstance] contentView] setAlpha:1.0f];
}

%end
