



// Import the interfaces
#import "GameLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "SceneManager.h"
#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation GameLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *layer = [GameLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(AppController *)delegate{
    return (AppController *)[[UIApplication sharedApplication] delegate];
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        [audio playBackgroundMusic:@"bg.mp3"];
        
        
        AppController *delegate = [self delegate];
        
        [self initSetting];
        stageValue = 1;
        delegate.timeValue = 0;
        [self schedule:@selector(timer) interval:0.1];
        
        [self schedule:@selector(StageLabelMethod)];
        self.isTouchEnabled = YES;
        
      
        
        
        
	}
	return self;
}
-(void)StageLabelMethod
{
    StageLabel.string = [NSString stringWithFormat:@"Stage:%d", stageValue];
    
}
-(void)initSetting
{
    BG_img = [CCSprite spriteWithFile:@"BG_img.png"];
    BG_img.position = ccp(150, 240);
    [self addChild:BG_img z:0];
    
    leftcon = [CCSprite spriteWithFile:@"con.png"];
    leftcon.position = ccp(50,105);
    [self addChild:leftcon];
    
    middlecon = [CCSprite spriteWithFile:@"con.png"];
    middlecon.position = ccp(150,105);
    [self addChild:middlecon];
    
    rightcon = [CCSprite spriteWithFile:@"con.png"];
    rightcon.position = ccp(250,105);
    [self addChild:rightcon];

    StageLabel = [CCLabelTTF labelWithString:@"" fontName:@"Papyrus" fontSize:20];
    StageLabel.position = ccp(40,450);
    
    [self addChild:StageLabel z:10];
    
    button1 = [CCSprite spriteWithFile:@"btn_1.png"];
    button1.position  =ccp(50,40);
    
    [self addChild:button1];
    button2 = [CCSprite spriteWithFile:@"btn_2.png"];
    button2.position  =ccp(150,40);
    
    [self addChild:button2];
    button3 = [CCSprite spriteWithFile:@"btn_3.png"];
    button3.position  =ccp(250,40);
    
    [self addChild:button3];
    
    
    leftValue = 0;
    rightValue = 0;
    middleValue = 0;
    leftTouch = 0;
    middleTouch = 0;
    rightTouch = 0;
    
    leftDownPoint = 0;
    middleDownPoint = 0;
    rightDownPoint  = 0;
    
    
    [self boxRandomSetting];
    
}
-(void)timer
{
    AppController *delegate = [self delegate];
    delegate.timeValue += 0.1;
    
}
-(void)boxRandomSetting
{
    leftTouch = arc4random()%7+1;
    middleTouch = arc4random()%7+1;
    rightTouch = arc4random()%7+1;
    for(int i = 0; i<leftTouch;i++)
    {
        CCSprite *instanc = [CCSprite spriteWithFile:@"ice2.png"];
        instanc.opacity = 150;
        instanc.position = ccp(50,170+45*i);
        [self addChild:instanc];
    }
    
    for(int i = 0; i<middleTouch;i++)
    {
        CCSprite *instanc = [CCSprite spriteWithFile:@"ice4.png"];
        instanc.opacity = 150;
        instanc.position = ccp(150,170+45*i);
        [self addChild:instanc];
    }
    
    for(int i = 0; i<rightTouch;i++)
    {
        CCSprite *instanc = [CCSprite spriteWithFile:@"ice5.png"];
        instanc.opacity = 150;
        instanc.position = ccp(250,170+45*i);
        [self addChild:instanc];
    }
    
    [self schedule:@selector(gameCheck)];
    
}
-(void)boxDown1
{
    CCSprite *instanc = [CCSprite spriteWithFile:@"ice2.png"];
    instanc.position = ccp(50,500);
    [self addChild:instanc];
    
    id move = [CCMoveTo actionWithDuration:((instanc.position.y-leftValue)/800) position:ccp(50,170+leftValue*45)];
    id call = [CCCallFunc actionWithTarget:self selector:@selector(boxDown1Success)];
    [instanc runAction:[CCSequence actionOne:move two:call]];
    leftValue+=1;
    
    CCLOG(@"Button1");
}
-(void)boxDown1Success
{
    leftDownPoint +=1;
}
-(void)boxDown2
{
    CCSprite *instanc = [CCSprite spriteWithFile:@"ice4.png"];
    instanc.position = ccp(150,500);
    [self addChild:instanc];
    id move = [CCMoveTo actionWithDuration:((instanc.position.y-middleValue)/800) position:ccp(150,170+middleValue*45)];
    id call = [CCCallFunc actionWithTarget:self selector:@selector(boxDown2Success)];
    [instanc runAction:[CCSequence actionOne:move two:call]];
    middleValue+=1;
    
    
    CCLOG(@"Button2");
}
-(void)boxDown2Success
{
    middleDownPoint+=1;
    
}
-(void)boxDown3
{
    CCSprite *instanc = [CCSprite spriteWithFile:@"ice5.png"];
    instanc.position = ccp(250,500);
    [self addChild:instanc];
    id move = [CCMoveTo actionWithDuration:((instanc.position.y-rightValue)/800) position:ccp(250,170+rightValue*45)];
    id call = [CCCallFunc actionWithTarget:self selector:@selector(boxDown3Success)];
    [instanc runAction:[CCSequence actionOne:move two:call]];
    rightValue+=1;
    
    
    CCLOG(@"Button3");
}
-(void)boxDown3Success
{
    rightDownPoint+=1;
}
-(void)cleargame
{
    CCLabelTTF *Clear = [CCLabelTTF labelWithString:@"Clear Game" fontName:@"Papyrus" fontSize:15];
    Clear.position = ccp(160,280);
    
    [self addChild:Clear z:10];
    
    id scale = [CCScaleBy actionWithDuration:0.5 scale:4];
    [Clear runAction:scale];
    
    
}

