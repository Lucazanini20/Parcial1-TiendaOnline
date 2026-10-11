using System;
using System.Configuration;
using System.Data.SqlClient;

namespace TiendaExamen
{
    public partial class BajaProducto : System.Web.UI.Page
    {
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtIdEliminar.Text, out int id))
            {
                lblMensaje.Text = "Ingrese un ID válido.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["CadenaTienda"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "DELETE FROM productos WHERE idProducto = @id";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    con.Open();
                    int filasAfectadas = cmd.ExecuteNonQuery();

                    if (filasAfectadas > 0)
                    {
                        lblMensaje.Text = "Producto eliminado correctamente.";
                        lblMensaje.ForeColor = System.Drawing.Color.Green;
                        txtIdEliminar.Text = "";
                    }
                    else
                    {
                        lblMensaje.Text = "No se encontró ningún producto con el ID especificado.";
                        lblMensaje.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}