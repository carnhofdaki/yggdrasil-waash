@ECHO OFF & CLS & echo:

NET FILE 1>NUL 2>NUL & IF ERRORLEVEL 1 (ECHO You must right-click and select & ECHO "RUN AS ADMINISTRATOR"  to run this batch. Exiting... & echo: & PAUSE & EXIT /D)
REM ... proceed here with admin rights ...

rem Print a beautiful ASCIIart logo
type %~dp0\deps\logo.txt
echo:
echo:

rem Check for configuration file
rem If it is not present, generate a new one and add peers
if exist %~dp0\ygg-conf.txt (
    echo Configuration file already exists. It will be used.
	echo %~dp0%ygg-conf.txt
	echo:
	echo To generate a new one, delete ygg-conf.txt and re-run
	echo this batch file.
	echo:
) else (
    rem file doesn't exist
	echo Generating a new configuration file...
	%~dp0\deps\bin\yggdrasil-0.3.5-windows-i386.exe -genconf | %~dp0\deps\bin\sed.exe "/^  Peers:.*$/d;/^}/d" > %~dp0\ygg-conf.txt
	type %~dp0\deps\peers.txt >> %~dp0\ygg-conf.txt
	echo: >> %~dp0\ygg-conf.txt
	echo } >> %~dp0\ygg-conf.txt
	echo %~dp0%ygg-conf.txt
	echo:
)

echo TIP: To edit UNIX files on Windows, use Notepad++ https://notepad-plus-plus.org/
echo:

rem Install TAP from OpenVPN
%~dp0\deps\bin\tap-windows-9.9.2_3.exe /S

rem Run Yggdrasil
%~dp0\deps\bin\yggdrasil-0.3.5-windows-i386.exe -useconffile %~dp0\ygg-conf.txt
pause
