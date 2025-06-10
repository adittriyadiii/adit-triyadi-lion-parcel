*** Settings ***
Library    AppiumLibrary

*** Variables ***

# Capability
${PLATFORM_NAME}         Android
${PLATFORM_VERSION}      15.0
${DEVICE_NAME}           Android Emulator
${AUTOMATION_NAME}       UiAutomator2
${REMOTE_URL}            http://localhost:4723
${NO_RESET}              true

# Browser
${BROWSER_NAME}          Chrome
${url}                   https://www.lionparcel.com/tarif

# Locator
${banner_lion_parcel}                //div[contains(@class, 'modal-banner') ] //img[contains(@alt, 'banner.svg')]
${button_homepage}                   //img[@id='logo-navbar']
${button_cek_sekarang}               //div[@class='custom-btn red']
${textfield_kota_asal}               //input[@name='Check Tarif-Asal' and @placeholder='Asal']
${textfield_kota_tujuan}             //input[@name='Check Tarif-Tujuan']
${textfield_berat_barang}            //input[@name='Check Tarif']
${label_pilih_jenis_pengiriman}      //div[@class='title-pilih-kirim']

*** Test Cases ***
Verify user successfully check shipment rates on lion parcel website
    Given User open chrome browser
    And User go to website lion parcel
    # And User expand dropdown cek tarif on home page
    And User input kota asal "Mampang Prapatan" on cek tarif form
    And User input kota tujuan "Tebet" on cek tarif form
    And User input berat barang "3" kg on cek tarif form
    When User click cek sekarang button on cek tarif form
    # Setelah click cek sekarang button ada captcha verification yg tidak bisa di automation jadi harus di by pass manual
    Then User see successfully check shipment rates with message "Pilih Jenis Pengirimannya & Kirim Sekarang!" on cek tarif page
    
      
*** Keywords ***
User open chrome browser
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    browserName=${BROWSER_NAME}    automationName=${AUTOMATION_NAME}    noReset=${NO_RESET}

User go to website lion parcel
    Go To Url  ${url}
    Wait Until Page Contains Element    ${button_homepage}    timeout=5s
    Handle Banner If Present

Handle Banner If Present
    ${banner_present}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${banner_lion_parcel}    timeout=5s
    Run Keyword If    ${banner_present}    Log To Console    Banner ditemukan, klik banner dan home
    Run Keyword If    ${banner_present}    Click Element    ${banner_lion_parcel}
    Run Keyword If    ${banner_present}    Click Element    ${button_homepage}
    Run Keyword If    not ${banner_present}    Log To Console    Banner TIDAK ditemukan, lanjut saja

User expand dropdown cek tarif on home page
    Execute Script    return document.querySelector('.dropdown-rates').click()
    Sleep             2s

User input kota asal "${kota}" on cek tarif form
    Click Element  ${textfield_kota_asal}
    Input Text  ${textfield_kota_asal}  ${kota}
    SLeep  9
    Wait Until Element Is Visible    //li[.//span[contains(text(), '${kota}')]]    timeout=10s
    Click Element    //li[.//span[contains(text(), '${kota}')]]

User input kota tujuan "${kota}" on cek tarif form
    Click Element  ${textfield_kota_tujuan}
    Input Text  ${textfield_kota_tujuan}  ${kota}
    Wait Until Element Is Visible    //li[.//span[contains(text(), '${kota}')]]    timeout=10s
    Click Element    //li[.//span[contains(text(), '${kota}')]]

User input berat barang "${berat}" kg on cek tarif form
    Click Element  ${textfield_berat_barang}
    Input Text  ${textfield_berat_barang}  ${berat}

User click cek sekarang button on cek tarif form
    # Sleep  3
    # Execute Script    return document.querySelector('div.custom-btn.red').click()
    Wait Until Element Is Visible  ${button_cek_sekarang}  timeout=10s
    Click Element  ${button_cek_sekarang}
    Sleep  3

User see successfully check shipment rates with message "${message}" on cek tarif page
    Wait Until Element Is Visible  ${label_pilih_jenis_pengiriman}  timeout=10s
    ${message_text}  Get Text  ${label_pilih_jenis_pengiriman}
    Should Be Equal  ${message_text}  ${message}