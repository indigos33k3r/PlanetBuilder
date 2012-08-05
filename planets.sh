#! /bin/sh

mkdir $1
cd $1
curl http://www.planetplanet.org/download/planet-nightly.zip > planet.zip
unzip planet.zip
cp planet-nightly/examples/* .
cp -r planet-nightly/examples/fancy .
cp -r planet-nightly/examples/basic .

cp -r planet-nightly/examples/output/* .

mv fancy/index.html.tmpl .

rm planet.zip

echo $(pwd)

echo "#! /bin/sh" > refresh.sh

echo "cd $(pwd)" >> refresh.sh
echo "python ./planet-nightly/planet.py $(pwd)/fancy/config.ini" >> refresh.sh

chmod +x refresh.sh

cat fancy/config.ini | python ../reconfig.py $(pwd) > xxx
mv xxx fancy/config.ini 

echo "You may want to update your 'crontab' so that the computer automatically updates the feed at regular times. Run the crontab editor using :"
echo "crontab -e"

echo "and add the following line or suitable variant."
echo "53 * * * * $(pwd)/refresh.sh"

echo "More documentation on crontab is here : http://www.adminschoice.com/crontab-quick-reference"

