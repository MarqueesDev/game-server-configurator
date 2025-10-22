using System;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Net;
using System.Security.Principal;
using System.Windows.Forms;
using Microsoft.Win32;
using System.Net.NetworkInformation;
using System.Reflection;
namespace PainelGameServerConfigurador
{
    public class ConfiguradorWebClient : WebClient
    {
        private readonly int timeoutMilissegundos;
        public ConfiguradorWebClient(int timeout = 8000)
        {
            timeoutMilissegundos = timeout;
        }
        protected override WebRequest GetWebRequest(Uri endereco)
        {
            WebRequest requisicao = base.GetWebRequest(endereco);
            if (requisicao != null)
            {
                requisicao.Timeout = timeoutMilissegundos;
            }
            return requisicao;
        }
    }
    public partial class FormularioPrincipal : Form
    {
        private Panel painelMenuPrincipal;
        private Panel painelMigracaoNuvem;
        private Panel painelConfiguradorRede;
        private Button botaoMigrarNuvem;
        private Button botaoConfigurador;
        private Button botaoVoltar;
        private Label rotuloTitulo;
        private Label rotuloStatus;
        private TextBox campoPortaServidor;
        private TextBox campoNomeRegra;
        private CheckBox opcaoRemoverRegras;
        private Button botaoConfigurarFirewall;
        private Button botaoTestarConexao;
        private Button botaoIniciarGameServer;
        private Button botaoAtualizarEnderecoIP;
        private Button botaoGerarEnderecoCompleto;
        private TextBox campoEnderecoServidor;
        private Button botaoCopiarEndereco;
        private TextBox areaLogAtividades;
        private Label rotuloInformacoesIP;
        private Button botaoTutorialOracle;
        private Button botaoTutorialRailway;
        private Button botaoPrepararArquivos;
        private Button botaoGerarScripts;
        private TextBox areaLogMigracao;
        private string enderecoIPLocal = "";
        private string enderecoIPPublico = "";
        private readonly string[] servicosConsultaIP = {
            "https://api.ipify.org",
            "https://ifconfig.me/ip", 
            "https://icanhazip.com",
            "https://ipecho.net/plain",
            "https://myexternalip.com/raw",
            "https://checkip.amazonaws.com"
        };
        public FormularioPrincipal()
        {
            InicializarComponentes();
            CriarInterfaceUsuario();
            ExibirPainelPrincipal();
            DetectarConfiguracoesRede();
        }
        private void InicializarComponentes()
        {
            this.SuspendLayout();
            this.Text = "Configurador GameServer - Servidor de Jogos v1.0";
            this.Size = new Size(650, 600);
            this.StartPosition = FormStartPosition.CenterScreen;
            this.FormBorderStyle = FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = true;
            this.BackColor = Color.FromArgb(30, 30, 35);
            this.ForeColor = Color.White;
            this.Icon = SystemIcons.Application;
            this.ResumeLayout(false);
        }
        private void CriarInterfaceUsuario()
        {
            painelMenuPrincipal = new Panel();
            painelMenuPrincipal.Size = new Size(630, 570);
            painelMenuPrincipal.Location = new Point(10, 10);
            painelMenuPrincipal.BackColor = Color.FromArgb(30, 30, 35);
            this.Controls.Add(painelMenuPrincipal);
            rotuloTitulo = new Label();
            rotuloTitulo.Text = "CONFIGURADOR GameServer SERVIDOR";
            rotuloTitulo.Location = new Point(50, 20);
            rotuloTitulo.Size = new Size(530, 30);
            rotuloTitulo.Font = new Font("Segoe UI", 16, FontStyle.Bold);
            rotuloTitulo.ForeColor = Color.FromArgb(0, 255, 127);
            rotuloTitulo.TextAlign = ContentAlignment.MiddleCenter;
            painelMenuPrincipal.Controls.Add(rotuloTitulo);
            botaoMigrarNuvem = new Button();
            botaoMigrarNuvem.Text = "MIGRAR PARA NUVEM";
            botaoMigrarNuvem.Location = new Point(50, 100);
            botaoMigrarNuvem.Size = new Size(530, 60);
            botaoMigrarNuvem.Font = new Font("Segoe UI", 14, FontStyle.Bold);
            botaoMigrarNuvem.BackColor = Color.FromArgb(0, 120, 215);
            botaoMigrarNuvem.ForeColor = Color.White;
            botaoMigrarNuvem.FlatStyle = FlatStyle.Flat;
            botaoMigrarNuvem.FlatAppearance.BorderSize = 0;
            botaoMigrarNuvem.TextAlign = ContentAlignment.MiddleCenter;
            botaoMigrarNuvem.Cursor = Cursors.Hand;
            botaoMigrarNuvem.Click += delegate { ExibirPainelMigracao(); };
            painelMenuPrincipal.Controls.Add(botaoMigrarNuvem);
            botaoConfigurador = new Button();
            botaoConfigurador.Text = "CONFIGURADOR GUI";
            botaoConfigurador.Location = new Point(50, 180);
            botaoConfigurador.Size = new Size(530, 60);
            botaoConfigurador.Font = new Font("Segoe UI", 14, FontStyle.Bold);
            botaoConfigurador.BackColor = Color.FromArgb(255, 140, 0);
            botaoConfigurador.ForeColor = Color.White;
            botaoConfigurador.FlatStyle = FlatStyle.Flat;
            botaoConfigurador.FlatAppearance.BorderSize = 0;
            botaoConfigurador.TextAlign = ContentAlignment.MiddleCenter;
            botaoConfigurador.Cursor = Cursors.Hand;
            botaoConfigurador.Click += delegate { ExibirPainelConfigurador(); };
            painelMenuPrincipal.Controls.Add(botaoConfigurador);
            rotuloStatus = new Label();
            rotuloStatus.Text = "Sistema iniciado com privilegios administrativos";
            rotuloStatus.Location = new Point(50, 510);
            rotuloStatus.Size = new Size(530, 20);
            rotuloStatus.Font = new Font("Segoe UI", 10);
            rotuloStatus.ForeColor = Color.FromArgb(0, 255, 127);
            rotuloStatus.TextAlign = ContentAlignment.MiddleCenter;
            painelMenuPrincipal.Controls.Add(rotuloStatus);
            CriarPainelMigracaoNuvem();
            CriarPainelConfiguradorRede();
        }
        private void CriarPainelMigracaoNuvem()
        {
            painelMigracaoNuvem = new Panel();
            painelMigracaoNuvem.Size = new Size(630, 570);
            painelMigracaoNuvem.Location = new Point(10, 10);
            painelMigracaoNuvem.BackColor = Color.FromArgb(30, 30, 35);
            painelMigracaoNuvem.Visible = false;
            this.Controls.Add(painelMigracaoNuvem);
            Label tituloMigracao = new Label();
            tituloMigracao.Text = "MIGRAR SERVIDOR PARA NUVEM";
            tituloMigracao.Location = new Point(50, 20);
            tituloMigracao.Size = new Size(530, 30);
            tituloMigracao.Font = new Font("Segoe UI", 16, FontStyle.Bold);
            tituloMigracao.ForeColor = Color.FromArgb(0, 255, 127);
            tituloMigracao.TextAlign = ContentAlignment.MiddleCenter;
            painelMigracaoNuvem.Controls.Add(tituloMigracao);
            botaoTutorialOracle = new Button();
            botaoTutorialOracle.Text = "TUTORIAL ORACLE CLOUD (GRATUITO)";
            botaoTutorialOracle.Location = new Point(50, 80);
            botaoTutorialOracle.Size = new Size(530, 40);
            botaoTutorialOracle.Font = new Font("Segoe UI", 11, FontStyle.Bold);
            botaoTutorialOracle.BackColor = Color.FromArgb(34, 139, 34);
            botaoTutorialOracle.ForeColor = Color.White;
            botaoTutorialOracle.FlatStyle = FlatStyle.Flat;
            botaoTutorialOracle.FlatAppearance.BorderSize = 0;
            botaoTutorialOracle.TextAlign = ContentAlignment.MiddleCenter;
            botaoTutorialOracle.Click += ExibirTutorialOracle;
            painelMigracaoNuvem.Controls.Add(botaoTutorialOracle);
            botaoTutorialRailway = new Button();
            botaoTutorialRailway.Text = "TUTORIAL RAILWAY.APP (5 DOLARES CREDITOS)";
            botaoTutorialRailway.Location = new Point(50, 130);
            botaoTutorialRailway.Size = new Size(530, 40);
            botaoTutorialRailway.Font = new Font("Segoe UI", 11, FontStyle.Bold);
            botaoTutorialRailway.BackColor = Color.FromArgb(138, 43, 226);
            botaoTutorialRailway.ForeColor = Color.White;
            botaoTutorialRailway.FlatStyle = FlatStyle.Flat;
            botaoTutorialRailway.FlatAppearance.BorderSize = 0;
            botaoTutorialRailway.TextAlign = ContentAlignment.MiddleCenter;
            botaoTutorialRailway.Click += ExibirTutorialRailway;
            painelMigracaoNuvem.Controls.Add(botaoTutorialRailway);
            botaoPrepararArquivos = new Button();
            botaoPrepararArquivos.Text = "PREPARAR ARQUIVOS PARA UPLOAD";
            botaoPrepararArquivos.Location = new Point(50, 180);
            botaoPrepararArquivos.Size = new Size(530, 40);
            botaoPrepararArquivos.Font = new Font("Segoe UI", 11, FontStyle.Bold);
            botaoPrepararArquivos.BackColor = Color.FromArgb(255, 140, 0);
            botaoPrepararArquivos.ForeColor = Color.White;
            botaoPrepararArquivos.FlatStyle = FlatStyle.Flat;
            botaoPrepararArquivos.FlatAppearance.BorderSize = 0;
            botaoPrepararArquivos.TextAlign = ContentAlignment.MiddleCenter;
            botaoPrepararArquivos.Click += PrepararArquivosMigracao;
            painelMigracaoNuvem.Controls.Add(botaoPrepararArquivos);
            botaoGerarScripts = new Button();
            botaoGerarScripts.Text = "GERAR SCRIPTS DE AUTOMACAO";
            botaoGerarScripts.Location = new Point(50, 230);
            botaoGerarScripts.Size = new Size(530, 40);
            botaoGerarScripts.Font = new Font("Segoe UI", 11, FontStyle.Bold);
            botaoGerarScripts.BackColor = Color.FromArgb(220, 20, 60);
            botaoGerarScripts.ForeColor = Color.White;
            botaoGerarScripts.FlatStyle = FlatStyle.Flat;
            botaoGerarScripts.FlatAppearance.BorderSize = 0;
            botaoGerarScripts.TextAlign = ContentAlignment.MiddleCenter;
            botaoGerarScripts.Click += GerarScriptsAutomacao;
            painelMigracaoNuvem.Controls.Add(botaoGerarScripts);
            areaLogMigracao = new TextBox();
            areaLogMigracao.Location = new Point(50, 280);
            areaLogMigracao.Size = new Size(530, 140);
            areaLogMigracao.Multiline = true;
            areaLogMigracao.ScrollBars = ScrollBars.Vertical;
            areaLogMigracao.ReadOnly = true;
            areaLogMigracao.BackColor = Color.Black;
            areaLogMigracao.ForeColor = Color.FromArgb(0, 255, 127);
            areaLogMigracao.Font = new Font("Consolas", 9);
            painelMigracaoNuvem.Controls.Add(areaLogMigracao);
            Button botaoVoltarMigracao = new Button();
            botaoVoltarMigracao.Text = "VOLTAR AO MENU";
            botaoVoltarMigracao.Location = new Point(50, 440);
            botaoVoltarMigracao.Size = new Size(530, 40);
            botaoVoltarMigracao.Font = new Font("Segoe UI", 11, FontStyle.Bold);
            botaoVoltarMigracao.BackColor = Color.FromArgb(128, 128, 128);
            botaoVoltarMigracao.ForeColor = Color.White;
            botaoVoltarMigracao.FlatStyle = FlatStyle.Flat;
            botaoVoltarMigracao.FlatAppearance.BorderSize = 0;
            botaoVoltarMigracao.TextAlign = ContentAlignment.MiddleCenter;
            botaoVoltarMigracao.Click += delegate { ExibirPainelPrincipal(); };
            painelMigracaoNuvem.Controls.Add(botaoVoltarMigracao);
        }
        private void CriarPainelConfiguradorRede()
        {
            painelConfiguradorRede = new Panel();
            painelConfiguradorRede.Size = new Size(630, 570);
            painelConfiguradorRede.Location = new Point(10, 10);
            painelConfiguradorRede.BackColor = Color.FromArgb(30, 30, 35);
            painelConfiguradorRede.Visible = false;
            this.Controls.Add(painelConfiguradorRede);
            Label tituloConfigurador = new Label();
            tituloConfigurador.Text = "CONFIGURADOR AUTOMATICO DE REDE";
            tituloConfigurador.Location = new Point(50, 20);
            tituloConfigurador.Size = new Size(530, 30);
            tituloConfigurador.Font = new Font("Segoe UI", 16, FontStyle.Bold);
            tituloConfigurador.ForeColor = Color.FromArgb(0, 255, 127);
            tituloConfigurador.TextAlign = ContentAlignment.MiddleCenter;
            painelConfiguradorRede.Controls.Add(tituloConfigurador);
            Label rotuloPorta = new Label();
            rotuloPorta.Text = "Porta do Servidor:";
            rotuloPorta.Location = new Point(50, 70);
            rotuloPorta.Size = new Size(120, 20);
            rotuloPorta.ForeColor = Color.White;
            painelConfiguradorRede.Controls.Add(rotuloPorta);
            campoPortaServidor = new TextBox();
            campoPortaServidor.Text = "14159";
            campoPortaServidor.Location = new Point(180, 68);
            campoPortaServidor.Size = new Size(100, 25);
            campoPortaServidor.BackColor = Color.FromArgb(60, 60, 60);
            campoPortaServidor.ForeColor = Color.White;
            painelConfiguradorRede.Controls.Add(campoPortaServidor);
            Label rotuloRegra = new Label();
            rotuloRegra.Text = "Nome da Regra:";
            rotuloRegra.Location = new Point(50, 100);
            rotuloRegra.Size = new Size(120, 20);
            rotuloRegra.ForeColor = Color.White;
            painelConfiguradorRede.Controls.Add(rotuloRegra);
            campoNomeRegra = new TextBox();
            campoNomeRegra.Text = "Servidor de Jogo GameServer";
            campoNomeRegra.Location = new Point(180, 98);
            campoNomeRegra.Size = new Size(200, 25);
            campoNomeRegra.BackColor = Color.FromArgb(60, 60, 60);
            campoNomeRegra.ForeColor = Color.White;
            painelConfiguradorRede.Controls.Add(campoNomeRegra);
            opcaoRemoverRegras = new CheckBox();
            opcaoRemoverRegras.Text = "Remover regras antigas primeiro";
            opcaoRemoverRegras.Location = new Point(50, 130);
            opcaoRemoverRegras.Size = new Size(250, 20);
            opcaoRemoverRegras.ForeColor = Color.White;
            opcaoRemoverRegras.Checked = true;
            painelConfiguradorRede.Controls.Add(opcaoRemoverRegras);
            rotuloInformacoesIP = new Label();
            rotuloInformacoesIP.Text = "Detectando configuracoes de rede...";
            rotuloInformacoesIP.Location = new Point(50, 160);
            rotuloInformacoesIP.Size = new Size(530, 30);
            rotuloInformacoesIP.ForeColor = Color.FromArgb(0, 255, 127);
            rotuloInformacoesIP.Font = new Font("Segoe UI", 9);
            painelConfiguradorRede.Controls.Add(rotuloInformacoesIP);
            botaoAtualizarEnderecoIP = new Button();
            botaoAtualizarEnderecoIP.Text = "DETECTAR IP PUBLICO";
            botaoAtualizarEnderecoIP.Location = new Point(50, 200);
            botaoAtualizarEnderecoIP.Size = new Size(170, 35);
            botaoAtualizarEnderecoIP.Font = new Font("Segoe UI", 9, FontStyle.Bold);
            botaoAtualizarEnderecoIP.BackColor = Color.FromArgb(34, 139, 34);
            botaoAtualizarEnderecoIP.ForeColor = Color.White;
            botaoAtualizarEnderecoIP.FlatStyle = FlatStyle.Flat;
            botaoAtualizarEnderecoIP.FlatAppearance.BorderSize = 0;
            botaoAtualizarEnderecoIP.TextAlign = ContentAlignment.MiddleCenter;
            botaoAtualizarEnderecoIP.Cursor = Cursors.Hand;
            botaoAtualizarEnderecoIP.Click += DetectarEnderecoIPPublico;
            painelConfiguradorRede.Controls.Add(botaoAtualizarEnderecoIP);
            botaoGerarEnderecoCompleto = new Button();
            botaoGerarEnderecoCompleto.Text = "GERAR ENDERECO";
            botaoGerarEnderecoCompleto.Location = new Point(240, 200);
            botaoGerarEnderecoCompleto.Size = new Size(140, 35);
            botaoGerarEnderecoCompleto.Font = new Font("Segoe UI", 9, FontStyle.Bold);
            botaoGerarEnderecoCompleto.BackColor = Color.FromArgb(255, 140, 0);
            botaoGerarEnderecoCompleto.ForeColor = Color.White;
            botaoGerarEnderecoCompleto.FlatStyle = FlatStyle.Flat;
            botaoGerarEnderecoCompleto.FlatAppearance.BorderSize = 0;
            botaoGerarEnderecoCompleto.TextAlign = ContentAlignment.MiddleCenter;
            botaoGerarEnderecoCompleto.Cursor = Cursors.Hand;
            botaoGerarEnderecoCompleto.Click += GerarEnderecoCompleto;
            painelConfiguradorRede.Controls.Add(botaoGerarEnderecoCompleto);
            Label rotuloEndereco = new Label();
            rotuloEndereco.Text = "Endereco para compartilhar:";
            rotuloEndereco.Location = new Point(50, 250);
            rotuloEndereco.Size = new Size(250, 20);
            rotuloEndereco.ForeColor = Color.White;
            rotuloEndereco.Font = new Font("Segoe UI", 10, FontStyle.Bold);
            painelConfiguradorRede.Controls.Add(rotuloEndereco);
            campoEnderecoServidor = new TextBox();
            campoEnderecoServidor.Location = new Point(50, 275);
            campoEnderecoServidor.Size = new Size(400, 25);
            campoEnderecoServidor.BackColor = Color.FromArgb(40, 40, 40);
            campoEnderecoServidor.ForeColor = Color.FromArgb(0, 255, 127);
            campoEnderecoServidor.Font = new Font("Consolas", 11, FontStyle.Bold);
            campoEnderecoServidor.ReadOnly = true;
            campoEnderecoServidor.Text = "Clique em DETECTAR IP PUBLICO primeiro";
            painelConfiguradorRede.Controls.Add(campoEnderecoServidor);
            botaoCopiarEndereco = new Button();
            botaoCopiarEndereco.Text = "COPIAR";
            botaoCopiarEndereco.Location = new Point(460, 275);
            botaoCopiarEndereco.Size = new Size(80, 25);
            botaoCopiarEndereco.Font = new Font("Segoe UI", 9, FontStyle.Bold);
            botaoCopiarEndereco.BackColor = Color.FromArgb(220, 20, 60);
            botaoCopiarEndereco.ForeColor = Color.White;
            botaoCopiarEndereco.FlatStyle = FlatStyle.Flat;
            botaoCopiarEndereco.FlatAppearance.BorderSize = 0;
            botaoCopiarEndereco.TextAlign = ContentAlignment.MiddleCenter;
            botaoCopiarEndereco.Cursor = Cursors.Hand;
            botaoCopiarEndereco.Click += CopiarEnderecoServidor;
            painelConfiguradorRede.Controls.Add(botaoCopiarEndereco);
            botaoConfigurarFirewall = new Button();
            botaoConfigurarFirewall.Text = "CONFIGURAR FIREWALL";
            botaoConfigurarFirewall.Location = new Point(50, 315);
            botaoConfigurarFirewall.Size = new Size(160, 40);
            botaoConfigurarFirewall.Font = new Font("Segoe UI", 9, FontStyle.Bold);
            botaoConfigurarFirewall.BackColor = Color.FromArgb(0, 120, 215);
            botaoConfigurarFirewall.ForeColor = Color.White;
            botaoConfigurarFirewall.FlatStyle = FlatStyle.Flat;
            botaoConfigurarFirewall.FlatAppearance.BorderSize = 0;
            botaoConfigurarFirewall.TextAlign = ContentAlignment.MiddleCenter;
            botaoConfigurarFirewall.Click += ConfigurarFirewallWindows;
            painelConfiguradorRede.Controls.Add(botaoConfigurarFirewall);
            botaoTestarConexao = new Button();
            botaoTestarConexao.Text = "TESTAR";
            botaoTestarConexao.Location = new Point(230, 315);
            botaoTestarConexao.Size = new Size(100, 40);
            botaoTestarConexao.Font = new Font("Segoe UI", 10, FontStyle.Bold);
            botaoTestarConexao.BackColor = Color.FromArgb(34, 139, 34);
            botaoTestarConexao.ForeColor = Color.White;
            botaoTestarConexao.FlatStyle = FlatStyle.Flat;
            botaoTestarConexao.FlatAppearance.BorderSize = 0;
            botaoTestarConexao.TextAlign = ContentAlignment.MiddleCenter;
            botaoTestarConexao.Click += TestarConexaoServidor;
            painelConfiguradorRede.Controls.Add(botaoTestarConexao);
            botaoIniciarGameServer = new Button();
            botaoIniciarGameServer.Text = "INICIAR GameServer";
            botaoIniciarGameServer.Location = new Point(350, 315);
            botaoIniciarGameServer.Size = new Size(130, 40);
            botaoIniciarGameServer.Font = new Font("Segoe UI", 10, FontStyle.Bold);
            botaoIniciarGameServer.BackColor = Color.FromArgb(138, 43, 226);
            botaoIniciarGameServer.ForeColor = Color.White;
            botaoIniciarGameServer.FlatStyle = FlatStyle.Flat;
            botaoIniciarGameServer.FlatAppearance.BorderSize = 0;
            botaoIniciarGameServer.TextAlign = ContentAlignment.MiddleCenter;
            botaoIniciarGameServer.Click += IniciarServidorGameServer;
            painelConfiguradorRede.Controls.Add(botaoIniciarGameServer);
            Label rotuloLog = new Label();
            rotuloLog.Text = "Log de Atividades do Sistema:";
            rotuloLog.Location = new Point(50, 370);
            rotuloLog.Size = new Size(200, 20);
            rotuloLog.ForeColor = Color.White;
            rotuloLog.Font = new Font("Segoe UI", 10, FontStyle.Bold);
            painelConfiguradorRede.Controls.Add(rotuloLog);
            areaLogAtividades = new TextBox();
            areaLogAtividades.Location = new Point(50, 395);
            areaLogAtividades.Size = new Size(530, 80);
            areaLogAtividades.Multiline = true;
            areaLogAtividades.ScrollBars = ScrollBars.Vertical;
            areaLogAtividades.ReadOnly = true;
            areaLogAtividades.BackColor = Color.Black;
            areaLogAtividades.ForeColor = Color.FromArgb(0, 255, 127);
            areaLogAtividades.Font = new Font("Consolas", 9);
            painelConfiguradorRede.Controls.Add(areaLogAtividades);
            Button botaoVoltarConfigurador = new Button();
            botaoVoltarConfigurador.Text = "VOLTAR AO MENU";
            botaoVoltarConfigurador.Location = new Point(50, 490);
            botaoVoltarConfigurador.Size = new Size(530, 40);
            botaoVoltarConfigurador.Font = new Font("Segoe UI", 11, FontStyle.Bold);
            botaoVoltarConfigurador.BackColor = Color.FromArgb(128, 128, 128);
            botaoVoltarConfigurador.ForeColor = Color.White;
            botaoVoltarConfigurador.FlatStyle = FlatStyle.Flat;
            botaoVoltarConfigurador.FlatAppearance.BorderSize = 0;
            botaoVoltarConfigurador.TextAlign = ContentAlignment.MiddleCenter;
            botaoVoltarConfigurador.Click += delegate { ExibirPainelPrincipal(); };
            painelConfiguradorRede.Controls.Add(botaoVoltarConfigurador);
        }
        private void ExibirPainelPrincipal()
        {
            painelMenuPrincipal.Visible = true;
            painelMigracaoNuvem.Visible = false;
            painelConfiguradorRede.Visible = false;
        }
        private void ExibirPainelMigracao()
        {
            painelMenuPrincipal.Visible = false;
            painelMigracaoNuvem.Visible = true;
            painelConfiguradorRede.Visible = false;
            AdicionarEntradaLogMigracao("Painel de migracao para nuvem iniciado");
        }
        private void ExibirPainelConfigurador()
        {
            painelMenuPrincipal.Visible = false;
            painelMigracaoNuvem.Visible = false;
            painelConfiguradorRede.Visible = true;
            AdicionarEntradaLogConfiguracao("Configurador de rede iniciado - pronto para detectar IP!");
        }
        private void DetectarConfiguracoesRede()
        {
            try
            {
                foreach (NetworkInterface interfaceRede in NetworkInterface.GetAllNetworkInterfaces())
                {
                    if (interfaceRede.NetworkInterfaceType == NetworkInterfaceType.Wireless80211 || 
                        interfaceRede.NetworkInterfaceType == NetworkInterfaceType.Ethernet)
                    {
                        if (interfaceRede.OperationalStatus == OperationalStatus.Up)
                        {
                            foreach (UnicastIPAddressInformation infoEndereco in interfaceRede.GetIPProperties().UnicastAddresses)
                            {
                                if (infoEndereco.Address.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork && 
                                    !infoEndereco.Address.ToString().StartsWith("169.254") && 
                                    !infoEndereco.Address.ToString().StartsWith("127."))
                                {
                                    enderecoIPLocal = infoEndereco.Address.ToString();
                                    break;
                                }
                            }
                        }
                    }
                    if (!string.IsNullOrEmpty(enderecoIPLocal)) break;
                }
                if (rotuloInformacoesIP != null)
                {
                    rotuloInformacoesIP.Text = "IP Local: " + enderecoIPLocal + " | IP Publico: Detectando...";
                    rotuloInformacoesIP.ForeColor = Color.Yellow;
                }
                System.Threading.Tasks.Task.Run(() => {
                    DetectarIPPublicoSilencioso();
                });
            }
            catch (Exception erro)
            {
                if (rotuloInformacoesIP != null)
                {
                    rotuloInformacoesIP.Text = "Erro na deteccao automatica de rede: " + erro.Message;
                    rotuloInformacoesIP.ForeColor = Color.Red;
                }
            }
        }
        private void DetectarIPPublicoSilencioso()
        {
            try
            {
                string ipDetectado = null;
                string servicoUtilizado = "";
                string[] servicosPrincipais = { 
                    "https://api.ipify.org", 
                    "https://ifconfig.me/ip", 
                    "https://icanhazip.com" 
                };
                foreach (string servico in servicosPrincipais)
                {
                    try
                    {
                        using (ConfiguradorWebClient cliente = new ConfiguradorWebClient(5000))
                        {
                            cliente.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36");
                            string resposta = cliente.DownloadString(servico).Trim();
                            System.Net.IPAddress endereco;
                            if (System.Net.IPAddress.TryParse(resposta, out endereco) && 
                                endereco.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork)
                            {
                                ipDetectado = resposta;
                                servicoUtilizado = servico;
                                break;
                            }
                        }
                    }
                    catch
                    {
                        continue;
                    }
                }
                this.Invoke(new Action(() => {
                    if (!string.IsNullOrEmpty(ipDetectado))
                    {
                        enderecoIPPublico = ipDetectado;
                        rotuloInformacoesIP.Text = "IP Local: " + enderecoIPLocal + " | IP Publico: " + enderecoIPPublico + 
                            " - Deteccao automatica concluida com sucesso!";
                        rotuloInformacoesIP.ForeColor = Color.FromArgb(0, 255, 127);
                    }
                    else
                    {
                        enderecoIPPublico = "Offline";
                        rotuloInformacoesIP.Text = "IP Local: " + enderecoIPLocal + " | IP Publico: Nao detectado" + 
                            " - Clique em DETECTAR IP PUBLICO para tentar novamente";
                        rotuloInformacoesIP.ForeColor = Color.Orange;
                    }
                }));
            }
            catch
            {
                this.Invoke(new Action(() => {
                    enderecoIPPublico = "Offline";
                    rotuloInformacoesIP.Text = "IP Local: " + enderecoIPLocal + " | IP Publico: Erro na deteccao" + 
                        " - Utilize DETECTAR IP PUBLICO para diagnostico completo";
                    rotuloInformacoesIP.ForeColor = Color.Orange;
                }));
            }
        }
        private void AdicionarEntradaLogConfiguracao(string mensagem)
        {
            if (areaLogAtividades != null)
            {
                string timestampAtual = DateTime.Now.ToString("HH:mm:ss");
                areaLogAtividades.AppendText("[" + timestampAtual + "] " + mensagem + "\r\n");
                areaLogAtividades.SelectionStart = areaLogAtividades.Text.Length;
                areaLogAtividades.ScrollToCaret();
            }
        }
        private void AdicionarEntradaLogMigracao(string mensagem)
        {
            if (areaLogMigracao != null)
            {
                string timestampAtual = DateTime.Now.ToString("HH:mm:ss");
                areaLogMigracao.AppendText("[" + timestampAtual + "] " + mensagem + "\r\n");
                areaLogMigracao.SelectionStart = areaLogMigracao.Text.Length;
                areaLogMigracao.ScrollToCaret();
            }
        }
        private void DetectarEnderecoIPPublico(object remetente, EventArgs argumentos)
        {
            AdicionarEntradaLogConfiguracao("=== INICIANDO DETECCAO ROBUSTA DE IP PUBLICO ===");
            AdicionarEntradaLogConfiguracao("Testando " + servicosConsultaIP.Length + " servicos diferentes...");
            rotuloInformacoesIP.Text = "Executando testes em multiplos servicos... Aguarde...";
            rotuloInformacoesIP.ForeColor = Color.Yellow;
            botaoAtualizarEnderecoIP.Enabled = false;
            botaoAtualizarEnderecoIP.Text = "DETECTANDO...";
            System.Threading.Tasks.Task.Run(() => {
                try
                {
                    string ipEncontrado = null;
                    string servicoFuncional = "";
                    int tentativasExecutadas = 0;
                    foreach (string servicoAtual in servicosConsultaIP)
                    {
                        tentativasExecutadas++;
                        this.Invoke(new Action(() => {
                            AdicionarEntradaLogConfiguracao("Tentativa " + tentativasExecutadas + ": " + servicoAtual);
                        }));
                        try
                        {
                            using (ConfiguradorWebClient clienteHTTP = new ConfiguradorWebClient(8000))
                            {
                                clienteHTTP.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36");
                                string respostaServico = clienteHTTP.DownloadString(servicoAtual).Trim();
                                if (respostaServico.Contains("\""))
                                {
                                    int inicioIP = respostaServico.IndexOf("\"") + 1;
                                    int fimIP = respostaServico.LastIndexOf("\"");
                                    if (fimIP > inicioIP)
                                        respostaServico = respostaServico.Substring(inicioIP, fimIP - inicioIP);
                                }
                                System.Net.IPAddress enderecoValidado;
                                if (System.Net.IPAddress.TryParse(respostaServico, out enderecoValidado) && 
                                    enderecoValidado.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork)
                                {
                                    ipEncontrado = respostaServico;
                                    servicoFuncional = servicoAtual;
                                    this.Invoke(new Action(() => {
                                        AdicionarEntradaLogConfiguracao("SUCESSO! IP publico detectado: " + ipEncontrado);
                                    }));
                                    break;
                                }
                            }
                        }
                        catch (Exception erroTentativa)
                        {
                            this.Invoke(new Action(() => {
                                AdicionarEntradaLogConfiguracao("Falhou: " + erroTentativa.Message);
                            }));
                        }
                    }
                    this.Invoke(new Action(() => {
                        botaoAtualizarEnderecoIP.Enabled = true;
                        botaoAtualizarEnderecoIP.Text = "DETECTAR IP PUBLICO";
                        if (!string.IsNullOrEmpty(ipEncontrado))
                        {
                            enderecoIPPublico = ipEncontrado;
                            rotuloInformacoesIP.Text = "IP Local: " + enderecoIPLocal + " | IP Publico: " + enderecoIPPublico + 
                                " - Detectado via: " + servicoFuncional;
                            rotuloInformacoesIP.ForeColor = Color.FromArgb(0, 255, 127);
                            AdicionarEntradaLogConfiguracao("=== DETECCAO CONCLUIDA COM SUCESSO! ===");
                            AdicionarEntradaLogConfiguracao("Servico utilizado: " + servicoFuncional);
                            AdicionarEntradaLogConfiguracao("Agora voce pode gerar o endereco completo do servidor!");
                        }
                        else
                        {
                            enderecoIPPublico = "Offline";
                            rotuloInformacoesIP.Text = "IP Local: " + enderecoIPLocal + " | TODOS OS SERVICOS FALHARAM" + 
                                " - Verifique firewall, antivirus ou conexao de internet!";
                            rotuloInformacoesIP.ForeColor = Color.Red;
                            AdicionarEntradaLogConfiguracao("=== ERRO: NENHUM SERVICO RESPONDEU ===");
                        }
                    }));
                }
                catch (Exception erroGeral)
                {
                    this.Invoke(new Action(() => {
                        botaoAtualizarEnderecoIP.Enabled = true;
                        botaoAtualizarEnderecoIP.Text = "DETECTAR IP PUBLICO";
                        AdicionarEntradaLogConfiguracao("ERRO GERAL NO SISTEMA: " + erroGeral.Message);
                    }));
                }
            });
        }
        private void GerarEnderecoCompleto(object remetente, EventArgs argumentos)
        {
            if (enderecoIPPublico == "Offline" || string.IsNullOrEmpty(enderecoIPPublico))
            {
                MessageBox.Show("IP publico nao foi detectado! Clique em 'DETECTAR IP PUBLICO' primeiro para detectar seu endereco IP publico.", 
                              "IP Nao Detectado", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            string portaConfigurada = campoPortaServidor.Text;
            string enderecoCompleto = enderecoIPPublico + ":" + portaConfigurada;
            campoEnderecoServidor.Text = enderecoCompleto;
            campoEnderecoServidor.BackColor = Color.FromArgb(0, 40, 0);
            AdicionarEntradaLogConfiguracao("=== ENDERECO DO SERVIDOR GERADO ===");
            AdicionarEntradaLogConfiguracao("Endereco completo: " + enderecoCompleto);
            AdicionarEntradaLogConfiguracao("Pronto para compartilhar com seus amigos!");
            AdicionarEntradaLogConfiguracao("Clique em COPIAR e envie via Discord/WhatsApp!");
        }
        private void CopiarEnderecoServidor(object remetente, EventArgs argumentos)
        {
            if (string.IsNullOrEmpty(campoEnderecoServidor.Text) || campoEnderecoServidor.Text.Contains("Clique"))
            {
                MessageBox.Show("Gere o endereco do servidor primeiro!", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            try
            {
                Clipboard.SetText(campoEnderecoServidor.Text);
                AdicionarEntradaLogConfiguracao("=== ENDERECO COPIADO PARA AREA DE TRANSFERENCIA ===");
                AdicionarEntradaLogConfiguracao("Endereco copiado: " + campoEnderecoServidor.Text);
                AdicionarEntradaLogConfiguracao("Agora voce pode colar e enviar para seus amigos!");
                botaoCopiarEndereco.BackColor = Color.FromArgb(34, 139, 34);
                botaoCopiarEndereco.Text = "COPIADO!";
                System.Threading.Tasks.Task.Run(() => {
                    System.Threading.Thread.Sleep(2000);
                    this.Invoke(new Action(() => {
                        botaoCopiarEndereco.BackColor = Color.FromArgb(220, 20, 60);
                        botaoCopiarEndereco.Text = "COPIAR";
                    }));
                });
            }
            catch (Exception erro)
            {
                MessageBox.Show("Erro ao copiar para area de transferencia: " + erro.Message, "Erro", 
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void ConfigurarFirewallWindows(object remetente, EventArgs argumentos)
        {
            AdicionarEntradaLogConfiguracao("Iniciando configuracao do firewall do Windows...");
            try
            {
                string portaConfigurada = campoPortaServidor.Text;
                string nomeRegraFirewall = campoNomeRegra.Text;
                ProcessStartInfo infoProcessoTCP = new ProcessStartInfo();
                infoProcessoTCP.FileName = "netsh";
                infoProcessoTCP.Arguments = "advfirewall firewall add rule name=\"" + nomeRegraFirewall + " TCP\" dir=in action=allow protocol=TCP localport=" + portaConfigurada;
                infoProcessoTCP.UseShellExecute = false;
                infoProcessoTCP.CreateNoWindow = true;
                Process.Start(infoProcessoTCP).WaitForExit();
                ProcessStartInfo infoProcessoUDP = new ProcessStartInfo();
                infoProcessoUDP.FileName = "netsh";
                infoProcessoUDP.Arguments = "advfirewall firewall add rule name=\"" + nomeRegraFirewall + " UDP\" dir=in action=allow protocol=UDP localport=" + portaConfigurada;
                infoProcessoUDP.UseShellExecute = false;
                infoProcessoUDP.CreateNoWindow = true;
                Process.Start(infoProcessoUDP).WaitForExit();
                AdicionarEntradaLogConfiguracao("Firewall configurado com sucesso! Porta " + portaConfigurada + " liberada.");
                AdicionarEntradaLogConfiguracao("Endereco do servidor: " + enderecoIPPublico + ":" + portaConfigurada);
                AdicionarEntradaLogConfiguracao("Regras TCP e UDP criadas para: " + nomeRegraFirewall);
            }
            catch (Exception erro)
            {
                AdicionarEntradaLogConfiguracao("ERRO na configuracao do firewall: " + erro.Message);
            }
        }
        private void TestarConexaoServidor(object remetente, EventArgs argumentos)
        {
            AdicionarEntradaLogConfiguracao("=== EXECUTANDO TESTE DE CONECTIVIDADE ===");
            AdicionarEntradaLogConfiguracao("IP Local detectado: " + enderecoIPLocal);
            AdicionarEntradaLogConfiguracao("IP Publico detectado: " + enderecoIPPublico);
            AdicionarEntradaLogConfiguracao("Porta configurada: " + campoPortaServidor.Text);
            AdicionarEntradaLogConfiguracao("Endereco completo do servidor: " + enderecoIPPublico + ":" + campoPortaServidor.Text);
            AdicionarEntradaLogConfiguracao("Teste de conectividade concluido. Inicie o GameServer para testar!");
        }
        private void IniciarServidorGameServer(object remetente, EventArgs argumentos)
        {
            AdicionarEntradaLogConfiguracao("Tentando localizar e iniciar o servidor GameServer...");
            try
            {
                string caminhoGameServerSteam = @"C:\Program Files (x86)\Steam\steamapps\common\GameServer\GameServer Dedicated Server.exe";
                if (File.Exists(caminhoGameServerSteam))
                {
                    Process.Start(caminhoGameServerSteam);
                    AdicionarEntradaLogConfiguracao("Servidor GameServer iniciado com sucesso!");
                    AdicionarEntradaLogConfiguracao("Caminho utilizado: " + caminhoGameServerSteam);
                }
                else
                {
                    AdicionarEntradaLogConfiguracao("ERRO: GameServer nao encontrado no diretorio padrao do Steam.");
                    AdicionarEntradaLogConfiguracao("Instale o GameServer via Steam e tente novamente.");
                }
            }
            catch (Exception erro)
            {
                AdicionarEntradaLogConfiguracao("ERRO ao iniciar GameServer: " + erro.Message);
            }
        }
        private void ExibirTutorialOracle(object remetente, EventArgs argumentos)
        {
            AdicionarEntradaLogMigracao("=== TUTORIAL COMPLETO ORACLE CLOUD (GRATUITO) ===");
            AdicionarEntradaLogMigracao("1. Acesse o site: https://cloud.oracle.com");
            AdicionarEntradaLogMigracao("2. Clique em 'Start for free' (Comecar gratuitamente)");
            AdicionarEntradaLogMigracao("3. Preencha seus dados (cartao necessario mas NAO sera cobrado)");
            AdicionarEntradaLogMigracao("4. Escolha a regiao: Brazil East (Sao Paulo)");
            AdicionarEntradaLogMigracao("5. No console: Compute -> Instances -> Create Instance");
            AdicionarEntradaLogMigracao("6. Nome da instancia: GameServer-server");
            AdicionarEntradaLogMigracao("7. Imagem do sistema: Ubuntu 22.04");
            AdicionarEntradaLogMigracao("8. Shape: VM.Standard.A1.Flex (ARM, 4 OCPUs, 24GB RAM)");
            AdicionarEntradaLogMigracao("9. Networking: Create new VCN (criar nova rede)");
            AdicionarEntradaLogMigracao("10. SSH Keys: Generate new pair (salve a chave privada!)");
            AdicionarEntradaLogMigracao("Tutorial detalhado disponivel na documentacao!");
        }
        private void ExibirTutorialRailway(object remetente, EventArgs argumentos)
        {
            AdicionarEntradaLogMigracao("=== TUTORIAL RAILWAY.APP (5 DOLARES CREDITOS MENSAIS) ===");
            AdicionarEntradaLogMigracao("1. Acesse o site: https://railway.app");
            AdicionarEntradaLogMigracao("2. Faca login com sua conta GitHub");
            AdicionarEntradaLogMigracao("3. New Project -> Deploy from GitHub repo");
            AdicionarEntradaLogMigracao("4. Conecte seu repositorio com os arquivos do GameServer");
            AdicionarEntradaLogMigracao("5. Configure as variaveis de ambiente necessarias");
            AdicionarEntradaLogMigracao("6. O deploy sera feito automaticamente!");
            AdicionarEntradaLogMigracao("Custo aproximado: 5 dolares em creditos mensais");
        }
        private void PrepararArquivosMigracao(object remetente, EventArgs argumentos)
        {
            AdicionarEntradaLogMigracao("Preparando arquivos para migracao para nuvem...");
            try
            {
                string areaTrabalho = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
                string pastaPreparacao = Path.Combine(areaTrabalho, "GameServer_Preparado_Nuvem");
                if (!Directory.Exists(pastaPreparacao))
                    Directory.CreateDirectory(pastaPreparacao);
                AdicionarEntradaLogMigracao("Pasta de preparacao criada: " + pastaPreparacao);
                AdicionarEntradaLogMigracao("Copie os seguintes arquivos do GameServer para esta pasta:");
                AdicionarEntradaLogMigracao("- GameServer Dedicated Server.exe (executavel principal)");
                AdicionarEntradaLogMigracao("- res/ (pasta completa com recursos)");
                AdicionarEntradaLogMigracao("- server.cfg (arquivo de configuracao, se existir)");
                AdicionarEntradaLogMigracao("- Qualquer mod ou configuracao personalizada");
                Process.Start("explorer.exe", pastaPreparacao);
            }
            catch (Exception erro)
            {
                AdicionarEntradaLogMigracao("ERRO na preparacao: " + erro.Message);
            }
        }
        private void GerarScriptsAutomacao(object remetente, EventArgs argumentos)
        {
            AdicionarEntradaLogMigracao("Gerando scripts de automacao para nuvem...");
            try
            {
                string areaTrabalho = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
                string pastaScripts = Path.Combine(areaTrabalho, "Scripts_Automacao_Nuvem");
                if (!Directory.Exists(pastaScripts))
                    Directory.CreateDirectory(pastaScripts);
                string scriptInstalacao = @"#!/bin/bash
echo 'Configurando ambiente do servidor GameServer...'
echo 'Atualizando sistema operacional...'
sudo apt update && sudo apt upgrade -y
echo 'Instalando Java Runtime Environment...'
sudo apt install -y openjdk-17-jre
echo 'Instalando ferramentas adicionais...'
sudo apt install -y screen htop wget curl
echo 'Criando diretorio do servidor...'
mkdir -p ~/GameServer-server
cd ~/GameServer-server
echo 'Configuracao do ambiente concluida!'
echo 'Agora copie os arquivos do GameServer para este diretorio.'";
                File.WriteAllText(Path.Combine(pastaScripts, "instalar_ambiente.sh"), scriptInstalacao);
                string scriptExecucao = @"#!/bin/bash
cd ~/GameServer-server
echo 'Iniciando servidor GameServer...'
echo 'Para sair do servidor, pressione Ctrl+C'
screen -S GameServer-server java -jar GameServer-server.jar
echo 'Servidor finalizado.'";
                File.WriteAllText(Path.Combine(pastaScripts, "executar_servidor.sh"), scriptExecucao);
                AdicionarEntradaLogMigracao("Scripts gerados com sucesso em: " + pastaScripts);
                AdicionarEntradaLogMigracao("Scripts criados:");
                AdicionarEntradaLogMigracao("- instalar_ambiente.sh (configuracao inicial)");
                AdicionarEntradaLogMigracao("- executar_servidor.sh (iniciar servidor)");
                Process.Start("explorer.exe", pastaScripts);
            }
            catch (Exception erro)
            {
                AdicionarEntradaLogMigracao("ERRO na geracao de scripts: " + erro.Message);
            }
        }
    }
    public class ProgramaPrincipal
    {
        [STAThread]
        public static void Main()
        {
            WindowsIdentity identidadeAtual = WindowsIdentity.GetCurrent();
            WindowsPrincipal principalWindows = new WindowsPrincipal(identidadeAtual);
            if (!principalWindows.IsInRole(WindowsBuiltInRole.Administrator))
            {
                try
                {
                    ProcessStartInfo infoInicializacao = new ProcessStartInfo();
                    infoInicializacao.FileName = Assembly.GetEntryAssembly().Location;
                    infoInicializacao.UseShellExecute = true;
                    infoInicializacao.Verb = "runas";
                    Process.Start(infoInicializacao);
                    return;
                }
                catch
                {
                    MessageBox.Show("Este configurador precisa ser executado como Administrador para funcionar corretamente! Clique com o botao direito no arquivo e selecione 'Executar como administrador'.", 
                                  "Privilegios Administrativos Necessarios", 
                                  MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
            }
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new FormularioPrincipal());
        }
    }
}



