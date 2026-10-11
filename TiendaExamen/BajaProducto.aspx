<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BajaProducto.aspx.cs" Inherits="TiendaExamen.BajaProducto" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Eliminar Producto</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" class="container">
        <h2>Baja de Producto</h2>

        <div class="form-group">
            <label>ID del Producto a eliminar:</label>
            <asp:TextBox ID="txtIdEliminar" runat="server" CssClass="form-control" />
        </div>

        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar Producto" 
            CssClass="btn btn-danger" 
            OnClientClick="return confirm('¿Está seguro de que desea eliminar este producto?');" 
            OnClick="btnEliminar_Click" />

        <asp:Label ID="lblMensaje" runat="server" CssClass="alert" />

        <div>
            <asp:HyperLink ID="lnkVolver" runat="server" NavigateUrl="~/Default.aspx" CssClass="back-link">← Volver al Menú Principal</asp:HyperLink>
        </div>
    </form>
</body>
</html>