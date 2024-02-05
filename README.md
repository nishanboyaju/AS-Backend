# README

* Ruby version: 3.1.2
* Rails version: 7.0.8

# Features

  * Custom Authentication using jwt
  * **User**: Sign in, Sign Up, Change password
  * **Content**: CRUD operation of contents
  * **Association**: User has_many Contents and Content belongs_to one User
  * **Rspecs**: Model and Controller rspecs. **Gems Used**: rspec-rails, factory_bot_rails, faker, shoulda-matchers
  * **Serialization**: Serialized JSON according to the requirements. **Gems Used**: jsonapi-serializer, jsonapi.rb
  * Dockerized container using Docker and Docker Compose

    
# POSTMAN - [Link To Postman Collection](https://www.postman.com/solar-escape-848590/workspace/assessment/collection/17707547-58460d14-61a5-4ae3-9444-a8e97555e3d7?action=share&creator=17707547&active-environment=17707547-d38a0fd1-6ce0-4a7d-98c8-357b6c9004be)
* On sign in, A Test scripts written on postman will update the value of the token on environment variable


# For Testing
**Pre-requisites**
- [Install Docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)
- [Install Docker Compose](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04)

**<ins>STEPS</ins>:**
* Clone this GitHub repository
* To run **RSpecs**, run the following commands:
  - **Step 1**: `docker compose --profile rspec build`
    - This builds the docker image. P.S. **Run this command again** if any changes are made to the files.
  - **Step 2**: `docker compose --profile rspec up`
    - This runs the services. If you are running for the first time you can skip Step 1 and directly follow Step 2.
  - **Step 3**: `docker compose --profile rspec down`
    - This stops the services

* To run the backend server, follow these steps:
  - **Step 1**: `docker compose --profile stage build`
    - This builds the docker image. P.S. **Run this command again** if any changes are made to the files.
  - **Step 2**: `docker compose --profile stage up`
    - This runs the services. If you are running for the first time you can skip Step 1 and directly follow Step 2.
  - **Step 3**: Test the APIs using this Postman collection. **[Link To Postman Collection](https://www.postman.com/solar-escape-848590/workspace/assessment/collection/17707547-58460d14-61a5-4ae3-9444-a8e97555e3d7?action=share&creator=17707547&active-environment=17707547-d38a0fd1-6ce0-4a7d-98c8-357b6c9004be)**
  - **Step 4**: `docker compose --profile stage down`
    - This stops the services
