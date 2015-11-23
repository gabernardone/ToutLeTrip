<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="toutLeTrip01.index" %>





<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>




<asp:Content ID="contentConteudo" ContentPlaceHolderID="conteudo" runat="server">

    <!-- CONTEÚDO DO SITE -->
    <header>
        <div class="grid"></div>
        <div class="header-content">
            <div class="header-content-inner">
                <h1 class="text-shadow">Sua melhor companhia de viagem
                </h1>
                <p class="text-shadow"></p>
                <a href="#about" class="btn btn-primary btn-xl page-scroll">Saiba +</a>
            </div>
        </div>
    </header>

    <section class="bg-primary" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading"><i class="fa fa-fw fa-suitcase"></i>Para você que curte viajar</h2>
                    <hr class="light" />
                    <p class="text-faded">Tenha seus roteiros de viajem sempre à mão. Evite carregar documentos e peso extra nas suas viagens, tendo todos os compromissos de férias na tela do seu smartphone.</p>
                </div>
            </div>
        </div>
    </section>

    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Nossos Serviços</h2>
                    <hr class="primary" />
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-trophy wow bounceIn text-primary"></i>
                        <h3>Pontos</h3>
                        <p class="text-muted">Ganhe pontos cumprindo seus objetivos e conhecendo novos lugares</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-bell-o wow bounceIn text-primary" data-wow-delay=".1s"></i>
                        <h3>Notificações</h3>
                        <p class="text-muted">Receba notificações de seu roteiro. Não deixamos você se esquecer de nada</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-info fa-4x wow bounceIn text-primary" data-wow-delay=".2s"></i>
                        <h3>Atualizado</h3>
                        <p class="text-muted">Horários, tempo, imprevistos.Fique por dentro do que ocorre nos lugares de seu roteiro</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-map-o wow bounceIn text-primary" data-wow-delay=".3s"></i>
                        <h3>Sem perder tempo</h3>
                        <p class="text-muted">Não perca tempo procurando informações sobre o locais de seu roteiro. Nós organizamos tudo</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="no-padding" id="portfolio">
        <div class="container-fluid">
            <div class="row no-gutter">
                <div class="col-lg-4 col-sm-6">
                    <img src="img/portfolio/1.jpg" class="img-responsive" alt="" />
                </div>
                <div class="col-lg-4 col-sm-6">
                    <img src="img/portfolio/2.jpg" class="img-responsive" alt="" />
                </div>
                <div class="col-lg-4 col-sm-6">
                    <img src="img/portfolio/3.jpg" class="img-responsive" alt="" />

                </div>
            </div>
        </div>
    </section>

    <aside class="bg-dark">
        <div class="container text-center">
            <div class="call-to-action">
                <h2>Baixe nosso Aplicativo</h2>
                <a href="#" class="btn btn-default btn-xl wow tada"><i class="fa fa-2x fa-play icon"></i><span class="nav-text">Download - Google Play</span></a>
                <a href="#" class="btn btn-default btn-xl wow tada"><i class="fa fa-2x fa-apple icon"></i><span class="nav-text">Download - Apple Store</span></a>
            </div>
        </div>
    </aside>

    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">Você faz parte de alguma agência de viagem?</h2>
                    <hr class="primary" />

                    <p>Cadastre sua empresa e ofereça mais um serviço aos seus clientes, mantendo os roteiros na nuvem e eles acessarão pelo celular. Ligue para nós ou envie uma mensagem, respondemos o mais rápido possível!</p>
                </div>
                <div class="col-lg-4 col-lg-offset-2 text-center">
                    <i class="fa fa-phone fa-3x wow bounceIn"></i>
                    <p>123-456-6789</p>
                </div>
                <div class="col-lg-4 text-center">
                    <i class="fa fa-envelope-o fa-3x wow bounceIn" data-wow-delay=".1s"></i>
                    <p><a href="mailto:your-email@your-domain.com">toutletrip@contato.com.br</a></p>
                </div>
            </div>
        </div>
    </section>
    <!-- FIM DO CONTEÚDO -->

</asp:Content>





<asp:Content ID="contentFooter" ContentPlaceHolderID="footer" runat="server">

    <!-- INICIO DO FOOTER-->
        <hr class="footer"/>
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="list-inline">
                            <li>
                                <a href="#">Home</a>
                            </li>
                            <li class="footer-menu-divider">&sdot;</li>

                            <li class="footer-menu-divider">&sdot;</li>

                            <li>
                                <a href="#cadastresuaagencia">Cadastre sua agência</a>
                            </li>
                            <li class="footer-menu-divider">&sdot;</li>

                            <li>
                                <a href="#about">About</a>
                            </li>
                            <li class="footer-menu-divider">&sdot;</li>

                            <li>
                                <a href="#services">Serviços</a>
                            </li>
                            <li class="footer-menu-divider">&sdot;</li>

                            <li>
                                <a href="#contact">Contato</a>
                            </li>
                        </ul>
                        <p class="copyright text-muted small">Copyright &copy; Tout Le Trip <%: DateTime.Now.Year %>. All Rights Reserved</p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- FIM DO FOOTER -->

</asp:Content>
