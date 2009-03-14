<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Register Assembly="Coolite.Ext.Web" Namespace="Coolite.Ext.Web" TagPrefix="ext" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        //this.Button1.Text = "My Test";
    }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <script type="text/javascript">
        var commandHandler = function (cmd, record) {
            switch (cmd) {
                case "customer-details":
                    CustomerDetailsWindow.autoLoad.params.id = record.id;
                    CustomerDetailsWindow.setTitle(record.data.CompanyName);
                    CustomerDetailsWindow.show();
                    break;
                case "delete":
                    dsCustomers.remove(record);
                    break;
            }
        }
    </script>
</head>
<body>
    <ext:ScriptManager runat="server" />

    <ext:Store ID="dsCustomers" runat="server" RemoteSort="true" UseIdConfirmation="true">
        <Proxy>
            <ext:HttpProxy Url="/Data/GetCustomers/" />
        </Proxy>
        <UpdateProxy>
            <ext:HttpWriteProxy Url="/Data/SaveCustomersWithConfirmation/" />
        </UpdateProxy>
        <Reader>
            <ext:JsonReader ReaderID="CustomerID" Root="data" TotalProperty="totalCount">
                <Fields>
                    <ext:RecordField Name="CustomerID" SortDir="ASC">
                        <Convert Handler="return value.trim();" />
                    </ext:RecordField>
                    <ext:RecordField Name="CompanyName" />
                    <ext:RecordField Name="ContactName" />
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
        
        <Listeners>
            <LoadException Handler="Ext.Msg.alert('Customers - Load failed', e.message || e )" />
            <CommitFailed Handler="Ext.Msg.alert('Customers - Commit failed', 'Reason: ' + msg)" />
            <SaveException Handler="Ext.Msg.alert('Customers - Save failed', e.message || e)" />
            <CommitDone Handler="Ext.Msg.alert('Customers - Commit', 'The data successfully saved');" />
        </Listeners>   
    </ext:Store>
    
    <ext:ViewPort runat="server">
        <Body>
            <ext:FitLayout runat="server">
                <ext:GridPanel 
                    ID="GridPanel1" 
                    runat="server" 
                    Header="false"
                    Border="false"
                    StoreID="dsCustomers"
                    TrackMouseOver="true"
                    AutoExpandColumn="CompanyName">
                    <ColumnModel ID="ColumnModel1" runat="server">
                        <Columns>
                            <ext:Column ColumnID="CustomerID" DataIndex="CustomerID" Header="ID">
                                <%--<Commands>
                                    <ext:ImageCommand CommandName="customer-details" Icon="ApplicationFormEdit" Tooltip="Show customer details" />
                                </Commands>--%>
                                <%--<PrepareCommand Handler="command.hidden = record.newRecord;" />--%>
                                <Editor>
                                    <ext:TextField runat="server" AllowBlank="false" />
                                </Editor>
                            </ext:Column>
                            
                            <ext:Column ColumnID="CompanyName" DataIndex="CompanyName" Header="Company Name">
                                <Editor>
                                    <ext:TextField runat="server" AllowBlank="false" />
                                </Editor>
                            </ext:Column>
                            
                            <ext:Column ColumnID="ContactName" DataIndex="ContactName" Header="Contact Name" Width="150">
                                <Editor>
                                    <ext:TextField runat="server" AllowBlank="false" />
                                </Editor>
                            </ext:Column>
                            
                            <ext:Column ColumnID="Email" DataIndex="Email" Header="Email">
                                <Editor>
                                    <ext:TextField runat="server" Vtype="email" />
                                </Editor>
                            </ext:Column>
                            <ext:Column ColumnID="Phone" DataIndex="Phone" Header="Phone">
                                <Editor>
                                    <ext:TextField runat="server" />
                                </Editor>
                            </ext:Column>
                            <ext:Column ColumnID="Fax" DataIndex="Fax" Header="Fax">
                                <Editor>
                                    <ext:TextField runat="server" />
                                </Editor>
                            </ext:Column>
                            <ext:Column ColumnID="Region" DataIndex="Region" Header="Region">
                                <Editor>
                                    <ext:TextField runat="server" />
                                </Editor>
                            </ext:Column>
                            <ext:ImageCommandColumn Width="30" Hideable="false">
                                <Commands>
                                    <ext:ImageCommand CommandName="delete" Icon="Cross" Tooltip="Delete" />
                                </Commands>
                                <PrepareCommand Handler="command.hidden = record.newRecord;" />
                            </ext:ImageCommandColumn>
                            <ext:CommandColumn Width="30" Hideable="false">
                                <Commands>
                                    <ext:GridCommand Icon="ApplicationFormEdit" CommandName="customer-details" QTipText="Edit" />
                                </Commands>
                            </ext:CommandColumn>
                        </Columns>
                    </ColumnModel>
                    <SelectionModel>
                        <ext:RowSelectionModel ID="RowSelectionModel1" runat="server" SingleSelect="true" />
                    </SelectionModel>
                    <TopBar>
                        <ext:Toolbar ID="Toolbar1" runat="server">
                            <Items>
                                <ext:Button ID="Button1" runat="server" Text="Save" Icon="Disk">
                                    <Listeners>
                                        <Click Handler="#{dsCustomers}.save();" />
                                    </Listeners>
                                </ext:Button>
                                <ext:Button ID="Button3" runat="server" Text="Add" Icon="Add">
                                    <Listeners>
                                        <Click Handler="#{GridPanel1}.insertRecord(0, {});#{GridPanel1}.getView().focusRow(0);#{GridPanel1}.startEditing(0, 0);" />
                                    </Listeners>
                                </ext:Button>
                                <ext:Button ID="Button2" runat="server" Text="Reject Changes" Icon="ArrowUndo">
                                    <Listeners>
                                        <Click Handler="#{dsCustomers}.rejectChanges();" />
                                    </Listeners>
                                </ext:Button>
                                <%--<ext:ToolbarSeparator />
                                <ext:ToolbarFill ID="indexFiller1" runat="server" />--%>
                            </Items>
                        </ext:Toolbar>
                    </TopBar>
                    <BottomBar>
                        <ext:PagingToolbar ID="PagingToolbar1" runat="server" StoreID="dsCustomers" PageSize="15" />
                    </BottomBar>
                    <Listeners>
                        <Command Fn="commandHandler" />
                    </Listeners>
                </ext:GridPanel>
            </ext:FitLayout>
        </Body>
    </ext:ViewPort>
    
    <ext:Window 
        ID="CustomerDetailsWindow" 
        runat="server" 
        Icon="ApplicationFormEdit" 
        Width="800" 
        Height="600" 
        ShowOnLoad="false" 
        Modal="true"
        Constrain="true">
        <AutoLoad 
            Url="/Customer/CustomerDetails/" 
            Mode="IFrame" 
            TriggerEvent="show" 
            ReloadOnEvent="true" 
            ShowMask="true" 
            MaskMsg="Loading customer...">
            <Params>
                <ext:Parameter Name="id" Value="" Mode="Value" />
            </Params>
        </AutoLoad>
        <Buttons>
            <ext:Button runat="server" ID="btnDetailsCancel" Text="Cancel" Icon="Decline">
                <Listeners>
                    <Click Handler="#{CustomerDetailsWindow}.hide();" />
                </Listeners>
            </ext:Button>
        </Buttons>
        <Listeners>
            <Hide Handler="if(this.iframe.dom.contentWindow.customerChanged) { dsCustomers.reload(); };" />
        </Listeners>
    </ext:Window>
</body>
</html>
