<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastroPage.aspx.cs" Inherits="toutLeTrip01.cadastroPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

    <!-- Bootstrap Core CSS -->
    <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />

    <!-- FONTAWESOME STYLE CSS -->
    <link href="Content/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <!-- CUSTOM STYLE CSS -->
    <link href="Content/styles.css" rel="stylesheet" type="text/css" />
    <link href="Content/register.css" rel="stylesheet" type="text/css" />

    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type="text/css" />

    <title>Cadastrar | Tout Le Trip</title>

</head>
<body>
    <form id="form1" runat="server">

            <!-- INICO FORMULÁRIO DO CADASTRO -->
            <div class="row center-blockP">

                <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2><strong>Crie sua conta no Tout Le Trip</strong></h2>
                        </div>
                        <br />
                        <div>
                            <asp:ValidationSummary ID="ValidationSummary1" ShowSummary="true" CssClass="alert alert-danger " runat="server"
                                ValidationGroup="cadastro" HeaderText="Ocorreram erros durante o registro:" Width="449px" />
                        </div>
                        <div class="panel-body">
                            <!-- NOME -->
                            <div class="form-group input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
                                <asp:TextBox ID="txtNomeUsuario" CssClass="form-control" placeholder="Nome" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" Display="None" ErrorMessage="Preencha o nome do usuário." ControlToValidate="txtNomeUsuario" ValidationGroup="cadastro"></asp:RequiredFieldValidator>
                            </div>


                            <!-- TELEFONE -->
                            <div class="form-group input-group">
                                <span class="input-group-addon"><i class="fa fa-fw fa-phone"></i></span>
                                <asp:TextBox ID="txtTelefoneUsuario" CssClass="form-control" placeholder="Telefone: DDI+DDD+Telefone" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" Display="None" ErrorMessage="Preencha o telefone do Usuário." ControlToValidate="txtTelefoneUsuario" ValidationGroup="cadastro"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" Display="None" ErrorMessage="Preencher DDI+DDD+Telefone" ControlToValidate="txtTelefoneUsuario" ValidationExpression="^\d{12,20}$" ValidationGroup="cadastro"></asp:RegularExpressionValidator>
                            </div>


                            <!-- CELULAR -->
                            <div class="form-group input-group">
                                <span class="input-group-addon"><i class="fa fa-fw fa-phone"></i></span>
                                <asp:TextBox ID="txtCelularUsuario" CssClass="form-control" placeholder="Celular: DDI+DDD+Celular" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" Display="None" ErrorMessage="Preencha o celular do Usuário." ControlToValidate="txtCelularUsuario" ValidationGroup="cadastro"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" Display="None" ErrorMessage="Preencher DDI+DDD+Celular" ControlToValidate="txtCelularUsuario" ValidationExpression="^\d{12,20}$" ValidationGroup="cadastro"></asp:RegularExpressionValidator>
                            </div>


                            <!-- DATA -->
                            <div class="form-group input-group">
                                <span class="input-group-addon"><i class="fa fa-calendar-o fa-fw"></i></span>
                                <asp:TextBox ID="txtDataNascimento" CssClass="form-control" placeholder="Formato dd/mm/yyyy" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" Display="None" ErrorMessage="Preencha a Data de Nascimento." ControlToValidate="txtDataNascimento" ValidationGroup="cadastro"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" Display="None" ErrorMessage="Formato dd/mm/yyyy" ControlToValidate="txtDataNascimento" ValidationExpression="^\d{2}/\d{2}/\d{4}$" ValidationGroup="cadastro"></asp:RegularExpressionValidator>
                            </div>


                            <!-- EMAIL -->
                            <div class="form-group input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope-o fa-fw"></i></span>
                                <asp:TextBox ID="txtEmailUsuario" CssClass="form-control" placeholder="E-mail" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" Display="None" ErrorMessage="Preencha o e-mail do Usuário." ControlToValidate="txtEmailUsuario" ValidationGroup="cadastro"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" Display="None" ErrorMessage="Email inválido" ControlToValidate="txtEmailUsuario" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" ValidationGroup="cadastro"></asp:RegularExpressionValidator>
                            </div>


                            <!-- SENHA -->
                            <div class="form-group input-group">
                                <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
                                <asp:TextBox ID="txtSenhaUsuario" CssClass="form-control" placeholder="Senha" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" Display="None" ErrorMessage="Preencha a senha." ControlToValidate="txtSenhaUsuario" ValidationGroup="cadastro"></asp:RequiredFieldValidator>
                                <asp:CompareValidator runat="server" Display="None" ControlToCompare="txtConfSenha" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,8}$" ErrorMessage="A senha deve ter de 8 caracteres sendo pelo menos uma letra maiúscula, pelo menos uma letra maiúscula e pelo menos 1 número." ControlToValidate="txtSenhaUsuario" ValidationGroup="cadastro"></asp:CompareValidator>
                            </div>


                            <!-- VALIDAR SENHA -->
                            <div class="form-group input-group">
                                <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
                                <asp:TextBox ID="txtConfSenha" CssClass="form-control" placeholder="Confirmar Senha" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" Display="None" ControlToValidate="txtConfSenha"></asp:RequiredFieldValidator>
                                <asp:CompareValidator runat="server" Display="None" ControlToCompare="txtSenhaUsuario" ErrorMessage="A confirmação da senha não corresponde." ControlToValidate="txtConfSenha" ValidationGroup="cadastro"></asp:CompareValidator>
                            </div>

                            <!-- CHECKS TERMOS -->
                            <div class="text-center checkbox">
                                <label>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />I agree with the <a href="#">Terms and Conditions</a>.
                                </label>
                            </div>


                            <!-- BUTTON CADASTRAR -->
                            <div class="col-sm-6 col-sm-offset-3">
                                <asp:Button CssClass="form-control btn btn-register" ID="btnCadastrar" runat="server" Text="Cadastrar" ValidationGroup="cadastro" OnClick="btnCadastrar_Click" />
                            </div>


                            <!-- LABEL ERRO -->
                            <div class="col-sm-6 col-sm-offset-3 has-error text-center">
                                <br />
                                <asp:Label ID="lblInfo" runat="server" Visible="false" CssClass="form-control alert-warning" Text=""></asp:Label>
                            </div>


                            <!-- LINK JÁ CADASTRADO -->
                            <div class="col-sm-6 col-sm-offset-3">
                                <hr class="message-inner-separator" />
                                Já é cadastrado?  <a href="index.aspx">Logue aqui</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->

            <!-- CORE JQUERY  -->
            <script src="Scripts/jquery.js"></script>

            <!-- BOOTSTRAP SCRIPTS  -->
            <script src="Scripts/bootstrap.js"></script>
    </form>
</body>
</html>
