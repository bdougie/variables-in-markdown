#!/bin/sh

set -e

sh -c "gem install octokit"
sh -c "gem install json"

sh -c "ruby /action.rb $*"
