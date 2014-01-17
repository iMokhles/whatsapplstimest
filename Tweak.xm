/*
 	WhatsApp LSeen TimeStamp, by Mokhles Hussien (iMokhles)
	Copyright 2013 Mokhles Hussien (iMokhles), 
 	This code is not under any license so use it and edit it as you want.
 	But don't forget to notice me if you want to publish it ;)
*/

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

static NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.imokhles.whatsapplstimest.plist"];

static BOOL lastSeen = NO;
static BOOL offLine = NO;
static BOOL showDate = NO;
static BOOL showTime = NO;
static BOOL showTimestamp = NO;


static id connection = nil;

%hook ChatManager

- (BOOL)lastSeenEnabled {


  lastSeen = [[plist objectForKey:@"enabled"]boolValue];  

  if (lastSeen) {
  return NO;
}
else if (!lastSeen) {
  return %orig;
}
}

- (BOOL)lastSeenChangeAllowed {

 lastSeen = [[plist objectForKey:@"enabled"]boolValue];  

if (lastSeen) {
 return YES;
}
else if (!lastSeen) {
  return %orig;
}
}

%end

%hook XMPPConnection

- (id)createPresence:(int)fp8 withNickname:(id)fp12 {

  offLine = [[plist objectForKey:@"enabledit"]boolValue];

 if (offLine) {
   return (connection = %orig);
}
else if (!offLine) {
  return YES;
  }
}
%end

// The hook below is used in WhatsApp 2.10.1 and above :)

%hook WATimestampView

- (BOOL)showDate {

 showDate = [[plist objectForKey:@"enabledDate"]boolValue];

if (showDate) {
 return YES;
}
else if (!showDate) {
  return %orig;
}
}

- (BOOL)showTime {

 showTime = [[plist objectForKey:@"enabledTime"]boolValue];     

 if (showTime) {
 return YES;
}
else if (!showTime) {
   return %orig;
}
}

- (BOOL)showTimestamp {

 showTimestamp = [[plist objectForKey:@"enabledTimestamp"]boolValue];     

if (showTimestamp) {
return YES;
}
else if (!showTimestamp) {
  return %orig;
}
}
%end