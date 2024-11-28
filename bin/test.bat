@echo off
pushd "%~dp0.."
call .\gradlew.bat basex_parse_examples
popd
