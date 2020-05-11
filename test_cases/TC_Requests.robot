*** Settings ***
Library  RequestsLibrary
Resource  ../resources/GET_Resources.robot
Resource  ../resources/POST_Resources.robot
Resource  ../resources/DELETE_Resources.robot

*** Test Cases ***
Robot Test Case
    Get Request Case 1
    Post Request Case 1
    Get Request Case 2
    Delete Request Case
    Get Request Case 1