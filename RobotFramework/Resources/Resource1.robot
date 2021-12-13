* settings *
Library  SeleniumLibrary
Resource    ../Resources/Resource2.robot
Library  DateTime


*** Keywords ***
Close_Popup
    [Documentation]   Closes the Appeared Pop Up.
    ...    
    Wait Until Element Is Visible   ${ClosePopup}
    Click Element                   ${ClosePopup}
    

Open_InputForms
    [Documentation]   Selects Input Forms.
    ...    
     Wait Until Element Is Visible   ${InputFormsLink}
     Click Link                      ${InputFormsLink}
     

Select&Verify_All_CheckBoxes  
    [Documentation]   Selects every Checkbox and Validates whether Checkbox is selected.      
    ...     
    ${Get_Checkboxes_count} =  Get Element Count  ${Checkbox_Count}
    Log to console  ${Get_Checkboxes_count}
    FOR  ${index}  IN RANGE   ${Get_Checkboxes_count}    
    Select Checkbox   xpath=//*[@id="easycont"]/div/div[2]/div[2]/div[2]/div[${index}+1]/label/input
    Checkbox Should Be Selected    xpath=//*[@id="easycont"]/div/div[2]/div[2]/div[2]/div[${index}+1]/label/input
    END
    

Validate_Radio_Button_Demo
    [Documentation]   Selects every radio buttons and validates whether Radiobutton is selected.
    ...    
    Select Radio Button             ${RadioButton}   ${Male}
    Click Element                   ${Click_GetCheckedValue}
    Radio Button Should Be Set To   ${RadioButton}   ${Male}
    Click Element                   ${Click_GetCheckedValue}
    Element Text Should Be          ${Printed_CheckedValue}      Radio button 'Male' is checked 
    Select Radio Button             ${RadioButton}   ${Female}
    Radio Button Should Be Set To   ${RadioButton}   ${Female}
    Click Element                   ${Click_GetCheckedValue}
    Element should contain          ${Printed_CheckedValue}      Radio button 'Female' is checked


Select_Age_Group 
    [Documentation]   Selects every Radiobuttons under group name-AgeGroup.
    ...    
    FOR  ${ListIndex2}   IN   0 - 5   5 - 15   15 - 50
         Select Radio Button  ageGroup  ${ListIndex2}
         Radio Button Should Be Set To   ageGroup   ${ListIndex2}
         Click Element    ${Click_Getvalues}
         Scroll Element Into View    ${Printed_Sex_Age} 
         Element should contain   ${Printed_Sex_Age}   Age group: ${ListIndex2}   
         Sleep  1s
    END
    

Validate_Group_Radiobutton
    [Documentation]   Selects every Radiobutton and Validates whether Radio button is selected.
    ...    
    FOR  ${ListIndex1}  IN   @{Sex} 
        Select Radio Button  gender  ${ListIndex1}
        Radio Button Should Be Set To   gender   ${ListIndex1}
        Select_Age_Group
      END
   
   
Get_Rows&Columns_Count 
     [Documentation]   Returns No of rows and columns.
     ...      
     ${rows}=    Get Element Count      ${No_of_Rows}   
     ${cols}=    Get Element Count      ${No_of_Columns}
    

     
Print_Table_Data 
       [Documentation]    Prints Table data into Console.
       ...     
      Get_Rows&Columns_Count
      FOR  ${i}   IN RANGE    ${rows}
          ${data}=  Get Text   xpath=//table[@id='task-table']/tbody/tr[${i}+1]
          Log to Console       ${data} 
      END
  
    
Verify_Table_Content_After_Filter
    [Documentation]   Verifies whether the particular Row has expected data.
    ...      
    FOR  ${p}  IN  @{Table_Row_No}
         Table row should contain    ${Table_Content_After_Filter}   ${p}  ${Name_ListIndex}
         END 

           
 Validate_table_data_After_Filter 
    [Documentation]    Verifies whether table has expected data.
    ...     
     FOR  ${Name_ListIndex}   IN   @{Filter_By_Name}
         Input Text    ${FilterInput}    ${Name_ListIndex}
         Capture_ScreenShort_TableSearch
         ${data1}=    Get Text   ${Table_Content_After_Filter}
         ${source}=    Set Variable    ${data1}
         Should be true    "${Name_ListIndex}"    "${source}" 
         Verify_Table_Content_After_Filter  
      END  

      
