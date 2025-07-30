# 🚀 Linux Utils - Ferramentas para Desenvolvedores

> **Uma coleção de utilitários bash para otimizar o fluxo de trabalho de desenvolvedores**

## 📋 Sobre o Projeto

O **Linux Utils** é um projeto que visa criar uma biblioteca de scripts bash para facilitar tarefas comuns de desenvolvimento. O objetivo é fornecer ferramentas práticas que acelerem o processo de desenvolvimento e melhorem a produtividade dos desenvolvedores.

## 🎯 Proposta

Este projeto nasceu da necessidade de automatizar e simplificar tarefas repetitivas que desenvolvedores enfrentam diariamente. Cada script é projetado para resolver um problema específico de forma eficiente e intuitiva.

### Objetivos:
- ⚡ **Acelerar o desenvolvimento** com atalhos e automações
- 🛠️ **Simplificar tarefas repetitivas** com scripts especializados
- 📁 **Organizar arquivos e configurações** de forma inteligente
- 🔍 **Facilitar a busca e navegação** em projetos
- 🎨 **Melhorar a experiência do desenvolvedor** com interfaces amigáveis

## 🛠️ Ferramentas Disponíveis

### 1. `shortcut_menu.sh` - Gerenciador de Atalhos Interativo

O primeiro utilitário do projeto é um **sistema completo de gerenciamento de atalhos** que permite acessar rapidamente arquivos de configuração e documentos importantes.

#### ✨ Funcionalidades Principais:

- **📋 Menu Interativo Colorido**: Interface amigável com cores para melhor experiência visual
- **🔍 Busca Inteligente**: Encontre atalhos rapidamente usando termos de busca
- **➕ Adicionar Atalhos**: Crie novos atalhos para arquivos importantes
- **🗑️ Remover Atalhos**: Gerencie sua lista removendo atalhos desnecessários
- **📖 Visualização Múltipla**: Visualize arquivos com `cat`, `vim` ou `nano`
- **💾 Persistência**: Atalhos são salvos automaticamente em `~/.shortcuts.conf`

#### 🎮 Como Usar:

```bash
# Execute o script
./shortcut_menu.sh

# Ou torne-o executável primeiro
chmod +x shortcut_menu.sh
./shortcut_menu.sh
```

#### 📱 Interface do Usuário:

```
╔═══════════════════════════════════════╗
║            MENU DE ATALHOS            ║
╚═══════════════════════════════════════╝

Atalhos disponíveis:
1. Cloudflared Config

Funções:
a. Adicionar Atalho
r. Remover Atalho
b. Buscar Atalho

0. Sair

Digite sua escolha:
```

#### 🔧 Ações Disponíveis:

1. **Selecionar Atalho**: Digite o número do atalho desejado
2. **Adicionar (a)**: Crie um novo atalho com descrição e caminho
3. **Remover (r)**: Delete atalhos da lista
4. **Buscar (b)**: Encontre atalhos por termo de busca
5. **Sair (0)**: Encerre o programa

#### 📁 Formato dos Atalhos:

Os atalhos são armazenados no formato:
```
Descrição do Atalho|/caminho/completo/para/arquivo
```

Exemplo:
```
Cloudflared Config|/etc/cloudflared/config.yml
Docker Compose|/home/user/project/docker-compose.yml
```

#### 🎨 Recursos Visuais:

- **Cores diferenciadas** para melhor legibilidade
- **Interface limpa** e organizada
- **Feedback visual** para todas as ações
- **Navegação intuitiva** com numeração clara

## 🚀 Instalação

1. **Clone o repositório**:
```bash
git clone https://github.com/seu-usuario/linux_util.git
cd linux_util
```

2. **Torne os scripts executáveis**:
```bash
chmod +x shortcut_menu.sh
```

3. **Execute o script**:
```bash
./shortcut_menu.sh
```

## 📝 Próximas Ferramentas

O projeto está em constante evolução. Próximas ferramentas planejadas:

- 🔍 **File Finder**: Busca avançada de arquivos em projetos
- 🐳 **Docker Utils**: Gerenciamento simplificado de containers
- 📊 **Git Stats**: Estatísticas e insights de repositórios
- 🎯 **Project Templates**: Criação rápida de projetos
- 🔧 **Config Manager**: Gerenciamento de configurações de desenvolvimento

## 🤝 Contribuição

Contribuições são bem-vindas! Para contribuir:

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

## 👨‍💻 Autor

**Victor Machado** - Desenvolvedor apaixonado por automação e produtividade

---

⭐ **Se este projeto te ajudou, considere dar uma estrela!**