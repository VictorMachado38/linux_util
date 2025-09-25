# 📋 Shortcut Menu - Gerenciador de Atalhos

> **Sistema completo de gerenciamento de atalhos para acesso rápido a arquivos importantes**

## 📋 Sobre

O **Shortcut Menu** é um gerenciador de atalhos interativo que permite acessar rapidamente arquivos de configuração, documentos e comandos importantes. Com interface colorida e busca inteligente, você pode organizar e acessar seus arquivos favoritos de forma eficiente.

## ✨ Funcionalidades

- **📋 Menu Interativo**: Interface colorida e intuitiva
- **🔍 Busca Inteligente**: Encontre atalhos rapidamente
- **➕ Gerenciamento Dinâmico**: Adicione e remova atalhos facilmente
- **📖 Visualização Múltipla**: cat, vim, nano com opções sudo
- **⚡ Execução de Comandos**: Execute comandos diretamente
- **💾 Persistência**: Atalhos salvos automaticamente

## 🚀 Como Usar

### Instalação
```bash
# Torne o script executável
chmod +x shortcut_menu.sh

# Execute o script
./shortcut_menu.sh
```

### Menu Principal
```
╔═══════════════════════════════════════╗
║            🚀 MENU DE ATALHOS 🚀      ║
╚═══════════════════════════════════════╝

📋 Atalhos disponíveis:
1. [📁 FILE] Cloudflared Config
2. [⚡ CMD] Docker Status

🛠️  Funções:
a. ✨ Adicionar Atalho
r. 🗑️  Remover Atalho
b. 🔍 Buscar Atalho

0. 🚪 Sair
```

## 🎮 Opções Disponíveis

### Selecionar Atalho
Digite o número do atalho desejado para:
- **Arquivos**: Escolher como visualizar (cat, vim, nano) com ou sem sudo
- **Comandos**: Executar diretamente

### a. ✨ Adicionar Atalho
Crie novos atalhos para:
- **Arquivos**: Visualizar/editar arquivos importantes
- **Comandos**: Executar comandos frequentemente usados

### r. 🗑️ Remover Atalho
Delete atalhos que não usa mais.

### b. 🔍 Buscar Atalho
Encontre atalhos por termo de busca na descrição.

## 📁 Formato dos Atalhos

Os atalhos são armazenados em `~/.shortcuts.conf` no formato:

### Arquivos
```
Descrição do Arquivo|/caminho/completo/para/arquivo|file
```

### Comandos
```
Descrição do Comando|comando a executar|command
```

### Exemplos
```
Cloudflared Config|/etc/cloudflared/config.yml|file
Docker Status|docker ps -a|command
Apache Config|/etc/apache2/apache2.conf|file
System Info|uname -a|command
```

## 🎯 Casos de Uso

- **Arquivos de Configuração**: Acesso rápido a configs do sistema
- **Documentação**: Links para documentos importantes
- **Scripts**: Execução de scripts frequentemente usados
- **Comandos Complexos**: Atalhos para comandos longos
- **Projetos**: Acesso rápido a arquivos de projetos específicos

## 🔧 Ações para Arquivos

Ao selecionar um arquivo, você pode:
1. **cat** - Visualizar conteúdo
2. **sudo cat** - Visualizar como root
3. **vim** - Editar com vim
4. **sudo vim** - Editar como root
5. **nano** - Editar com nano
6. **sudo nano** - Editar como root

## 🚀 Exemplo de Uso

```bash
# Execute o menu
./shortcut_menu.sh

# Adicione um novo atalho
# Escolha 'a' para adicionar
# Tipo: 1 (Arquivo)
# Descrição: "Docker Compose"
# Caminho: "/home/user/project/docker-compose.yml"

# Use o atalho
# Digite '1' para selecionar o atalho
# Escolha '3' para editar com vim
```

## ⚙️ Configuração

### Arquivo de Configuração
Local: `~/.shortcuts.conf`

### Backup
Faça backup do arquivo para preservar seus atalhos:
```bash
cp ~/.shortcuts.conf ~/.shortcuts.conf.backup
```

### Restaurar
```bash
cp ~/.shortcuts.conf.backup ~/.shortcuts.conf
```

## 🔧 Dicas de Uso

1. **Use Descrições Claras**: Facilite a busca e identificação
2. **Organize por Categoria**: Agrupe atalhos relacionados
3. **Mantenha Atualizado**: Remova atalhos obsoletos
4. **Use Comandos Úteis**: Automatize tarefas repetitivas

## 🎨 Recursos Visuais

- **Cores Diferenciadas**: Melhor legibilidade
- **Interface Limpa**: Organização clara
- **Feedback Visual**: Confirmação de ações
- **Navegação Intuitiva**: Numeração clara

## 🤝 Contribuição

Contribuições são bem-vindas! Para contribuir:

1. Fork o projeto
2. Crie uma branch para sua feature
3. Commit suas mudanças
4. Push para a branch
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT.

## 👨‍💻 Autor

**Victor Machado** - Desenvolvedor apaixonado por automação e produtividade

---

⭐ **Se este projeto te ajudou, considere dar uma estrela!**