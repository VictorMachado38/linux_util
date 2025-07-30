#!/bin/bash

# Script de Menu de Atalhos Interativo
# Autor: Victor
# Versão: 1.0

# Arquivo para armazenar os atalhos
# Formato: "Descrição|/caminho/para/o/arquivo"
SHORTCUTS_FILE="$HOME/.shortcuts.conf"

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Garante que o arquivo de configuração exista
touch "$SHORTCUTS_FILE"
if ! grep -q "Cloudflared Config" "$SHORTCUTS_FILE"; then
    echo "Cloudflared Config|/etc/cloudflared/config.yml" >> "$SHORTCUTS_FILE"
fi


# Função para exibir o cabeçalho
show_header() {
    clear
    echo -e "${BLUE}╔═══════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║            MENU DE ATALHOS            ║${NC}"
    echo -e "${BLUE}╚═══════════════════════════════════════╝${NC}"
    echo ""
}

# Função para exibir e selecionar atalhos
select_shortcut() {
    local search_term=$1
    show_header

    # Cria array de atalhos
    declare -a shortcuts
    local i=0
    
    if [[ -n "$search_term" ]]; then
        echo -e "${CYAN}Resultados da busca por \"$search_term\":${NC}"
        while IFS= read -r line; do
            shortcuts[i]="$line"
            ((i++))
        done < <(grep -i "$search_term" "$SHORTCUTS_FILE")
    else
        echo -e "${CYAN}Selecione um atalho:${NC}"
        while IFS= read -r line; do
            shortcuts[i]="$line"
            ((i++))
        done < "$SHORTCUTS_FILE"
    fi
    echo ""

    if [ ${#shortcuts[@]} -eq 0 ]; then
        echo -e "${RED}Nenhum atalho encontrado.${NC}"
        sleep 2
        return
    fi

    local index=1
    for item in "${shortcuts[@]}"; do
        description=$(echo "$item" | cut -d'|' -f1)
        echo -e "${YELLOW}$index.${NC} $description"
        ((index++))
    done

    echo ""
    echo -e "${RED}0.${NC} Voltar ao menu principal"
    echo ""
    echo -n "Digite sua escolha: "
    read -r choice

    if [[ "$choice" -eq 0 ]]; then
        return
    fi

    if [[ "$choice" -gt 0 && "$choice" -le ${#shortcuts[@]} ]]; then
        local selected_shortcut="${shortcuts[$((choice-1))]}"
        action_menu "$selected_shortcut"
    else
        echo -e "${RED}Opção inválida!${NC}"
        sleep 2
    fi
}

# Menu de ação para o atalho selecionado
action_menu() {
    local shortcut_info=$1
    local description=$(echo "$shortcut_info" | cut -d'|' -f1)
    local file_path=$(echo "$shortcut_info" | cut -d'|' -f2)

    clear
    show_header
    echo -e "${CYAN}Atalho:${NC} ${YELLOW}$description${NC}"
    echo -e "${CYAN}Arquivo:${NC} ${PURPLE}$file_path${NC}"
    echo ""
    echo "O que você deseja fazer?"
    echo "1. cat"
    echo "2. vim"
    echo "3. nano"
    echo -e "${RED}0. Voltar${NC}"
    echo ""
    echo -n "Digite sua escolha: "
    read -r action

    case $action in
        1) clear; cat "$file_path"; echo -e "\n${GREEN}Pressione Enter para continuar...${NC}"; read ;;
        2) vim "$file_path" ;;
        3) nano "$file_path" ;;
        0) return ;;
        *) echo -e "${RED}Opção inválida!${NC}"; sleep 2 ;;
    esac
}

