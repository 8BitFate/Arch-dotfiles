#!/bin/bash

case $BLOCK_BUTTON in
  1) xkb-switch -n
esac

lang=$(xkb-switch | sed 's/([^)]*)//g')

echo " ${lang^^}"
