*** Settings ***
Library    AppiumLibrary
Library    Process
Library    OperatingSystem

Resource    mBtv.resource
Suite Setup    앱 실행
Test Setup    앱 종료 후 재진입


*** Test Cases ***

찜 목록 카드 확인
    #1. 앱 실행 > "MY" > 찜 목록 진입    /    1. '찜 목록은 60개까지 저장됩니다.' 문구 노출 확인
    #2. 임의의 포스터 선택하여 시놉시스 진입    /    2. VOD 타이틀 노출 확인 시 pass

    Wait Until Keyword Succeeds    1 min    3 sec    Click Element    Xpath=//android.widget.RelativeLayout[@content-desc="MY버튼"]
    Sleep    1
    Wait Until Keyword Succeeds    1 min    3 sec    Click Element    Xpath=//android.widget.TextView[@text="찜 목록"]
    Sleep    1
    Element Text Should Be    com.skb.smartrc:id/tv_title_comment    찜 목록은 60개까지 저장됩니다.
    Wait Until Keyword Succeeds    1 min    3 sec    Click Element    Xpath=//android.widget.ImageView[@resource-id="com.skb.smartrc:id/iv_favorite_poster"]
    Sleep    1
    Wait Until Element Is Visible    com.skb.smartrc:id/tv_title

TV다시보기 콘텐츠 전체 가격 표기 삭제 확인
    #1. 앱 실행 > "탐색" > TV다시보기 진입
    #2. 아래로 스크롤 하면서 가격 미노출 확인    /    2. 스크롤 끝날 때까지 가격(0원)이 포함된 엘리먼트 노출되지 않을 시 pass

    Wait Until Keyword Succeeds    1 min    3 sec    Click Element    Xpath=//android.widget.RelativeLayout[@content-desc="탐색버튼"]
    Sleep    1
    Wait Until Keyword Succeeds    1 min    3 sec    Click Element    Xpath=//android.view.ViewGroup[@content-desc="TV다시보기버튼"]
    Sleep    1
    FOR  ${i}  IN RANGE    0    10    #아래로 스크롤 하면서 가격이 노출되지 않는 지 확인
        Page Should Not Contain Element    Xpath=//android.widget.TextView[contains(@text, "0원")]
        Swipe By Percent    50    70    50    30
    END