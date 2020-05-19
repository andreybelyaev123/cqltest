@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  cqltest startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and CQLTEST_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-Djavax.net.ssl.trustStore=/opt/reuters/apps/cassandra_truststore.jks" "-Djavax.net.ssl.trustStorePassword=amazon"

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

set CLASSPATH=%APP_HOME%\lib\cqltest-1.0-SNAPSHOT.jar;%APP_HOME%\lib\slf4j-log4j12-1.6.1.jar;%APP_HOME%\lib\java-driver-query-builder-4.1.0.jar;%APP_HOME%\lib\aws-sigv4-auth-cassandra-java-driver-plugin-4.0.2.jar;%APP_HOME%\lib\java-driver-core-4.4.0.jar;%APP_HOME%\lib\metrics-core-4.0.5.jar;%APP_HOME%\lib\tinkergraph-gremlin-3.3.3.jar;%APP_HOME%\lib\gremlin-core-3.3.3.jar;%APP_HOME%\lib\jcl-over-slf4j-1.7.21.jar;%APP_HOME%\lib\slf4j-api-1.7.26.jar;%APP_HOME%\lib\log4j-1.2.16.jar;%APP_HOME%\lib\native-protocol-1.4.8.jar;%APP_HOME%\lib\netty-handler-4.1.39.Final.jar;%APP_HOME%\lib\java-driver-shaded-guava-25.1-jre.jar;%APP_HOME%\lib\config-1.3.4.jar;%APP_HOME%\lib\jnr-posix-3.0.50.jar;%APP_HOME%\lib\jnr-ffi-2.1.10.jar;%APP_HOME%\lib\HdrHistogram-2.1.11.jar;%APP_HOME%\lib\jcip-annotations-1.0-1.jar;%APP_HOME%\lib\spotbugs-annotations-3.1.12.jar;%APP_HOME%\lib\aws-java-sdk-core-1.11.717.jar;%APP_HOME%\lib\validation-api-2.0.0.Final.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\esri-geometry-api-1.2.1.jar;%APP_HOME%\lib\jackson-databind-2.10.0.jar;%APP_HOME%\lib\jackson-dataformat-cbor-2.6.7.jar;%APP_HOME%\lib\jackson-core-2.10.0.jar;%APP_HOME%\lib\reactive-streams-1.0.2.jar;%APP_HOME%\lib\httpclient-4.5.9.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\ion-java-1.0.2.jar;%APP_HOME%\lib\joda-time-2.8.1.jar;%APP_HOME%\lib\netty-codec-4.1.39.Final.jar;%APP_HOME%\lib\netty-transport-4.1.39.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.39.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.39.Final.jar;%APP_HOME%\lib\netty-common-4.1.39.Final.jar;%APP_HOME%\lib\jffi-1.2.19.jar;%APP_HOME%\lib\jffi-1.2.19-native.jar;%APP_HOME%\lib\asm-commons-7.1.jar;%APP_HOME%\lib\asm-util-7.1.jar;%APP_HOME%\lib\asm-analysis-7.1.jar;%APP_HOME%\lib\asm-tree-7.1.jar;%APP_HOME%\lib\asm-7.1.jar;%APP_HOME%\lib\jnr-a64asm-1.0.0.jar;%APP_HOME%\lib\jnr-x86asm-1.0.2.jar;%APP_HOME%\lib\jnr-constants-0.9.12.jar;%APP_HOME%\lib\json-20090211.jar;%APP_HOME%\lib\jackson-core-asl-1.9.12.jar;%APP_HOME%\lib\gremlin-shaded-3.3.3.jar;%APP_HOME%\lib\commons-configuration-1.10.jar;%APP_HOME%\lib\commons-collections-3.2.2.jar;%APP_HOME%\lib\snakeyaml-1.15.jar;%APP_HOME%\lib\javatuples-1.2.jar;%APP_HOME%\lib\hppc-0.7.1.jar;%APP_HOME%\lib\jcabi-manifests-1.1.jar;%APP_HOME%\lib\javapoet-1.8.0.jar;%APP_HOME%\lib\exp4j-0.4.8.jar;%APP_HOME%\lib\commons-lang3-3.3.1.jar;%APP_HOME%\lib\jackson-annotations-2.10.0.jar;%APP_HOME%\lib\httpcore-4.4.11.jar;%APP_HOME%\lib\commons-codec-1.11.jar;%APP_HOME%\lib\commons-lang-2.6.jar;%APP_HOME%\lib\jcabi-log-0.14.jar

@rem Execute cqltest
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %CQLTEST_OPTS%  -classpath "%CLASSPATH%" com.clarivate.cql.AmazonKeyspaces %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable CQLTEST_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%CQLTEST_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
