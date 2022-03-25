@echo off

:do_prompt
   echo *** IF THE 'rocky8' DISTRO ALREADY EXISTS IT WILL BE REMOVED!!! ***
   set /p answer=Are you sure you want to install (Y/N)?
   if /i "%answer:~,1%" EQU "Y" goto do_install
   if /i "%answer:~,1%" EQU "N" goto do_exit
   echo Please type Y for Yes or N for No
   goto do_prompt

:do_install
  wsl --terminate rocky8 >nul 2>&1
  wsl --unregister rocky8 >nul 2>&1
  wsl --import rocky8 %USERPROFILE%\WSL2\systems\rocky8 .\rocky8-wsl-container.tar
  wsl -d

:do_exit
  echo Exiting...
  pause
  exit /b
