#!/bin/bash

mkdir -p ~/screenshots
grim -g "$(slurp)" ~/screenshots/screenshot-$(date +%Y%m%d-%H%M%S).png