using System;
using System.Configuration;
using System.Data.SqlClient;

namespace TiendaExamen
{
    public partial class AltaProducto : System.Web.UI.Page
    {
        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNombre.Text) || string.IsNullOrWhiteSpace(txtPrecio.Text))
            {
                lblMensaje.Text = "Complete todos los campos requeridos.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (!decimal.TryParse(txtPrecio.Text, out decimal precio))
            {
                lblMensaje.Text = "El precio ingresado no es válido.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["CadenaTienda"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "INSERT INTO productos (nombre, precio, categoria) VALUES (@nombre, @precio, @categoria)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@nombre", txtNombre.Text.Trim());
                    cmd.Parameters.AddWithValue("@precio", precio);
                    cmd.Parameters.AddWithValue("@categoria", ddlCategorias.SelectedValue);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblMensaje.Text = "Producto registrado con éxito.";
            lblMensaje.ForeColor = System.Drawing.Color.Green;
            txtNombre.Text = "";
            txtPrecio.Text = "";
        }
    }
}