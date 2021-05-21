#!/bin/bash

SERVER_PORT=3001
CLIENT_PORT=3000

## client
cd client
PORT=${CLIENT_PORT} yarn start &

cd ..   

PORT=${SERVER_PORT} bundle exec puma -C config/puma.rb
