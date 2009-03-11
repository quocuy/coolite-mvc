<%@ Control Language="C#" %>
<%@ Register Assembly="Coolite.Ext.Web" Namespace="Coolite.Ext.Web" TagPrefix="ext" %>

<ext:Accordion ID="wmAccordion1" runat="server" Animate="true">
    <ext:Panel ID="wmPanel1" runat="server" Border="false" Collapsed="true" Title="Customers & Orders">
        <Body>
            <ext:FitLayout ID="wmFitLayout1" runat="server">
                <ext:MenuPanel ID="wmMenuPanel1" runat="server" Border="false" SaveSelection="false" Cls="white-menu">
                    <Menu>
                        <Items>
                            <ext:MenuItem ID="wmMenuItem1" runat="server" Text="Top Ten Orders by Sales Amount" Icon="ApplicationDouble">
                                <CustomConfig>
                                    <ext:ConfigItem Name="url" Value="/Customer/TopTenOrdersBySalesAmount2" Mode="Value" />
                                </CustomConfig>
                            </ext:MenuItem>
                            
                            <ext:MenuItem ID="wmMenuItem2" runat="server" Text="Customer Details" Icon="ApplicationForm" />
                            <ext:MenuItem ID="wmMenuItem3" runat="server" Text="Customer List" Icon="ApplicationForm" />
                            <ext:MenuItem ID="wmMenuItem4" runat="server" Text="Order Details" Icon="ApplicationForm" />
                            <ext:MenuItem ID="wmMenuItem5" runat="server" Text="Order List" Icon="ApplicationForm" />
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
            <ext:FitLayout ID="wmFitLayout2" runat="server">
                <ext:MenuPanel ID="wmMenuPanel2" runat="server" Border="false" SaveSelection="false" Cls="white-menu">
                    <Menu>
                        <Items>
                            <ext:MenuItem ID="wmMenuItem6" runat="server" Text="Inventory List" Icon="ApplicationForm" />
                            <ext:MenuItem ID="wmMenuItem7" runat="server" Text="Product Details" Icon="ApplicationForm" />
                            <ext:MenuItem ID="wmMenuItem8" runat="server" Text="Purchase Order Details" Icon="ApplicationForm" />
                            <ext:MenuItem ID="wmMenuItem9" runat="server" Text="Purchase Order List" Icon="ApplicationForm" />
                        </Items>
                    </Menu>
                </ext:MenuPanel>
            </ext:FitLayout>
        </Body>
    </ext:Panel>
    
    <ext:Panel ID="wmPanel3" runat="server" Border="false" Collapsed="true" Title="Suppliers">
        <Body>
            <ext:FitLayout ID="wmFitLayout3" runat="server">
                <ext:MenuPanel ID="wmMenuPanel3" runat="server" Border="false" SaveSelection="false" Cls="white-menu">
                    <Menu>
                        <Items>
                            <ext:MenuItem ID="wmMenuItem10" runat="server" Text="Supplier Details" Icon="ApplicationForm" />
                            <ext:MenuItem ID="wmMenuItem11" runat="server" Text="Supplier List" Icon="ApplicationForm" />
                        </Items>
                    </Menu>
                </ext:MenuPanel>
            </ext:FitLayout>
        </Body>
    </ext:Panel>
    
    <ext:Panel ID="wmPanel4" runat="server" Border="false" Collapsed="true" Title="Shippers">
        <Body>
            <ext:FitLayout ID="wmFitLayout4" runat="server">
                <ext:MenuPanel ID="wmMenuPanel4" runat="server" Border="false" SaveSelection="false" Cls="white-menu">
                    <Menu>
                        <Items>
                            <ext:MenuItem ID="wmMenuItem12" runat="server" Text="Shipper Details" Icon="ApplicationForm" />
                            <ext:MenuItem ID="wmMenuItem13" runat="server" Text="Shipper List" Icon="ApplicationForm" />
                        </Items>
                    </Menu>
                </ext:MenuPanel>
            </ext:FitLayout>
        </Body>
    </ext:Panel>
    
    <ext:Panel ID="wmPanel5" runat="server" Border="false" Collapsed="true" Title="Reports" Cls="white-menu">
    </ext:Panel>
    
    <ext:Panel ID="wmPanel6" runat="server" Border="false" Collapsed="true" Title="Employees">
        <Body>
            <ext:FitLayout ID="wmFitLayout5" runat="server">
                <ext:MenuPanel ID="wmMenuPanel5" runat="server" Border="false" SaveSelection="false" Cls="white-menu">
                    <Menu>
                        <Items>
                            <ext:MenuItem ID="wmMenuItem14" runat="server" Text="Employee Details" Icon="ApplicationForm" />
                            <ext:MenuItem ID="wmMenuItem15" runat="server" Text="Employee List" Icon="ApplicationForm" />
                        </Items>
                    </Menu>
                </ext:MenuPanel>
            </ext:FitLayout>
        </Body>
    </ext:Panel>
</ext:Accordion>
