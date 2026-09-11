*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}       https://sampleapp.tricentis.com/101/
${BROWSER}      Chrome

*** Test Cases ***
TC01 Open Insurance Main Page
    Open Browser    ${URL}index.php    ${BROWSER}
    Maximize Browser Window
    Location Should Contain     index.php
    Wait Until Page Contains    Vehicle Insurance

TC02 Enter Vehicle Data for Automobile
    Click Element   id=nav_automobile
    Wait Until Page Contains    Vehicle Data
    Location Should Contain    app.php
    Select From List By Label       id=make     BMW
    Input Text    id=engineperformance    110
    Input Text    id=dateofmanufacture    09/09/2020
    Select From List By Label    id=numberofseats    5
    Select From List By Label    id=fuel    Electric Power
    Input Text    id=listprice    30000
    Input Text    id=licenseplatenumber    CK1234
    Input Text    id=annualmileage    10000
    Click Element    id=nextenterinsurantdata
    Location Should Contain     app.php
    Page Should Contain    Enter Insurant Data
    
TC03 Enter Insurance Data
    Input Text    id=firstname    Wichai
    Input Text    id=lastname    Sandee
    Input Text    id=birthdate    01/31/1990
    Click Element    xpath=//label[input[@id="gendermale"]]
    Input Text    id=streetaddress    KKU
    Input Text    id=streetaddress    KKU
    Select From List By Label    id=country    Thailand
    Input Text    id=zipcode    40002
    Input Text    id=city    Khon Kaen
    Select From List By Label    id=occupation    Employee
    Click Element    xpath=//label[input[@id="other"]]
    Click Button    id=nextenterproductdata
    Location Should Contain     app.php
    Page Should Contain    Enter Product Data

TC04 Enter Product Data
    Input Text    id=startdate  11/01/2026
    Select From List By Label   id=insurancesum    7.000.000,00
    Select From List By Label   id=meritrating      Bonus 1
    Select From List By Label   id=damageinsurance     No Coverage
    Click Element    xpath=//label[input[@id="EuroProtection"]]
    Select From List By Label   id=courtesycar     Yes
    Click Button    id=nextselectpriceoption
    Location Should Contain     app.php
    Page Should Contain    Select Price Option
    Page Should Contain    Silver

TC05 Select Price Option
    Scroll Element Into View    xpath=//label[input[@id="selectsilver"]]
    Click Element               xpath=//label[input[@id="selectsilver"]]
    Scroll Element Into View    id=nextsendquote
    Click Button    id=nextsendquote
    Location Should Contain     app.php
    Page Should Contain    Send Quote

TC06 Send Quote 
    Input Text    id=email  wichai.sandee@gmail.com
    Input Text    id=phone  0049201123456
    Input Text    id=username   wichai.sandee
    Input Text    id=password   SecretPassword123!
    Input Text    id=confirmpassword    SecretPassword123!
    Input Text    id=Comments    Please contact via email only
    Click Button    id=sendemail
    Location Should Contain     app.php
    Wait Until Page Contains    Sending e-mail success!    30s
    Page Should Contain    Sending e-mail success!