<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Register Assembly="Coolite.Ext.Web" Namespace="Coolite.Ext.Web" TagPrefix="ext" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    
    <script type="text/javascript">
        var reloadImage = function() {
            var year = cbxYear.getValue();
            if (Ext.isEmpty(year, false)) {
                year = 0;
            }
            Ext.fly('chart').dom.src = String.format('/Chart/GetProductsSalesByCategoryImage/?t={0}&width={1}&height={2}&year={3}', new Date().format('U'), ImgContainer.body.getWidth(true), ImgContainer.body.getHeight(true), year);
        }
    </script>
</head>
<body>
        <ext:ScriptManager runat="server"/>
        
        <ext:Store ID="dsYears" runat="server">
            <Proxy>
                <ext:HttpProxy Url="/Data/GetOrdersYears/"></ext:HttpProxy>
            </Proxy>
            <Reader>
                <ext:JsonReader Root="data">
                    <Fields>
                        <ext:RecordField Name="Year"></ext:RecordField>
                        <ext:RecordField Name="Value" Mapping="Year"></ext:RecordField>
                    </Fields>
                </ext:JsonReader>
            </Reader>
        </ext:Store>
        
        <ext:ViewPort runat="server">
            <Body>
                <ext:FitLayout runat="server">
                    <ext:Panel ID="ImgContainer" runat="server" Border="false">
                        <TopBar>
                            <ext:Toolbar runat="server">
                                <Items>
                                    <ext:ComboBox ID="cbxYear" runat="server" 
                                        StoreID="dsYears" 
                                        DisplayField="Year" 
                                        Mode="Local"
                                        ValueField="Value" 
                                        Editable="false">
                                        <Items>
                                            <ext:ListItem Text="All" Value="0" />
                                        </Items>
                                        <SelectedItem Value="0" />
                                        <Listeners>
                                            <Select Handler="reloadImage();" />
                                        </Listeners>
                                    </ext:ComboBox>
                                </Items>
                            </ext:Toolbar>                            
                        </TopBar>
                        <Body>
                            <img id="chart" />
                        </Body>
                        <Listeners>
                            <Render Delay="50" Handler="reloadImage();" />
                        </Listeners>
                    </ext:Panel>
                </ext:FitLayout>
            </Body>
        </ext:ViewPort>
</body>
</html>
