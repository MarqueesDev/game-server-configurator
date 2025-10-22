@echo off
title Migrar Game Server para Nuvem

echo.
echo ================================================================
echo                MIGRAR Game Server PARA NUVEM
echo ================================================================
echo.
echo Este assistente ajudara voce a migrar seu Game Server
echo do seu PC para a nuvem (GRATUITO)
echo.
echo VANTAGENS:
echo [+] Servidor 24/7 online
echo [+] Nao precisa deixar PC ligado
echo [+] Melhor performance
echo [+] Backup automatico
echo [+] Custo ZERO (planos gratuitos)
echo.
echo ================================================================
echo.

:menu
echo Escolha uma opcao:
echo.
echo [1] Tutorial Oracle Cloud (RECOMENDADO - Gratuito para sempre)
echo [2] Tutorial Railway.app (MAIS FACIL - $5 creditos mensais)
echo [3] Preparar arquivos para upload
echo [4] Gerar scripts de automacao
echo [5] Abrir guia completo (HTML)
echo [6] Sair
echo.
choice /c 123456 /n /m "Digite sua opcao (1-6): "

if errorlevel 6 goto sair
if errorlevel 5 goto guia
if errorlevel 4 goto scripts
if errorlevel 3 goto preparar
if errorlevel 2 goto railway
if errorlevel 1 goto oracle

:oracle
cls
echo.
echo ================================================================
echo                     TUTORIAL ORACLE CLOUD
echo ================================================================
echo.
echo PASSO 1: CRIAR CONTA
echo ====================
echo 1. Acesse: https://cloud.oracle.com
echo 2. Clique em "Start for free"
echo 3. Preencha seus dados (cartao necessario mas NAO sera cobrado)
echo 4. Escolha regiao: Brazil East (Sao Paulo)
echo.
echo PASSO 2: CRIAR VM
echo =================
echo 1. Console -^> Compute -^> Instances
echo 2. Create Instance
echo 3. Name: GameServer-server
echo 4. Image: Ubuntu 22.04 LTS  
echo 5. Shape: VM.Standard.E2.1.Micro (Always Free)
echo 6. Generate SSH key pair (BAIXE AS CHAVES!)
echo 7. Create
echo.
echo PASSO 3: CONFIGURAR FIREWALL
echo ============================
echo 1. Networking -^> Virtual Cloud Networks
echo 2. Clique na VCN -^> Security Lists -^> Default
echo 3. Add Ingress Rules:
echo    - Source: 0.0.0.0/0
echo    - Protocol: TCP
echo    - Port: 14159
echo 4. Repita para UDP
echo.
echo PASSO 4: CONECTAR
echo =================
echo - Use PuTTY (Windows) ou SSH (Linux/Mac)
echo - Usuario: ubuntu
echo - IP: Veja no console da Oracle
echo.
choice /c 1 /n /m "Pressione 1 para voltar ao menu: "
goto menu

:railway
cls
echo.
echo ================================================================
echo                     TUTORIAL RAILWAY.APP
echo ================================================================
echo.
echo MAIS FACIL, MAS COM LIMITE DE $5/MES (ainda assim gratuito)
echo.
echo PASSO 1: CRIAR CONTA
echo ====================
echo 1. Acesse: https://railway.app
echo 2. Login com GitHub
echo 3. New Project -^> Empty Project
echo.
echo PASSO 2: CONFIGURAR
echo ===================
echo 1. Upload dos arquivos do GameServer
echo 2. Adicionar variaveis:
echo    - PORT: 14159
echo    - JAVA_OPTS: -Xmx512M
echo 3. Deploy automatico!
echo.
echo PASSO 3: ACESSAR
echo =================
echo 1. Railway gera URL automaticamente
echo 2. Use a URL:14159 para conectar
echo.
choice /c 1 /n /m "Pressione 1 para voltar ao menu: "
goto menu

:preparar
cls
echo.
echo ================================================================
echo                  PREPARANDO ARQUIVOS PARA UPLOAD
echo ================================================================
echo.

:: Encontrar instalacao do GameServer
set STEAM_PATH=C:\Program Files (x86)\Steam\steamapps\common\GameServer Dedicated Server
set GameServer_PATH=

if exist "%STEAM_PATH%" (
    set GameServer_PATH=%STEAM_PATH%
    echo ✓ GameServer encontrado em: %STEAM_PATH%
) else (
    echo ⚠ GameServer nao encontrado no caminho padrao.
    set /p GameServer_PATH="Digite o caminho completo do GameServer Dedicated Server: "
)

