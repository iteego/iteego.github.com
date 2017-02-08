#!/usr/bin/env bash

if pgrep gitit
then
    echo "gitit already running"
    exit 1
fi

if pgrep jekyll
then
    echo "jekyll already running"
    exit 1
fi

cd $(dirname "$0")
wikidata_dir="$(pwd)"
project_name="$(basename ${wikidata_dir})"
cd ..
base_dir="$(pwd)"
log_dir="$base_dir/log"
[ -d "$log_dir" ] || mkdir "$log_dir"
gitit --config-file="$wikidata_dir/.gitit.conf" &>>"$log_dir/gitit.log" &
cd "$project_name"
jekyll build --watch &>>"$log_dir/jekyll.log" &

echo "gitit and jekyll started - follow output in log files under $log_dir"
exit 0
