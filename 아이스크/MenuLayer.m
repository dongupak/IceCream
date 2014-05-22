
#import "MenuLayer.h"
#import "SceneManager.h"
#import "AppDelegate.h"
#pragma mark - MenuLayer

// HelloWorldLayer implementation
@implementation MenuLayer


// Helper class method that creates a Scene with the HelloWorldLayer as the only child.

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MenuLayer *layer = [MenuLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	if( (self=[super initWithColor:ccc4(255, 255, 0, 0)]) ) {
		size = [[CCDirector sharedDirector] winSize];
        CCSprite *bgSprite = [CCSprite spriteWithFile:@"bg_Menu.png"];
        bgSprite.anchorPoint = CGPointZero;
        [bgSprite setPosition: ccp(0, 0)];
        [self addChild:bgSprite z:0];
        
        backsound = [SimpleAudioEngine sharedEngine];
        [backsound preloadBackgroundMusic:@"bg.mp3"];
        if(backsound.willPlayBackgroundMusic)
        {
            backsound.backgroundMusicVolume = 0.5f;
        }
        [backsound playBackgroundMusic:@"bg.mp3" loop:YES];
        
        startMenuItem = [CCMenuItemImage itemWithNormalImage:@"btn_Start.png" selectedImage:@"btn_Start.png" target:self selector:@selector(newGameMenuCallback)];
        
        howtoMenuItem = [CCMenuItemImage itemWithNormalImage:@"btn_Howto.png" selectedImage:@"btn_Howto.png" target:self selector:@selector(howtoMenuCallback)];
        
        creditMenuItem = [CCMenuItemImage itemWithNormalImage:@"btn_Credit.png" selectedImage:@"btn_Credit.png" target:self selector:@selector(goCreditScene)];
        
            
        CCMenu *menu =[CCMenu menuWithItems:startMenuItem,howtoMenuItem,creditMenuItem,nil];
        [menu alignItemsVerticallyWithPadding:15];
        menu.position =ccp(size.width /2, size.height * 3/10);
        [self addChild:menu];
        return self;
    }
}

- (void) goCreditScene
{
    [SceneManager goCredit];
}

- (void) howtoMenuCallback
{
    [SceneManager goHowto];
}

- (void) newGameMenuCallback
{
    [SceneManager goGame];
}




@end
