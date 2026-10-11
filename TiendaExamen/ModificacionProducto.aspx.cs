using System;
using System.Configuration;
using System.Data.SqlClient;

namespace TiendaExamen
{
    public partial class ModificacionProducto : System.Web.UI.Page
    {
        private string ConnStr => ConfigurationManager.ConnectionStrings["CadenaTienda"].ConnectionString;

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "";
            if (!int.TryParse(txtIdBuscar.Text, out int id))
            {
                lblMensaje.Text = "Ingrese un ID válido.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            using (SqlConnection con = new SqlConnection(ConnStr))
            {
                string query = "SELECT nombre, precio, categoria FROM productos WHERE idProducto = @id";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            pnlEdicion.Visible = true;
                            txtNombreMod.Text = dr["nombre"].ToString();
                            txtPrecioMod.Text = Convert.ToDecimal(dr["precio"]).ToString("0.00");

                            ddlCategoriaMod.DataBind();
                            ddlCategoriaMod.SelectedValue = dr["categoria"].ToString();

                            ViewState["OrigNombre"] = txtNombreMod.Text;
                            ViewState["OrigPrecio"] = txtPrecioMod.Text;
                            ViewState["OrigCategoria"] = ddlCategoriaMod.SelectedValue;
                        }
                        else
                        {
                            pnlEdicion.Visible = false;
                            lblMensaje.Text = "Producto no encontrado.";
                            lblMensaje.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string origNombre = ViewState["OrigNombre"]?.ToString();
            string origPrecio = ViewState["OrigPrecio"]?.ToString();
            string origCategoria = ViewState["OrigCategoria"]?.ToString();

            bool huboCambios = (txtNombreMod.Text.Trim() != origNombre) ||
                               (txtPrecioMod.Text.Trim() != origPrecio) ||
                               (ddlCategoriaMod.SelectedValue != origCategoria);

            if (!huboCambios)
            {
                lblMensaje.Text = "Debe modificar al menos un campo antes de guardar cambios.";
                lblMensaje.ForeColor = System.Drawing.Color.DarkOrange;
                return;
            }

            if (!decimal.TryParse(txtPrecioMod.Text, out decimal nuevoPrecio))
            {
                lblMensaje.Text = "El precio ingresado no es válido.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            using (SqlConnection con = new SqlConnection(ConnStr))
            {
                string query = "UPDATE productos SET nombre = @nombre, precio = @precio, categoria = @categoria WHERE idProducto = @id";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@nombre", txtNombreMod.Text.Trim());
                    cmd.Parameters.AddWithValue("@precio", nuevoPrecio);
                    cmd.Parameters.AddWithValue("@categoria", ddlCategoriaMod.SelectedValue);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(txtIdBuscar.Text));

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblMensaje.Text = "Producto actualizado correctamente.";
            lblMensaje.ForeColor = System.Drawing.Color.Green;
            pnlEdicion.Visible = false;
            txtIdBuscar.Text = "";
        }
    }
}