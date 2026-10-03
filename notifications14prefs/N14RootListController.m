#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>

@interface FBSSystemService : NSObject
+ (instancetype)sharedService;
- (void)sendActions:(NSSet *)actions withResult:(id)result;
@end

@interface SBSRelaunchAction : NSObject
+ (instancetype)actionWithReason:(NSString *)reason options:(NSUInteger)options targetURL:(NSURL *)targetURL;
@end

// SBSRelaunchActionOptionsFadeToBlackTransition
static const NSUInteger kN14RelaunchFadeToBlack = 1 << 2;

static NSString *const kN14Domain = @"com.aronsz26.notifications14";

@interface N14RootListController : PSListController
@end

@implementation N14RootListController

- (NSArray *)specifiers {
    if (!_specifiers) {
        _specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
    }
    return _specifiers;
}

// The tweak reads the plist from disk when SpringBoard starts; cfprefsd may write it much later,
// so write it right away too.
- (void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier {
    [super setPreferenceValue:value specifier:specifier];
    NSString *key = [specifier propertyForKey:@"key"];
    if (!key) return;
    NSString *path = [NSString stringWithFormat:@"/var/mobile/Library/Preferences/%@.plist", kN14Domain];
    NSMutableDictionary *prefs = [NSMutableDictionary dictionaryWithContentsOfFile:path] ?: [NSMutableDictionary dictionary];
    prefs[key] = value;
    [prefs writeToFile:path atomically:YES];
}

- (void)respring {
    SBSRelaunchAction *action = [SBSRelaunchAction actionWithReason:@"RestartRenderServer"
                                                            options:kN14RelaunchFadeToBlack
                                                          targetURL:nil];
    [[FBSSystemService sharedService] sendActions:[NSSet setWithObject:action] withResult:nil];
}

@end
