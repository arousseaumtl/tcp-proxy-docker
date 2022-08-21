#!/bin/sh

APP_NAME=$(basename $(pwd))

if [ $# -eq 0 ]
  then
    echo "Usage: run.sh [--run (-r), --build (-b), or -tty (-t)]"
  else
    [[ "$@" =~ "--run" || "$@" =~ "-r" ]] && ( docker run -p $PORT:$PORT --env-file ./vars.env --rm $APP_NAME )
    [[ "$@" =~ "--build" || "$@" =~ "-b" ]] && ( docker build --platform linux/amd64 -t $APP_NAME:latest . )
    [[ "$@" =~ "--tty" || "$@" =~ "-t" ]] && ( docker run -it --entrypoint /bin/sh $APP_NAME )
fi
