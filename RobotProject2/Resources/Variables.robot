*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${URL}                          https://demo.seleniumeasy.com/
${BROWSER}                      Chrome
${ClosePopup}                   xpath=//*[@id="at-cv-lightbox-close"]
${InputFormsLink}               xpath=//*[@id="navbar-brand-centered"]/ul[1]/li[1]/a

#Scenario1
${SimpleFormDemoLink}           xpath=//*[@id="navbar-brand-centered"]/ul[1]/li[1]/ul/li[1]/a
${MessageBox}                   xpath=//*[@id="user-message"]  
${EnterMessage}                 xpath=//*[@id="user-message"]  
${ClickShowMessage}             xpath=//*[@id="get-input"]/button
${EnterInput-a}                 id=sum1 
${EnterInput-b}                 id=sum2
${ClickGetTotal}                xpath=//button[@onclick='return total()']
${Printed_Message}              xpath=//*[@id="display"]
${Printed_TotalValue}           xpath=//*[@id="displayvalue"]
${message}                      Hello
${input-a}                      2
${input-b}                      3
${value}                        5  

#scenario2
${Check_BoxDemo_Link}           link=Checkbox Demo
${Select_CheckBox}              id=isAgeSelected
${Click_CheckAll}               id=check1 
${Unselect_CheckBox}            xpath=//input[@class='cb1-element'][1]  
${CheckBox_Message}             xpath=//*[@id="txtAge"]
${index}                   
${Select_Each_CheckBox}         xpath=//*[@id="easycont"]/div/div[2]/div[2]/div[2]/div[${index}+1]/label/input
${Checkbox_Count}               xpath=//input[@class='cb1-element']
${printed_checkbox_message}     Success - Check box is checked
#Scenario3
${RadioButtonsDemo}              link=Radio Buttons Demo
${RadioButton}                   optradio  
${Male}                          Male
${Female}                        Female    
@{Sex}                           Male  Female                
${Click_GetCheckedValue}         id=buttoncheck
${Printed_CheckedValue}          xpath=//*[@id="easycont"]/div/div[2]/div[1]/div[2]/p[3]
${Printed_Sex_Age}               xpath=//*[@id="easycont"]/div/div[2]/div[2]/div[2]/p[2]
${Click_Getvalues}               xpath=//button[@onclick='getValues();']

#Scenario4
${Table}                          link=Table     
${TableDataSearch}                xpath=//a[@href='./table-search-filter-demo.html']     
${No_of_Rows}                     xpath=//table[@id='task-table']/tbody/tr    
${No_of_Columns}                  xpath=//table[@id='task-table']/tbody/tr[1]/td  
${FilterInput}=                   xpath=//input[@id='task-table-filter']
@{Filter_By_Name}=                Wireframes  Mike Trout  deployed
@{Table_Row_No}=                  1  2  5
${Table_Content_After_Filter}=    xpath=//table[@id='task-table']
${Name_ListIndex}

#Scenario5
${DatePicker}                      link=Date pickers   
${Bootsrap_DatePicker}             link=Bootstrap Date Picker   
${Click_DD-MM-YY}                  xpath=//input[@class='form-control']   
${Select_Today}                    xpath=//th[@class='today']      
${Select_Clear}                    xpath=//th[@class='clear']    
${Date_Format}                     %d-%m-%Y
${Select_Today_Date}               xpath=/html/body/div[3]/div[1]/table/tbody/tr[6]/td[2]    
${date}=                           2021-11-30
${dateElem}                        xpath=//input[@class='form-control']
${Get_Month&Year}                  xpath=//div[@class='datepicker-days']/table/thead/tr[2]/th[2]

#scenario6
${Alerts&Modals}                   xpath=//*[@id="treemenu"]/li/ul/li[5]/a  
${Java_Scripts_Alerts}             xpath=//*[@id="treemenu"]/li/ul/li[5]/ul/li[5]/a   
${Click_Alert_Box}                 xpath=//*[@id="easycont"]/div/div[2]/div[1]/div[2]/button   
${Click_Confirm_Box}               xpath=//*[@id="easycont"]/div/div[2]/div[2]/div[2]/button    
${Dismiss_Alert_Box}               action=DISMISS   
${Click_Prompt_Box}                xpath=//*[@id="easycont"]/div/div[2]/div[3]/div[2]/button   
${Enter_input_IN_AlertBox}         Selenium
${Accept_Alert_Box}                ACTION=ACCEPT 
${Printed_AlertMessage}            xpath=//*[@id="confirm-demo"]
${Printed_PromptBox_message}       xpath=//*[@id="prompt-demo"]