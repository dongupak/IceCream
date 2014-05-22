#import "HowtoLayer.h"
#import "SceneManager.h"

@implementation HowtoLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HowtoLayer *layer = [HowtoLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super init]) )
    {
        size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *bgSprite = [CCSprite spriteWithFile:@"bg_Howto.png"];
        bgSprite.anchorPoint = CGPointZero;
        [bgSprite setPosition: ccp(0, 0)];
        [self addChild:bgSprite z:0];
        
        CCMenuItem *back = [CCMenuItemImage itemWithNormalImage:@"btn_Back.png" selectedImage:@"btn_Back.png" target:self selector:@selector(goMenu)];
        CCMenu *menu = [CCMenu menuWithItems:back, nil];
        menu.position = ccp(160, 50);
        [self addChild:menu z:1];
    }
    return self;
}

- (void) goMenu
{
    [SceneManager goMenu];
}
@end
