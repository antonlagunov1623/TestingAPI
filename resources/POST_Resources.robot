*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary

*** Variables ***
${URL}  https://petstore.swagger.io
${id}  convert to integer  1626

*** Keywords ***
Post Request Case 1
    create session  post_request_session  ${URL}

    ${category}  create dictionary  id  ${id}  name  string
    ${tags}  create dictionary  id  ${id}  name  string
    ${tags}  create list  ${tags}
    ${photo_url}  create list  string
    ${data}  create dictionary  id  ${id}  category  ${category}  name  doggie  photoUrls  ${photo_url}  tags  ${tags}  status  available
    ${headers}  create dictionary  accept  application/json  Content-Type  application/json

    ${response}  post request  post_request_session  v2/pet  headers=${headers}  json=${data}

    ${status_code}  convert to string  ${response.status_code}

    # VALIDATION
    should be equal  ${status_code}  200
    log to console  ${response.text}

Post Request Case 2
    create session  post_request_session  ${URL}

#    ${data}  set to dictionary  status  sold
    ${data}  create dictionary  status  sold
    ${headers}  create dictionary  accept  application/json  Content-Type  application/x-www-form-urlencoded

    ${response}  post request  post_request_session  v2/pet/${id}  headers=${headers}  status=sold

    ${status_code}  convert to string  ${response.status_code}

    # VALIDATION
    should be equal  ${status_code}  200
    log to console  ${response.text}