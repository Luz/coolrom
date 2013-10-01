echo "cd 2links" > 2tmplinks.sh

grep "By Genre" ./1raw/* \
| sed "s|<a href|\\nhref|g" \
| sed "s/\"/\"><\/a>\n/2" \
| grep "href=\"/roms/$@/" \
| grep href \
| grep php \
| sed -r "s|href=\"/roms/$@/([0-9]+)/.*\.php\"></a>|wget http://coolrom.com/dlpop.php?id=\1\ncat dlpop.php\?id=\1 \| grep \'action\=\\\"http://dl.coolrom.com/dl/\' \| sed -r \'s\|\.*action\=\\\"\(http://dl.coolrom.com/dl/\[0-9\]\+/.\+/\[0-9\]\+/\)\\\"\.\*\|wget \\\1\|\' > ../3tmpdl.sh\ncd ../3download\nsh ../3tmpdl.sh\nmv index.html \1.zip\n\ncd ../2links|" \
>> 2tmplinks.sh

#1 nur href lines die auf der quelltextzeile "By Genre" sind, denn sonst werden die "top games" mehrfach genommen
#2 vor jedes a href ein newline und bischen kuerzer machen
#3 kuerzen und dl befehl erzeugen

#generiert auf zeile10 wird ungefaehr folgendes regex snippet:
# | grep 'action=\"http://dl.coolrom.com/dl/' \
# | sed -r 's|.*action=\"(http://dl.coolrom.com/dl/[0-9]+/.+/[0-9]+/)\".*|wget \1|' \

