#! /bin/sh

mkdir $1
cd $1
curl -L https://github.com/interstar/planetplanet/zipball/master > planet.zip

unzip planet.zip

mv interstar-planetplanet* p2
mv p2/* .
rm -rf p2

rm planet.zip
cp -r examples/* .
cp -r output/* .

mv fancy/index.html.tmpl .

echo "Path here : $(pwd)"

echo "#! /bin/sh" > refresh.sh

echo "cd $(pwd)" >> refresh.sh
echo "python ./planet.py $(pwd)/fancy/config.ini" >> refresh.sh

chmod +x refresh.sh

cat fancy/config.ini | python ../reconfig.py $(pwd) > xxx
mv xxx fancy/config.ini 

echo "You may want to update your 'crontab' so that the computer automatically updates the feed at regular times. Run the crontab editor using :"
echo "crontab -e"

echo "and add the following line or suitable variant."
echo "53 * * * * $(pwd)/refresh.sh"

echo "More documentation on crontab is here : http://www.adminschoice.com/crontab-quick-reference"

