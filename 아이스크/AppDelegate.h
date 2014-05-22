//
//  AppDelegate.h
//  아이스크
//
//  Created by JungTong 51310 on 13. 6. 10..
//  Copyright __MyCompanyName__ 2013년. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
	UIWindow *window_;
	UINavigationController *navController_;

	CCDirectorIOS	*director_;							// weak ref
    float timeValue;
}

@property (nonatomic, retain) UIWindow *window;
@property (readonly) UINavigationController *navController;
@property (readonly) CCDirectorIOS *director;
@property (readwrite) float timeValue;
@end
