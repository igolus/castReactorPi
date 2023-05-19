#!/bin/bash
ONLINE=1
TRY=0
while [ $ONLINE -ne 0 ] && [ $TRY -le 10 ]
do
   ping -q -c 1 -w 1 www.google.com >/dev/null 2>&1
   ONLINE=$?
   if [ $ONLINE -ne 0 ]
     then
       sleep 2
   fi
   echo $TRY
   TRY=$((TRY+1))
done

echo $ONLINE

if [ $ONLINE -eq 0 ]; then
  echo "We are on line!"
fi

chromium-browser --no-sandbox --kiosk --window-size=$screenSize --no-first-run --fast --fast-start --password-store=basic --disable-features=TouchpadOverscrollHistoryNavigation --disable-features=TranslateUI --noerrdialogs --incognito --disable-pinch --overscroll-history-navigation=0 --disable-infobars https://dashboard.castreactor.com/connect &