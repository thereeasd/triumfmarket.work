@echo off
chcp 1251
# input
Setlocal EnableDelayedExpansion
set Backup_folder_2=Z:\base\
set srv_folder=C:\backup\
set Backup_folder=O:\
set CompleteUpload=Z:\completeUpload.txt
# checkout
if exist %CompleteUpload% (
  del %CompleteUpload%
)
IF NOT EXIST O:\ (
 NET USE O: \\srv-backup-2\Backups-3\DailyBackup /PERSISTENT:yes /User:triumf.local\
)
IF NOT EXIST Z:\ (
 NET USE Z: \\SRV-db-1\srv-db-4_bak /PERSISTENT:YES /User:triumf.local\eaa $uperpas_912
)
if exist %Backup_folder_2% (
 rmdir /s /q %Backup_folder_2%
)
mkdir %Backup_folder_2%
# cycle body
for /f "usebackq tokens=*" %%a in (`dir /b %Backup_folder%`) do call :DelFromBackup_folder "%%a"
for /f "usebackq tokens=*" %%c in (`dir /b %srv_folder%`) do call :DelFromsrv_folder "%%c"
robocopy %srv_folder% %Backup_folder_2% /s /LOG+:%Backup_folder_2%robolog.txt
copy nul %CompleteUpload%
robocopy %srv_folder% %Backup_folder%  /s /log+:%Backup_folder%robolog.txt
goto :eof
# function
:DelFromBackup_folder
set /a y=0
for /f "usebackq tokens=*" %%d in (`dir /t:w /o:-d /b %Backup_folder%%~1%`) do (
	set /a y+=1
	if !y! GTR 4 (del %Backup_folder%%~1\%%d) 
)
:DelFromsrv_folder
set /a y=0
for /f "usebackq tokens=*" %%f in (`dir /t:w /o:-d /b %srv_folder%%~1%`) do (
	set /a y+=1
	if !y! GTR 1 (del %srv_folder%%~1\%%f) 
)

