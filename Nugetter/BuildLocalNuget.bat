@echo off

cd ..
RMDIR /S /Q Build142
cmake.exe -DBUILD_SHARED_LIBS:BOOL=true -G "Visual Studio 16 2019" -A x64 -S . -B Build142

rem RMDIR /S /Q Build140
rem cmake.exe -DBUILD_SHARED_LIBS:BOOL=true -G "Visual Studio 14 2015" -A x64 -S . -B Build140

cd Nugetter


MSBuild ../Build142/ALL_BUILD.vcxproj /p:Configuration=Debug /p:Platform=x64
MSBuild ../Build142/ALL_BUILD.vcxproj /p:Configuration=RelWithDebInfo /p:Platform=x64
rem MSBuild ../Build140/ALL_BUILD.vcxproj /p:Configuration=Debug /p:Platform=x64
rem MSBuild ../Build140/ALL_BUILD.vcxproj /p:Configuration=RelWithDebInfo /p:Platform=x64

set /p Build=<build.txt
set /a Build+=1
echo %Build% >build.txt

c:/work/nuget.exe pack -Version 2.5.5.%Build% Freetype-Tekla.redist.nuspec
c:/work/nuget.exe pack -Version 2.5.5.%Build% Freetype-Tekla.nuspec
