echo build web app
call flutter build web -t lib\rocket-main.dart

xcopy build\web H:\data\gael-home\war\web\rocket\web /SY
