#!/bin/bash

# Script de Diário Pessoal
# Autor: Victor
# Versão: 1.0

# Diretório base do diário
DIARY_DIR="$(dirname "$0")/diario"
ACTIVITIES_FILE="$(dirname "$0")/activities.conf"

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Garante que os diretórios e arquivos existam
mkdir -p "$DIARY_DIR"
touch "$ACTIVITIES_FILE"

# Função para exibir o cabeçalho
show_header() {
    clear
    echo -e "${BLUE}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║                    📝 DIÁRIO PESSOAL 📝                     ║${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

# Função para obter a data atual no formato DD-MM-YYYY
get_current_date() {
    date +"%d-%m-%Y"
}

# Função para obter a hora atual no formato HH:MM
get_current_time() {
    date +"%H:%M"
}

# Função para obter o arquivo do dia atual
get_today_file() {
    local today=$(get_current_date)
    echo "$DIARY_DIR/$today.txt"
}

# Função para registrar uma atividade
log_activity() {
    local activity="$1"
    local time=$(get_current_time)
    local today_file=$(get_today_file)
    
    echo "$time - $activity" >> "$today_file"
    echo -e "${GREEN}✅ Atividade registrada: ${YELLOW}$time - $activity${NC}"
}

# Função para exibir atividades predefinidas
show_predefined_activities() {
    show_header
    echo -e "${CYAN}📋 Atividades Predefinidas:${NC}"
    echo ""
    
    # Cria array de atividades
    declare -a activities
    local i=0
    while IFS= read -r line; do
        activities[i]="$line"
        ((i++))
    done < "$ACTIVITIES_FILE"
    
    if [ ${#activities[@]} -eq 0 ]; then
        echo -e "${RED}📭 Nenhuma atividade predefinida encontrada.${NC}"
        echo -e "${YELLOW}Use a opção 'g' para gerenciar atividades predefinidas.${NC}"
        echo ""
        echo -e "${GREEN}Pressione Enter para continuar...${NC}"
        read
        return
    fi
    
    local index=1
    for activity in "${activities[@]}"; do
        echo -e "${YELLOW}$index.${NC} $activity"
        ((index++))
    done
    
    echo ""
    echo -e "${RED}0.${NC} Voltar ao menu principal"
    echo ""
    echo -n "Escolha uma atividade: "
    read -r choice
    
    if [[ "$choice" -eq 0 ]]; then
        return
    fi
    
    if [[ "$choice" -gt 0 && "$choice" -le ${#activities[@]} ]]; then
        local selected_activity="${activities[$((choice-1))]}"
        log_activity "$selected_activity"
        echo -e "\n${GREEN}Pressione Enter para continuar...${NC}"
        read
    else
        echo -e "${RED}❌ Opção inválida!${NC}"
        sleep 2
    fi
}

# Função para registrar atividade manual
manual_activity() {
    show_header
    echo -e "${CYAN}✍️  Registrar Atividade Manual${NC}"
    echo ""
    echo -n -e "${YELLOW}Descreva o que você está fazendo agora: ${NC}"
    read -r activity
    
    if [[ -n "$activity" ]]; then
        log_activity "$activity"
    else
        echo -e "${RED}❌ Atividade não pode ser vazia!${NC}"
    fi
    
    echo -e "\n${GREEN}Pressione Enter para continuar...${NC}"
    read
}

# Função para visualizar o diário do dia
view_today_diary() {
    show_header
    echo -e "${CYAN}📅 Diário de Hoje - $(get_current_date)${NC}"
    echo ""
    
    local today_file=$(get_today_file)
    
    if [[ -f "$today_file" ]]; then
        echo -e "${GREEN}📝 Atividades do dia:${NC}"
        echo ""
        cat "$today_file"
    else
        echo -e "${RED}📭 Nenhuma atividade registrada hoje ainda.${NC}"
    fi
    
    echo ""
    echo -e "${GREEN}Pressione Enter para continuar...${NC}"
    read
}

# Função para visualizar diários de outros dias
view_other_diary() {
    show_header
    echo -e "${CYAN}📅 Visualizar Outro Dia${NC}"
    echo ""
    
    # Lista todos os arquivos .txt no diretório do diário
    local files=()
    if [[ -d "$DIARY_DIR" ]]; then
        while IFS= read -r -d '' file; do
            files+=("$file")
        done < <(find "$DIARY_DIR" -maxdepth 1 -name "*.txt" -type f -print0 2>/dev/null | sort -rz)
    fi
    
    if [ ${#files[@]} -eq 0 ]; then
        echo -e "${RED}📭 Nenhum diário encontrado.${NC}"
        echo -e "${GREEN}Pressione Enter para continuar...${NC}"
        read
        return
    fi
    
    echo -e "${YELLOW}Selecione um dia:${NC}"
    echo ""
    
    local index=1
    for file in "${files[@]}"; do
        local filename=$(basename "$file" .txt)
        echo -e "${YELLOW}$index.${NC} $filename"
        ((index++))
    done
    
    echo ""
    echo -e "${RED}0.${NC} Voltar ao menu principal"
    echo ""
    echo -n "Escolha um dia: "
    read -r choice
    
    if [[ "$choice" -eq 0 ]]; then
        return
    fi
    
    if [[ "$choice" -gt 0 && "$choice" -le ${#files[@]} ]]; then
        local selected_file="${files[$((choice-1))]}"
        local filename=$(basename "$selected_file" .txt)
        
        clear
        show_header
        echo -e "${CYAN}📅 Diário de $filename${NC}"
        echo ""
        echo -e "${GREEN}📝 Atividades do dia:${NC}"
        echo ""
        if [[ -f "$selected_file" ]]; then
            cat "$selected_file"
        else
            echo -e "${RED}❌ Arquivo não encontrado: $selected_file${NC}"
        fi
        echo ""
        echo -e "${GREEN}Pressione Enter para continuar...${NC}"
        read
    else
        echo -e "${RED}❌ Opção inválida!${NC}"
        sleep 2
    fi
}

# Função para gerenciar atividades predefinidas
manage_activities() {
    while true; do
        show_header
        echo -e "${CYAN}🛠️  Gerenciar Atividades Predefinidas${NC}"
        echo ""
        
        # Cria array de atividades
        declare -a activities
        local i=0
        while IFS= read -r line; do
            activities[i]="$line"
            ((i++))
        done < "$ACTIVITIES_FILE"
        
        if [ ${#activities[@]} -gt 0 ]; then
            echo -e "${YELLOW}📋 Atividades atuais:${NC}"
            echo ""
            local index=1
            for activity in "${activities[@]}"; do
                echo -e "${YELLOW}$index.${NC} $activity"
                ((index++))
            done
            echo ""
        else
            echo -e "${RED}📭 Nenhuma atividade predefinida.${NC}"
            echo ""
        fi
        
        echo -e "${CYAN}🛠️  Opções:${NC}"
        echo -e "${GREEN}a.${NC} ✨ Adicionar Atividade"
        echo -e "${GREEN}r.${NC} 🗑️  Remover Atividade"
        echo ""
        echo -e "${RED}0.${NC} 🚪 Voltar ao menu principal"
        echo ""
        echo -n "Digite sua escolha: "
        read -r choice
        
        case $choice in
            a|A) add_activity ;;
            r|R) remove_activity ;;
            0) return ;;
            *) echo -e "${RED}❌ Opção inválida! Tente novamente.${NC}"; sleep 2 ;;
        esac
    done
}

# Função para adicionar atividade predefinida
add_activity() {
    show_header
    echo -e "${CYAN}✨ Adicionar Atividade Predefinida ✨${NC}"
    echo ""
    echo -n -e "${YELLOW}📝 Descrição da atividade: ${NC}"
    read -r activity
    
    if [[ -n "$activity" ]]; then
        echo "$activity" >> "$ACTIVITIES_FILE"
        echo -e "${GREEN}✅ Atividade adicionada com sucesso!${NC}"
    else
        echo -e "${RED}❌ Descrição não pode ser vazia.${NC}"
    fi
    sleep 2
}

# Função para remover atividade predefinida
remove_activity() {
    show_header
    echo -e "${CYAN}🗑️  Remover Atividade Predefinida 🗑️${NC}"
    echo ""
    
    # Cria array de atividades
    declare -a activities
    local i=0
    while IFS= read -r line; do
        activities[i]="$line"
        ((i++))
    done < "$ACTIVITIES_FILE"
    
    if [ ${#activities[@]} -eq 0 ]; then
        echo -e "${RED}📭 Nenhuma atividade para remover.${NC}"
        sleep 2
        return
    fi
    
    local index=1
    for activity in "${activities[@]}"; do
        echo -e "${YELLOW}$index.${NC} $activity"
        ((index++))
    done
    
    echo ""
    echo -e "${RED}0.${NC} ❌ Cancelar"
    echo ""
    echo -n "Qual atividade deseja remover? "
    read -r choice
    
    if [[ "$choice" -gt 0 && "$choice" -le ${#activities[@]} ]]; then
        local activity_to_remove="${activities[$((choice-1))]}"
        
        # Cria um arquivo temporário sem a atividade a ser removida
        local temp_file=$(mktemp)
        while IFS= read -r line; do
            if [[ "$line" != "$activity_to_remove" ]]; then
                echo "$line" >> "$temp_file"
            fi
        done < "$ACTIVITIES_FILE"
        
        # Substitui o arquivo original
        mv "$temp_file" "$ACTIVITIES_FILE"
        
        echo -e "${GREEN}✅ Atividade removida com sucesso!${NC}"
    elif [[ "$choice" -ne 0 ]]; then
        echo -e "${RED}❌ Seleção inválida.${NC}"
    fi
    sleep 2
}

# Função principal do menu
main_menu() {
    while true; do
        show_header
        
        echo -e "${CYAN}📅 Hoje é: ${YELLOW}$(get_current_date)${NC}"
        echo -e "${CYAN}🕐 Agora são: ${YELLOW}$(get_current_time)${NC}"
        echo ""
        
        echo -e "${CYAN}📝 O que você deseja fazer?${NC}"
        echo ""
        echo -e "${GREEN}1.${NC} 📋 Usar Atividade Predefinida"
        echo -e "${GREEN}2.${NC} ✍️  Registrar Atividade Manual"
        echo -e "${GREEN}3.${NC} 📅 Ver Diário de Hoje"
        echo -e "${GREEN}4.${NC} 📚 Ver Diário de Outro Dia"
        echo -e "${GREEN}5.${NC} 🛠️  Gerenciar Atividades Predefinidas"
        echo ""
        echo -e "${RED}0.${NC} 🚪 Sair"
        echo ""
        echo -n "Digite sua escolha: "
        read -r choice
        
        case $choice in
            1) show_predefined_activities ;;
            2) manual_activity ;;
            3) view_today_diary ;;
            4) view_other_diary ;;
            5) manage_activities ;;
            0) echo -e "${GREEN}👋 Saindo...${NC}"; exit 0 ;;
            *) echo -e "${RED}❌ Opção inválida! Tente novamente.${NC}"; sleep 2 ;;
        esac
    done
}

# Executa o script
echo -e "${GREEN}📝 Iniciando Diário Pessoal...${NC}"
sleep 0.2
main_menu
