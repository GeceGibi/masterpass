#import "MasterpassPlugin.h"
#if __has_include(<masterpass/masterpass-Swift.h>)
#import <masterpass/masterpass-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "masterpass-Swift.h"
#endif

@implementation MasterpassPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMasterpassPlugin registerWithRegistrar:registrar];
}
@end
