%hook SBFLockScreenDateView
-(void)setUseCompactDateFormat:(BOOL)arg1 {
    %orig(YES); //pass the bool arg to = yes inside %orig
}
%end

%hook SBScreenWakeAnimationController
- (void)_startWakeAnimationsForWaking:(_Bool)arg1 animationSettings:(id)arg2{
  %orig(arg1,nil); // fixes the laggy bug on ios11 when u wake device
	}
%end
