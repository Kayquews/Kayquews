#!/bin/bash

# Script para atualizar a análise do perfil com timestamp atual
# Profile Analysis Update Script

echo "🔄 Atualizando análise do perfil..."

# Obter data atual em português
DATA_ATUAL=$(date +"%d/%m/%Y às %H:%M")

# Atualizar o arquivo com a data atual (usando # como delimitador)
sed -i "s#\$(date +\"%d/%m/%Y às %H:%M\")#$DATA_ATUAL#g" PROFILE_ANALYSIS.md

echo "✅ Análise atualizada com sucesso!"
echo "📅 Data: $DATA_ATUAL"