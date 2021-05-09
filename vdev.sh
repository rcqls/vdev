#!/usr/bin/env bash

VEXE="${HOME}/vlang/v/v"
VDEVMODULES="${HOME}/vdevmodules"
VRUNDIR="${HOME}/.vmodules/"

VPATH=""

if [ "$1" = "-dev" ]; then
    shift
    VPATH="-path @vlib:${VDEVMODULES}:@vmodules"
    VRUNDIR="${VDEVMODULES}/"
fi 

VARGS="$*"

${VEXE} ${VPATH}  ${VARGS/\%/${VRUNDIR}}