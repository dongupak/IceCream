

#import <GameKit/GameKit.h>
#import "SimpleAudioEngine.h"

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "SimpleAudioEngine.h"

// HelloWorldLayer
@interface GameLayer : CCLayer
{
    SimpleAudioEngine *backsound;
    
    CCSprite *button1;
    CCSprite *button2;
    CCSprite *button3;
    CCSprite *BG_img;
    CCSprite *leftcon;
    CCSprite *middlecon;
    CCSprite *rightcon;
    CCLabelTTF *StageLabel;
    CCLabelTTF *timerLabel;
    
    SimpleAudioEngine *audio;
    
    
    int leftValue;
    int middleValue;
    int rightValue;
    int leftTouch;
    int middleTouch;
    int rightTouch;
    
    int leftDownPoint;
    int middleDownPoint;
    int rightDownPoint;
    int stageValue;
    
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end