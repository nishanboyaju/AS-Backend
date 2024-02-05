# README

* Ruby version: 3.1.2
* Rails version: 7.0.8

  #Features

  * Custom Authentication using jwt
  * **User**: Sign in, Sign Up, Change password
  * **Content**: CRUD operation of contents
  * **Association**: User has_many Contents and Content belongs_to one User
  * **Rspecs**: Model and Controller rspecs. **Gems Used**: rspec-rails, factory_bot_rails, faker, shoulda-matchers
  * **Serialization**: Serialized JSON according to the requirements. **Gems Used**: jsonapi-serializer, jsonapi.rb

    
# POSTMAN - [Link To Postman Collection](https://www.postman.com/solar-escape-848590/workspace/assessment/collection/17707547-58460d14-61a5-4ae3-9444-a8e97555e3d7?action=share&creator=17707547&active-environment=17707547-d38a0fd1-6ce0-4a7d-98c8-357b6c9004be)
* On sign in, A Test scripts written on postman will update the value of the token on environment variable
