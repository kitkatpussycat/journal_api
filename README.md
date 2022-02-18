# Journal Api
Journal Api is a simple note making application for your mobile device. This Journal Api provides all the basic CRUD operation.

## Features
can sign-up new user, log-in, create category, create task per category, read, edit and delete category and task. it can also shows which task are completed.

## Responses
Endpoints return the JSON representation on the resources created or edited.

## User Registration
``` 
HTTP Method: POST
URL: {{url}}/users/ 
``` 

### Sample Request Body
``` 
{
    "user":{
        "email": "lola@lola.com",
        "password": "lolalola"
    }
} 
```

### Parameters
| Name     | Description   | Required |
|----------|---------------|----------|
| email    | user email    | yes      |
| password | user password | yes      |


## Login
```
HTTP Method: POST
URL: {{url}}/api/v1/auth/sign_in
```

### Sample Request Body
```
{
    "user":{
        "email": "lola@lola.com",
        "password": "lolalola"
    }
}
```

### Parameters
| Name     | Description   | Required |
|----------|---------------|----------|
| email    | user email    | yes      |
| password | user password | yes      |


## Create Categories
```
HTTP Method: POST
URL: {{url}}/api/v1/categories
```

### Sample Request Body
```
{
    "name": "Finance",
    "description": "finance"
}
```

### Parameters
| Name        | Description | Required |
|-------------|-------------|----------|
| name        | name        | yes      |
| description | description | no       |
| user_id     | user_id     | yes      |


## READ Categories
```
HTTP Method: GET
URL: {{url}}/api/v1/categories/${id}
```

## EDIT Categories
```
HTTP Method: PUT
URL: {{url}}/api/v1/categories/${id}
```

### Sample Request Body
```
{
    "name": "Finance",
    "description": "finance"
}
```

### Parameters
| Name        | Description | Required |
|-------------|-------------|----------|
| name        | name        | yes      |
| description | description | no       |

## DELETE Categories
```
HTTP Method: DELETE
URL: {{url}}/api/v1/categories/${id}
```

## CREATE Task
```
HTTP Method: POST
URL: {{url}}/api/v1/task
```

### Sample Request Body
```
{
    "name":"matulog",
    "description": "atleast 8 hrs",
    "category_id":1,
    "date": "2022-02-14"
}
```

### Parameters
| Name        | Description | Required |
|-------------|-------------|----------|
| name        | name        | yes      |
| description | description | no       |
| date        | date        | yes      |
| category_id | category_id | yes      |


### READ Task
```
HTTP Method: GET
URL: {{url}}/api/v1/tasks/${id}
```

## EDIT Categories
```
HTTP Method: PUT
URL: {{url}}/api/v1/tasks/${id}
```
## DELETE Categories
```
HTTP Method: DELETE
URL: {{url}}/api/v1/tasks/${id}
```












