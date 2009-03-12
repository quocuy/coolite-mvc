<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Register Assembly="Coolite.Ext.Web" Namespace="Coolite.Ext.Web" TagPrefix="ext" %>
<%@ Register src="CustomerDetailsGeneral.ascx" tagname="CustomerDetailsGeneral" tagprefix="uc1" %>
<%@ Register src="CustomerDetailsOrders.ascx" tagname="CustomerDetailsOrders" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    
    <script type="text/javascript">
        var failureHandler = function(form, action) {

            var msg = '';

            if (action.failureType == "client" || (action.result && action.result.errors && action.result.errors.length > 0)) {
                msg = "Please check fields.";
            } else if (action.result && action.result.extraParams.msg) {
                msg = action.result.extraParams.msg;
            } else if (action.response) {
                msg = action.response.responseText;
            }

            Ext.MessageBox.show({
                title: 'Failure',
                msg: msg,
                buttons: Ext.MessageBox.OK,
                icon: Ext.MessageBox.ERROR
            });
        }

        var successHandler = function(form, action) {
            Ext.MessageBox.alert('Success', 'Customer has been saved!');
            if (action.result && action.result.extraParams && action.result.extraParams.newID) {
                dsCustomer.getAt(0).id = action.result.extraParams.newID;
                if (dsCustomer.getAt(0).newRecord) {
                    delete dsCustomer.getAt(0).newRecord;
                }
            }

            if (action.options.params.setNew) {
                debugger;
                DetailsForm.form.reset();
                dsCustomer.removeAll();
                var rec = new dsCustomer.recordType();
                rec.newRecord = true;
                rec.commit();
                dsCustomer.add(rec);
            }
        }
    </script>

