@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  benchmark_worker startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and BENCHMARK_WORKER_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-javaagent:/home/user/.gradle/caches/modules-2/files-2.1/org.mortbay.jetty.alpn/jetty-alpn-agent/2.0.9/929172f5e38dde92b092f1ca359892e992f25965/jetty-alpn-agent-2.0.9.jar" "-server" "-Xms2g" "-Xmx2g" "-XX:+PrintGCDetails"

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\grpc-benchmarks-1.25.0.jar;%APP_HOME%\lib\grpc-netty-1.25.0.jar;%APP_HOME%\lib\grpc-okhttp-1.25.0.jar;%APP_HOME%\lib\grpc-testing-1.25.0.jar;%APP_HOME%\lib\grpc-core-1.25.0.jar;%APP_HOME%\lib\grpc-stub-1.25.0.jar;%APP_HOME%\lib\grpc-protobuf-1.25.0.jar;%APP_HOME%\lib\junit-4.12.jar;%APP_HOME%\lib\mockito-core-2.25.1.jar;%APP_HOME%\lib\HdrHistogram-2.1.10.jar;%APP_HOME%\lib\netty-tcnative-boringssl-static-2.0.26.Final.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.1.42.Final-linux-x86_64.jar;%APP_HOME%\lib\commons-math3-3.6.jar;%APP_HOME%\lib\grpc-protobuf-lite-1.25.0.jar;%APP_HOME%\lib\grpc-api-1.25.0.jar;%APP_HOME%\lib\gson-2.8.5.jar;%APP_HOME%\lib\annotations-4.1.1.4.jar;%APP_HOME%\lib\perfmark-api-0.19.0.jar;%APP_HOME%\lib\opencensus-contrib-grpc-metrics-0.21.0.jar;%APP_HOME%\lib\opencensus-api-0.21.0.jar;%APP_HOME%\lib\netty-codec-http2-4.1.42.Final.jar;%APP_HOME%\lib\netty-handler-proxy-4.1.42.Final.jar;%APP_HOME%\lib\okio-1.13.0.jar;%APP_HOME%\lib\okhttp-2.5.0.jar;%APP_HOME%\lib\protobuf-java-3.10.0.jar;%APP_HOME%\lib\guava-28.1-android.jar;%APP_HOME%\lib\proto-google-common-protos-1.12.0.jar;%APP_HOME%\lib\hamcrest-core-1.3.jar;%APP_HOME%\lib\byte-buddy-1.9.7.jar;%APP_HOME%\lib\byte-buddy-agent-1.9.7.jar;%APP_HOME%\lib\objenesis-2.6.jar;%APP_HOME%\lib\netty-transport-native-unix-common-4.1.42.Final.jar;%APP_HOME%\lib\netty-codec-http-4.1.42.Final.jar;%APP_HOME%\lib\netty-handler-4.1.42.Final.jar;%APP_HOME%\lib\netty-codec-socks-4.1.42.Final.jar;%APP_HOME%\lib\netty-codec-4.1.42.Final.jar;%APP_HOME%\lib\netty-transport-4.1.42.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.42.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.42.Final.jar;%APP_HOME%\lib\netty-common-4.1.42.Final.jar;%APP_HOME%\lib\grpc-context-1.25.0.jar;%APP_HOME%\lib\error_prone_annotations-2.3.3.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.17.jar;%APP_HOME%\lib\failureaccess-1.0.1.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\checker-compat-qual-2.5.5.jar;%APP_HOME%\lib\j2objc-annotations-1.3.jar

@rem Execute benchmark_worker
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %BENCHMARK_WORKER_OPTS%  -classpath "%CLASSPATH%" io.grpc.benchmarks.driver.LoadWorker %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable BENCHMARK_WORKER_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%BENCHMARK_WORKER_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
