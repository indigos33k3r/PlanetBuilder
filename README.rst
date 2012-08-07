PlanetBuilder
=============

PlanetBuilder is a quick script to bootstrap an RSS planet on a Unix system. 

Planets are now an old (and tried) technology : simple RSS aggregators that poll a number of feeds (RSS or Atom) and write a flat HTML file aggregating them together. Planet itself is basically Python glue, that uses Mark Pilgrim's Universal Feed Parser to read from RDF, RSS and Atom feeds; and Tomas Styblo's templating engine to output static files in any format you can dream up. 

To find out more about Planet see http://www.planetplanet.org/

PlanetBuilder is an even simpler script that installs and configures Planet on Unix systems requiring as little work as possible.

Using PlanetBuilder
-------------------

Simply copy the two scripts : planets.sh and reconfig.py into an empty directory somewhere and type

./planet.sh NEWPLANET

where NEWPLANET is the name of the new planet you want to create. The script will create a new directory called NEWPLANET, download Planet code into it and configure the directory for use. 

Specify the feeds you want to aggregate in NEWPLANET/fancy/config.ini

To refresh the feed you can now run the script : NEWPLANET/refresh.sh

And the installer will finish by advising how to update your Crontab file to ensure regular calls.
