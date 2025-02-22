@echo off

if [%1] == [] goto usage

set fullpath=%1
for /f "tokens=*" %%a in ("%fullpath%") do set "filename=%%~nxa"
set "fullpath=%fullpath:\=/%"

@echo INFO: Launching %filename% in renode...
REM renode -e "$bin=@./uart.elf" -e "include @bare-metal-app.resc" -e "start" --console
renode -e "$bin=@%fullpath%" -e "include @bare-metal-app.resc" -e "start" --console

:usage
@echo %0 [elf-filename]
