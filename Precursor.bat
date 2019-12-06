@ECHO OFF
C:
CD\
CLS
MODE 50,20
set version=0.02
TITLE Precursor: MCCMM v%version%

for /f "tokens=2 delims==" %%a in ('findstr mccdir %~dp0\settings.ini') do set installdir=%%a


:MENU
CLS

ECHO +++Precursor+++++++++++++++++++++++++++++
ECHO +++Master Chief Collection Mod Manager+++
ECHO ++++++++++++++++++++++++++By SolidGary+++
ECHO 1.  Launch MCC (Modded)
ECHO 2.  Launch MCC (Vanilla)
ECHO 3.  Forge Unlocker
ECHO 4.  Custom Maps and Variants
ECHO 5.  Custom Modes
ECHO 6.  Other Mods
ECHO 7.  Options
ECHO.
SET INPUT=
SET /P INPUT=Please select a number:

IF /I '%INPUT%'=='1' GOTO LaunchModded
IF /I '%INPUT%'=='2' GOTO LaunchVanilla
IF /I '%INPUT%'=='3' GOTO HaloForgeUnlockMenu
IF /I '%INPUT%'=='4' GOTO CustomMapsMenu
IF /I '%INPUT%'=='5' GOTO CustomModesMenu
IF /I '%INPUT%'=='6' GOTO OtherModsMenu
IF /I '%INPUT%'=='7' GOTO Options

IF /I '%INPUT%'=='Q' GOTO Quit
IF /I '%INPUT%'=='M' GOTO MENU

CLS

ECHO +++Precursor+++++++++++++++++++++++++++++
ECHO +++Master Chief Collection Mod Manager+++
ECHO +++++++++++++++++++++++++++++++++++++++++
ECHO Invalid Option.
ECHO Press Enter To Continue.

PAUSE > NUL
GOTO MENU

:Twitter

start "webpage name" "https://twitter.com/SolidGary"
GOTO MENU

:Github

start "webpage name" "https://github.com/SolidGary"
GOTO MENU

:LaunchModded

START /d "%installdir%\MCC\Binaries\Win64\" MCC-Win64-Shipping.exe
GOTO MENU

:LaunchVanilla

START /d "%installdir%" mcclauncher.exe
GOTO MENU

:Options
CLS
ECHO +++Precursor+++++++++++++++++++++++++++++
ECHO +++Master Chief Collection Mod Manager+++
ECHO +++++++++++++++++++++++++++++++++++++++++
ECHO.
ECHO Halo MCC Working Directory.
ECHO "%installdir%"
ECHO.
ECHO Press Enter To Continue.

PAUSE > NUL
GOTO MENU
:Quit
CLS
EXIT

:HaloForgeUnlockMenu
CLS

ECHO +++Halo Forge Unlocker+++
ECHO +++++++++++++++++++++++++
ECHO 1.  Unlock Forge
ECHO 2.  Lock Forge (Undo Changes)


SET INPUT=
SET /P INPUT=Please select a number:


IF /I '%INPUT%'=='1' GOTO HaloForgeUnlocker
IF /I '%INPUT%'=='2' GOTO HaloForgeUndo

IF /I '%INPUT%'=='Q' GOTO Quit
IF /I '%INPUT%'=='M' GOTO MENU

:HaloForgeUnlocker
CLS

ECHO +++Halo Forge Unlocker+++
ECHO +++++++++++++++++++++++++
ECHO Unlocking Forge
mkdir "%installdir%MCC\Content\Paks\mods"
copy %~dp0\assets\MCC\Content\Paks\mods\ForgeEnabled_p.pak "%installdir%MCC\Content\Paks\mods\" >NUL
ECHO Press Enter To Go Home.
PAUSE>NUL
GOTO MENU


IF /I '%INPUT%'=='1' GOTO HaloForgeUnlocker
IF /I '%INPUT%'=='2' GOTO HaloForgeUndo

IF /I '%INPUT%'=='Q' GOTO Quit
IF /I '%INPUT%'=='M' GOTO MENU

:HaloForgeUndo
CLS

ECHO +++Halo Forge locker+++
ECHO +++++++++++++++++++++++
ECHO Locking Forge
rmdir /S /Q "%installdir%MCC\Content\Paks\mods"
ECHO Press Enter To Go Home.
PAUSE>NUL
GOTO MENU


IF /I '%INPUT%'=='1' GOTO HaloForgeUnlocker
IF /I '%INPUT%'=='2' GOTO HaloForgeUndo

IF /I '%INPUT%'=='Q' GOTO Quit
IF /I '%INPUT%'=='M' GOTO MENU

:CustomMapsMenu
CLS

ECHO +++Custom Maps Menu+++
ECHO ++++++++++++++++++++++
ECHO 1.  Sync Maps (Downloads. Must Run First!)
ECHO 2.  Install Forge World Unlimited


SET INPUT=
SET /P INPUT=Please select a number:


IF /I '%INPUT%'=='1' GOTO SyncMaps
IF /I '%INPUT%'=='2' GOTO ForgeWorldUnlimitedInstall

IF /I '%INPUT%'=='Q' GOTO Quit
IF /I '%INPUT%'=='M' GOTO MENU

:SyncMaps
CLS

ECHO +++Sync Maps+++
ECHO ++++++++++++++++++++++
ECHO Starting sync with server...


bitsadmin /transfer "Forge World Unlimited" /priority high /download https://boy.soy/h/forge_halo.map "%~dp0\assets\haloreach\maps\forge_halo.map"  

PAUSE>NUL
GOTO MENU              