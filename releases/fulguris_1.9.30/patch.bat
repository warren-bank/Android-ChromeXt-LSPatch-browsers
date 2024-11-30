@echo off

set DIR=%~dp0.

call "E:\PortableApps\Java\env.bat"

set assets_dir=%DIR%\..\..\assets

set output_dir=%DIR%\out
set output_log=%output_dir%\%~n0.log
if exist "%output_dir%" rmdir /Q /S "%output_dir%"
mkdir "%output_dir%"

set browser_apk=%DIR%\net.slions.fulguris.full.fdroid_230.apk
set chromext_apk=%assets_dir%\ChromeXt-signed.apk
set lspatch_jar=%assets_dir%\jar-v0.6-426-release.jar

call java -jar "%lspatch_jar%" "%browser_apk%" -d -v -m "%chromext_apk%" -o "%output_dir%" --force >"%output_log%" 2>&1
