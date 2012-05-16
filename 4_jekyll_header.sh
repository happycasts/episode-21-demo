#!/bin/bash
#################################
#
#   Step4: add jekyll header
#    
#################################

for file in `ls html_tmp/*.html`
do
   cp $file $file.tmp
   echo "---" >$file
   echo "layout: master" >>$file
   echo "---" >> $file
   cat $file.tmp >> $file
   rm $file.tmp
done

