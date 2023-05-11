#!/usr/bin/env bash

PORT=8000
echo "Port: $PORT"

# POST method predict
curl -X GET http://localhost:$PORT/home
