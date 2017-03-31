#!/usr/bin/env bash

pkgs=()
pkgs+=('ubuntu')
pkgs+=('ubuntu:14.04')
pkgs+=('ubuntu:16.04')
pkgs+=('centos')
pkgs+=('alpine')

for i in "${pkgs[@]}"; do
  docker pull $i
done
