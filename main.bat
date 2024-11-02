@echo off
setlocal enabledelayedexpansion

:infinite_loop
    :: Gera uma extensão aleatória entre 1 e 4 letras minúsculas
    set "ext="
    set /a "ext_length=!random! %% 4 + 1"
    for /L %%j in (1,1,!ext_length!) do (
        set /a "char=!random! %% 26 + 97"
        cmd /c exit /b !char! >nul
        set "ext=!ext!!=ExitCodeAscii!"
    )

    :: Define o nome do arquivo
    set "filename=file.!ext!"

    :: Verifica se o arquivo já existe
    if exist "!filename!" (
        goto infinite_loop
    ) else (
        > "!filename!" echo.
        echo Arquivo criado: !filename!
    )

:: Repete o loop infinitamente
goto infinite_loop

endlocal
