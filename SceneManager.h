//
//  SceneManager.h
//  아이스크
//
//  Created by 310 on 13. 5. 21..
//
//

#import "AppDelegate.h"

#import "MenuLayer.h"
#import "GameLayer.h"
#import "IntroLayer.h"
#import "HowtoLayer.h"
#import "CreditLayer.h"
#import "GameOverLayer.h"
#import "RankLayer.h"
@interface SceneManager : NSObject {
    
}

// 각 레이어로 이동하는 정적 메소드임
+(void) goIntro;
+(void) goMenu;
+(void) goGame;
+(void) goGameOver;
+(void) goCredit;
+(void) goHowto;
+(void) goRank;
+(void) goLoad;
+(void) goPoint;


// 레이어간 이동에서 사용되는 트랜지션 효과와 효과에 사용되는 시간
+(void) go:(CCLayer *)layer withTransition:(NSString *)transitionString ofDelay:(float)t;
+(void) go:(CCLayer *)layer withTransition:(NSString *)transitionString;
+(void) go:(CCLayer *)layer;

@end
