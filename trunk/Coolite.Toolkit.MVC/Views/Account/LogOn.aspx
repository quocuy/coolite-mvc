<%@ Page Language="C#" %>

<%@ Register assembly="Coolite.Ext.Web" namespace="Coolite.Ext.Web" tagprefix="ext" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log On</title>    
    
    <script type="text/javascript">
        function getQueryArgs() {
            var args = new Object();
            var query = location.search.substring(1);
            var pairs = query.split("&");
            for (var i = 0; i < pairs.length; i++) {
                var pos = pairs[i].indexOf('=');
                if (pos == -1) continue;
                var argname = pairs[i].substring(0, pos);
                var value = pairs[i].substring(pos + 1);
                args[argname] = unescape(value);
            }
            return args;
        }
    </script>
</head>
<body>
        <ext:ScriptManager ID="ScriptManager1" runat="server" CleanResourceUrl="false" InitScriptMode="Inline" ScriptMode="Debug" />
        
        <ext:Window 
            ID="Window1" 
            runat="server" 
            Closable="false"
            Resizable="false"
            Height="150" 
            Icon="Lock" 
            Title="Login"
            Draggable="false"
            Width="350"
            Modal="true"
            BodyStyle="padding:5px;">
            <Body>
                <ext:FitLayout runat="server">
                    <ext:FormPanel ID="FormPanel1" runat="server" FormId="loginForm" Border="false" BodyStyle="background:transparent;" Url=<%# Html.AttributeEncode(Url.Action("LogOn")) %>>
                        <Anchors>
                            <ext:Anchor>
                                <ext:TextField 
                                    ID="txtUsername" 
                                    runat="server" 
                                    ReadOnly="false"
                                    FieldLabel="Username" 
                                    AllowBlank="false"
                                    BlankText="Your username is required."
                                    Text="demo"
                                    />
                            </ext:Anchor>
                            <ext:Anchor>
                                <ext:TextField 
                                    ID="txtPassword" 
                                    runat="server" 
                                    ReadOnly="false"
                                    InputType="Password" 
                                    FieldLabel="Password" 
                                    AllowBlank="false" 
                                    BlankText="Your password is required."
                                    Text="demo"
                                    />
                            </ext:Anchor>
                            <ext:Anchor>
                                <ext:Checkbox ID="rememberMe" runat="server" FieldLabel="Remember me"></ext:Checkbox>
                            </ext:Anchor>
                        </Anchors>
                        <Buttons>
<%--                            <ext:Button runat="server" Text="Login" Icon="Accept">     
                                <Listeners>
                                    <Click Handler="#{FormPanel1}.form.submit(waitMsg:'Checking...'});" />
                                </Listeners>                           
                            </ext:Button>--%>
                            <ext:Button ID="Button1" runat="server" Text="Login" Icon="Accept">
                                <AjaxEvents>
                                    <Click Url="/Account/LogOn" FormID="loginForm" CleanRequest="true" Method="POST">
                                        <EventMask ShowMask="true" />
                                        <ExtraParams>
                                            <ext:Parameter Name="ReturnUrl" Value="getQueryArgs().ReturnUrl" Mode="Raw" />
                                        </ExtraParams>
                                    </Click>
                                </AjaxEvents>
                            </ext:Button>
                        </Buttons>
                    </ext:FormPanel>
                </ext:FitLayout>
            </Body>            
        </ext:Window>
</body>
</html>
