*** Settings ***
Name              Login
Documentation     Tests for user login and logout, including successful and failed scenarios.
Library           SeleniumLibrary

Test Setup        Open App
Test Teardown     Close App

*** Variables ***
${SELENIUM_SPEED}  0.25 seconds
${LOGIN_URL}       https://www.saucedemo.com/
${BROWSER}         Chrome

*** Test Cases ***
Valid Credentials Of Standard User Should Redirect to Products Page
    Input Username           standard_user
    Input Password           secret_sauce
    Submit Form
    Products Page Should Be Open

Invalid Credentials Should Display Error
    Input Username             invalid_user
    Input Password             secret_sauce
    Submit Form
    Error Message Should Be    Epic sadface: Username and password do not match any user in this service

Valid Credentials of Locked Out User Should Display Error
    # TODO: Add remaining code
    Sleep    2

Empty Credentials Should Display Error
    # TODO: Add remaining code
    Sleep    2

*** Keywords ***
Open App
    Set Selenium Speed    ${SELENIUM_SPEED}
    Open Browser          ${LOGIN URL}    ${BROWSER}
    Title Should Be       Swag Labs

Close App
    Close Browser

Input Username
    [Arguments]    ${username}
    Input Text     user-name    ${username}

Input Password
    [Arguments]    ${password}
    Input Text     password    ${password}

Error Message Should Be
    [Arguments]    ${message}
    Element Text Should Be    xpath://*[@id="login_button_container"]/div/form/div[3]/h3[1]
    ...                       ${message}

Products Page Should Be Open
    Element Text Should Be    xpath:/html/body/div/div/div/div[1]/div[2]/span    Products
