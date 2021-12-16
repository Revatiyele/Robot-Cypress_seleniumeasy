*** Settings ***
Library  SeleniumLibrary
Suite Setup     Open Browser   ${URL}   ${BROWSER}
Suite Teardown  Close Browser
Resource    Resources/Resource1.robot
Resource    Resources/Resource2.robot
 
***Test Cases***
TestCase1_SimpleForms
    Maximize Browser Window
    Capture_ScreenShort_SimpleForms
    Close_Popup
    Open_InputForms
    Wait Until Element Is Visible   ${SimpleFormDemoLink}
    Click Element                   ${SimpleFormDemoLink}
    Click Element                   ${MessageBox}
    Input Text                      ${EnterMessage}       ${message}  
    Capture_ScreenShort_SimpleForms
    Click Element                   ${ClickShowMessage}
    Element Text Should Be          ${Printed_Message}    ${message}   
    Input Text                      ${EnterInput-a}       ${input-a}
    Input Text                      ${EnterInput-b}       ${input-b}
    Click Element                   ${ClickGetTotal}
    Element Text Should Be          ${Printed_TotalValue}   ${value}   
    Capture_ScreenShort_SimpleForms
  

Testcase2_Checkbox
   Capture_ScreenShort_Checkbox
   Scroll Element Into View        ${InputFormsLink}
   Wait Until Element Is Visible   ${InputFormsLink}
   Click Link                      ${InputFormsLink}
   Click Element                   ${Check_BoxDemo_Link}
   Select CheckBox                 ${Select_CheckBox}
   Checkbox Should Be Selected     ${Select_CheckBox}
   Element Text Should Be          ${CheckBox_Message}      ${printed_checkbox_message}
   Capture_ScreenShort_Checkbox
   Click Element                   ${Click_CheckAll}      
   Click Element                   ${Unselect_CheckBox}
   Select&Verify_All_CheckBoxes 
   Capture_ScreenShort_Checkbox
   

Testcase3_RadioButtons
    
    Capture_ScreenShort_Radiobutton   
    Scroll Element Into View        ${InputFormsLink}
    Wait Until Element Is Visible   ${InputFormsLink}
    Click Link                      ${InputFormsLink}
    Click Element                   ${RadioButtonsDemo}
    Validate_Radio_Button_Demo    
    Capture_ScreenShort_Radiobutton 
    Validate_Group_Radiobutton
    Capture_ScreenShort_Radiobutton
  

Testcase4_Table Search
    
    Scroll Element Into View          ${Table}
    Click Element                     ${Table}
    Click Element                     ${TableDataSearch}
    Get_Rows&Columns_Count 
    Validate_table_data_After_Filter  
    

Testcase5_Alerts
    
    Scroll Element Into View       ${Alerts&Modals}
    click element                  ${Alerts&Modals}
    click element                  ${Java_Scripts_Alerts}
    AlertBox_validation
    ConfirmBox_Validation    
    PromptBox_Validation  
    
testcase6
        Scroll Element Into View       ${Alerts&Modals}
