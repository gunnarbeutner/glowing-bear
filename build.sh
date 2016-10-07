#!/bin/sh
rm -rf app
rm -rf /tmp/glowing-bear-dist
mkdir /tmp/glowing-bear-dist /tmp/glowing-bear-dist/osx

npm run build-electron-darwin
mv 'SBFL Chat-darwin-x64/SBFL Chat.app' /tmp/glowing-bear-dist/osx
rm -rf 'SBFL Chat-darwin-x64'
~/create-dmg/create-dmg --volname "SBFL Chat" --volicon assets/img/glowing-bear.icns --window-pos 200 120 --window-size 800 400 --icon-size 100 --icon 'SBFL Chat.app' 200 190 --hide-extension 'SBFL Chat.app' --app-drop-link 600 185 sbfl-chat.dmg /tmp/glowing-bear-dist/osx
mv sbfl-chat.dmg /tmp/glowing-bear-dist/

npm run build-electron-windows
zip -9mr sbfl-chat.zip 'SBFL Chat-win32-ia32'
mv sbfl-chat.zip /tmp/glowing-bear-dist/

npm run build-electron-linux
GZIP=-9 tar cfz sbfl-chat.tar.gz 'SBFL Chat-linux-x64'
rm -rf 'SBFL Chat-linux-x64'
mv sbfl-chat.tar.gz /tmp/glowing-bear-dist/

mkdir -p app
mv /tmp/glowing-bear-dist/sbfl-chat.* app/
ls -l app/
