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
            <ext:HttpProxy Url="/Data/GetCustomers/" />
        </Proxy>
        <Reader>
            <ext:JsonReader Root="data" TotalProperty="totalCount">
                <Fields>
                    <ext:RecordField Name="CustomerID" SortDir="ASC" />
                    <ext:RecordField Name="CompanyName" />
                    <ext:RecordField Name="Email" />
                    <ext:RecordField Name="Phone" />
                    <ext:RecordField Name="Fax" />
                    <ext:RecordField Name="Region" />
                </Fields>
            </ext:JsonReader>
        </Reader>
        <BaseParams>
            <ext:Parameter Name="limit" Value="15" Mode="Raw" />
            <ext:Parameter Name="start" Value="0" Mode="Raw" />
            <ext:Parameter Name="dir" Value="ASC" />
            <ext:Parameter Name="sort" Value="CustomerID" />
        </BaseParams>
        <SortInfo Field="CustomerID" Direction="ASC" />
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
                    AutoExpandColumn="CompanyName">
                    <ColumnModel ID="ColumnModel1" runat="server">
                        <Columns> 
                            <ext:Column ColumnID="CustomerID" DataIndex="CustomerID" Header="ID" />
                            <ext:Column ColumnID="CompanyName" DataIndex="CompanyName" Header="Name" />
                            <ext:Column ColumnID="Email" DataIndex="Email" Header="Email" />
                            <ext:Column ColumnID="Phone" DataIndex="Phone" Header="Phone" />
                            <ext:Column ColumnID="Fax" DataIndex="Fax" Header="Fax" />
                            <ext:Column ColumnID="Region" DataIndex="Region" Header="Region" />
                        </Columns>
                    </ColumnModel>
                    <SelectionModel>
                        <ext:RowSelectionModel ID="RowSelectionModel1" runat="server" SingleSelect="true" />
                    </SelectionModel>
                    <TopBar>
                        <ext:Toolbar ID="Toolbar1" runat="server">
                            <Items>
                                <ext:ToolbarTextItem ID="TextItem1" runat="server" Text="<%# DateTime.Now.ToString() %>" />
                                <ext:ToolbarFill ID="indexFiller1" runat="server" />
                                <ext:Button ID="Button1" runat="server" Text="Save" Icon="Disk">
                                    <AjaxEvents>
                                        <Click Url="/Helpers/GetTimestamp/">
                                            <EventMask ShowMask="false" />
                                        </Click>
                                    </AjaxEvents>
                                </ext:Button>
                            </Items>
                        </ext:Toolbar>
                    </TopBar>
                    <BottomBar>
                        <ext:PagingToolbar ID="PagingToolbar1" runat="server" StoreID="Store1" PageSize="15" />
                    </BottomBar>
                </ext:GridPanel>
            </ext:FitLayout>
        </Body>
    </ext:ViewPort>
</body>
</html>
