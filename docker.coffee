#!/usr/bin/env coffee

echo = console.log
require 'shelljs/make'
_ = require 'lodash'

exec_silent = (command) ->
  exec command, silent:true

output_to_array = (output) ->
  _.compact output.split '\n'

clean_docker = ->
  # exec commander
  list_docker = exec_silent 'docker ps -a -q'
  return unless list_docker.code is 0

  containers = output_to_array list_docker.output

  for container in containers

    # stop container
    exec_silent "docker stop #{container}"
    echo "stop container #{container}"

    # remove container
    exec_silent "docker rm #{container}"
    echo "remove container #{container}"

clean_images = ->
  # exec commander
  list_images = exec_silent 'docker images'
  return unless list_images.code is 0

  images = (
    output_to_array list_images.output
  )[1..]

  image_objs = []
  for image in images
    image_items = _.compact image.split '\ \ '
    if (
      _.isArray image_items
    ) and (
      image_items.length is 5
    )
      image_obj =
        name: _.trim image_items[0]
        tag: _.trim image_items[1]
        id: _.trim image_items[2]
        created: _.trim image_items[3]
        size: _.trim image_items[4]
      image_objs.push image_obj
    else
      echo "error: Failed to parse image item."
      echo "  #{JSON.stringify image_items, null, 2}"
      return 1

  ids_for_remove = _.pluck (
    _.filter image_objs, name: '<none>'
  ), 'id'

  for id in ids_for_remove
    exec_silent "docker rmi #{id}"
    echo "docker image #{id} has been removed."

target.clean = ->

  clean_docker()
  clean_images()

target.all = ->

  target.clean()
