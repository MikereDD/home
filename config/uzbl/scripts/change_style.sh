#/bin/bash
 
# Author: Jurica Bradaric <jbradaric at gmail.com> 
# A simple script to use custom stylesheets for websites.
# Similar to the Stylish extension for Firefox.
# I hope someone finds it useful. All comments and suggestions
# are welcome.
 
XDG_DATA_HOME=${XDG_DATA_HOME:-"$HOME/.local/share/"}
 
# Set the path to the .css files
# Every custom css style must be in a file named web_address.css
# e.g. reddit.com.css
STYLE_PATH=$XDG_DATA_HOME/uzbl/userstyles
 
STYLESHEET_SET=0
 
for i in $STYLE_PATH/*.css; do
    stylesheet=$(basename $i '.css')
    if [[ "$6" =~ "${stylesheet}" ]]; then
        #echo "set stylesheet_uri = file://$STYLE_PATH/${stylesheet}.css" >> "$4"
        echo "set stylesheet_uri = file://${STYLE_PATH}/${stylesheet}.css" | socat - unix-connect:$5
        STYLESHEET_SET=1
        break
    fi
done
 
if [ $STYLESHEET_SET -eq 0 ]; then
    echo "set stylesheet_uri = file://${STYLE_PATH}/default.css" | socat - unix-connect:$5
fi
 
exit 0
