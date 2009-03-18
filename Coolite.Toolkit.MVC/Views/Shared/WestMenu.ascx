<%@ Control Language="C#" %>
<%@ Register Assembly="Coolite.Ext.Web" Namespace="Coolite.Ext.Web" TagPrefix="ext" %>

<ext:Accordion ID="wmAccordion1" runat="server" Animate="true">
    <ext:Panel ID="wmPanel7" runat="server" Border="false" Collapsed="true" Title="Reports">
        <Body>
            <ext:FitLayout runat="server">
                <ext:MenuPanel runat="server" Border="false" SaveSelection="false" Cls="white-menu">
                    <Menu>
                        <Items>
                            <ext:MenuItem runat="server" Text="Customer Address Book" Icon="Report">
                                <CustomConfig>
                                    <ext:ConfigItem Name="url" Value="/Report/CustomerAddressBook/" Mode="Value" />
                                </CustomConfig>
                            </ext:MenuItem>                
                            
                            <ext:MenuItem runat="server" Text="Total Sales By Employee" Icon="ChartBar">
                                <CustomConfig>
                                    <ext:ConfigItem Name="url" Value="/Chart/TotalByEmployee/" Mode="Value" />
                                    <ext:ConfigItem Name="passParentSize" Value="true" Mode="Raw" />
                                </CustomConfig>
                            </ext:MenuItem>            
                            
                            <ext:MenuItem runat="server" Text="Product Sales By Category" Icon="ChartBar">
                                <CustomConfig>
                                    <ext:ConfigItem Name="url" Value="/Chart/ProductSalesByCategory/" Mode="Value" />
                                </CustomConfig>
                            </ext:MenuItem>         
                        </Items>
                        <Listeners>
                            <ItemClick Handler="Northwind.addTab({ title: menuItem.text, url: menuItem.url, icon: menuItem.iconCls, passParentSize: menuItem.passParentSize});" />
                        </Listeners>
                    </Menu>                    
                </ext:MenuPanel>
            </ext:FitLayout>
        </Body>
    </ext:Panel>
    <ext:Panel ID="wmPanel1" runat="server" Border="false" Collapsed="true" Title="Customers & Orders">
        <Body>
            <ext:FitLayout runat="server">
                <ext:MenuPanel runat="server" Border="false" SaveSelection="false" Cls="white-menu">
                    <Menu>
                        <Items>
                            <ext:MenuItem runat="server" Text="Top Ten Orders by Sales Amount" Icon="ApplicationDouble">
                                <CustomConfig>
                                    <ext:ConfigItem Name="url" Value="/Customer/TopTenOrdersBySalesAmount/" Mode="Value" />
                                </CustomConfig>
                            </ext:MenuItem>
                            <ext:MenuItem runat="server" Text="Customer Details" Icon="ApplicationForm">
                                <CustomConfig>
                                    <ext:ConfigItem Name="url" Value="/Customer/CustomerDetails/" Mode="Value" />
                                </CustomConfig>
                            </ext:MenuItem>
                            <ext:MenuItem runat="server" Text="Customer List" Icon="ApplicationForm">
                                <CustomConfig>
                                    <ext:ConfigItem Name="url" Value="/Customer/CustomerList/" Mode="Value" />
                                </CustomConfig>
                            </ext:MenuItem>
                            <%--<ext:MenuItem ID="wmMenuItem4" runat="server" Text="Order Details" Icon="ApplicationForm">
                                 <CustomConfig>
                                    <ext:ConfigItem Name="url" Value="/Order/OrderDetails/" Mode="Value" />
                                </CustomConfig>
                            </ext:MenuItem>--%>
                            <ext:MenuItem runat="server" Text="Order List" Icon="ApplicationForm">
                                 <CustomConfig>
                                    <ext:ConfigItem Name="url" Value="/Order/OrderList/" Mode="Value" />
                                </CustomConfig>
                            </ext:MenuItem>
                        </Items>
                        <Listeners>
                            <ItemClick Handler="Northwind.addTab({ title: menuItem.text, url: menuItem.url, icon: menuItem.iconCls });" />
                        </Listeners>
                    </Menu>                    
                </ext:MenuPanel>
            </ext:FitLayout>
        </Body>
    </ext:Panel>
    <ext:Panel ID="wmPanel2" runat="server" Border="false" Collapsed="true" Title="Inventory & Purchasing">
        <Body>
            <ext:FitLayout runat="server">
                <ext:MenuPanel runat="server" Border="false" SaveSelection="false" Cls="white-menu">
                    <Menu>
                        <Items>
                            <ext:MenuItem runat="server" Text="Coming Soon" Icon="ApplicationForm" />
                        
                            <%--<ext:MenuItem ID="wmMenuItem6" runat="server" Text="Inventory List" Icon="ApplicationForm" />
                            <ext:MenuItem ID="wmMenuItem7" runat="server" Text="Product Details" Icon="ApplicationForm" />
                            <ext:MenuItem ID="wmMenuItem8" runat="server" Text="Purchase Order Details" Icon="ApplicationForm" />
                            <ext:MenuItem ID="wmMenuItem9" runat="server" Text="Purchase Order List" Icon="ApplicationForm" />--%>
                        </Items>
                    </Menu>
                </ext:MenuPanel>
            </ext:FitLayout>
        </Body>
    </ext:Panel>
    <ext:Panel ID="wmPanel3" runat="server" Border="false" Collapsed="true" Title="Suppliers">
        <Body>
            <ext:FitLayout runat="server">
                <ext:MenuPanel runat="server" Border="false" SaveSelection="false" Cls="white-menu">
                    <Menu>
                        <Items>
                            <ext:MenuItem runat="server" Text="Coming Soon" Icon="ApplicationForm" />
                            <%--<ext:MenuItem ID="wmMenuItem10" runat="server" Text="Supplier Details" Icon="ApplicationForm" />
                            <ext:MenuItem ID="wmMenuItem11" runat="server" Text="Supplier List" Icon="ApplicationForm" />--%>
                        </Items>
                    </Menu>
                </ext:MenuPanel>
            </ext:FitLayout>
        </Body>
    </ext:Panel>
    <ext:Panel ID="wmPanel4" runat="server" Border="false" Collapsed="true" Title="Shippers">
        <Body>
            <ext:FitLayout runat="server">
                <ext:MenuPanel runat="server" Border="false" SaveSelection="false" Cls="white-menu">
                    <Menu>
                        <Items>
                            <ext:MenuItem runat="server" Text="Coming Soon" Icon="ApplicationForm" />
                            <%--<ext:MenuItem ID="wmMenuItem12" runat="server" Text="Shipper Details" Icon="ApplicationForm" />
                            <ext:MenuItem ID="wmMenuItem13" runat="server" Text="Shipper List" Icon="ApplicationForm" />--%>
                        </Items>
                    </Menu>
                </ext:MenuPanel>
            </ext:FitLayout>
        </Body>
    </ext:Panel>
    <%--<ext:Pa nel ID="wmPanel5" runat="server" Border="false" Collapsed="true" Title="Reports" Cls="white-menu">
    </ext:Panel>--%>
    <ext:Panel ID="wmPanel6" runat="server" Border="false" Collapsed="true" Title="Employees">
        <Body>
            <ext:FitLayout runat="server">
                <ext:MenuPanel runat="server" Border="false" SaveSelection="false" Cls="white-menu">
                    <Menu>
                        <Items>
                            <ext:MenuItem runat="server" Text="Coming Soon" Icon="ApplicationForm" />
                            <%--<ext:MenuItem ID="wmMenuItem14" runat="server" Text="Employee Details" Icon="ApplicationForm" />
                            <ext:MenuItem ID="wmMenuItem15" runat="server" Text="Employee List" Icon="ApplicationForm" />--%>
                        </Items>
                    </Menu>
                </ext:MenuPanel>
            </ext:FitLayout>
        </Body>
    </ext:Panel> 
</ext:Accordion>
