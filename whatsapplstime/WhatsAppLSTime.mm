#import <Preferences/Preferences.h>

@interface WhatsAppLSTimeListController: PSListController {
}
@end

@implementation WhatsAppLSTimeListController

-(void)FollowMe:(PSSpecifier*)specifier
{
[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.imokhles.com/follow.html"]];
}

-(void)Respring:(PSSpecifier*)specifier
{
		system("killall -9 SpringBoard");
}

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"WhatsAppLSTime" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
