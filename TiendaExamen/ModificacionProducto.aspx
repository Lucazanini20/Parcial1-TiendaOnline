<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificacionProducto.aspx.cs" Inherits="TiendaExamen.ModificacionProducto" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Modificar Producto</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" class="container">
        <h2>Modificación de Producto</h2>

        <div class="form-group">
            <label>ID del Producto:</label>
            <asp:TextBox ID="txtIdBuscar" runat="server" CssClass="form-control" />
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn" OnClick="btnBuscar_Click" />
        </div>

        <asp:Panel ID="pnlEdicion" runat="server" Visible="false">
            <div class="form-group">
                <label>Nombre:</label>
                <asp:TextBox ID="txtNombreMod" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <label>Precio:</label>
                <asp:TextBox ID="txtPrecioMod" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <label>Categoría:</label>
                <asp:DropDownList ID="ddlCategoriaMod" runat="server" CssClass="form-control"
                    DataSourceID="SqlDataCategoriasMod" DataTextField="descripcion" DataValueField="idCategoria" />
                <asp:SqlDataSource ID="SqlDataCategoriasMod" runat="server"
                    ConnectionString="<%$ ConnectionStrings:CadenaTienda %>"
                    SelectCommand="SELECT idCategoria, descripcion FROM categorias" />
            </div>

            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cambios" CssClass="btn" OnClick="btnGuardar_Click" />
        </asp:Panel>

        <asp:Label ID="lblMensaje" runat="server" CssClass="alert" />

        <div>
            <asp:HyperLink ID="lnkVolver" runat="server" NavigateUrl="~/Default.aspx" CssClass="back-link">← Volver al Menú Principal</asp:HyperLink>
        </div>
    </form>
</body>
</html>