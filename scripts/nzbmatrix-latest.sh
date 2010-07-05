#!/bin/bash
#
# Fetch Latest Listings from NZBMatrix
# by: MreDD
##
# Variables
# NZBMatrix API Link
MATRIX="http://rss.nzbmatrix.com/rss.php?"
# Curl - Path to Curl
CURL="/usr/bin/curl"
# ELinks - Path to ELinks
ELINKS="/usr/bin/elinks"
# Cat - Path to Cat
CAT="/bin/cat"
# UserID - Add it Here
USERID=`cat $HOME/.nzbmatrixrc | awk '{print $3}'`
# APIKey - Add it Here
APIKEY=`cat $HOME/.nzbmatrixrc | awk '{print $9}'`
# Temp Folder Path
TMP="$HOME/tmp"

# Fetch Info
SEARCH="$@"
if [ -z "$SEARCH" ]; then
    echo -e "Provide a Search Category, Choices - Apps - Anime - Games - Movies - Music - TV"
    echo ""
else
    unset response
# Fetch Latest
    $CURL -s "${MATRIX}cat=${SEARCH}&userid=${USERID}&apikey=${APIKEY}" > $TMP/nzblatest.txt > $TMP/nzblatestcurl.txt
    $ELINKS -dump -dump-width 5000 "${MATRIX}cat=${SEARCH}&userid=${USERID}&apikey=${APIKEY}" > $TMP/nzblatestelinks.txt
    echo -e "Searching in $SEARCH @ NZBMatrix..."
    echo ""
    SPLAT=$($CAT $TMP/nzblatest.txt | tr -d ";")
if [ "$SPLAT" = "error:nothing_found" ]; then
    echo "NoFiles: No Files Found.."
elif [ "$SPLAT" = "error:invalid_login" ]; then
    echo "Username: There is a problem with the username you have provided."
elif [ "$SPLAT" = "error:invalid_api" ]; then
    echo "APIKey: There is a problem with the API Key you have provided."
elif [ "$SPLAT" = "error:invalid_nzbid" ]; then
    echo "NZBid: There is a problem with the NZBid supplied."
elif [ "$SPLAT" = "error:please_wait_x" ]; then
    echo "Wait: Please wait x seconds before retry."
elif [ "$SPLAT" = "error:vip_only" ]; then
    echo "VIP Only: NZBMatrix Offers Search to VIP Members Only."
elif [ "$SPLAT" = "error:disabled_account" ]; then
    echo "Account: User Account Disabled."
elif [ "$SPLAT" = "error:x_daily_limit" ]; then
    echo "Limit: You have reached the daily download limit of x."
elif [ "$SPLAT" = "error:no_nzb_found" ]; then
    echo "NoNZB: No NZB found."
else
#    echo -e "$SPLAT"
    echo -e "Title|Link|NZBid|Category|IndexDate|$FileSize"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -2 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -2 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -2 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -3 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -3 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -1 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -3 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -1 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -1 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -4 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -4 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -2 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -4 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -2 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -2 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -5 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -5 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -3 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -5 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -3 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -3 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -6 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -6 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -4 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -6 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -4 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -4 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -7 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -7 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -5 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -7 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -5 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -5 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -8 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -8 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -6 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -8 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -6 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -6 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -9 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -9 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -7 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -9 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -7 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -7 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -10 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -10 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -8 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -10 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -8 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -8 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -11 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -11 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -9 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -11 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -9 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -9 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -12 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -12 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -10 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -12 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -10 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -10 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -13 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -13 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -11 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -13 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -11 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -11 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -14 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -14 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -12 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -14 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -12 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -12 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -14 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -14 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -13 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -14 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -13 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -13 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -15 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -15 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -14 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -15 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -14 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -14 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -16 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -16 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -15 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -16 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -15 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -15 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -17 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -17 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -16 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -17 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -16 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -16 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -18 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -18 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -17 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -18 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -17 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -17 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -19 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -19 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -18 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -19 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -18 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -18 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -20 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -20 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -19 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -20 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -19 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -19 | tail -1`"
    echo -e "`$CAT $TMP/nzblatestcurl.txt | grep "<title>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -21 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -21 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<link>" | grep "http://nzbmatrix.com/nzb-details.php?id=" | cut -f 1 -d "&" | cut -f 2 -d "=" | head -20 | tail -1`|`$CAT $TMP/nzblatestcurl.txt | grep "<category>" | cut -f 2 -d "<" | cut -f 2 -d ">" | head -21 | tail -1`|`$CAT $TMP/nzblatestelinks.txt |grep "Added:" | cut -f 1 -d "]" | cut -f 2 -d ":" | head -20 | tail -1 | cut -f 2 -d " " | cut -f 1 -d " "`|`$CAT $TMP/nzblatestelinks.txt | grep "Size:" | cut -f 2 -d ":" |tr -d " " | head -20 | tail -1`"
echo " "
fi
fi
exit 0
