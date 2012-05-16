#!/bin/bash
#################################
#
#    Step1: Split file 
#    
#################################
cd book-content/
for file in `ls ch*.md`
do
    i=0 
    IFS=  
    # Set IFS, otherwise the leading spaces for code block is ignored
    shortname=${file%.*}
    while  read line
    do
        if echo $line | grep "^#"|grep -v "^###"; then # this will match "##" and "#"
            currentname=$shortname-$i.md #can be section or chapter synopsis
            echo '$currentname:'"$currentname"
            i=$((i+1))
        fi
        echo $line >> $currentname
    done < $file 
    unset IFS #IFS will casue trouble in some cases, so must unset
done

cd ..
rm -rf md_tmp &>/dev/null
mkdir md_tmp 
mv book-content/ch*-*.md md_tmp
cp -rf book-content/figures/ md_tmp &>/dev/null
