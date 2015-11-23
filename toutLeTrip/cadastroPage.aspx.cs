using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.IO;

namespace toutLeTrip01
{
    public partial class cadastroPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public void EnviaEmail(string destinatario,string nome)
        {

            MailMessage msg = new MailMessage();
            msg.From = new MailAddress(destinatario); // Destinatario;

            msg.To.Add(destinatario); // Destinatario;
            msg.To.Add("gabrielbernardone@gmail.com"); // Cópia para;

            msg.Subject = "Confirmação de Cadastro"; // Assunto

            using (StreamReader objReader = new StreamReader("Boas_Vindas.html"))
            {
                // Lê todo o arquivo e o joga em uma variável


                msg.Body = objReader.ReadToEnd();

                msg.Body = msg.Body.Replace("#NOME", nome);
                msg.Body = msg.Body.Replace("#EMAIL", destinatario);


            }

            msg.IsBodyHtml = true;
            msg.Priority = MailPriority.High;
            msg.BodyEncoding = System.Text.Encoding.GetEncoding("utf-8");
            msg.SubjectEncoding = System.Text.Encoding.GetEncoding("utf-8");


            var smtp = new SmtpClient("smtp.gmail.com", 587);
            using (smtp)
            {
                smtp.EnableSsl = true; //Gmail requer SSL
                smtp.Port = 587; //Porta SSL
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network; //modo de envio
                smtp.UseDefaultCredentials = false; //Utiliza credencial especifica

                //Usuário e Senha para autenticação
                smtp.Credentials = new NetworkCredential("gabrielbernardone@gmail.com", "56485277a");
                smtp.Send(msg);

            }
            
        }


        protected void btnCadastrar_Click(object sender, EventArgs e)
        {

            // VALIDAÇÃO DOS CAMPOS DO CADASTRO

            // NOME
            String nome = txtNomeUsuario.Text.Trim();
            if (txtNomeUsuario.Text.Length == 0)
            {
                return;
            }
            // TELEFONE
            String telefone = txtTelefoneUsuario.Text.Trim();
            if (txtTelefoneUsuario.Text.Length == 0)
            {
                return;
            }
            // CELULAR
            String celular = txtCelularUsuario.Text.Trim();
            if (txtCelularUsuario.Text.Length == 0)
            {
                return;
            }
            //DATA
            DateTime data;
            if (DateTime.TryParse(txtDataNascimento.Text, out data) == false)
            {
                return;
            }
            // EMAIL
            String email = txtEmailUsuario.Text.Trim();
            int arroba, arroba2, ponto;
            arroba = email.IndexOf('@');
            arroba2 = email.LastIndexOf('@');
            ponto = email.LastIndexOf('.');
            if (arroba <= 0 || ponto <= (arroba + 1) || ponto == (email.Length - 1) || arroba2 != arroba)
            {
                //E-mail era inválido!
                lblInfo.Text = "Email inválido!!";
                return;
            }
            // SENHA
            String password = txtSenhaUsuario.Text.Trim();
            if (password.Length == 0)
            {
                return;
            }




            // VERIFICAR SE USUÁRIO JÁ É CADASTRADO SE EXISTE RETORNA 'false'
            if (verificaRegistro(email) != true)
            {
                lblInfo.Visible = true;
                lblInfo.Text = "Email já cadastrado!";
                return;
            }




            // INSERINDO DADOS NO BANCO 
            lblInfo.Visible = false;

            SqlConnection conn = new SqlConnection("Server=tcp:hc8676slcz.database.windows.net,1433;Database=toutLeTrip01;User ID=toutLeTrip@hc8676slcz;Password=tout2015ADS3;Trusted_Connection=False;Encrypt=True;Connection Timeout=30;");
            conn.Open();
            SqlCommand cmd;
            //cmd = new SqlCommand("INSERT INTO tbUsuario(nomeUsuario, telefone, celular, dataNascimento, emailUsuario, pw) VALUES (@nomeUsuario, @telefone, @celular, @dataNascimento, @emailUsuario, @pw)", conn);

            //cmd.Parameters.AddWithValue("@nomeUsuario", nome);
            //cmd.Parameters.AddWithValue("@telefone", telefone);
            //cmd.Parameters.AddWithValue("@celular", celular);
            //cmd.Parameters.AddWithValue("@dataNascimento", data);
            //cmd.Parameters.AddWithValue("@emailUsuario", email);
            //cmd.Parameters.AddWithValue("@pw", password);
            //cmd.ExecuteNonQuery();


            cmd = new SqlCommand("IF NOT EXISTS(SELECT emailUsuario FROM tbUsuario WHERE emailUsuario = @emailUsuario) BEGIN INSERT INTO tbUsuario(nomeUsuario, telefone, celular, dataNascimento, emailUsuario, pw) OUTPUT INSERTED.idUsuario VALUES (@nomeUsuario, @telefone, @celular, @dataNascimento, @emailUsuario, @pw) END", conn);

            cmd.Parameters.AddWithValue("@nomeUsuario", nome);
            cmd.Parameters.AddWithValue("@telefone", telefone);
            cmd.Parameters.AddWithValue("@celular", celular);
            cmd.Parameters.AddWithValue("@dataNascimento", data);
            cmd.Parameters.AddWithValue("@emailUsuario", email);
            cmd.Parameters.AddWithValue("@pw", password);

            int idUser = int.Parse(cmd.ExecuteScalar().ToString());

            cmd.Dispose();
            conn.Close();
            conn.Dispose();


            cadastrarTipoUsuario(idUser);
            EnviaEmail(email,nome);


            string valorA = email;
            Response.Redirect("Index.aspx?valorA=" + Uri.EscapeDataString(valorA));

        }




