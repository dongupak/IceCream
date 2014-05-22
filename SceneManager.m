//
//  SceneManager.m
//  아이스크
//
//  Created by 310 on 13. 5. 21..
//
//

#import "SceneManager.h"

@implementation SceneManager

+(void) goIntro{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[IntroLayer scene] withColor:ccWHITE]];
}

+(void) goMenu{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[MenuLayer scene] withColor:ccWHITE]];
}

+(void) goGame{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameLayer scene] withColor:ccWHITE]];
}


+(void) goGameOver
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameOverLayer scene] withColor:ccWHITE]];
}

+(void) goCredit{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[CreditLayer scene] withColor:ccWHITE]];
}

+(void) goHowto{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[HowtoLayer scene] withColor:ccWHITE]];
}

+(void) goRank{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[RankLayer scene] withColor:ccWHITE]];
}
@end
