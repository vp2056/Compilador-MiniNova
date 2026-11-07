#!/bin/bash
echo "=== MiniNova Compiler - Linux Builder & Runner ==="
echo "[1] Compilando o projeto com Maven (JavaCC)..."
mvn compile

if [ $? -eq 0 ]; then
    echo "[BUILD SUCCESS] Compilacao concluida!"
    if [ -z "$1" ]; then
        echo "Executando MiniNova via entrada padrao (Console)..."
        mvn exec:java -Dexec.mainClass="MiniNova"
    else
        echo "Executando MiniNova com o arquivo: $1"
        mvn exec:java -Dexec.mainClass="MiniNova" -Dexec.args="$1"
    fi
else
    echo "[ERRO] Falha na compilacao do Maven."
    exit 1
fi