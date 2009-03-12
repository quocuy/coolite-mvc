<%@ Control Language="C#"%>
<%@ Register Assembly="Coolite.Ext.Web" Namespace="Coolite.Ext.Web" TagPrefix="ext" %>

<ext:Store ID="CustomerStore" runat="server" ShowWarningOnFailure="true">
    <Proxy>
        <ext:HttpWriteProxy Url="/Data/GetOrder/" SaveUrl="/Data/SaveOrder/"/>
    </Proxy>
    <Reader>
        <ext:JsonReader ReaderID="OrderID" Root="data" TotalProperty="totalCount">
            <Fields>
                <ext:RecordField Name="OrderID" />
            </Fields>
        </ext:JsonReader>
    </Reader>
    <BaseParams>
        <ext:Parameter Name="orderID" Value="-1" Mode="Raw" />
    </BaseParams>
    <Listeners>
        <Load Handler="records.length > 0 ? #{DetailsForm}.form.loadRecord(records[0]) : #{DetailsForm}.form.reset();" />
    </Listeners>
</ext:Store>

<ext:FitLayout ID="gdFitLayout1" runat="server">
    <ext:FormPanel ID="DetailsForm" runat="server" Border="false">
        <ext:Anchor>
            <ext:Panel ID="gdPanel1" runat="server" Border="false">
                <Body>
                    <ext:ColumnLayout ID="gdColumnLayout1" runat="server">
                        <ext:LayoutColumn ColumnWidth="0.5">
                            <ext:Panel ID="gdPanel2" runat="server" Border="false">
                                <Body>
                                    <ext:FormLayout ID="gdFormLayout1" runat="server" LabelSeparator="" LabelWidth="130">
                                        <ext:Anchor Horizontal="95%">
                                            <ext:TextField ID="CompanyName" runat="server" FieldLabel="Company" />
                                        </ext:Anchor>
                                        
                                        <ext:Anchor>
                                            <ext:Label ID="gdLabel1" runat="server" FieldLabel="<br/><b>Primary Contact</b>">                                                                                            
                                            </ext:Label>
                                        </ext:Anchor>
                                        
                                        <ext:Anchor Horizontal="95%">
                                            <ext:TextField ID="ContactName" runat="server" FieldLabel="Contact Name" />
                                        </ext:Anchor>
                                        
                                        <ext:Anchor Horizontal="95%">
                                            <ext:TextField ID="ContactTitle" runat="server" FieldLabel="Job Title" />
                                        </ext:Anchor>
                                        
                                        <ext:Anchor>
                                            <ext:Label ID="gdLabel2" runat="server" FieldLabel="<br/><b>Phone Numbers</b>">                                                                                            
                                            </ext:Label>
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
                                            <ext:Label ID="Label3" runat="server" FieldLabel="<br/><b>Address</b>">                                                                                            
                                            </ext:Label>
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
                                            <ext:TextField ID="Email" runat="server" FieldLabel="E-mail" />
                                        </ext:Anchor>
                                        
                                        <ext:Anchor Horizontal="95%">
                                            <ext:TextField ID="WebPage" runat="server" FieldLabel="Web Page" />
                                        </ext:Anchor>
                                        
                                        <ext:Anchor>
                                            <ext:Label ID="gdLabel4" runat="server" FieldLabel="<br/>">                                                                                            
                                            </ext:Label>
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
    </ext:FormPanel>
</ext:FitLayout>
