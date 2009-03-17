<%@ Control Language="C#" %>
<%@ Register Assembly="Coolite.Ext.Web" Namespace="Coolite.Ext.Web" TagPrefix="ext" %>

<script type="text/javascript">
    function loadOrder(orderID) {
        if (Ext.isEmpty(orderID, false)) {
            return;
        }
        dsOrder.load({ params: { orderID: orderID} });
    }

    function fillOrder(record) {
        OrderCommonInformation.form.loadRecord(record);
        ShippingInformationForm.form.loadRecord(record);
        dsOrderDetails.loadData(record.data.Order_Details);
    }  
</script>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if(ViewData["orderID"] != null)
        {
            ProxyManager.ScriptManager.RegisterOnReadyScript(string.Format("loadOrder({0});", ViewData["orderID"]));
        }
    }
</script>

<style type="text/css">
    .bottom-margin
    {
        margin-top: 6px;
        margin-bottom: 3px;
    }
    
    .x-grid3-body .x-grid3-td-TotalPrice {
            background-color:#f1f2f4;
        }
        
        .x-grid3-summary-row .x-grid3-td-TotalPrice {
            background-color:#e1e2e4;
        }
        
        .x-grid3-summary-row {
            background:#F1F2F4 none repeat scroll 0 0;
            border-left:1px solid #FFFFFF;
            border-right:1px solid #FFFFFF;
            color:#333333;
        }
        
        .x-grid3-summary-row .x-grid3-cell-inner {
            font-weight:bold;
            padding-bottom:4px;
        }
        
        .x-grid3-cell-first .x-grid3-cell-inner {
            padding-left:16px;
        }
        
        .x-grid-hide-summary .x-grid3-summary-row {
            display:none;
        }
        
        .x-grid3-summary-msg {
            font-weight:bold;
            padding:4px 16px;
        }        
</style>

<ext:ScriptManagerProxy ID="ProxyManager" runat="server"/>

<ext:Store ID="dsOrder" runat="server" AutoLoad="false">
    <Proxy>
        <ext:HttpProxy Url="/Data/GetOrder/">
        </ext:HttpProxy>
    </Proxy>
    <Reader>
        <ext:JsonReader ReaderID="OrderID" Root="data">
            <Fields>
                <ext:RecordField Name="OrderID"/>
                <ext:RecordField Name="Salesperson"/>
                <ext:RecordField Name="CustomerName"/>
                <ext:RecordField Name="CustomerEmail"/>
                <ext:RecordField Name="OrderDate" Type="Date"/>
                <ext:RecordField Name="Order_Details"/>
                <ext:RecordField Name="ShippingCompany"/>
                <ext:RecordField Name="ShippedDate" Type="Date"/>
                <ext:RecordField Name="Freight"/>
                <ext:RecordField Name="ShipName"/>
                <ext:RecordField Name="ShipAddress"/>
                <ext:RecordField Name="ShipCity"/>
                <ext:RecordField Name="ShipRegion"/>
                <ext:RecordField Name="ShipPostalCode"/>
                <ext:RecordField Name="ShipCountry"/>
            </Fields>
        </ext:JsonReader>
    </Reader>
    <Listeners>
        <Load Handler="OrderDetails.body.unmask(); if(records.length > 0) { fillOrder(records[0])}else { #{OrderCommonInformation}.form.reset(); #{ShippingInformationForm}.form.reset(); this.removeAll(); }" />
    </Listeners>
</ext:Store>

<ext:Store ID="dsOrderDetails" runat="server" AutoLoad="false" GroupField="OrderID">
    <Reader>
        <ext:JsonReader>
            <Fields>
                <ext:RecordField Name="OrderID"/>
                <ext:RecordField Name="Product"/>
                <ext:RecordField Name="Quantity" Type="Int"/>
                <ext:RecordField Name="UnitPrice" Type="Float"/>
                <ext:RecordField Name="Discount" Type="Float"/>
                <ext:RecordField Name="TotalPrice" Type="Float">
                    <Convert Handler="return record.Quantity*record.UnitPrice*(1-record.Discount);" />
                </ext:RecordField>
            </Fields>
        </ext:JsonReader>
    </Reader>
</ext:Store>

