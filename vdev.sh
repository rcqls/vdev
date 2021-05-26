#!/usr/bin/env bash

VEXE="${HOME}/vlang/v/v"

if [ "$1" = "-v" ]; then
    shift
    if [ -e "$1" ]; then
        VEXE="$1"
    fi
    shift
fi

VDEFARGS=""
CFG="${HOME}/vlang/.vdev"
if [ -e "$CFG" ]; then
    VDEFARGS=`cat $CFG`
fi

VDEVMODULES="${HOME}/vdevmodules"

if [ "$USERPROFILE" != "" ]; then
    VDEVMODULES="${USERPROFILE/\\/\/}/vdevmodules"
fi

VRUNDIR="${HOME}/.vmodules/"

VPATH=""
if [ "$1" = "-dev" ]; then
    shift
    VPATH="-path @vlib|${VDEVMODULES}|@vmodules"
    VRUNDIR="${VDEVMODULES}/"
fi 

VARGS="$*"

${VEXE} ${VPATH} ${VDEFARGS}  ${VARGS/\%/${VRUNDIR}}