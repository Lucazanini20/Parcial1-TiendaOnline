<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TiendaExamen.Default" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Menú Principal - Tienda Online</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" class="container">
        <h2>Panel de Gestión - Tienda Online</h2>
        <div class="nav-menu">
            <asp:HyperLink ID="lnkAlta" runat="server" NavigateUrl="~/AltaProducto.aspx" CssClass="nav-link">Cargar Nuevo Producto</asp:HyperLink>
            <asp:HyperLink ID="lnkConsulta" runat="server" NavigateUrl="~/ConsultaProductos.aspx" CssClass="nav-link">Consultar Catálogo de Productos</asp:HyperLink>
            <asp:HyperLink ID="lnkModificacion" runat="server" NavigateUrl="~/ModificacionProducto.aspx" CssClass="nav-link">Modificar Producto</asp:HyperLink>
            <asp:HyperLink ID="lnkBaja" runat="server" NavigateUrl="~/BajaProducto.aspx" CssClass="nav-link">Eliminar Producto</asp:HyperLink>
        </div>
    </form>
</body>
</html>