# Configurador Automatico de Servidor de Jogos - MELHORADO# Configurador Avançado de Servidor - PowerShell GUI

# Versao com visual escuro igual da imagem que voce gostou!# Requer execução como administrador



Add-Type -AssemblyName System.Windows.FormsAdd-Type -AssemblyName System.Windows.Forms

Add-Type -AssemblyName System.DrawingAdd-Type -AssemblyName System.Drawing



# Criar formulario principal# Verificar se está executando como administrador

$form = New-Object System.Windows.Forms.Formif (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {

$form.Text = "Configurador Automatico de Servidor"    [System.Windows.Forms.MessageBox]::Show("Este script precisa ser executado como administrador!`n`nReiniciando com privilegios elevados...", "Privilegios Necessarios", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)

$form.Size = New-Object System.Drawing.Size(580, 520)    Start-Process PowerShell -Verb RunAs -ArgumentList "-ExecutionPolicy Bypass -File `"$PSCommandPath`""

$form.StartPosition = "CenterScreen"    exit

$form.FormBorderStyle = "FixedDialog"}

$form.MaximizeBox = $false

$form.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 48)# Criar o formulário principal

$form.ForeColor = [System.Drawing.Color]::White$form = New-Object System.Windows.Forms.Form

$form.Text = "Configurador Automatico de Servidor"

# Titulo principal$form.Size = New-Object System.Drawing.Size(600, 500)

$lblTitulo = New-Object System.Windows.Forms.Label$form.StartPosition = "CenterScreen"

$lblTitulo.Location = New-Object System.Drawing.Point(20, 20)$form.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 48)

$lblTitulo.Size = New-Object System.Drawing.Size(540, 35)$form.ForeColor = [System.Drawing.Color]::White

$lblTitulo.Text = "CONFIGURADOR AUTOMATICO DE SERVIDOR DE JOGOS"$form.FormBorderStyle = "FixedSingle"

$lblTitulo.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)$form.MaximizeBox = $false

$lblTitulo.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 127)

$lblTitulo.TextAlign = "MiddleCenter"# Título

$form.Controls.Add($lblTitulo)$lblTitulo = New-Object System.Windows.Forms.Label

$lblTitulo.Location = New-Object System.Drawing.Point(20, 20)

# Porta do Servidor$lblTitulo.Size = New-Object System.Drawing.Size(550, 40)

$lblPorta = New-Object System.Windows.Forms.Label$lblTitulo.Text = "CONFIGURADOR AUTOMATICO DE SERVIDOR DE JOGOS"

$lblPorta.Location = New-Object System.Drawing.Point(54, 80)$lblTitulo.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)

$lblPorta.Size = New-Object System.Drawing.Size(120, 20)$lblTitulo.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 127)

$lblPorta.Text = "Porta do Servidor:"$lblTitulo.TextAlign = "MiddleCenter"

$lblPorta.Font = New-Object System.Drawing.Font("Segoe UI", 10)

$lblPorta.ForeColor = [System.Drawing.Color]::White# Campo Porta

$form.Controls.Add($lblPorta)$lblPorta = New-Object System.Windows.Forms.Label

$lblPorta.Location = New-Object System.Drawing.Point(50, 80)

$txtPorta = New-Object System.Windows.Forms.TextBox$lblPorta.Size = New-Object System.Drawing.Size(100, 23)

$txtPorta.Location = New-Object System.Drawing.Point(162, 78)$lblPorta.Text = "Porta do Servidor:"

$txtPorta.Size = New-Object System.Drawing.Size(100, 25)$lblPorta.ForeColor = [System.Drawing.Color]::White

$txtPorta.Text = "14159"

$txtPorta.Font = New-Object System.Drawing.Font("Segoe UI", 10)$txtPorta = New-Object System.Windows.Forms.TextBox

$txtPorta.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60)$txtPorta.Location = New-Object System.Drawing.Point(160, 80)

$txtPorta.ForeColor = [System.Drawing.Color]::White$txtPorta.Size = New-Object System.Drawing.Size(100, 23)

$txtPorta.BorderStyle = "FixedSingle"$txtPorta.Text = "14159"

$form.Controls.Add($txtPorta)$txtPorta.BackColor = [System.Drawing.Color]::FromArgb(37, 37, 38)

$txtPorta.ForeColor = [System.Drawing.Color]::White

# Nome da Regra

$lblNomeRegra = New-Object System.Windows.Forms.Label# Campo Nome da Regra

$lblNomeRegra.Location = New-Object System.Drawing.Point(54, 120)$lblNome = New-Object System.Windows.Forms.Label

$lblNomeRegra.Size = New-Object System.Drawing.Size(120, 20)$lblNome.Location = New-Object System.Drawing.Point(50, 120)

$lblNomeRegra.Text = "Nome da Regra:"$lblNome.Size = New-Object System.Drawing.Size(100, 23)

$lblNomeRegra.Font = New-Object System.Drawing.Font("Segoe UI", 10)$lblNome.Text = "Nome da Regra:"

$lblNomeRegra.ForeColor = [System.Drawing.Color]::White$lblNome.ForeColor = [System.Drawing.Color]::White

$form.Controls.Add($lblNomeRegra)

$txtNome = New-Object System.Windows.Forms.TextBox

$txtNomeRegra = New-Object System.Windows.Forms.TextBox$txtNome.Location = New-Object System.Drawing.Point(160, 120)

$txtNomeRegra.Location = New-Object System.Drawing.Point(162, 118)$txtNome.Size = New-Object System.Drawing.Size(200, 23)

$txtNomeRegra.Size = New-Object System.Drawing.Size(200, 25)$txtNome.Text = "Servidor de Jogo"

$txtNomeRegra.Text = "Servidor de Jogo"$txtNome.BackColor = [System.Drawing.Color]::FromArgb(37, 37, 38)

$txtNomeRegra.Font = New-Object System.Drawing.Font("Segoe UI", 10)$txtNome.ForeColor = [System.Drawing.Color]::White

$txtNomeRegra.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60)

$txtNomeRegra.ForeColor = [System.Drawing.Color]::White# Checkbox para remover regras antigas

$txtNomeRegra.BorderStyle = "FixedSingle"$chkRemover = New-Object System.Windows.Forms.CheckBox

$form.Controls.Add($txtNomeRegra)$chkRemover.Location = New-Object System.Drawing.Point(50, 160)

$chkRemover.Size = New-Object System.Drawing.Size(300, 23)

# Checkbox remover regras antigas$chkRemover.Text = "Remover regras antigas com o mesmo nome"

$chkRemover = New-Object System.Windows.Forms.CheckBox$chkRemover.Checked = $true

$chkRemover.Location = New-Object System.Drawing.Point(54, 160)$chkRemover.ForeColor = [System.Drawing.Color]::White

$chkRemover.Size = New-Object System.Drawing.Size(350, 20)

$chkRemover.Text = "Remover regras antigas com o mesmo nome"# Botão Configurar

$chkRemover.Font = New-Object System.Drawing.Font("Segoe UI", 10)$btnConfigurar = New-Object System.Windows.Forms.Button

$chkRemover.ForeColor = [System.Drawing.Color]::White$btnConfigurar.Location = New-Object System.Drawing.Point(50, 200)

$chkRemover.Checked = $true$btnConfigurar.Size = New-Object System.Drawing.Size(200, 40)

$chkRemover.FlatStyle = "Flat"$btnConfigurar.Text = "CONFIGURAR SERVIDOR"

$form.Controls.Add($chkRemover)$btnConfigurar.BackColor = [System.Drawing.Color]::FromArgb(0, 122, 255)

$btnConfigurar.ForeColor = [System.Drawing.Color]::White

# Informacoes de rede$btnConfigurar.FlatStyle = "Flat"

$lblIPInfo = New-Object System.Windows.Forms.Label$btnConfigurar.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)

$lblIPInfo.Location = New-Object System.Drawing.Point(54, 190)

$lblIPInfo.Size = New-Object System.Drawing.Size(480, 40)# Área de Log

$lblIPInfo.Text = "Carregando informacoes de rede..."$lblLog = New-Object System.Windows.Forms.Label

$lblIPInfo.Font = New-Object System.Drawing.Font("Segoe UI", 9)$lblLog.Location = New-Object System.Drawing.Point(50, 260)

$lblIPInfo.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 127)$lblLog.Size = New-Object System.Drawing.Size(100, 23)

$form.Controls.Add($lblIPInfo)$lblLog.Text = "Log de Atividades:"

$lblLog.ForeColor = [System.Drawing.Color]::White

# Botoes principais (iguais da imagem)

$btnConfigurar = New-Object System.Windows.Forms.Button$txtLog = New-Object System.Windows.Forms.TextBox

$btnConfigurar.Location = New-Object System.Drawing.Point(54, 240)$txtLog.Location = New-Object System.Drawing.Point(50, 285)

$btnConfigurar.Size = New-Object System.Drawing.Size(150, 40)$txtLog.Size = New-Object System.Drawing.Size(500, 120)

$btnConfigurar.Text = "CONFIGURAR SERVIDOR"$txtLog.Multiline = $true

$btnConfigurar.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)$txtLog.ScrollBars = "Vertical"

$btnConfigurar.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)$txtLog.ReadOnly = $true

$btnConfigurar.ForeColor = [System.Drawing.Color]::White$txtLog.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)

$btnConfigurar.FlatStyle = "Flat"$txtLog.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 127)

$btnConfigurar.FlatAppearance.BorderSize = 0$txtLog.Font = New-Object System.Drawing.Font("Consolas", 9)

$form.Controls.Add($btnConfigurar)

# Botão Salvar Relatório

$btnRelatorio = New-Object System.Windows.Forms.Button$btnRelatorio = New-Object System.Windows.Forms.Button

$btnRelatorio.Location = New-Object System.Drawing.Point(220, 240)$btnRelatorio.Location = New-Object System.Drawing.Point(270, 200)

$btnRelatorio.Size = New-Object System.Drawing.Size(130, 40)$btnRelatorio.Size = New-Object System.Drawing.Size(150, 40)

$btnRelatorio.Text = "GERAR RELATORIO"$btnRelatorio.Text = "GERAR RELATORIO"

$btnRelatorio.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)$btnRelatorio.BackColor = [System.Drawing.Color]::FromArgb(255, 159, 10)

$btnRelatorio.BackColor = [System.Drawing.Color]::FromArgb(255, 140, 0)$btnRelatorio.ForeColor = [System.Drawing.Color]::White

$btnRelatorio.ForeColor = [System.Drawing.Color]::White$btnRelatorio.FlatStyle = "Flat"

$btnRelatorio.FlatStyle = "Flat"$btnRelatorio.Enabled = $false

$btnRelatorio.FlatAppearance.BorderSize = 0

$form.Controls.Add($btnRelatorio)# Botão Testar Porta

$btnTestar = New-Object System.Windows.Forms.Button

$btnTestar = New-Object System.Windows.Forms.Button$btnTestar.Location = New-Object System.Drawing.Point(440, 200)

$btnTestar.Location = New-Object System.Drawing.Point(370, 240)$btnTestar.Size = New-Object System.Drawing.Size(110, 40)

$btnTestar.Size = New-Object System.Drawing.Size(100, 40)$btnTestar.Text = "TESTAR"

$btnTestar.Text = "TESTAR"$btnTestar.BackColor = [System.Drawing.Color]::FromArgb(52, 199, 89)

$btnTestar.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)$btnTestar.ForeColor = [System.Drawing.Color]::White

$btnTestar.BackColor = [System.Drawing.Color]::FromArgb(34, 139, 34)$btnTestar.FlatStyle = "Flat"

$btnTestar.ForeColor = [System.Drawing.Color]::White

$btnTestar.FlatStyle = "Flat"# Função para adicionar log

$btnTestar.FlatAppearance.BorderSize = 0function Add-Log {

$form.Controls.Add($btnTestar)    param($mensagem)

    $timestamp = Get-Date -Format "HH:mm:ss"

# Botoes extras melhorados    $txtLog.AppendText("[$timestamp] $mensagem`r`n")

$btnIniciarServidor = New-Object System.Windows.Forms.Button    $txtLog.ScrollToCaret()

$btnIniciarServidor.Location = New-Object System.Drawing.Point(54, 290)    [System.Windows.Forms.Application]::DoEvents()

$btnIniciarServidor.Size = New-Object System.Drawing.Size(120, 30)}

$btnIniciarServidor.Text = "Iniciar GameServer"

$btnIniciarServidor.Font = New-Object System.Drawing.Font("Segoe UI", 9)# Variáveis globais para armazenar resultados

$btnIniciarServidor.BackColor = [System.Drawing.Color]::FromArgb(138, 43, 226)$global:ResultadosConfig = @{}

$btnIniciarServidor.ForeColor = [System.Drawing.Color]::White

$btnIniciarServidor.FlatStyle = "Flat"# Event handler do botão Configurar

$btnIniciarServidor.FlatAppearance.BorderSize = 0$btnConfigurar.Add_Click({

$form.Controls.Add($btnIniciarServidor)    try {

        $porta = $txtPorta.Text.Trim()

$btnAbrirPasta = New-Object System.Windows.Forms.Button        $nomeRegra = $txtNome.Text.Trim()

$btnAbrirPasta.Location = New-Object System.Drawing.Point(185, 290)        

$btnAbrirPasta.Size = New-Object System.Drawing.Size(120, 30)        if ([string]::IsNullOrEmpty($porta) -or $porta -notmatch '^\d+$') {

$btnAbrirPasta.Text = "Abrir Pasta Steam"            [System.Windows.Forms.MessageBox]::Show("Por favor, insira uma porta válida!", "Erro", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)

$btnAbrirPasta.Font = New-Object System.Drawing.Font("Segoe UI", 9)            return

$btnAbrirPasta.BackColor = [System.Drawing.Color]::FromArgb(105, 105, 105)        }

$btnAbrirPasta.ForeColor = [System.Drawing.Color]::White        

$btnAbrirPasta.FlatStyle = "Flat"        if ([string]::IsNullOrEmpty($nomeRegra)) {

$btnAbrirPasta.FlatAppearance.BorderSize = 0            $nomeRegra = "Servidor de Jogo"

$form.Controls.Add($btnAbrirPasta)        }

        

$btnCopiarIP = New-Object System.Windows.Forms.Button        $txtLog.Clear()

$btnCopiarIP.Location = New-Object System.Drawing.Point(315, 290)        Add-Log "INICIANDO CONFIGURACAO AUTOMATICA..."

$btnCopiarIP.Size = New-Object System.Drawing.Size(100, 30)        Add-Log "Porta: $porta | Nome: $nomeRegra"

$btnCopiarIP.Text = "Copiar IP"        

$btnCopiarIP.Font = New-Object System.Drawing.Font("Segoe UI", 9)        # 1. Descobrir IPs

$btnCopiarIP.BackColor = [System.Drawing.Color]::FromArgb(220, 20, 60)        Add-Log "DESCOBRINDO IP PUBLICO..."

$btnCopiarIP.ForeColor = [System.Drawing.Color]::White        try {

$btnCopiarIP.FlatStyle = "Flat"            $ipPublico = (Invoke-WebRequest -Uri "http://ifconfig.me/ip" -UseBasicParsing -TimeoutSec 10).Content.Trim()

$btnCopiarIP.FlatAppearance.BorderSize = 0            Add-Log "SUCESSO - IP Publico: $ipPublico"

$form.Controls.Add($btnCopiarIP)            $global:ResultadosConfig.IPPublico = $ipPublico

        } catch {

$btnSair = New-Object System.Windows.Forms.Button            Add-Log "ERRO ao obter IP publico: $($_.Exception.Message)"

$btnSair.Location = New-Object System.Drawing.Point(425, 290)            $global:ResultadosConfig.IPPublico = "ERRO"

$btnSair.Size = New-Object System.Drawing.Size(80, 30)        }

$btnSair.Text = "Sair"        

$btnSair.Font = New-Object System.Drawing.Font("Segoe UI", 9)        Add-Log "DESCOBRINDO IP LOCAL..."

$btnSair.BackColor = [System.Drawing.Color]::FromArgb(128, 128, 128)        $ipLocal = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.IPAddress -like "192.168.*" -or $_.IPAddress -like "10.*" -or $_.IPAddress -like "172.*"} | Select-Object -First 1).IPAddress

$btnSair.ForeColor = [System.Drawing.Color]::White        if ($ipLocal) {

$btnSair.FlatStyle = "Flat"            Add-Log "SUCESSO - IP Local: $ipLocal"

$btnSair.FlatAppearance.BorderSize = 0            $global:ResultadosConfig.IPLocal = $ipLocal

$form.Controls.Add($btnSair)        } else {

            Add-Log "ERRO - IP local nao encontrado"

# Label Log de Atividades            $global:ResultadosConfig.IPLocal = "NAO ENCONTRADO"

$lblLogTitulo = New-Object System.Windows.Forms.Label        }

$lblLogTitulo.Location = New-Object System.Drawing.Point(54, 330)        

$lblLogTitulo.Size = New-Object System.Drawing.Size(150, 20)        # 2. Verificar se servidor está rodando

$lblLogTitulo.Text = "Log de Atividades:"        Add-Log "VERIFICANDO se servidor esta rodando na porta $porta..."

$lblLogTitulo.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)        $conexoes = Get-NetTCPConnection -LocalPort $porta -ErrorAction SilentlyContinue

$lblLogTitulo.ForeColor = [System.Drawing.Color]::White        $conexoesUDP = Get-NetUDPEndpoint -LocalPort $porta -ErrorAction SilentlyContinue

$form.Controls.Add($lblLogTitulo)        

        if ($conexoes -or $conexoesUDP) {

# TextBox do Log IGUAL DA IMAGEM (preto com texto verde)            Add-Log "SUCESSO - Servidor detectado rodando na porta $porta"

$txtLog = New-Object System.Windows.Forms.TextBox            $global:ResultadosConfig.ServidorRodando = $true

$txtLog.Location = New-Object System.Drawing.Point(54, 355)        } else {

$txtLog.Size = New-Object System.Drawing.Size(480, 120)            Add-Log "AVISO - Nenhum servidor detectado na porta $porta"

$txtLog.Multiline = $true            $global:ResultadosConfig.ServidorRodando = $false

$txtLog.ScrollBars = "Vertical"        }

$txtLog.ReadOnly = $true        

$txtLog.BackColor = [System.Drawing.Color]::Black        # 3. Remover regras antigas se solicitado

$txtLog.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 127)        if ($chkRemover.Checked) {

$txtLog.Font = New-Object System.Drawing.Font("Consolas", 9)            Add-Log "REMOVENDO regras antigas..."

$txtLog.BorderStyle = "FixedSingle"            try {

$form.Controls.Add($txtLog)                Remove-NetFirewallRule -DisplayName "$nomeRegra TCP" -ErrorAction SilentlyContinue

                Remove-NetFirewallRule -DisplayName "$nomeRegra UDP" -ErrorAction SilentlyContinue

# Variaveis globais                Add-Log "SUCESSO - Regras antigas removidas"

$ipLocal = ""            } catch {

$ipPublico = ""                Add-Log "AVISO - Nenhuma regra antiga encontrada"

            }

# Funcoes        }

function Adicionar-Log {        

    param([string]$mensagem)        # 4. Criar regras do firewall

    $timestamp = Get-Date -Format "HH:mm:ss"        Add-Log "CRIANDO regras do Windows Firewall..."

    $txtLog.AppendText("[$timestamp] $mensagem`r`n")        

    $txtLog.SelectionStart = $txtLog.Text.Length        # Regra TCP

    $txtLog.ScrollToCaret()        try {

    $form.Refresh()            New-NetFirewallRule -DisplayName "$nomeRegra TCP" -Direction Inbound -Protocol TCP -LocalPort $porta -Action Allow -ErrorAction Stop

}            Add-Log "SUCESSO - Regra TCP criada com sucesso"

            $global:ResultadosConfig.TCPOk = $true

function Obter-IPs {        } catch {

    try {            Add-Log "ERRO ao criar regra TCP: $($_.Exception.Message)"

        # IP Local            $global:ResultadosConfig.TCPOk = $false

        $script:ipLocal = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.IPAddress -notmatch "127.0.0.1" -and $_.IPAddress -notmatch "169.254"} | Select-Object -First 1).IPAddress        }

                

        # IP Publico        # Regra UDP

        try {        try {

            $script:ipPublico = (Invoke-RestMethod -Uri "https://api.ipify.org" -TimeoutSec 8)            New-NetFirewallRule -DisplayName "$nomeRegra UDP" -Direction Inbound -Protocol UDP -LocalPort $porta -Action Allow -ErrorAction Stop

            $lblIPInfo.Text = "IP Local: $ipLocal | IP Publico: $ipPublico | Servidor: $ipPublico`:$($txtPorta.Text)"            Add-Log "SUCESSO - Regra UDP criada com sucesso"

            $lblIPInfo.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 127)            $global:ResultadosConfig.UDPOk = $true

        } catch {        } catch {

            $script:ipPublico = "Sem internet"            Add-Log "ERRO ao criar regra UDP: $($_.Exception.Message)"

            $lblIPInfo.Text = "IP Local: $ipLocal | IP Publico: Offline | Configure port forwarding no roteador!"            $global:ResultadosConfig.UDPOk = $false

            $lblIPInfo.ForeColor = [System.Drawing.Color]::Orange        }

        }        

    } catch {        # 5. Teste local

        $lblIPInfo.Text = "Erro ao obter informacoes de rede"        Add-Log "TESTANDO conectividade local..."

        $lblIPInfo.ForeColor = [System.Drawing.Color]::Red        $testeLocal = Test-NetConnection -ComputerName "localhost" -Port $porta -WarningAction SilentlyContinue

    }        if ($testeLocal.TcpTestSucceeded) {

}            Add-Log "SUCESSO - Teste local bem-sucedido"

            $global:ResultadosConfig.TesteLocal = $true