<ext:FitLayout ID="odFitLayout1" runat="server">
    <ext:Panel ID="OrderDetails" runat="server" Border="false">
        <Body>
            <ext:RowLayout ID="odRowLayout1" runat="server">
                <ext:LayoutRow>
                    <ext:FormPanel ID="OrderCommonInformation" runat="server" Border="false" BodyStyle="padding:5px" Height="70">
                        <Body>
                            <ext:ColumnLayout ID="odColLayout1" runat="server" FitHeight="true">
                                <ext:LayoutColumn ColumnWidth="0.5">
                                    <ext:Panel ID="odFormPanel1" runat="server" Border="false">
                                        <Body>
                                            <ext:FormLayout ID="odFormLayout1" runat="server">
                                                <ext:Anchor Horizontal="95%">
                                                    <ext:TextField ID="CustomerName" runat="server" ReadOnly="true" FieldLabel="Customer"
                                                        DataIndex="CustomerName">
                                                    </ext:TextField>
                                                </ext:Anchor>
                                                <ext:Anchor Horizontal="95%">
                                                    <ext:TextField ID="CustomerEmail" runat="server" ReadOnly="true" FieldLabel="E-mail Address">
                                                    </ext:TextField>
                                                </ext:Anchor>
                                            </ext:FormLayout>
                                        </Body>
                                    </ext:Panel>
                                </ext:LayoutColumn>
                                <ext:LayoutColumn ColumnWidth="0.5">
                                    <ext:Panel ID="odFormPanel2" runat="server" Border="false">
                                        <Body>
                                            <ext:FormLayout ID="odFormLayout2" runat="server">
                                                <ext:Anchor Horizontal="95%">
                                                    <ext:TextField ID="Salesperson" runat="server" ReadOnly="true" FieldLabel="Salesperson">
                                                    </ext:TextField>
                                                </ext:Anchor>
                                                <ext:Anchor Horizontal="95%">
                                                    <ext:DateField ID="OrderDate" runat="server" ReadOnly="true" FieldLabel="Order Date" HideTrigger="true">                                                        
                                                    </ext:DateField>
                                                </ext:Anchor>
                                            </ext:FormLayout>
                                        </Body>
                                    </ext:Panel>
                                </ext:LayoutColumn>
                            </ext:ColumnLayout>
                        </Body>
                    </ext:FormPanel>
                </ext:LayoutRow>
                <ext:LayoutRow RowHeight="1">
                    <ext:TabPanel ID="odTabPanel1" runat="server" LayoutOnTabChange="true" DeferredRender="false">
                        <Tabs>
                            <ext:Tab ID="tabOrderDetails" runat="server" Title="Order Details">
                                <Body>
                                    <ext:FitLayout ID="odFitLayout4" runat="server">
                                        <ext:GridPanel ID="grdOrderDetails" runat="server"
                                            StoreID="dsOrderDetails" 
                                            Border="false"
                                            TrackMouseOver="true">
                                            <ColumnModel ID="odColumnModel1" runat="server">
                                                <Columns>
                                                    <ext:Column Header="OrderID" DataIndex="OrderID" Hidden="true"/>
                                                    <ext:Column Header="Product" DataIndex="Product" Sortable="true"/>
                                                    <ext:Column Header="Quantity" DataIndex="Quantity" Sortable="true"/>
                                                    <ext:Column Header="UnitPrice" DataIndex="UnitPrice" Sortable="true">
                                                        <Renderer Format="UsMoney" />
                                                    </ext:Column>
                                                    <ext:Column Header="Discount" DataIndex="Discount" Sortable="true">
                                                        <Renderer Handler="return Math.round(value*100) + '%';" />
                                                    </ext:Column>
                                                    
                                                    <ext:GroupingSummaryColumn 
                                                        Header="Total Price" 
                                                        ColumnID="TotalPrice"
                                                        DataIndex="TotalPrice" 
                                                        Sortable="true"
                                                        SummaryType="Sum">
                                                        <Renderer Format="UsMoney" />
                                                        <SummaryRenderer Format="UsMoney" />
                                                    </ext:GroupingSummaryColumn>
                                                </Columns>
                                            </ColumnModel>                                            
                                             <View>
                                                <ext:GroupingView 
                                                    ID="GroupingView1"  
                                                    runat="server" 
                                                    AutoFill="true"
                                                    ShowGroupName="false"
                                                    EnableNoGroups="true"
                                                    HideGroupedColumn="true"
                                                    />
                                            </View>     
                                            <SelectionModel>
                                                <ext:RowSelectionModel ID="odRowSelectionModel1" runat="server"/>
                                            </SelectionModel>
                                            <Plugins>
                                                <ext:GroupingSummary ID="GroupingSummary1" runat="server" />
                                            </Plugins>    
                                        </ext:GridPanel>
                                    </ext:FitLayout>
                                </Body>
                            </ext:Tab>
                            <ext:Tab ID="tabShippingDetails" runat="server" Title="Shipping Details" BodyStyle="padding:5px;">
                                <Body>
                                    <ext:FitLayout runat="server">
                                        <ext:FormPanel ID="ShippingInformationForm" runat="server" Border="false">
                                            <Body>
                                                <ext:FormLayout runat="server">
                                                    <ext:Anchor>
                                                        <ext:Panel runat="server" Cls="bottom-margin" BodyStyle="padding:4px;padding-bottom:0px;">
                                                            <Body>
                                                                <ext:ColumnLayout runat="server">
                                                                    <ext:LayoutColumn ColumnWidth="0.33">
                                                                        <ext:Panel runat="server" Border="false">
                                                                            <Body>
                                                                                <ext:FormLayout runat="server" LabelWidth="110">
                                                                                    <ext:Anchor Horizontal="95%">
                                                                                        <ext:TextField ID="ShippingCompany" runat="server" ReadOnly="true" FieldLabel="Shipping Company"/>
                                                                                    </ext:Anchor>
                                                                                </ext:FormLayout>
                                                                            </Body>
                                                                        </ext:Panel>                                                                        
                                                                    </ext:LayoutColumn>
                                                                    
                                                                    <ext:LayoutColumn ColumnWidth="0.33">
                                                                         <ext:Panel runat="server" Border="false">
                                                                            <Body>
                                                                                <ext:FormLayout runat="server" LabelWidth="110">
                                                                                    <ext:Anchor Horizontal="95%">
                                                                                        <ext:DateField ID="ShippedDate" runat="server" ReadOnly="true" FieldLabel="Ship Date" HideTrigger="true"/>
                                                                                    </ext:Anchor>
                                                                                </ext:FormLayout>
                                                                            </Body>
                                                                        </ext:Panel>                                                                        
                                                                    </ext:LayoutColumn>
                                                                    
                                                                    <ext:LayoutColumn ColumnWidth="0.33">
                                                                         <ext:Panel runat="server" Border="false">
                                                                            <Body>
                                                                                <ext:FormLayout runat="server" LabelWidth="110">
                                                                                    <ext:Anchor Horizontal="95%">
                                                                                        <ext:NumberField ID="Freight" runat="server" DecimalPrecision="2" ReadOnly="true" FieldLabel="Shipping Fee"/>
                                                                                    </ext:Anchor>
                                                                                </ext:FormLayout>
                                                                            </Body>
                                                                        </ext:Panel>                                                                        
                                                                    </ext:LayoutColumn>
                                                                </ext:ColumnLayout>
                                                            </Body>
                                                        </ext:Panel>
                                                    </ext:Anchor>
                                                    
                                                    <ext:Anchor>
                                                        <ext:Panel runat="server" Cls="bottom-margin" BodyStyle="padding:4px;padding-bottom:0px;">
                                                            <Body>
                                                                <ext:FormLayout runat="server">
                                                                    <ext:Anchor Horizontal="99%">
                                                                        <ext:TextField ID="ShipName" runat="server" ReadOnly="true" FieldLabel="Ship Name"/>
                                                                    </ext:Anchor>
                                                                    
                                                                    <ext:Anchor Horizontal="99%">
                                                                        <ext:TextField ID="ShipAddress" runat="server" ReadOnly="true" FieldLabel="Ship Address"/>
                                                                    </ext:Anchor>
                                                                    
                                                                    <ext:Anchor Horizontal="99%">
                                                                        <ext:TextField ID="ShipCity" runat="server" ReadOnly="true" FieldLabel="City"/>
                                                                    </ext:Anchor>
                                                                    
                                                                    <ext:Anchor Horizontal="99%">
                                                                        <ext:TextField ID="ShipRegion" runat="server" ReadOnly="true" FieldLabel="State/Province"/>
                                                                    </ext:Anchor>
                                                                    
                                                                    <ext:Anchor Horizontal="99%">
                                                                        <ext:TextField ID="ShipPostalCode" runat="server" ReadOnly="true" FieldLabel="Zip/Postal Code"/>
                                                                    </ext:Anchor>
                                                                    
                                                                    <ext:Anchor Horizontal="99%">
                                                                        <ext:TextField ID="ShipCountry" runat="server" ReadOnly="true" FieldLabel="Country/Region"/>
                                                                    </ext:Anchor>
                                                                </ext:FormLayout>
                                                            </Body>
                                                        </ext:Panel>
                                                    </ext:Anchor>
                                                </ext:FormLayout>                                                
                                            </Body>
                                        </ext:FormPanel>
                                    </ext:FitLayout>
                                </Body>
                            </ext:Tab>
                        </Tabs>
                    </ext:TabPanel>
                </ext:LayoutRow>
            </ext:RowLayout>
        </Body>
    </ext:Panel>
</ext:FitLayout>
