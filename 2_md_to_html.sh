#!/bin/bash
#################################
#
#    Step2: md -> html
#    
#################################

cd md_tmp
for file in `ls *.md`
do
    shortname=${file%.*}
    pandoc $file >$shortname.html
done

cd ..
rm -rf html_tmp
mkdir html_tmp
mv md_tmp/*.html html_tmp
mv md_tmp/figures html_tmp &>/dev/null
rm -rf md_tmp
