@echo off

cd %~dp0

echo ========================================PART 1========================================
echo;
call :runsql 1

echo;
echo;

echo ========================================PART 2========================================
echo;
call :runsql 2

goto :eof

:runsql
setlocal
set "FOLDER=Part %1" 

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