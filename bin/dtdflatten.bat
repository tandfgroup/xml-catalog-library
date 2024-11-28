@echo off
setlocal
pushd "%~dp0.."
if not ""%1"" == """" (set DTDFLATTEN_OUTPUT_NAME=-PDtdAnalyzer_dtdflatten_output_name="%1")
if not ""%2"" == """" (set DTDFLATTEN_SOURCE_PATH=-PDtdAnalyzer_dtdflatten_source_path="%~f2")
call .\gradlew.bat DtdAnalyzer_dtdflatten %DTDFLATTEN_OUTPUT_NAME% %DTDFLATTEN_SOURCE_PATH%
popd
