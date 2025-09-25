# 📝 Diary - Diário Pessoal

> **Sistema de registro de atividades diárias com interface intuitiva**

## 📋 Sobre

O **Diary** é um sistema de diário pessoal desenvolvido em bash que permite registrar suas atividades diárias de forma organizada e eficiente. Com atividades predefinidas e registro manual, você pode acompanhar seu dia a dia de forma simples e visual.

## ✨ Funcionalidades

- **📋 Atividades Predefinidas**: Lista personalizável de atividades comuns
- **✍️ Registro Manual**: Adicione atividades personalizadas a qualquer momento
- **📅 Organização por Data**: Arquivos separados por dia no formato DD-MM-YYYY
- **🕐 Timestamp Automático**: Cada entrada é registrada com hora atual
- **🎨 Interface Colorida**: Interface visual atrativa e fácil de usar
- **📚 Visualização de Histórico**: Veja atividades de dias anteriores

## 🚀 Como Usar

### Instalação
```bash
# Torne o script executável
chmod +x diary.sh

# Execute o script
./diary.sh
```

### Menu Principal
```
╔══════════════════════════════════════════════════════════════╗
║                    📝 DIÁRIO PESSOAL 📝                     ║
╚══════════════════════════════════════════════════════════════╝

📅 Hoje é: 25-09-2025
🕐 Agora são: 11:38

📝 O que você deseja fazer?

1. 📋 Usar Atividade Predefinida
2. ✍️  Registrar Atividade Manual
3. 📅 Ver Diário de Hoje
4. 📚 Ver Diário de Outro Dia
5. 🛠️  Gerenciar Atividades Predefinidas

0. 🚪 Sair
```

## 🎮 Opções Disponíveis

### 1. 📋 Usar Atividade Predefinida
Selecione uma atividade da sua lista personalizada:
- Trabalhando no computador
- Estudando programação
- Fazendo exercícios
- Lendo livros
- E muitas outras...

### 2. ✍️ Registrar Atividade Manual
Digite qualquer atividade personalizada que deseja registrar.

### 3. 📅 Ver Diário de Hoje
Visualize todas as atividades registradas no dia atual.

### 4. 📚 Ver Diário de Outro Dia
Navegue pelos arquivos de dias anteriores.

### 5. 🛠️ Gerenciar Atividades Predefinidas
- **Adicionar**: Crie novas atividades predefinidas
- **Remover**: Delete atividades que não usa mais

## 📁 Estrutura de Arquivos

```
Diary/
├── diary.sh              # Script principal
├── activities.conf        # Lista de atividades predefinidas
└── diario/               # Pasta com arquivos diários
    ├── 25-09-2025.txt    # Exemplo de arquivo diário
    ├── 26-09-2025.txt
    └── ...
```

## 📝 Formato dos Registros

Cada entrada no diário segue o formato:
```
HH:MM - Descrição da atividade
```

Exemplo:
```
09:30 - Trabalhando no computador
10:15 - Estudando programação
11:00 - Fazendo exercícios
```

## ⚙️ Configuração

### Atividades Predefinidas
O arquivo `activities.conf` contém sua lista de atividades. Você pode editá-lo diretamente ou usar o menu de gerenciamento:

```
Trabalhando no computador
Estudando programação
Fazendo exercícios
Lendo livros
Assistindo vídeos
Cozinhando
Limpando a casa
Descansando
```

### Personalização
- Adicione suas próprias atividades
- Remova atividades que não usa
- Mantenha a lista organizada e atualizada

## 🎯 Casos de Uso

- **Tracking de Produtividade**: Acompanhe como gasta seu tempo
- **Análise de Rotina**: Identifique padrões em suas atividades
- **Registro de Projetos**: Documente progresso em trabalhos específicos
- **Diário Pessoal**: Mantenha um registro das suas atividades diárias

## 🔧 Dicas de Uso

1. **Registre Regularmente**: Use o sistema várias vezes ao dia
2. **Seja Específico**: Descreva atividades de forma clara
3. **Mantenha Atualizado**: Revise e atualize suas atividades predefinidas
4. **Use Atalhos**: Prefira atividades predefinidas para agilizar o registro

## 🚀 Exemplo de Uso

```bash
# Execute o diário
./diary.sh

# Escolha opção 1 para usar atividade predefinida
# Selecione "Trabalhando no computador"
# ✅ Atividade registrada: 14:30 - Trabalhando no computador

# Escolha opção 2 para registro manual
# Digite: "Reunião com cliente sobre novo projeto"
# ✅ Atividade registrada: 14:45 - Reunião com cliente sobre novo projeto
```

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
