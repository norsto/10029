#!/bin/bash

#This wget collects the script from Wikipedia and puts it into a html document called
#kommuner.html. Kommuner=municipalities
wget -O kommuner.html http://en.wikipedia.org/wiki/List_of_municipalities_of_Norway

#This cat looks at the kommuner.html where the script for the entire website is located.
#After the | the pup installation extracts the table part of the kommuner.html document, it
#will put the exracted table in a document called extracted_table.html.
cat kommuner.html | pup 'table.sortable.wikitable.jquery-tablesorter' > extracted_table.html

#These commands puts the extracted tables and puts it in an index.html document
echo "<html><body><h1>Norwegian Municipalities</h1><table>" > index.html
cat  extracted_table.html >> index.html
echo "</table></body><html>" >> index.html

#This opens the index.html
xdg-open index.html
