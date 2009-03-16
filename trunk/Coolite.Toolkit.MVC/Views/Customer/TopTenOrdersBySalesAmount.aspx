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
    
    <ext:Store ID="Store1" runat="server" ShowWarningOnFailure="true">
        <Proxy>
            <ext:HttpProxy Url="/Data/GetTopTenOrdersBySalesAmount/" />
        </Proxy>
        <Reader>
            <ext:JsonReader Root="data" ReaderID="OrderID">
                <Fields>
                    <ext:RecordField Name="OrderID" Type="Int"/>
                    <ext:RecordField Name="OrderDate" Type="Date" />
                    <ext:RecordField Name="SaleAmount" Type="Float"/>
                    <ext:RecordField Name="CompanyName" />
                    <ext:RecordField Name="ShippedDate" Type="Date" />
                </Fields>
            </ext:JsonReader>
        </Reader>
    </ext:Store>
    
    <ext:ViewPort runat="server">
        <Body>
            <ext:FitLayout runat="server">
                <ext:GridPanel 
                    runat="server" 
                    StoreID="Store1" 
                    Border="false"
                    TrackMouseOver="true">
                    <ColumnModel>
                        <Columns>
                            <ext:Column Header="Order ID" DataIndex="OrderID" Sortable="true"/>
                            <ext:Column Header="Sale Amount" DataIndex="SaleAmount" Sortable="true">
                                <Renderer Format="UsMoney" />
                            </ext:Column>
                            <ext:Column Header="Order Date" DataIndex="OrderDate" Sortable="true">
                                <Renderer Fn="Ext.util.Format.dateRenderer('Y-m-d')" />
                            </ext:Column>
                            <ext:Column Header="Company" DataIndex="CompanyName"/>
                            <ext:Column Header="Shipped Date" DataIndex="ShippedDate" Sortable="true">
                                <Renderer Fn="Ext.util.Format.dateRenderer('Y-m-d')" />
                            </ext:Column>
                        </Columns>
                    </ColumnModel>
                    <View>
                        <ext:GridView runat="server" AutoFill="true" />
                    </View>
                    <SelectionModel>
                        <ext:RowSelectionModel runat="server" />
                    </SelectionModel>
                </ext:GridPanel>
            </ext:FitLayout>
        </Body>
    </ext:ViewPort>
</body>
</html>
