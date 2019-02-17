%hook SBFLockScreenDateView
-(void)setUseCompactDateFormat:(BOOL)arg1 {
    %orig(YES); //pass the bool arg to = yes inside %orig
}
%end

/*
now its time to fix the wake up lag causing the date to go crazy
*/

@interface SBAnimationSettings
@end

@interface SBWakeAnimationSettings
@property(retain, nonatomic) SBAnimationSettings *dateWakeSettings;
- (void)setDefaultValues;
@end

%hook SBWakeAnimationSettings
- (void)setDefaultValues {
  %orig;
  self.dateWakeSettings = nil;
}
%end
