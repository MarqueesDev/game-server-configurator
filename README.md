# 🎮 GameServer Configurator

> Configurador automático para servidores de jogos com interface gráfica moderna

[![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)](#)
[![C#](https://img.shields.io/badge/C%23-239120?style=for-the-badge&logo=c-sharp&logoColor=white)](#)
[![.NET](https://img.shields.io/badge/.NET_Framework_4.0-5C2D91?style=for-the-badge&logo=.net&logoColor=white)](#)

## 📋 Sobre o Projeto

Ferramenta completa e intuitiva para configurar automaticamente servidores de jogos. Automatiza detecção de IP, configuração de firewall, testes de conectividade e migração para nuvem.

### ✨ Principais Recursos

- 🖥️ **Interface Moderna**: Design dark theme profissional
- 🌐 **Detecção Inteligente de IP**: 6 serviços diferentes com fallback automático
- 🔥 **Configuração de Firewall**: Automatiza regras TCP/UDP no Windows
- � **Geração de Endereço**: IP:PORTA pronto para compartilhar
- ☁️ **Migração para Nuvem**: Assistentes para Oracle Cloud e Railway
- 📊 **Logs em Tempo Real**: Acompanhe todas as operações
- 🔐 **Execução Elevada**: UAC automático para privilégios administrativos

## 🎯 Para Quem é Este Configurador

- **Gamers** que querem hospedar servidores para amigos
- **Administradores** que gerenciam servidores dedicados
- **Desenvolvedores** que precisam de setup rápido para testes
- **Comunidades de jogos** que querem facilitar a configuração

## 🚀 Como Usar

### 1. Download e Execução
```
1. Baixe GameServerConfigurator.exe
2. Execute como administrador (elevação automática)
3. Interface será aberta automaticamente
```

### 2. Configuração Rápida
```
🌐 CONFIGURAÇÃO DE REDE:
1. "DETECTAR IP PÚBLICO" → Encontra seu IP automaticamente
2. Defina a porta do servidor (padrão: 14159)
3. "CONFIGURAR FIREWALL" → Libera portas automaticamente
4. "GERAR ENDERECO" → Cria IP:PORTA para compartilhar
5. "COPIAR" → Envie para seus amigos via Discord/WhatsApp

☁️ MIGRAÇÃO PARA NUVEM:
1. "TUTORIAL ORACLE CLOUD" → Servidor gratuito
2. "TUTORIAL RAILWAY.APP" → $5 dólares mensais
3. "PREPARAR ARQUIVOS" → Organiza files para upload
4. "GERAR SCRIPTS" → Automação para Linux
```

### 3. Fluxo Completo
1. **Detectar IP** → Automaticamente encontra seu IP público
2. **Configurar Firewall** → Libera portas TCP/UDP no Windows
3. **Gerar Endereço** → Cria endereço completo do servidor
4. **Copiar e Compartilhar** → Envie para amigos jogarem
5. **Migrar para Nuvem** (opcional) → Servidor 24/7 online

## 🛠️ Funcionalidades Detalhadas

### 🌐 **Configuração de Rede**
- ✅ **Detecção de IP Local**: Interface de rede ativa
- ✅ **Detecção de IP Público**: 6 serviços com redundância
- ✅ **Configuração de Firewall**: Regras TCP/UDP automáticas
- ✅ **Teste de Conectividade**: Verificação completa
- ✅ **Geração de Endereço**: IP:PORTA pronto para usar

### ☁️ **Migração para Nuvem**
- ✅ **Oracle Cloud**: Tutorial completo (gratuito)
- ✅ **Railway.app**: Guia step-by-step ($5/mês)
- ✅ **Preparação de Arquivos**: Organização automática
- ✅ **Scripts Linux**: Instalação/execução automatizada

### 📊 **Sistema de Logs**
- ✅ **Logs em Tempo Real**: Acompanhe cada operação
- ✅ **Timestamping**: Horário de cada ação
- ✅ **Cores Diferenciadas**: Sucesso/erro/aviso
- ✅ **Scroll Automático**: Sempre na linha mais recente

## 🔧 Tecnologias Utilizadas

- **Linguagem**: C# (compatível com C# 5.0)
- **Framework**: .NET Framework 4.0
- **Interface**: Windows Forms nativo
- **Compilação**: Microsoft C# Compiler (csc.exe)
- **Rede**: WebClient com timeout customizado
- **Sistema**: Integration com Windows Registry e Firewall

## 📁 Estrutura Final do Projeto

```
📂 Configurador_Servidor_GUI/
├── 🚀 GameServerConfigurator.exe    # ← EXECUTÁVEL PRINCIPAL (36KB)
├── 📄 README.md                     # ← Documentação do projeto
├── 📜 LICENSE                       # ← Licença MIT
└── 📁 .git/                        # ← Controle de versão
```

## � Serviços de IP Suportados

O configurador testa automaticamente estes serviços:

1. **api.ipify.org** - Serviço principal
2. **ifconfig.me/ip** - Backup confiável
3. **icanhazip.com** - Alternativa rápida
4. **ipecho.net/plain** - Redundância extra
5. **myexternalip.com/raw** - Mais uma opção
6. **checkip.amazonaws.com** - AWS endpoint

**Timeout**: 8 segundos por serviço  
**Fallback**: Automático se um falhar  
**Headers**: User-Agent para evitar bloqueios

## 💡 Casos de Uso Reais

### 🎮 **Servidor de Jogos Pessoal**
```
Cenário: Quer jogar com amigos online
Solução: 
1. Execute o configurador
2. Configure firewall automaticamente  
3. Compartilhe IP:PORTA gerado
4. Amigos conectam diretamente
```

### 🏢 **Servidor Dedicado 24/7**
```
Cenário: Comunidade precisa servidor sempre online
Solução:
1. Use "Migração para Nuvem"
2. Oracle Cloud (gratuito) ou Railway ($5/mês)
3. Scripts automáticos fazem deploy
4. Servidor fica online 24/7
```

### 🔧 **Ambiente de Desenvolvimento**
```
Cenário: Testar servidor durante desenvolvimento
Solução:
1. Configuração rápida com 1 clique
2. Logs em tempo real para debug
3. Fácil reconfiguração para testes
```

## 🎯 Vantagens sobre Soluções Manuais

| Manual | Com Configurador |
|--------|------------------|
| ❌ Abrir cmd como admin | ✅ Elevação automática |
| ❌ Comandos netsh complexos | ✅ Interface visual |
| ❌ Descobrir IP manualmente | ✅ Detecção automática |
| ❌ Configurar cada porta | ✅ Setup completo |
| ❌ Possibilidade de erros | ✅ Processo validado |

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

<div align="center">

**🎮 Desenvolvido para facilitar a vida dos gamers e administradores de servidor**

*Transformando configuração complexa em processo simples e visual*

</div>

## 📥 Como Usar

### Download e Execução
1. Baixe o arquivo `Game ServerConfiguradorFINAL_v2.exe`
2. Execute como administrador (elevação automática)
3. A interface será aberta automaticamente

### Configuração Básica
1. **Detectar IP**: Clique em "OBTER IP PÚBLICO" para detecção automática
2. **Configurar Portas**: Defina as portas do seu servidor
3. **Firewall**: Clique em "CONFIGURAR FIREWALL" para liberação automática
4. **Migração** (opcional): Use o assistente para deploy em nuvem

### Recursos Avançados
- **Logs**: Visualize operações em tempo real
- **Scripts**: Gere automações personalizadas
- **Backup**: Salve configurações para reutilização

## 🛠️ Tecnologias Utilizadas

- **Linguagem**: C# (.NET Framework)
- **Interface**: Windows Forms
- **Rede**: HttpClient com múltiplos endpoints
- **Sistema**: Integração com Windows API e UAC
- **Compilação**: Compiler Service (csc.exe)

## 📁 Estrutura do Projeto

```
📂 Configurador_Servidor_GUI/
├── 🚀 Game ServerConfiguradorFINAL_v2.exe    # Executável principal
├── 📝 Game ServerFinal.cs                     # Código fonte C#
├── ⚙️ Assistente_Migrar_Nuvem.bat        # Script de migração
└── 🔄 Configurador_Original_Melhorado.ps1 # Versão PowerShell legada
```

## 🔧 Desenvolvimento

### Compilação Manual
```bash
# Compilar o código fonte
csc.exe /target:winexe /out:ServidorConfigurador.exe Game ServerFinal.cs

# Executar
.\ServidorConfigurador.exe
```

### Recursos Técnicos
- **Detecção de IP**: 6 endpoints diferentes com fallback automático
- **Timeout de Rede**: 8 segundos por serviço para evitar travamentos
- **Elevação de Privilégios**: ProcessStartInfo com Verb "runas"
- **Interface Responsiva**: Painéis organizados para diferentes funcionalidades

## 🌐 Serviços de IP Suportados

1. `api.ipify.org`
2. `ifconfig.me/ip`
3. `icanhazip.com`
4. `ipecho.net/plain`
5. `myexternalip.com/raw`
6. `checkip.amazonaws.com`

## 🚀 Funcionalidades

### ✅ Implementadas
- [x] Interface gráfica moderna
- [x] Detecção automática de IP público
- [x] Configuração de firewall Windows
- [x] Assistente de migração para nuvem
- [x] Elevação automática de privilégios
- [x] Sistema de logs detalhados
- [x] Geração de scripts auxiliares

### 🔄 Futuras Melhorias
- [ ] Suporte para Linux/macOS
- [ ] Interface web opcional
- [ ] Configuração de múltiplos servidores
- [ ] Integração com Docker
- [ ] Dashboard de monitoramento

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 🤝 Contribuições

Contribuições são sempre bem-vindas! Para contribuir:

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📞 Suporte

Se encontrar algum problema ou tiver sugestões:

- 🐛 [Abra uma issue](https://github.com/yourusername/dedicated-server-configurator/issues)
- 💬 [Inicie uma discussão](https://github.com/yourusername/dedicated-server-configurator/discussions)

---

<div align="center">

**Desenvolvido com ❤️ para a comunidade de servidores dedicados**

[⭐ Star este projeto](https://github.com/yourusername/dedicated-server-configurator) se ele foi útil para você!

</div>