function Configurar-Firewall {        } else {

    Adicionar-Log "Iniciando configuracao do firewall..."            Add-Log "AVISO - Teste local falhou (normal se servidor nao estiver rodando)"

                $global:ResultadosConfig.TesteLocal = $false

    try {        }

        $porta = $txtPorta.Text        

        $nomeRegra = $txtNomeRegra.Text        # Armazenar configurações

                $global:ResultadosConfig.Porta = $porta

        # Remover regras antigas se marcado        $global:ResultadosConfig.NomeRegra = $nomeRegra

        if ($chkRemover.Checked) {        $global:ResultadosConfig.DataHora = Get-Date -Format "dd/MM/yyyy HH:mm:ss"

            Adicionar-Log "Removendo regras antigas com nome '$nomeRegra'..."        

            Get-NetFirewallRule -DisplayName "*$nomeRegra*" -ErrorAction SilentlyContinue | Remove-NetFirewallRule -ErrorAction SilentlyContinue        Add-Log ""

        }        Add-Log "CONFIGURACAO CONCLUIDA!"

                Add-Log "Endereco para amigos: $($global:ResultadosConfig.IPPublico):$porta"

        # Criar novas regras        Add-Log ""

        Adicionar-Log "Criando regra TCP de entrada para porta $porta..."        Add-Log "PROXIMO PASSO: Configure port forwarding no seu roteador!"

        New-NetFirewallRule -DisplayName "$nomeRegra TCP In" -Direction Inbound -Protocol TCP -LocalPort $porta -Action Allow -Profile Any | Out-Null        

                $btnRelatorio.Enabled = $true

        Adicionar-Log "Criando regra UDP de entrada para porta $porta..."        

        New-NetFirewallRule -DisplayName "$nomeRegra UDP In" -Direction Inbound -Protocol UDP -LocalPort $porta -Action Allow -Profile Any | Out-Null        # Mostrar resultado final

                $mensagemFinal = @"

        Adicionar-Log "Criando regra TCP de saida para porta $porta..."CONFIGURACAO CONCLUIDA!

        New-NetFirewallRule -DisplayName "$nomeRegra TCP Out" -Direction Outbound -Protocol TCP -LocalPort $porta -Action Allow -Profile Any | Out-Null

        RESUMO:

        Adicionar-Log "Criando regra UDP de saida para porta $porta..."• Porta: $porta

        New-NetFirewallRule -DisplayName "$nomeRegra UDP Out" -Direction Outbound -Protocol UDP -LocalPort $porta -Action Allow -Profile Any | Out-Null• IP Publico: $($global:ResultadosConfig.IPPublico)

        • IP Local: $($global:ResultadosConfig.IPLocal)

        Adicionar-Log "CONFIGURADOR CARREGADO. Pronto para uso!"• Regra TCP: $(if($global:ResultadosConfig.TCPOk){"OK"}else{"ERRO"})

        Adicionar-Log "Firewall configurado com sucesso! Porta $porta liberada."• Regra UDP: $(if($global:ResultadosConfig.UDPOk){"OK"}else{"ERRO"})

        Adicionar-Log "Endereco do servidor: $ipPublico`:$porta"

        ENDERECO PARA AMIGOS:

    } catch {$($global:ResultadosConfig.IPPublico):$porta

        Adicionar-Log "ERRO: Falha na configuracao. Execute como Administrador!"

    }IMPORTANTE: Agora configure o port forwarding no seu roteador!

}"@

        

