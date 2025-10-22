# 🚀 Dedicated Server Configurator

> Interface gráfica moderna para configuração automática de servidores dedicados

[![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)](https://github.com/yourusername/dedicated-server-configurator)
[![C#](https://img.shields.io/badge/C%23-239120?style=for-the-badge&logo=c-sharp&logoColor=white)](https://github.com/yourusername/dedicated-server-configurator)
[![.NET](https://img.shields.io/badge/.NET-5C2D91?style=for-the-badge&logo=.net&logoColor=white)](https://github.com/yourusername/dedicated-server-configurator)

## 📋 Sobre o Projeto

Ferramenta completa com interface gráfica para configurar e gerenciar servidores dedicados de jogos. Elimina a complexidade da configuração manual, automatizando detecção de IP, configuração de firewall e migração para nuvem.

### ✨ Principais Recursos

- 🖥️ **Interface Moderna**: Tema escuro profissional e intuitivo
- 🌐 **Detecção de IP**: 6 serviços para encontrar IP público automaticamente
- 🔥 **Firewall Automático**: Configuração do Windows Defender sem intervenção
- ☁️ **Migração Nuvem**: Assistente para Oracle Cloud e Railway
- 🔐 **Elevação UAC**: Execução automática como administrador
- 📊 **Logs Detalhados**: Registro completo de todas as operações
- ⚙️ **Scripts Inclusos**: Automação adicional via batch/PowerShell

## 🎯 Para Quem é Este Projeto

- **Administradores de Servidor** que querem automatizar configurações
- **Gamers** que hospedam servidores dedicados
- **Desenvolvedores** que precisam de setup rápido para testes
- **Profissionais de TI** que gerenciam múltiplos servidores

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