if not exist "%GameServer_PATH%" (
    echo ✗ Caminho invalido!
    choice /c 1 /n /m "Pressione 1 para voltar: "
    goto menu
)

:: Criar pasta de preparacao
set PREP_FOLDER=%USERPROFILE%\Desktop\GameServer_Upload
mkdir "%PREP_FOLDER%" 2>nul

echo.
echo Copiando arquivos necessarios...

:: Copiar arquivos essenciais
copy "%GameServer_PATH%\Server.jar" "%PREP_FOLDER%\" >nul
copy "%GameServer_PATH%\*.jar" "%PREP_FOLDER%\" >nul
xcopy "%GameServer_PATH%\mods" "%PREP_FOLDER%\mods\" /E /I >nul 2>&1
xcopy "%GameServer_PATH%\worlds" "%PREP_FOLDER%\worlds\" /E /I >nul 2>&1

:: Criar arquivo de configuracao
echo world=MeuMundo > "%PREP_FOLDER%\server.cfg"
echo port=14159 >> "%PREP_FOLDER%\server.cfg"
echo maxplayers=10 >> "%PREP_FOLDER%\server.cfg"
echo password= >> "%PREP_FOLDER%\server.cfg"
echo motd=Servidor na Nuvem >> "%PREP_FOLDER%\server.cfg"
echo pause=false >> "%PREP_FOLDER%\server.cfg"
echo logging=true >> "%PREP_FOLDER%\server.cfg"

:: Criar script de inicio
echo #!/bin/bash > "%PREP_FOLDER%\start.sh"
echo java -Xmx1G -Xms512M -jar Server.jar -cfg server.cfg >> "%PREP_FOLDER%\start.sh"

echo.
echo ✓ Arquivos preparados em: %PREP_FOLDER%
echo.
echo PROXIMOS PASSOS:
echo 1. Use WinSCP ou SCP para enviar esta pasta para a VM
echo 2. Na VM, execute: chmod +x start.sh
echo 3. Execute: ./start.sh
echo.
start explorer "%PREP_FOLDER%"
choice /c 1 /n /m "Pressione 1 para voltar ao menu: "
goto menu

:scripts
cls
echo.
echo ================================================================
echo                   GERANDO SCRIPTS DE AUTOMACAO
echo ================================================================
echo.

set SCRIPTS_FOLDER=%USERPROFILE%\Desktop\Scripts_GameServer
mkdir "%SCRIPTS_FOLDER%" 2>nul

:: Script de monitoramento
echo #!/bin/bash > "%SCRIPTS_FOLDER%\monitor.sh"
echo echo "=== STATUS DO Game Server ===" >> "%SCRIPTS_FOLDER%\monitor.sh"
echo if pgrep -f "Server.jar" ^> /dev/null; then >> "%SCRIPTS_FOLDER%\monitor.sh"
echo     echo "STATUS: ONLINE ✓" >> "%SCRIPTS_FOLDER%\monitor.sh"
echo     echo "CONEXOES: $(ss -tuln | grep :14159 | wc -l)" >> "%SCRIPTS_FOLDER%\monitor.sh"
echo else >> "%SCRIPTS_FOLDER%\monitor.sh"
echo     echo "STATUS: OFFLINE ✗" >> "%SCRIPTS_FOLDER%\monitor.sh"
echo     echo "Reiniciando servidor..." >> "%SCRIPTS_FOLDER%\monitor.sh"
echo     cd ~/GameServer-server >> "%SCRIPTS_FOLDER%\monitor.sh"
echo     ./start.sh ^& >> "%SCRIPTS_FOLDER%\monitor.sh"
echo fi >> "%SCRIPTS_FOLDER%\monitor.sh"
echo echo "IP PUBLICO: $(curl -s ifconfig.me):14159" >> "%SCRIPTS_FOLDER%\monitor.sh"
echo echo "RAM: $(free -h | awk 'NR==2{printf \"%.1f%%\", $3*100/$2}')" >> "%SCRIPTS_FOLDER%\monitor.sh"

:: Script de backup
echo #!/bin/bash > "%SCRIPTS_FOLDER%\backup.sh"
echo BACKUP_DIR="$HOME/GameServer-backups" >> "%SCRIPTS_FOLDER%\backup.sh"
echo WORLD_DIR="$HOME/GameServer-server/worlds" >> "%SCRIPTS_FOLDER%\backup.sh"
echo DATE=$(date +%%Y%%m%%d_%%H%%M%%S) >> "%SCRIPTS_FOLDER%\backup.sh"
echo mkdir -p "$BACKUP_DIR" >> "%SCRIPTS_FOLDER%\backup.sh"
echo tar -czf "$BACKUP_DIR/mundo_$DATE.tar.gz" -C "$WORLD_DIR" . >> "%SCRIPTS_FOLDER%\backup.sh"
echo cd "$BACKUP_DIR" >> "%SCRIPTS_FOLDER%\backup.sh"
echo ls -t mundo_*.tar.gz ^| tail -n +6 ^| xargs rm -f >> "%SCRIPTS_FOLDER%\backup.sh"
echo echo "Backup criado: mundo_$DATE.tar.gz" >> "%SCRIPTS_FOLDER%\backup.sh"