function Gerar-Relatorio {        [System.Windows.Forms.MessageBox]::Show($mensagemFinal, "Configuração Concluída", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)

    Adicionar-Log "Gerando relatorio do sistema..."        

        } catch {

    $relatorio = @"        Add-Log "ERRO GERAL: $($_.Exception.Message)"

========================================        [System.Windows.Forms.MessageBox]::Show("Erro durante a configuração: $($_.Exception.Message)", "Erro", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)

RELATORIO DO CONFIGURADOR DE SERVIDOR    }

========================================})



Data/Hora: $(Get-Date)# Event handler do botão Testar

IP Local: $ipLocal$btnTestar.Add_Click({

IP Publico: $ipPublico    $porta = $txtPorta.Text.Trim()

Porta Configurada: $($txtPorta.Text)    if ([string]::IsNullOrEmpty($porta) -or $porta -notmatch '^\d+$') {

Nome da Regra: $($txtNomeRegra.Text)        [System.Windows.Forms.MessageBox]::Show("Por favor, insira uma porta válida!", "Erro", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)

        return

ENDERECO DO SERVIDOR: $ipPublico`:$($txtPorta.Text)    }

    

REGRAS DE FIREWALL ATIVAS:    Add-Log "TESTANDO porta $porta..."

$(Get-NetFirewallRule -DisplayName "*$($txtNomeRegra.Text)*" | Select-Object DisplayName, Direction, Action | Format-Table -AutoSize | Out-String)    

    # Teste local

INSTRUCOES PARA AMIGOS:    $testeLocal = Test-NetConnection -ComputerName "localhost" -Port $porta -WarningAction SilentlyContinue

1. Compartilhe o endereco: $ipPublico`:$($txtPorta.Text)    if ($testeLocal.TcpTestSucceeded) {

2. Certifique-se que o Game Server esteja rodando        Add-Log "SUCESSO - Teste local: SUCESSO"

3. Configure port forwarding no roteador se necessario    } else {

        Add-Log "ERRO - Teste local: FALHOU"

TROUBLESHOOTING:    }

- Se amigos nao conseguem conectar: verifique port forwarding    

- Se servidor nao inicia: instale GameServer via Steam    # Verificar se está escutando

- Se firewall da erro: execute como Administrador    $conexoes = Get-NetTCPConnection -LocalPort $porta -ErrorAction SilentlyContinue

    $conexoesUDP = Get-NetUDPEndpoint -LocalPort $porta -ErrorAction SilentlyContinue

========================================    

"@    if ($conexoes) {

        Add-Log "SUCESSO - TCP: Porta $porta esta sendo usada"

    $relatorio | Out-File -FilePath "$env:USERPROFILE\Desktop\Relatorio_Servidor_GameServer.txt" -Encoding UTF8    }

    Adicionar-Log "Relatorio salvo em: Desktop\Relatorio_Servidor_GameServer.txt"    if ($conexoesUDP) {

    Start-Process "notepad.exe" "$env:USERPROFILE\Desktop\Relatorio_Servidor_GameServer.txt"        Add-Log "SUCESSO - UDP: Porta $porta esta sendo usada"

}    }

    if (-not $conexoes -and -not $conexoesUDP) {

function Testar-Conexao {        Add-Log "AVISO - Nenhum processo esta usando a porta $porta"

    Adicionar-Log "Testando conectividade da porta $($txtPorta.Text)..."    }

        

    try {    # Verificar regras do firewall

        $teste = Test-NetConnection -ComputerName $ipLocal -Port $txtPorta.Text -InformationLevel Quiet    $regrasTCP = Get-NetFirewallRule | Where-Object {$_.DisplayName -like "*$porta*" -or $_.DisplayName -like "*TCP*"}

        if ($teste) {    $regrasUDP = Get-NetFirewallRule | Where-Object {$_.DisplayName -like "*$porta*" -or $_.DisplayName -like "*UDP*"}

            Adicionar-Log "SUCESSO: Porta $($txtPorta.Text) esta acessivel localmente!"    

        } else {    if ($regrasTCP) {

            Adicionar-Log "AVISO: Porta $($txtPorta.Text) nao responde localmente"        Add-Log "SUCESSO - Regras TCP encontradas no firewall"

        }    } else {

    } catch {        Add-Log "AVISO - Nenhuma regra TCP encontrada"

        Adicionar-Log "Erro no teste de conectividade"    }

    }    

        if ($regrasUDP) {

    Adicionar-Log "Teste concluido. Verifique se o servidor esta rodando."        Add-Log "SUCESSO - Regras UDP encontradas no firewall"

}    } else {

        Add-Log "AVISO - Nenhuma regra UDP encontrada"

# Eventos dos botoes    }

$btnConfigurar.Add_Click({ Configurar-Firewall })})

