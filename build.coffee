#!/usr/bin/env coffee

echo = console.log
require 'shelljs/make'

target.build = ->
  exec 'docker build -t mooxe/base .'

target.in = ->
  echo 'docker run -t -i mooxe/base /bin/bash'

target.push = ->
  exec 'docker push mooxe/base'

target.all = ->
  echo 'hello'
