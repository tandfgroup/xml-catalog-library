@echo off
pushd "%~dp0.."
call .\gradlew.bat test
popd
