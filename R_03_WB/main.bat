@REM a simple batch script which does some boring stuff

@echo off
goto :main

:clean
	echo.
	for /r /d %%d in (*report*) do if exist "%%d" rd /s /q "%%d"
	mkdir report
goto :eof

:copy_right
	echo.
	echo   === SSVE Pmod/SET White Blance ===
	echo   === powered by @ZL, 20211220   ===
	echo.
goto :eof

:main
	call :copy_right
	@REM call :clean
	
	echo === Wrangling ===
	set python="D:\DevEnv\WPy32-3741\python-3.7.4\python.exe"
	set pyscript=".\main.py"
	%python% %pyscript%
	
	echo.
	
	echo === Visualization ===
	set r="D:\DevEnv\R-Portable\App\R-Portable\bin\Rscript.exe"
	set rscript=".\wb.R"
	%r% -e setwd('.')
	%r% --no-save --slave %rscript%
	
	start Rplots.pdf
	
	echo.
	pause
goto :eof