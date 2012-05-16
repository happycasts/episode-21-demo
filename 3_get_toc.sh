#!/bin/bash
#################################
#
#    Step3: get toc    
#    
#################################

echo "<ul id="toc">">index.html
chapter_no=1
for file in `ls book-content/ch*.md`
do
    i=0
    while read line
    do
        basefilename=`basename $file`
        shortname=${basefilename%.*}
        if echo $line | grep "^#"|grep -v "^###"; then
            if echo $line | grep "##"; then
                i=$((i+1))
                stringA=$line
                section=${stringA#'##'} 
                echo "<li><h2><a href=\"${shortname}-$i.html\">$chapter_no.$i $section</a></h2></li>" >>index.html
            else
                stringB=$line
                chapter=${stringB#'#'} 
                echo "<li><h1><a href=\"${shortname}-$i.html\">$chapter_no. $chapter</a></h1></li>" >>index.html
            fi
        fi
    done< $file
    chapter_no=$((chapter_no+1))
done
echo "</ul>">>index.html

mv index.html html_tmp
