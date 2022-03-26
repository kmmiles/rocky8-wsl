@echo off

:do_prompt
  choice /C YN /M "IF THE 'rocky8' DISTRO ALREADY EXISTS IT WILL BE REMOVED!!!"
  IF ERRORLEVEL 2 goto do_exit 
  IF ERRORLEVEL 1 goto do_install
  goto do_prompt

:do_install
  wsl --terminate rocky8 >nul 2>&1
  wsl --unregister rocky8 >nul 2>&1
  wsl --import rocky8 %USERPROFILE%\WSL2\systems\rocky8 .\rocky8-wsl-container.tar

  echo rocky8 should now be available in Windows Terminal (may require restart)
  echo Otherwise you may start it manually with `wsl -d rocky8`
  echo Starting rocky8 distro..
  wsl -d rocky8

:do_exit
  echo Exiting...
  pause
  exit /b