Current_Date 
       [Documentation]   Returns Current Date in required date format.
       [Return]    ${date}
       
       ${Current_Date}=   Get Current Date 
       ${date}=  Convert date  ${Current_Date}  ${Date_Format}
       Log to console   ${date}   

             
 Get_MonthYear
     [Documentation]     Return current month & year from datepicker
     [Return]    ${monthyear}
     
     click element   ${Click_DD-MM-YY}
     ${monthyear}=   Get Text   ${Get_Month&Year}
     Log to console   ${monthyear}
     

AlertBox_validation
    [Documentation]    1. Selects Alertbox
    ...                2. Accepts Alertbox
    ...                3. Verifies whether above actions is done.
   
    click element  ${Click_Alert_Box}
    sleep  1s    
    ${message}=  Handle Alert
    Should Be Equal  ${message}  I am an alert box! 
    Capture_ScreenShort_JavaScriptsAlerts
 
   
ConfirmBox_Validation    
    [Documentation]    1. Selects Confirm Alert Box
    ...                2. Dismiss  Confirm Box
    ...                3. Verifies whether above actions is done.
    
    click element  ${Click_Confirm_Box}
    sleep  1s   
    ${message2}  Handle Alert    action=DISMISS
    Should Be Equal  ${message2}  Press a button!
    Scroll Element Into View   ${Printed_AlertMessage}
    Element Text Should Be  ${Printed_AlertMessage}  You pressed Cancel!
    Capture_ScreenShort_JavaScriptsAlerts
    

PromptBox_Validation    
       [Documentation]    1. Selects Prompt Box.
       ...                2. Enters input in prompt box and accepts prompt box.
       ...                3. Verifies whether above actions is done.
       
       click element  ${Click_Prompt_Box}
       sleep  1s   
       Input Text Into Alert   ${Enter_input_IN_AlertBox}    action=ACCEPT
       Scroll Element Into View   ${Printed_PromptBox_message}
       Element Text Should Be    ${Printed_PromptBox_message}   You have entered 'Selenium' !
       Capture_ScreenShort_JavaScriptsAlerts

    
Capture_ScreenShort_SimpleForms
    [Documentation]      Captures Screenshorts while validating SimpleForms.
    
    ${previous} =    Set Screenshot Directory    ${OUTPUTDIR}/ScreenShorts/Tc01_SimpleForms
    ${file} =    Capture Page Screenshot     
  
  
Capture_ScreenShort_Checkbox
    [Documentation]      Captures Screenshorts while validating Checkboxes.
    
     ${previous} =    Set Screenshot Directory    ${OUTPUTDIR}/ScreenShorts/Tc02_Checkbox
     ${file} =        Capture Page Screenshot     #TC1_SimpleForms-screenshot.png
  
   
Capture_ScreenShort_Radiobutton
    [Documentation]      Captures Screenshorts while validating RadioButtons.
    ...    
     ${previous} =    Set Screenshot Directory    ${OUTPUTDIR}/ScreenShorts/Tc03_RadioButtons
     ${file} =        Capture Page Screenshot
  
   
Capture_ScreenShort_TableSearch
    [Documentation]       Captures Screenshorts while validating Table Search.
    ...    
     ${previous} =    Set Screenshot Directory    ${OUTPUTDIR}/ScreenShorts/Tc04_TableDataSearch
     ${file} =        Capture Page Screenshot   
    
 
Capture_ScreenShort_DatePicker
    [Documentation]       Captures Screenshorts while validating DatePicker.
    ...    
     ${previous} =    Set Screenshot Directory    ${OUTPUTDIR}/ScreenShorts/Tc05_DatePicker
     ${file} =        Capture Page Screenshot  
  
   
Capture_ScreenShort_JavaScriptsAlerts
    [Documentation]       Captures Screenshorts while validating Alerts.
    ...    
     ${previous} =    Set Screenshot Directory    ${OUTPUTDIR}/ScreenShorts/Tc06_JavaScriptAlerts
     ${file} =        Capture Page Screenshot    