-(void)gameover
{
    CCLabelTTF *GameOver = [CCLabelTTF labelWithString:@"GameOver" fontName:@"Papyrus" fontSize:15];
    GameOver.position = ccp(160,280);
    GameOver.color = ccRED;
    
    [self addChild:GameOver z:10];
    
    id scale = [CCScaleBy actionWithDuration:0.5 scale:4];
    [GameOver runAction:scale];}

-(void)restartGame {
    [[CCDirector sharedDirector] replaceScene:[GameLayer scene]];
}


-(void)gameCheck
{
    AppController *delegate = [self delegate];
    
    if(leftDownPoint==leftTouch&&middleDownPoint==middleTouch&&rightDownPoint==rightTouch)
    {
        
        
        
        if (stageValue != 5) {
            
            [self removeAllChildrenWithCleanup:YES];
            stageValue +=1;
            [self initSetting];
            
        }
        
        else
        {
            
            
            timerLabel = [CCLabelTTF labelWithString:@"" fontName:@"Papyrus" fontSize:20];
            timerLabel.position = ccp(250,450);
            timerLabel.color = ccRED;
            [self addChild: timerLabel z:10];
            timerLabel.string = [NSString stringWithFormat:@"Time:%f",delegate.timeValue];
            
            [self cleargame];
            [self unschedule:@selector(gameCheck)];
            self.isTouchEnabled = NO;
            
            [SceneManager goRank];
          
        }
        
        
    }
    
    if(leftDownPoint>leftTouch||middleDownPoint>middleTouch||rightDownPoint>rightTouch)
    {
       
        [self unschedule:@selector(timer)];
        [self gameover];
        [self unschedule:@selector(gameCheck)];
        self.isTouchEnabled = NO;
        
        CCMenuItemImage *reset;
        
        reset    = [CCMenuItemImage itemWithNormalImage:@"btn_Gameover.png"
                                          selectedImage:@"btn_Gameover.png"
                                                 target:self
                                               selector:@selector(restartGame)];
        
        
        
        reset.position = ccp(160,230);
        id rotate =[CCRotateBy actionWithDuration:1 angle:360];
        [reset runAction:[CCRepeatForever actionWithAction:rotate]];
        CCMenu *menu = [CCMenu menuWithItems: reset,nil];
        menu.anchorPoint = ccp(0,0);
        menu.position = ccp(0,0);
        [self addChild:menu];
        
    }
    
}
- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSArray *arrTouch = [touches allObjects];
    
    for (UITouch *touch in arrTouch) {
        
        CGPoint location = [touch locationInView:[touch view]];
        
        CGRect Box1 = CGRectMake( button1.position.x-25,
                                 button1.position.y+370 ,
                                 button1.contentSize.width+10,button1.contentSize.height+10);
        
        CGRect Box2 = CGRectMake( button2.position.x-25,
                                 button2.position.y+370 ,
                                 button2.contentSize.width+10,button1.contentSize.height+10);
        
        CGRect Box3 = CGRectMake( button3.position.x-25,
                                 button3.position.y+370 ,
                                 button3.contentSize.width+10,button1.contentSize.height+10);
        
        
        if (CGRectContainsPoint(Box1, location))
        {
            
            [self boxDown1];
            backsound = [SimpleAudioEngine sharedEngine];
            if(backsound != nil){
                [backsound preloadEffect:@"impact.wav"];
                
                backsound.effectsVolume = 1.0f;
            }
            [backsound playEffect:@"impact.wav"];
            CCLOG(@"1");
        }
        
        
        if (CGRectContainsPoint(Box2, location))
        {
            [self boxDown2];
            
            backsound = [SimpleAudioEngine sharedEngine];
            if(backsound != nil){
                [backsound preloadEffect:@"impact.wav"];
                
                backsound.effectsVolume = 1.0f;
            }
            [backsound playEffect:@"impact.wav"];
            CCLOG(@"2");
        }
        
        
        if (CGRectContainsPoint(Box3, location))
        {
            [self boxDown3];
            
            backsound = [SimpleAudioEngine sharedEngine];
            if(backsound != nil){
                [backsound preloadEffect:@"impact.wav"];
                
                backsound.effectsVolume = 1.0f;
            }
            [backsound playEffect:@"impact.wav"];
            CCLOG(@"3");
        }
    }
    
    
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}


@end