# briktest

A CRUD Flutter project, using Flutter, Provider, and crudcrud for its backend.

## Setup
To be able to run the project, all you need to do is do as the following:
- Create your .env file in the root directory of the project
- Insert your crudcrud URL under 'BASE_URL' in your .env file, such as below:
```
BASE_URL ='https://crudcrud.com/api/{your-crud-token-here}/'
```
- After that, just run `dart run build_runner build --delete-conflicting-outputs` and you'll be good to go!