        public Boolean verificaRegistro(string emailUsuario)
        {

            // ESTANCIANDO ELEMENTOS DO BANCO
            SqlConnection conn = new SqlConnection("Server=tcp:hc8676slcz.database.windows.net,1433;Database=toutLeTrip01;User ID=toutLeTrip@hc8676slcz;Password=tout2015ADS3;Trusted_Connection=False;Encrypt=True;Connection Timeout=30;");
            conn.Open();
            SqlCommand cmd;
            SqlDataReader reader;

            // INICIALIZANDO VARIÁVEIS
            string verificarMail = "";


            // VERIFICAR SE USUÁRIO JÁ É CADASTRADO
            cmd = new SqlCommand("SELECT emailUsuario FROM tbUsuario WHERE emailUsuario = @email", conn);
            cmd.Parameters.AddWithValue("@email", emailUsuario);
            reader = cmd.ExecuteReader();

            //Obtém os registros, um por vez
            while (reader.Read())
            {
                verificarMail = reader.GetString(0);
            }
            reader.Close();
            reader.Dispose();
            cmd.Dispose();

            conn.Close();
            conn.Dispose();


            // VERIFICA O RETORNO DOS VALORES DO BANCO
            if (emailUsuario != verificarMail)
            {
                return true;
            }
            else
            {
                return false;
            }
        }



        public void cadastrarTipoUsuario(int idUsuario)
        {
            SqlConnection conn = new SqlConnection("Server=tcp:hc8676slcz.database.windows.net,1433;Database=toutLeTrip01;User ID=toutLeTrip@hc8676slcz;Password=tout2015ADS3;Trusted_Connection=False;Encrypt=True;Connection Timeout=30;");
            conn.Open();
            SqlCommand cmd;

            // CADASTRAR TIPO DE USUÁRIO
            cmd = new SqlCommand(" INSERT INTO tbUsuarioTipoUsuario (idUsuario, idTipoUsuario) VALUES (@idUsuario, @idTipoUsuario)", conn);
            cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
            cmd.Parameters.AddWithValue("@idTipoUsuario", 3);
            cmd.ExecuteNonQuery();

            cmd.Dispose();
            conn.Close();
            conn.Dispose();

        }
    }
}