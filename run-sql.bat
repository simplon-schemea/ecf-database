@echo off

set PARTS=1 2

if [%1] neq [] set PARTS=%1

cd %~dp0

for %%p in (%PARTS%) do (
   call :runsql %%p
   echo;
   echo;
)

goto :eof

:runsql
setlocal
set "FOLDER=Part %1" 

echo ========================================PART %1========================================
echo;
echo ========Executing DDL============
echo;
psql -h localhost -p 5432 -U postgres -f "%FOLDER%/ddl.sql" > nul
echo;

echo ========Executing DML============
echo;
psql -h localhost -p 5432 -U postgres -f "%FOLDER%/dml.sql" > nul
echo;

echo ========Executing REQUEST========
echo;
psql -h localhost -p 5432 -U postgres -f "%FOLDER%/request.sql"
echo;

endlocal

goto :eof