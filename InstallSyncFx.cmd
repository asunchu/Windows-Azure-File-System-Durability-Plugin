REM Copyright © Microsoft Corporation.  All Rights Reserved.
REM This code released under the terms of the 
REM Apache License, Version 2.0 (http://opensource.org/licenses/Apache-2.0)
REM This script uses code from http://www.robvanderwoude.com/
REM Install Microsoft Sync Framework 2.1

@ECHO OFF
SETLOCAL
IF "%~1"=="" (SET Computer=%ComputerName%) ELSE (SET Computer=%~1)
IF /I NOT "%Computer%"=="%ComputerName%" (
       PING %Computer% -n 2 2>NUL | FIND "TTL=" >NUL || GOTO Syntax
       )
       FOR /F "tokens=2 delims==" %%A IN ('WMIC /Node:%Computer% Path Win32_Processor Get AddressWidth /Format:list') DO SET OSVersion=%%A
IF "%OSVersion%"=="64" (
%windir%\System32\msiexec.exe /i "%~dp0\syncfx\Synchronization-v2.1-x64-ENU.msi" /quiet
%windir%\System32\msiexec.exe /i "%~dp0\syncfx\ProviderServices-v2.1-x64-ENU.msi" /quiet) ELSE (
%windir%\System32\msiexec.exe /i "%~dp0\syncfx\Synchronization-v2.1-x86-ENU.msi" /quiet
%windir%\System32\msiexec.exe /i "%~dp0\syncfx\ProviderServices-v2.1-x86-ENU.msi" /quiet)