</head>
<body>
    <ext:ScriptManager ID="ScriptManager1" runat="server" />
    
    <ext:Store ID="dsCustomer" runat="server" ShowWarningOnFailure="true">
        <Proxy>
            <ext:HttpWriteProxy Url="/Data/GetCustomer/" SaveUrl="/Data/SaveCustomer/"/>
        </Proxy>
        <Reader>
            <ext:JsonReader ReaderID="CustomerID" Root="data" TotalProperty="totalCount">
                <Fields>
                    <ext:RecordField Name="CompanyName" />
                    <ext:RecordField Name="ContactName" />
                    <ext:RecordField Name="ContactTitle" />
                    <ext:RecordField Name="Phone" />
                    <ext:RecordField Name="Mobile" />
                    <ext:RecordField Name="Fax" />
                    <ext:RecordField Name="Address" />
                    <ext:RecordField Name="City" />
                    <ext:RecordField Name="Region" />
                    <ext:RecordField Name="PostalCode" />
                    <ext:RecordField Name="Country" />
                    <ext:RecordField Name="Email" />
                    <ext:RecordField Name="WebPage" />
                    <ext:RecordField Name="Notes" />
                </Fields>
            </ext:JsonReader>
        </Reader>
        <BaseParams>
            <ext:Parameter Name="start" Value="0" Mode="Raw" />
            <ext:Parameter Name="filter" Value="#{txtFilter}.getValue()" Mode="Raw" />
        </BaseParams>
        <Listeners>
            <Load Handler="records.length > 0 ? #{DetailsForm}.form.loadRecord(records[0]) : #{DetailsForm}.form.reset();" />
        </Listeners>
    </ext:Store>
    
    <ext:Store ID="dsCustomers" runat="server" ShowWarningOnFailure="true" AutoLoad="false">
        <Proxy>
            <ext:HttpProxy Url="/Data/GetCustomersSimple/" />
        </Proxy>
        <Reader>
            <ext:JsonReader ReaderID="CustomerID" Root="data" TotalProperty="totalCount">
                <Fields>
                    <ext:RecordField Name="CustomerID" />
                    <ext:RecordField Name="CompanyName" />
                </Fields>
            </ext:JsonReader>
        </Reader>
        <BaseParams>
            <ext:Parameter Name="filter" Value="#{txtCustomers}.getText()" Mode="Raw" />
        </BaseParams>
    </ext:Store>
    
    <ext:ViewPort ID="ViewPort1" runat="server">
        <Body>
            <ext:FitLayout ID="FitLayout1" runat="server">
                <ext:Panel ID="ToolbarsPanel" runat="server" Border="false">
                     <TopBar>
                        <ext:Toolbar ID="TopBar" runat="server">
                            <Items>
                                <ext:ToolbarButton runat="server" Text="Save" Icon="Disk">
                                    <Listeners>
                                        <Click Handler="#{DetailsForm}.form.submit({waitMsg:'Saving...', params:{id: (#{dsCustomer}.getCount()>0 && !#{dsCustomer}.getAt(0).newRecord) ? #{dsCustomer}.getAt(0).id : ''}, success: successHandler, failure: failureHandler});" />
                                    </Listeners>
                                </ext:ToolbarButton>
                                
                                <ext:ToolbarButton runat="server" Text="Save and New" Icon="Add">
                                     <Listeners>
                                        <Click Handler="#{DetailsForm}.form.submit({waitMsg:'Saving...', params:{setNew: true, id: (#{dsCustomer}.getCount()>0 && !#{dsCustomer}.getAt(0).newRecord) ? #{dsCustomer}.getAt(0).id : ''}, success: successHandler, failure: failureHandler});" />
                                    </Listeners>
                                </ext:ToolbarButton>
                                
                                <ext:ToolbarButton ID="ToolbarButton1" runat="server" Text="Delete" Icon="Cross">
                                     <AjaxEvents>
                                        <Click 
                                            Url="/Data/DeleteCustomer" 
                                            CleanRequest="true"
                                            Method="POST"
                                            Failure="Ext.Msg.show({title:'Delete Error',msg: result.errorMessage,buttons: Ext.Msg.OK,icon: Ext.MessageBox.ERROR});" 
                                            Success="#{CustomerPager}.doLoad(Math.max(0, #{CustomerPager}.cursor-1));">
                                            <Confirmation ConfirmRequest="true" Title="Confirm" Message="Are you sure?" />
                                            <ExtraParams>
                                                <ext:Parameter Name="id" Value="#{dsCustomer}.getAt(0).id" Mode="Raw" />
                                            </ExtraParams>
                                        </Click>
                                     </AjaxEvents>
                                </ext:ToolbarButton>
                                
                                <ext:ToolbarFill runat="server" />
                                <ext:Hidden ID="txtFilter" runat="server">
                                    <Listeners>
                                        <Change Handler="#{CustomerPager}.changePage(1)" />
                                    </Listeners>
                                </ext:Hidden>
                                <ext:ComboBox 
                                    ID="txtCustomers" 
                                    runat="server" 
                                    EmptyText="Select Customer"
                                    TypeAhead="true" 
                                    StoreID="dsCustomers"
                                    DisplayField="CompanyName" 
                                    ValueField="CustomerID"
                                    MinChars="1">
                                    <Listeners>
                                        <Select Handler="#{txtSearch}.setValue('');#{txtFilter}.setValue(el.getValue());" />
                                        <Blur Handler="if(Ext.isEmpty(el.getText())) { el.setValue(''); #{txtFilter}.setValue(''); };" />
                                    </Listeners>
                                </ext:ComboBox>
                                <ext:ToolbarSpacer ID="ToolbarSpacer2" runat="server" />
                                <ext:ToolbarSeparator ID="ToolbarSeparator1" runat="server" />
                                <ext:ToolbarSpacer ID="ToolbarSpacer1" runat="server" />
                                <ext:TriggerField 
                                    ID="txtSearch" 
                                    runat="server" 
                                    EmptyText="Search" 
                                    EnableKeyEvents="true">
                                    <Listeners>
                                        <KeyDown Buffer="200" Handler="#{txtCustomers}.setValue('');#{txtFilter}.setValue(el.getValue()); if(!Ext.isEmpty(el.getValue())) { el.triggers[0].show(); }" />
                                        <TriggerClick Handler="if(index == 1) { #{txtFilter}.setValue(el.getValue()); } if(index == 0) { #{txtSearch}.reset(); #{txtFilter}.setValue(''); el.triggers[0].hide(); }" />
                                        <Blur Handler="if(Ext.isEmpty(el.getValue())) { el.triggers[0].hide(); }" />
                                    </Listeners>
                                    <Triggers>
                                        <ext:FieldTrigger Icon="Clear" HideTrigger="true" />
                                        <ext:FieldTrigger Icon="Search" />
                                    </Triggers>
                                </ext:TriggerField>
                            </Items>
                        </ext:Toolbar>
                     </TopBar>
                     <Body>
                         <ext:FitLayout ID="FitLayout2" runat="server">
                                <ext:TabPanel ID="TabPanel1" runat="server" Border="false">
                                    <Tabs>
                                        <ext:Tab ID="tabGeneralDetails" runat="server" Title="General" BodyStyle="padding:6px;">
                                            <Body>
                                                <ext:FitLayout ID="gdFitLayout1" runat="server">
                                                    <ext:FormPanel ID="DetailsForm" runat="server" Border="false" Url="/Data/SaveCustomer">
                                                        <Anchors>
                                                            <ext:Anchor>
                                                                <ext:Panel ID="gdPanel1" runat="server" Border="false">
                                                                    <Body>
                                                                        <ext:ColumnLayout ID="gdColumnLayout1" runat="server">
                                                                            <ext:LayoutColumn ColumnWidth="0.5">
                                                                                <ext:Panel ID="gdPanel2" runat="server" Border="false">
                                                                                    <Body>
                                                                                        <ext:FormLayout ID="gdFormLayout1" runat="server" LabelSeparator="" LabelWidth="130" MsgTarget="Side" AllowBlank="false">
                                                                                            <ext:Anchor Horizontal="95%">
                                                                                                <ext:TextField ID="CompanyName" runat="server" FieldLabel="Company" />
                                                                                            </ext:Anchor>
                                                                                            
                                                                                            <ext:Anchor>
                                                                                                <ext:Label ID="gdLabel1" runat="server" FieldLabel="<br/><b>Primary Contact</b>" />
                                                                                            </ext:Anchor>
                                                                                            
                                                                                            <ext:Anchor Horizontal="95%">
                                                                                                <ext:TextField ID="ContactName" runat="server" FieldLabel="Contact Name"  MsgTarget="Side" AllowBlank="false"/>
                                                                                            </ext:Anchor>
                                                                                            
                                                                                            <ext:Anchor Horizontal="95%">
                                                                                                <ext:TextField ID="ContactTitle" runat="server" FieldLabel="Job Title" />
                                                                                            </ext:Anchor>
                                                                                            
                                                                                            <ext:Anchor>
                                                                                                <ext:Label ID="gdLabel2" runat="server" FieldLabel="<br/><b>Phone Numbers</b>" />
                                                                                            </ext:Anchor>
                                                                                            
                                                                                            <ext:Anchor Horizontal="95%">
                                                                                                <ext:TextField ID="Phone" runat="server" FieldLabel="Business Phone" />
                                                                                            </ext:Anchor>
                                                                                            
                                                                                            <ext:Anchor Horizontal="95%">
                                                                                                <ext:TextField ID="Mobile" runat="server" FieldLabel="Mobile Phone" />
                                                                                            </ext:Anchor>
                                                                                            
                                                                                            <ext:Anchor Horizontal="95%">
                                                                                                <ext:TextField ID="Fax" runat="server" FieldLabel="Fax Number" />
                                                                                            </ext:Anchor>
                                                                                            
                                                                                            <ext:Anchor>
                                                                                                <ext:Label ID="Label3" runat="server" FieldLabel="<br/><b>Address</b>" />
                                                                                            </ext:Anchor>
                                                                                            
                                                                                            <ext:Anchor Horizontal="95%">
                                                                                                <ext:TextField ID="Address" runat="server" FieldLabel="Street" />
                                                                                            </ext:Anchor>
                                                                                            
                                                                                            <ext:Anchor Horizontal="95%">
                                                                                                <ext:TextField ID="City" runat="server" FieldLabel="City" />
                                                                                            </ext:Anchor>
                                                                                            
                                                                                            <ext:Anchor Horizontal="95%">
                                                                                                <ext:TextField ID="Region" runat="server" FieldLabel="State/Province" />
                                                                                            </ext:Anchor>
                                                                                            
                                                                                            <ext:Anchor Horizontal="95%">
                                                                                                <ext:TextField ID="PostalCode" runat="server" FieldLabel="Zip/Postal Code" />
                                                                                            </ext:Anchor>
                                                                                            
                                                                                            <ext:Anchor Horizontal="95%">
                                                                                                <ext:TextField ID="Country" runat="server" FieldLabel="Country/Region" />
                                                                                            </ext:Anchor>
                                                                                        </ext:FormLayout>
                                                                                    </Body>
                                                                                </ext:Panel>   
                                                                            </ext:LayoutColumn>
                                                                            <ext:LayoutColumn ColumnWidth="0.5">
                                                                                 <ext:Panel ID="gdPanel3" runat="server" Border="false">
                                                                                    <Body>
                                                                                        <ext:FormLayout ID="gdFormLayout2" runat="server" LabelSeparator="" LabelWidth="130">
                                                                                            <ext:Anchor Horizontal="95%">
                                                                                                <ext:TextField ID="Email" runat="server" FieldLabel="E-mail"/>
                                                                                            </ext:Anchor>
                                                                                            
                                                                                            <ext:Anchor Horizontal="95%">
                                                                                                <ext:TextField ID="WebPage" runat="server" FieldLabel="Web Page" />
                                                                                            </ext:Anchor>
                                                                                            
                                                                                            <ext:Anchor>
                                                                                                <ext:Label ID="gdLabel4" runat="server" FieldLabel="<br/>" />
                                                                                            </ext:Anchor>
                                                                                            
                                                                                            <ext:Anchor Horizontal="95%">
                                                                                               <ext:Panel ID="gdPanel4" runat="server" Border="false">
                                                                                                    <Body>
                                                                                                        <ext:FormLayout ID="gdFormLayout3" runat="server" LabelAlign="Top">
                                                                                                            <ext:Anchor Horizontal="100%">
                                                                                                                 <ext:TextArea ID="Notes" runat="server" FieldLabel="Notes" Height="302" />
                                                                                                            </ext:Anchor>
                                                                                                        </ext:FormLayout>
                                                                                                    </Body>
                                                                                               </ext:Panel>
                                                                                            </ext:Anchor>
                                                                                        </ext:FormLayout>
                                                                                    </Body>
                                                                                </ext:Panel>
                                                                             </ext:LayoutColumn>
                                                                        </ext:ColumnLayout>
                                                                    </Body>
                                                                </ext:Panel>
                                                            </ext:Anchor>
                                                        </Anchors>
                                                    </ext:FormPanel>
                                                </ext:FitLayout>
                                            </Body>
                                        </ext:Tab>
                                        <ext:Tab ID="tabOrders" runat="server" Title="Orders">
                                            <Body>
                                                Not Implemented
                                            </Body>
                                        </ext:Tab>
                                    </Tabs>
                                     <BottomBar>
                                        <ext:PagingToolbar 
                                            ID="CustomerPager" 
                                            runat="server" 
                                            PageSize="1" 
                                            StoreID="dsCustomer"
                                            DisplayMsg="Displaying Customer {0} of {2}"
                                            />
                                    </BottomBar>
                                </ext:TabPanel>
                         </ext:FitLayout>
                     </Body> 
                </ext:Panel>
            </ext:FitLayout>
        </Body>
    </ext:ViewPort>
</body>
</html>
