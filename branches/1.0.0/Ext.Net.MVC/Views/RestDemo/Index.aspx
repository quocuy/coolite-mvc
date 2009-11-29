<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>    
        <ext:ResourceManager runat="server">
            <RestAPI 
                Create="POST" 
                Destroy="DELETE" 
                Read="GET" 
                Update="POST" />
        </ext:ResourceManager>
        
        <h3>RESTful Store</h3>
       
        <ext:Store 
            ID="Store1" 
            runat="server" 
            AutoSave="true" 
            Restful="true"
            ShowWarningOnFailure="false"
            SkipIdForNewRecords="false"
            RefreshAfterSaving="None">
            
            <Proxy>
                <ext:HttpProxy>
                    <RestAPI 
                        Create="/RestDemo/Create" 
                        Destroy="/RestDemo/Destroy" 
                        Read="/RestDemo/Read" 
                        Update="/RestDemo/Update" />
                </ext:HttpProxy>
            </Proxy>
            
            <Reader>
                <ext:JsonReader IDProperty="CategoryID" Root="data" MessageProperty="message">
                    <Fields>
                        <ext:RecordField Name="CategoryID" />
                        <ext:RecordField Name="CategoryName" AllowBlank="false" />
                        <ext:RecordField Name="Description" />
                    </Fields>
                </ext:JsonReader>
            </Reader>
            
            <Listeners>
                <Exception Handler="
                    Ext.net.Notification.show({
                        iconCls    : 'icon-exclamation', 
                        html       : e && e.message ? e.message : response.message || response.statusText, 
                        title      : 'EXCEPTION', 
                        hideDelay  : 5000
                    });" />
                <Save Handler=" Ext.net.Notification.show({
                        iconCls    : 'icon-information', 
                        html       : arg.message, 
                        title      : 'Success', 
                        hideDelay  : 5000
                    });" />
            </Listeners>
        </ext:Store>
        
        <ext:GridPanel ID="CategoriesGrid" runat="server"
            Icon="Table"
            Frame="true"
            Title="Categories"
            Height="400"
            Width="500"
            StoreID="Store1"
            StyleSpec="margin-top: 10px">
            <ColumnModel>
                <Columns>
                    <ext:Column Header="ID" Width="40" DataIndex="CategoryID" />
                    
                    <ext:Column Header="Name" Width="100" DataIndex="CategoryName">
                        <Editor>
                            <ext:TextField runat="server" MaxLength="15" />    
                        </Editor>
                    </ext:Column>
                    
                    <ext:Column Header="Description" Width="100" DataIndex="Description">
                        <Editor>
                            <ext:TextField runat="server" />    
                        </Editor>
                    </ext:Column>
                </Columns>
            </ColumnModel>
            
            <SelectionModel>
                <ext:RowSelectionModel runat="server" />
            </SelectionModel>
            
            <View>
                <ext:GridView runat="server" ForceFit="true" />
            </View>
            
            <TopBar>
                <ext:Toolbar runat="server">
                    <Items>
                        <ext:Button runat="server" Text="Add" Icon="Add">
                            <Listeners>
                                <Click Handler="#{CategoriesGrid}.insertRecord();#{CategoriesGrid}.getRowEditor().startEditing(0);" />
                            </Listeners>
                        </ext:Button>
                        
                        <ext:Button runat="server" Text="Delete" Icon="Exclamation">
                            <Listeners>
                                <Click Handler="#{CategoriesGrid}.deleteSelected();" />
                            </Listeners>
                        </ext:Button>
                    </Items>
                </ext:Toolbar>
            </TopBar>
            
            <Plugins>
                <ext:RowEditor runat="server" SaveText="Update" />
            </Plugins>
        </ext:GridPanel>
</body>
</html>
