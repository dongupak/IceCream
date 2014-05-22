//
//  RankLayer.m
//  아이스크
//
//  Created by JungTong 51310 on 13. 6. 16..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//

#import "RankLayer.h"
#import "SceneManager.h"

@implementation RankLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	RankLayer *layer = [RankLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(AppController *)delegate{
    return (AppController *)[[UIApplication sharedApplication] delegate];
}

-(id) init
{
	if( (self=[super init]) )
    {
        AppController *delegate = [self delegate];
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        if (delegate.timeValue <= 15.0) {
            CCSprite *Rank = [CCSprite spriteWithFile:@"bg_Rank.png"];
            Rank.anchorPoint = CGPointZero;
            [Rank setPosition: ccp(0, 0)];
            [self addChild:Rank z:0];
          
        } else if (delegate.timeValue < 25.0) {
            CCSprite *Rank2 = [CCSprite spriteWithFile:@"bg_Rank2.png"];
            Rank2.anchorPoint = CGPointZero;
            [Rank2 setPosition: ccp(0, 0)];
            [self addChild:Rank2 z:0];
        } else {
            CCSprite *Rank3 = [CCSprite spriteWithFile:@"bg_Rank3.png"];
            Rank3.anchorPoint = CGPointZero;
            [Rank3 setPosition: ccp(0, 0)];
            [self addChild:Rank3 z:0];
        }
        
        timerLabel = [CCLabelTTF labelWithString:@"" fontName:@"Papyrus" fontSize:40];
        timerLabel.position = ccp(145,140);
        timerLabel.color = ccRED;
        [self addChild: timerLabel z:10];
        timerLabel.string = [NSString stringWithFormat:@"Time:%f",delegate.timeValue];

        restart = [CCMenuItemImage itemWithNormalImage:@"btn_Restart.png" selectedImage:@"btn_Restart.png" target:self selector:@selector(newGameMenuCallback)];
        restart.position = ccp(-35,-200);

        home = [CCMenuItemImage itemWithNormalImage:@"btn_Home.png" selectedImage:@"btn_Home.png" target:self selector:@selector(goMenu)];
        home.position = ccp(35,-200);

    CCMenu *menu =[CCMenu menuWithItems:restart,home,nil];
    [self addChild:menu];



    }
    return self;
}


- (void) newGameMenuCallback
{
    [SceneManager goGame];
}



- (void) goMenu
{
    [SceneManager goMenu];
}




@end