# Função para adicionar um novo atalho
add_shortcut() {
    show_header
    echo -e "${CYAN}Adicionar Novo Atalho${NC}"
    echo ""
    echo -n "Descrição do atalho: "
    read -r description
    echo -n "Caminho completo do arquivo: "
    read -r file_path

    if [[ -n "$description" && -n "$file_path" ]]; then
        echo "$description|$file_path" >> "$SHORTCUTS_FILE"
        echo -e "${GREEN}Atalho adicionado com sucesso!${NC}"
    else
        echo -e "${RED}Descrição e caminho não podem ser vazios.${NC}"
    fi
    sleep 2
}

# Função para remover um atalho
remove_shortcut() {
    show_header
    echo -e "${CYAN}Remover Atalho${NC}"
    echo ""
    
    # Cria array de atalhos
    declare -a shortcuts
    local i=0
    while IFS= read -r line; do
        shortcuts[i]="$line"
        ((i++))
    done < "$SHORTCUTS_FILE"
    
    local index=1
    for item in "${shortcuts[@]}"; do
        description=$(echo "$item" | cut -d'|' -f1)
        echo -e "${YELLOW}$index.${NC} $description"
        ((index++))
    done
    
    echo ""
    echo -e "${RED}0.${NC} Cancelar"
    echo ""
    echo -n "Qual atalho deseja remover? "
    read -r choice

    if [[ "$choice" -gt 0 && "$choice" -le ${#shortcuts[@]} ]]; then
        local line_to_remove="${shortcuts[$((choice-1))]}"
        sed -i.bak "s|^$line_to_remove$||g" "$SHORTCUTS_FILE"
        sed -i.bak '/^$/d' "$SHORTCUTS_FILE"
        rm "${SHORTCUTS_FILE}.bak"
        echo -e "${GREEN}Atalho removido com sucesso!${NC}"
    elif [[ "$choice" -ne 0 ]]; then
        echo -e "${RED}Seleção inválida.${NC}"
    fi
    sleep 2
}

# Função de busca
search_shortcut() {
    show_header
    echo -e "${CYAN}Buscar Atalho${NC}"
    echo ""
    echo -n "Digite o termo para buscar na descrição: "
    read -r search_term
    select_shortcut "$search_term"
}


# Função principal do menu
main_menu() {
    while true; do
        show_header
        
        # Cria array de atalhos
        declare -a shortcuts
        local i=0
        while IFS= read -r line; do
            shortcuts[i]="$line"
            ((i++))
        done < "$SHORTCUTS_FILE"
        
        if [ ${#shortcuts[@]} -gt 0 ]; then
            echo -e "${CYAN}Atalhos disponíveis:${NC}"
            echo ""
            
            local index=1
            for item in "${shortcuts[@]}"; do
                description=$(echo "$item" | cut -d'|' -f1)
                echo -e "${YELLOW}$index.${NC} $description"
                ((index++))
            done
            echo ""
        else
            echo -e "${RED}Nenhum atalho encontrado.${NC}"
            echo ""
        fi
        
        echo -e "${CYAN}Funções:${NC}"
        echo -e "${GREEN}a.${NC} Adicionar Atalho"
        echo -e "${GREEN}r.${NC} Remover Atalho"
        echo -e "${GREEN}b.${NC} Buscar Atalho"
        echo ""
        echo -e "${RED}0. Sair${NC}"
        echo ""
        echo -n "Digite sua escolha: "
        read -r choice

        case $choice in
            [1-9]*) 
                if [[ "$choice" -gt 0 && "$choice" -le ${#shortcuts[@]} ]]; then
                    local selected_shortcut="${shortcuts[$((choice-1))]}"
                    action_menu "$selected_shortcut"
                else
                    echo -e "${RED}Opção inválida!${NC}"
                    sleep 2
                fi
                ;;
            a|A) add_shortcut ;;
            r|R) remove_shortcut ;;
            b|B) search_shortcut ;;
            0) echo -e "${GREEN}Saindo...${NC}"; exit 0 ;;
            *) echo -e "${RED}Opção inválida! Tente novamente.${NC}"; sleep 2 ;;
        esac
    done
}

# Executa o script
main_menu

