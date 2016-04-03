#!/bin/bash

mkdir tmp
cd tmp
wget -i $1
rename -v 's/\.jsonp$/\.jsonp.gz/' *.jsonp
for i in *.gz; do gunzip i; done
find . -type f -exec sed -i 's/^window.page[0-9]\+_callback(\[\"//g;s/\"\])\;//g' {} \;
find . -type f -exec sed -i 's/\\"/"/g' {} \;
find . -type f -exec sed -i 's/\\n/\n/g' {} \;
find . -type f | xargs -i sh -c 'echo "</html>" >> {}'
find . -type f | xargs -i sh -c 'cat ../header {} | sponge {}'
find . -type f -exec sed -i 's/orig/src/g' {} \;
rename -v 's/\.jsonp$/\.html/' *.jsonp
find . -name "*.html" -type f | xargs -i sh -c 'wkhtmltopdf {} {}.pdf'
