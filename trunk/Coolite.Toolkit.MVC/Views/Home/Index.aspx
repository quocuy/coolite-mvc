<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Register Assembly="Coolite.Ext.Web" Namespace="Coolite.Ext.Web" TagPrefix="ext" %>

<asp:Content ID="indexHead" ContentPlaceHolderID="head" runat="server">
    <title>Home Page</title>
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<h2><%= Html.Encode(ViewData["Message"]) %></h2>--%>
    <ext:Store ID="Store1" runat="server" RemoteSort="true">
        <Proxy>
            <ext:HttpProxy Url="/Data/GetCustomers/" />
        </Proxy>
        <Reader>
            <ext:JsonReader Root="data" TotalProperty="totalCount">
                <Fields>
                    <ext:RecordField Name="CustomerID" />
                    <ext:RecordField Name="CompanyName" SortDir="ASC" />
                </Fields>
            </ext:JsonReader>
        </Reader>
        <BaseParams>
            <ext:Parameter Name="limit" Value="15" Mode="Raw" />
            <ext:Parameter Name="start" Value="0" Mode="Raw" />
            <ext:Parameter Name="dir" Value="ASC" />
            <ext:Parameter Name="sort" Value="CustomerName" />
        </BaseParams>
        <SortInfo Field="CompanyName" Direction="ASC" />
    </ext:Store>
    
    <ext:FitLayout ID="indexFitLayout1" runat="server">
        <ext:GridPanel 
            ID="GridPanel1" 
            runat="server" 
            Header="false"
            Border="false"
            StoreID="Store1" 
            AutoExpandColumn="CompanyName">
            <ColumnModel runat="server">
                <Columns> 
                    <ext:Column ColumnID="CustomerID" DataIndex="CustomerID" Header="ID" />
                    <ext:Column ColumnID="CompanyName" DataIndex="CompanyName" Header="Name" />
                </Columns>
            </ColumnModel>
            <SelectionModel>
                <ext:RowSelectionModel runat="server" SingleSelect="true" />
            </SelectionModel>
            <TopBar>
                <ext:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <ext:ToolbarTextItem ID="TextItem1" runat="server" Text="<%# DateTime.Now.ToString() %>" />
                        <ext:ToolbarFill ID="indexFiller1" runat="server" />
                        <ext:Button ID="Button1" runat="server" Text="Save" Icon="Disk">
                            <AjaxEvents>
                                <Click Url="/Home/GetTimestamp/">
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
            <LoadMask ShowMask="true"  />
        </ext:GridPanel>
    </ext:FitLayout>
</asp:Content>
