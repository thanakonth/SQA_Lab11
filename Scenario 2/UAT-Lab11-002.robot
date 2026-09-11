*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}        https://sampleapp.tricentis.com/101/
${BROWSER}    Chrome


*** Test Cases ***

TC01 Open Insurance Main Page
    Open Browser    ${URL}index.php    ${BROWSER}
    Maximize Browser Window
    Location Should Contain    index.php
    Wait Until Page Contains    Vehicle Insurance


TC02 Enter Invalid Vehicle Data for Automobile
    Click Element   id=nav_automobile
    Location Should Contain    app.php
    Select From List By Label    id=make    BMW
    Input Text    id=engineperformance    9999
    Input Text    id=dateofmanufacture    12/31/2030
    Select From List By Label    id=numberofseats    5
    Select From List By Label    id=fuel    Electric Power
    Input Text    id=listprice    999999
    Input Text    id=licenseplatenumber    ABCDEFGHIJKLMNO
    Input Text    id=annualmileage    999999
    Page Should Contain    Must be a number between 1 and 2000
    Page Should Contain    Must be today or somewhere in the past
    Page Should Contain    Must be a number between 500 and 100000
    Page Should Contain    Must be under 10 characters
    Page Should Contain    Must be a number between 100 and 100000
    Click Button    id=nextenterinsurantdata

TC03 Enter Incomplete Insurance Data
    Location Should Contain    app.php
    Input Text    id=firstname    a1
    Input Text    id=lastname    s12
    Input Text    id=birthdate    10/09/2026
    Input Text    id=streetaddress    a
    Input Text    id=zipcode    123
    Page Should Contain    Must be at least 2 characters long and must only contain letters
    Page Should Contain    You must be between 18 and 70 years of age
    Page Should Contain    Must be at least 3 characters long
    Page Should Contain     Select an option
    Page Should Contain    Must be a number between 4 and 8 digits
    Page Should Contain     Select at least 1 options
    Click Button    id=nextenterproductdata

TC04 Enter Incomplete Product Data
    Location Should Contain    app.php
    Input Text    id=startdate  09/12/2026
    Click Element    xpath=//label[input[@id="EuroProtection"]]
    Page Should Contain     Must be more than one month in the future
    Page Should Contain     Select an option
    Page Should Contain     Select at least 1 options
    Click Button    id=nextselectpriceoption

