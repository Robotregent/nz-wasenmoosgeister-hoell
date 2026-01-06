#!/usr/bin/env bash
set -euo pipefail

# find gem bindir and run jekyll from there
BINDIR=$(ruby -e 'require "rubygems"; print Gem.bindir')
echo "Using gem bindir: $BINDIR"
if [ -x "$BINDIR/jekyll" ]; then
  exec "$BINDIR/jekyll" serve --watch --force_polling --host 0.0.0.0
else
  echo "jekyll executable not found in $BINDIR"
  echo "Gem list:";
  gem list
  exec ruby -S jekyll serve --watch --force_polling --host 0.0.0.0
fi
