@echo off
cd /d %~dp0
if not exist core (
	set "tmp=%~dp0tmp"
	md tmp
	curl -L -o setup.exe "https://download.mozilla.org/?product=thunderbird-latest&os=win&lang=en-US"
	start /b setup.exe
	echo copying file...
	timeout /T 10
	for /d %%i in ("tmp\7*") do robocopy %%i\core core /S /Z
	taskkill /IM "setup.exe" /F
	rd tmp /s /q
	del setup.exe /q
	cls &echo done!
	md .profile
	pause
	exit
	)
start /b core\thunderbird -profile .profile

