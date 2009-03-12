<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Register Assembly="Coolite.Ext.Web" Namespace="Coolite.Ext.Web" TagPrefix="ext" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <ext:ScriptManager runat="server" />
    
    <ext:Store ID="Store1" runat="server" RemoteSort="true">
        <Proxy>
            <ext:HttpProxy Url="/Data/GetOrders/" />
        </Proxy>
        <Reader>
            <ext:JsonReader Root="data" TotalProperty="totalCount">
                <Fields>
                    <ext:RecordField Name="OrderID" />
                    <ext:RecordField Name="OrderDate" Type="Date" />
                </Fields>
            </ext:JsonReader>
        </Reader>
        <BaseParams>
            <ext:Parameter Name="limit" Value="15" Mode="Raw" />
            <ext:Parameter Name="start" Value="0" Mode="Raw" />
            <ext:Parameter Name="dir" Value="ASC" />
            <ext:Parameter Name="sort" Value="OrderID" />
        </BaseParams>
        <SortInfo Field="OrderID" Direction="ASC" />
    </ext:Store>
    
    <ext:ViewPort runat="server">
        <Body>
            <ext:FitLayout runat="server">
                <ext:GridPanel 
                    ID="GridPanel1" 
                    runat="server" 
                    Header="false"
                    Border="false"
                    StoreID="Store1" 
                    AutoExpandColumn="OrderID">
                    <ColumnModel ID="ColumnModel1" runat="server">
                        <Columns> 
                            <ext:Column ColumnID="OrderID" DataIndex="OrderID" Header="ID" />
                            <ext:Column ColumnID="OrderDate" DataIndex="OrderDate" Header="Order Date" />
                        </Columns>
                    </ColumnModel>
                    <SelectionModel>
                        <ext:RowSelectionModel ID="RowSelectionModel1" runat="server" SingleSelect="true" />
                    </SelectionModel>
                    <BottomBar>
                        <ext:PagingToolbar ID="PagingToolbar1" runat="server" StoreID="Store1" PageSize="15" />
                    </BottomBar>
                </ext:GridPanel>
            </ext:FitLayout>
        </Body>
    </ext:ViewPort>
</body>
</html>
