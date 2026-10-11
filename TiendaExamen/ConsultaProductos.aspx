<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaProductos.aspx.cs" Inherits="TiendaExamen.ConsultaProductos" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Consulta de Productos</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" class="container">
        <h2>Catálogo de Productos</h2>

        <asp:SqlDataSource ID="SqlDataProductos" runat="server"
            ConnectionString="<%$ ConnectionStrings:CadenaTienda %>"
            SelectCommand="SELECT p.idProducto, p.nombre, p.precio, c.descripcion AS Categoria 
                           FROM productos p 
                           INNER JOIN categorias c ON p.categoria = c.idCategoria">
        </asp:SqlDataSource>

        <asp:GridView ID="gvProductos" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataProductos" CssClass="table-custom" GridLines="None">
            <Columns>
                <asp:BoundField DataField="idProducto" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="nombre" HeaderText="Producto" />
                <asp:BoundField DataField="precio" HeaderText="Precio" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Categoria" HeaderText="Categoría" />
            </Columns>
        </asp:GridView>

        <div>
            <asp:HyperLink ID="lnkVolver" runat="server" NavigateUrl="~/Default.aspx" CssClass="back-link">← Volver al Menú Principal</asp:HyperLink>
        </div>
    </form>
</body>
</html>