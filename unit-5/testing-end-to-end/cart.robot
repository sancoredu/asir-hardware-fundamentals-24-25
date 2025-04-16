*** Settings ***
Name              Cart
Documentation     Tests for operations related to Cart, i.e. adding and removing products.
Library           SeleniumLibrary

Test Setup        Login
Test Teardown     Logout

*** Variables ***
${SELENIUM_SPEED}  0.25 seconds
${LOGIN_URL}      https://www.saucedemo.com/
${BROWSER}        Chrome

*** Test Cases ***
Adding Product Should Increase Counter
    [Documentation]   When a product is added to the cart, the cart icon counter
    ...               should increase by one.
    # TODO: Add remaining code
    Sleep    2

Adding Product Should Enable Product Removal
    [Documentation]    When a product is added to the cart, its "Add to cart" button
    ...                should turn into "Remove" button.
    # TODO: Add remaining code
    Sleep    2

Adding Product Should Display Product On Cart Page
    [Documentation]    When a product is added to the cart, it should appear on the Cart page
    # TODO: Add remaining code
    Sleep    2

# TODO: Add Product Removal test cases

*** Keywords ***
Login
    Set Selenium Speed    ${SELENIUM_SPEED}
    Open Browser          ${LOGIN URL}    ${BROWSER}
    Title Should Be       Swag Labs
    Input Username        standard_user
    Input Password        secret_sauce
    Submit Form
    Products Page Should Be Open

Logout
    Click Button    id=react-burger-menu-btn
    Click Link      id=logout_sidebar_link
    Close Browser

Input Username
    [Arguments]    ${username}
    Input Text     user-name    ${username}

Input Password
    [Arguments]    ${password}
    Input Text     password    ${password}

Products Page Should Be Open
    Element Text Should Be        xpath:/html/body/div/div/div/div[1]/div[2]/span    Products
