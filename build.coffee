#!/usr/bin/env coffee

echo = console.log
require 'shelljs/make'
_ = require 'lodash'

target.build = ->
  exec 'docker build -t mooxe/base ./src'

target.in = ->
  exec 'docker run -t -i mooxe/base /bin/bash'

target.run = ->
  # exec 'docker run --name nginx -d -p 80:80 mooxe/base'
  # docker run -t -i -p 80:80 mooxe/base /bin/bash
  exec 'docker run -d -p 80:80 mooxe/base'

target.all = ->
  echo 'hello'
