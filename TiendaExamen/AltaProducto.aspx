<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaProducto.aspx.cs" Inherits="TiendaExamen.AltaProducto" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Alta de Producto</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" class="container">
        <h2>Alta de Producto</h2>

        <div class="form-group">
            <label>Nombre del Producto:</label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label>Precio:</label>
            <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label>Categoría:</label>
            <asp:DropDownList ID="ddlCategorias" runat="server" CssClass="form-control"
                DataSourceID="SqlDataCategorias" DataTextField="descripcion" DataValueField="idCategoria" />
            <asp:SqlDataSource ID="SqlDataCategorias" runat="server"
                ConnectionString="<%$ ConnectionStrings:CadenaTienda %>"
                SelectCommand="SELECT idCategoria, descripcion FROM categorias" />
        </div>

        <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" CssClass="btn" OnClick="btnConfirmar_Click" />
        <asp:Label ID="lblMensaje" runat="server" CssClass="alert" />

        <div>
            <asp:HyperLink ID="lnkVolver" runat="server" NavigateUrl="~/Default.aspx" CssClass="back-link">← Volver al Menú Principal</asp:HyperLink>
        </div>
    </form>
</body>
</html>