:: Script de instalacao
echo #!/bin/bash > "%SCRIPTS_FOLDER%\install.sh"
echo echo "Instalando Game Server..." >> "%SCRIPTS_FOLDER%\install.sh"
echo sudo apt update ^&^& sudo apt upgrade -y >> "%SCRIPTS_FOLDER%\install.sh"
echo sudo apt install openjdk-17-jdk -y >> "%SCRIPTS_FOLDER%\install.sh"
echo mkdir -p ~/GameServer-server >> "%SCRIPTS_FOLDER%\install.sh"
echo cd ~/GameServer-server >> "%SCRIPTS_FOLDER%\install.sh"
echo sudo ufw allow 14159/tcp >> "%SCRIPTS_FOLDER%\install.sh"
echo sudo ufw allow 14159/udp >> "%SCRIPTS_FOLDER%\install.sh"
echo sudo ufw --force enable >> "%SCRIPTS_FOLDER%\install.sh"
echo echo "Instalacao concluida!" >> "%SCRIPTS_FOLDER%\install.sh"

:: Arquivo de instrucoes
echo SCRIPTS DE AUTOMACAO PARA Game Server > "%SCRIPTS_FOLDER%\INSTRUCOES.txt"
echo ============================================== >> "%SCRIPTS_FOLDER%\INSTRUCOES.txt"
echo. >> "%SCRIPTS_FOLDER%\INSTRUCOES.txt"
echo 1. install.sh - Instala Java e configura firewall >> "%SCRIPTS_FOLDER%\INSTRUCOES.txt"
echo 2. monitor.sh - Monitora servidor e reinicia se necessario >> "%SCRIPTS_FOLDER%\INSTRUCOES.txt"
echo 3. backup.sh - Faz backup automatico dos mundos >> "%SCRIPTS_FOLDER%\INSTRUCOES.txt"
echo. >> "%SCRIPTS_FOLDER%\INSTRUCOES.txt"
echo COMO USAR: >> "%SCRIPTS_FOLDER%\INSTRUCOES.txt"
echo 1. Transfira os scripts para a VM >> "%SCRIPTS_FOLDER%\INSTRUCOES.txt"
echo 2. Execute: chmod +x *.sh >> "%SCRIPTS_FOLDER%\INSTRUCOES.txt"
echo 3. Execute: ./install.sh >> "%SCRIPTS_FOLDER%\INSTRUCOES.txt"
echo 4. Configure cron para automacao: >> "%SCRIPTS_FOLDER%\INSTRUCOES.txt"
echo    crontab -e >> "%SCRIPTS_FOLDER%\INSTRUCOES.txt"
echo    */5 * * * * ~/GameServer-server/monitor.sh >> "%SCRIPTS_FOLDER%\INSTRUCOES.txt"
echo    0 3 * * * ~/GameServer-server/backup.sh >> "%SCRIPTS_FOLDER%\INSTRUCOES.txt"

echo ✓ Scripts gerados em: %SCRIPTS_FOLDER%
start explorer "%SCRIPTS_FOLDER%"
choice /c 1 /n /m "Pressione 1 para voltar ao menu: "
goto menu

:guia
start "%USERPROFILE%\Desktop\Guia_Servidor_Nuvem.html"
goto menu

:sair
echo.
echo Obrigado por usar o assistente!
echo.
echo RECURSOS CRIADOS:
echo - Guia_Servidor_Nuvem.html (guia completo)
echo - Tutorial_Servidor_Nuvem.sh (script de instalacao)
echo - Scripts de automacao (se gerados)
echo - Arquivos preparados para upload (se preparados)
echo.
echo PROXIMOS PASSOS:
echo 1. Escolha uma plataforma (Oracle Cloud recomendado)
echo 2. Siga o tutorial correspondente  
echo 3. Transfira arquivos do GameServer
echo 4. Configure scripts de automacao
echo 5. Aproveite seu servidor 24/7!
echo.
choice /c 1 /n /m "Pressione 1 para sair: "
exit
