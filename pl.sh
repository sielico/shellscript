#!/bin/sh

DVI_PATH=`echo $1 | sed -e "s/^\(.*\)\.tex$/\1.dvi/"`
PDF_PATH=`echo $1 | sed -e "s/^\(.*\)\.tex$/\1.pdf/"`
LOG_PATH=`echo $1 | sed -e "s/^\(.*\)\.tex$/\1.log/"`
AUX_PATH=`echo $1 | sed -e "s/^\(.*\)\.tex$/\1.aux/"`

if [ -e $1 ];then
  platex $1
  if [ $? -eq 0 -a -e "${DVI_PATH}" ];then
    dvipdfmx "${DVI_PATH}"
    if [ $? -eq 0 -a -e "${PDF_PATH}" ];then
      open -a Preview "${PDF_PATH}"
    fi
  fi
fi
rm -f "${DVI_PATH}"
rm -f "${AUX_PATH}"
rm -f "${LOG_PATH}"
rm -f *.xbb
