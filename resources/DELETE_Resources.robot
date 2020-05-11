*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary

*** Variables ***
${URL}  https://petstore.swagger.io
${id}  convert to integer  1626

*** Keywords ***
Delete Request Case
    create session  delete_request_session  ${URL}

    ${headers}  create dictionary  accept  application/json

    ${response}  delete request  delete_request_session  v2/pet/${id}  headers=${headers}

    ${status_code}  convert to string  ${response.status_code}

    # VALIDATION
    should be equal  ${status_code}  200
    log to console  ${response.text}