@echo off
set "build_folder=build"

if not exist "%build_folder%" (
    echo Build folder does not exist.
    exit /b 1
)

for /r "%build_folder%" %%F in (*) do (
    if not "%%~nxF"==".gitkeep" (
        if not "%%~nxF"==".gdignore" (
            del "%%F"
            echo Removed: %%F
        )
    )
)

echo Cleanup completed!