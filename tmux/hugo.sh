#!/bin/sh
tmux split-window -h 'hugo -vw serve'
tmux split-window -v 'node node_modules/gulp/bin/gulp.js'
