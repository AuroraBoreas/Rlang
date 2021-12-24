@REM a simple batch script which does some boring stuff

@echo off
goto :main

:copy_right
	echo.
	echo   === SSVE Pmod/SET White Blance ===
	echo   === powered by @ZL, 20211220   ===
	echo.
goto :eof

:main
	call :copy_right
	
	set path=".\main.py"
	d:\DevEnv\WPy32-3741\python-3.7.4\python.exe %path%

	echo.
	pause
goto :eof