@echo off
setlocal
echo === MiniNova Compiler - Windows Builder & Runner ===
echo [1] Compilando o projeto com Maven (JavaCC)...
call mvn compile

if %errorlevel% neq 0 (
    echo [ERRO] Falha na compilacao do Maven.
    exit /b %errorlevel%
)

echo [BUILD SUCCESS] Compilacao concluida!
if "%~1"=="" (
    echo Executando MiniNova via entrada padrao (Console)...
    call mvn exec:java -Dexec.mainClass="MiniNova"
) else (
    echo Executando MiniNova com o arquivo: %~1
    call mvn exec:java -Dexec.mainClass="MiniNova" -Dexec.args="%~1"
)
endlocal