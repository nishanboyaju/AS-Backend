#!/bin/bash

TOKEN=$(rails secret)
echo "JWT_SECRET_KEY=$TOKEN" > .env
rails db:migrate

if [ $RAILS_ENV == 'test' ]; then
    rspec
else
    rails s -p 3000 -b 0.0.0.0
fi

