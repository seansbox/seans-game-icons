#!/bin/bash

rm -rf ../icons
curl -LO http://game-icons.net/archives/svg/zip/000000/transparent/game-icons.net.svg.zip
python -c "import zipfile; zipfile.ZipFile('game-icons.net.svg.zip', 'r').extractall('.')"
pushd icons/000000/transparent/1x1/
for d in */; do for f in "$d"*.svg; do b=${f##*/}; mv "$f" "../../../${b%.*}-${d%/}.svg"; done; done
popd
rm -rf icons/000000 game-icons.net.svg.zip
pushd icons
sed -i.bak 's|<path fill="#000" \([^/]*\)/|<path stroke="#000000" stroke-width="40" stroke-linecap="round" stroke-linejoin="round" \1/><path fill="#FFFFFF" \1/|g' *.svg
sed -i.bak 's|viewBox="0 0 512 512"|viewBox="-32 -32 576 576"|g' *.svg
rm *.bak
popd
mv icons ..
