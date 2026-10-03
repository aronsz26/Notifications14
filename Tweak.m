// Notifications14 — iOS 14's notification design on iOS 15.
//
// iOS 15 still has iOS 14's notification look; the redesign sits behind the feature flag
// Kettle/FeatureComplete. Turning it off (only here, in SpringBoard; the system's flag file stays
// untouched) brings back iOS 14's notifications. iOS 16 removed the old code, so this does
// nothing there.

#import <Foundation/Foundation.h>
#import <dlfcn.h>
#import <string.h>
#import <substrate.h>

static bool (*N14FeatureEnabledOrig)(const char *domain, const char *feature);
static bool N14FeatureEnabled(const char *domain, const char *feature) {
    if (domain && feature && strcmp(domain, "Kettle") == 0 && strcmp(feature, "FeatureComplete") == 0) return false;
    return N14FeatureEnabledOrig(domain, feature);
}

__attribute__((constructor)) static void N14Init(void) {
    if ([NSProcessInfo processInfo].operatingSystemVersion.majorVersion != 15) return;
    void *featureEnabled = dlsym(RTLD_DEFAULT, "_os_feature_enabled_impl");
    if (featureEnabled) MSHookFunction(featureEnabled, (void *)N14FeatureEnabled, (void **)&N14FeatureEnabledOrig);
}