$btnRelatorio.Add_Click({ Gerar-Relatorio })

$btnTestar.Add_Click({ Testar-Conexao })# Event handler do botão Relatório

$btnRelatorio.Add_Click({

$btnIniciarServidor.Add_Click({    if (-not $global:ResultadosConfig -or -not $global:ResultadosConfig.Porta) {

    Adicionar-Log "Tentando iniciar GameServer Dedicated Server..."        [System.Windows.Forms.MessageBox]::Show("Execute a configuração primeiro!", "Aviso", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)

    $steamPath = "C:\Program Files (x86)\Steam\steamapps\common\GameServer\GameServer Dedicated Server.exe"        return

    if (Test-Path $steamPath) {    }

        Start-Process $steamPath    

        Adicionar-Log "GameServer iniciado com sucesso!"    $saveDialog = New-Object System.Windows.Forms.SaveFileDialog

    } else {    $saveDialog.Filter = "Arquivo de Texto (*.txt)|*.txt|Todos os Arquivos (*.*)|*.*"

        Adicionar-Log "ERRO: GameServer nao encontrado. Instale via Steam."    $saveDialog.Title = "Salvar Relatório de Configuração"

        [System.Windows.Forms.MessageBox]::Show("GameServer Dedicated Server nao encontrado!`n`nInstale o jogo via Steam primeiro.", "Erro", "OK", "Error")    $saveDialog.FileName = "Relatorio_Servidor_$($global:ResultadosConfig.Porta).txt"

    }    $saveDialog.InitialDirectory = [Environment]::GetFolderPath("Desktop")

})    

    if ($saveDialog.ShowDialog() -eq "OK") {

$btnAbrirPasta.Add_Click({        $relatorio = @"

    $steamPath = "C:\Program Files (x86)\Steam\steamapps\common\GameServer"=======================================================

    if (Test-Path $steamPath) {           RELATÓRIO DE CONFIGURAÇÃO DO SERVIDOR

        Start-Process "explorer.exe" $steamPath=======================================================

        Adicionar-Log "Pasta do Steam aberta"Data/Hora: $($global:ResultadosConfig.DataHora)

    } else {

        Adicionar-Log "ERRO: Pasta do GameServer nao encontrada"CONFIGURAÇÕES:

        [System.Windows.Forms.MessageBox]::Show("Pasta do GameServer nao encontrada!`n`nInstale o jogo via Steam primeiro.", "Erro", "OK", "Error")- Porta configurada: $($global:ResultadosConfig.Porta)

    }- Nome das regras: $($global:ResultadosConfig.NomeRegra)

})

INFORMAÇÕES DE REDE:

$btnCopiarIP.Add_Click({- IP Público: $($global:ResultadosConfig.IPPublico)

    if ($ipPublico -ne "Sem internet") {- IP Local: $($global:ResultadosConfig.IPLocal)

        $endereco = "$ipPublico`:$($txtPorta.Text)"

        [System.Windows.Forms.Clipboard]::SetText($endereco)STATUS DAS CONFIGURAÇÕES:

        Adicionar-Log "Endereco copiado: $endereco"- Regra TCP criada: $(if($global:ResultadosConfig.TCPOk){"SIM"}else{"NÃO"})

        [System.Windows.Forms.MessageBox]::Show("Endereco copiado para area de transferencia:`n`n$endereco`n`nCompartilhe este endereco com seus amigos!", "IP Copiado!", "OK", "Information")- Regra UDP criada: $(if($global:ResultadosConfig.UDPOk){"SIM"}else{"NÃO"})

    } else {- Servidor rodando: $(if($global:ResultadosConfig.ServidorRodando){"SIM"}else{"NÃO"})

        $enderecoLocal = "$ipLocal`:$($txtPorta.Text)"- Teste local: $(if($global:ResultadosConfig.TesteLocal){"SUCESSO"}else{"FALHOU"})

        [System.Windows.Forms.Clipboard]::SetText($enderecoLocal)

        Adicionar-Log "IP local copiado: $enderecoLocal"ENDEREÇO PARA AMIGOS:

        [System.Windows.Forms.MessageBox]::Show("IP publico nao disponivel.`nIP local copiado: $enderecoLocal`n`nConfigure port forwarding no roteador!", "Aviso", "OK", "Warning")$($global:ResultadosConfig.IPPublico):$($global:ResultadosConfig.Porta)

    }

})INSTRUÇÕES PARA PORT FORWARDING:

=================================

$btnSair.Add_Click({ $form.Close() })

1. ACESSE SEU ROTEADOR:

# Inicializacao   - Abra um navegador e digite: 192.168.0.1 ou 192.168.1.1

Adicionar-Log "CONFIGURADOR AUTOMATICO DE SERVIDOR iniciado!"   - Faça login (usuário/senha estão na etiqueta do modem)

Adicionar-Log "Obtendo informacoes de rede..."

Obter-IPs2. CONFIGURE O PORT FORWARDING:

Adicionar-Log "Sistema pronto. Clique em CONFIGURAR SERVIDOR para comecar."

   OPÇÃO 1 - Se o roteador suporta TCP/UDP junto:

# Exibir formulario   -----------------------------------------------

$form.ShowDialog() | Out-Null   Nome/Descrição: $($global:ResultadosConfig.NomeRegra)
   Porta Externa: $($global:ResultadosConfig.Porta)
   Porta Interna: $($global:ResultadosConfig.Porta)
   Protocolo: TCP/UDP ou AMBOS
   IP de Destino: $($global:ResultadosConfig.IPLocal)
   Status: Habilitado

   OPÇÃO 2 - Se precisa configurar separadamente:
   -----------------------------------------------
   REGRA 1 (TCP):
   - Nome: $($global:ResultadosConfig.NomeRegra) TCP
   - Porta Externa: $($global:ResultadosConfig.Porta)
   - Porta Interna: $($global:ResultadosConfig.Porta)
   - Protocolo: TCP
   - IP de Destino: $($global:ResultadosConfig.IPLocal)

   REGRA 2 (UDP):
   - Nome: $($global:ResultadosConfig.NomeRegra) UDP
   - Porta Externa: $($global:ResultadosConfig.Porta)
   - Porta Interna: $($global:ResultadosConfig.Porta)
   - Protocolo: UDP
   - IP de Destino: $($global:ResultadosConfig.IPLocal)

3. TESTE A CONFIGURAÇÃO:
   - Acesse: https://www.yougetsignal.com/tools/open-ports/
   - Digite seu IP público: $($global:ResultadosConfig.IPPublico)
   - Digite a porta: $($global:ResultadosConfig.Porta)
   - Se aparecer "Port is open", está funcionando!

COMANDOS UTILIZADOS:
===================
New-NetFirewallRule -DisplayName "$($global:ResultadosConfig.NomeRegra) TCP" -Direction Inbound -Protocol TCP -LocalPort $($global:ResultadosConfig.Porta) -Action Allow
New-NetFirewallRule -DisplayName "$($global:ResultadosConfig.NomeRegra) UDP" -Direction Inbound -Protocol UDP -LocalPort $($global:ResultadosConfig.Porta) -Action Allow
"@
        
        try {
            $relatorio | Out-File -FilePath $saveDialog.FileName -Encoding UTF8
            [System.Windows.Forms.MessageBox]::Show("Relatório salvo com sucesso em:`n$($saveDialog.FileName)", "Sucesso", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
            
            # Perguntar se quer abrir
            $resultado = [System.Windows.Forms.MessageBox]::Show("Deseja abrir o relatório agora?", "Abrir Relatório", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)
            if ($resultado -eq "Yes") {
                Start-Process notepad $saveDialog.FileName
            }
        } catch {
            [System.Windows.Forms.MessageBox]::Show("Erro ao salvar relatório: $($_.Exception.Message)", "Erro", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
    }
})

# Adicionar controles ao formulário
$form.Controls.Add($lblTitulo)
$form.Controls.Add($lblPorta)
$form.Controls.Add($txtPorta)
$form.Controls.Add($lblNome)
$form.Controls.Add($txtNome)
$form.Controls.Add($chkRemover)
$form.Controls.Add($btnConfigurar)
$form.Controls.Add($btnRelatorio)
$form.Controls.Add($btnTestar)
$form.Controls.Add($lblLog)
$form.Controls.Add($txtLog)

# Mostrar o formulário
Add-Log "CONFIGURADOR CARREGADO. Pronto para uso!"
$form.ShowDialog()
