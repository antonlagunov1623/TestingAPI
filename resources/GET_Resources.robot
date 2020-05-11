*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${URL}  https://petstore.swagger.io
${id}  1626
#${URL}  https://petstore.swagger.io/v2/pet

*** Keywords ***
Get Request Case 1
    create session  get_request_session  ${URL}

    ${response}  get request  get_request_session  v2/pet/${id}
    ${status_code}  convert to string  ${response.status_code}
    ${content_type_value}  get from dictionary  ${response.headers}  content-type

    # VALIDATION
    should be equal  ${status_code}  404
    log to console  ${response.text}

Get Request Case 2
    create session  get_request_session  ${URL}

    ${response}  get request  get_request_session  v2/pet/${id}
    ${status_code}  convert to string  ${response.status_code}
    ${content_type_value}  get from dictionary  ${response.headers}  content-type

    # VALIDATION
    should be equal  ${status_code}  200
    log to console  ${response.text}

