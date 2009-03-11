<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Register Assembly="Coolite.Ext.Web" Namespace="Coolite.Ext.Web" TagPrefix="ext" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <script type="text/javascript">
        var getMsg = function (action) {
            if (action.failureType == "client") {
                return "Please check fields.";
            }
            
            var msg = '';
            
            if (action.result && action.result.errors.length > 0) {
                msg = action.result.errors[0].msg;
            } else if(action.response) {
                msg = action.response.responseText;
            }

            return msg;
        }

        var failureHandler = function (form, action) {
            Ext.MessageBox.show({
                title: 'Failure',
                msg: getMsg(action),
                buttons: Ext.MessageBox.OK,
                icon: Ext.MessageBox.ERROR
            });
        }

        var successHandler = function (form, action) {
            Ext.MessageBox.alert('Success', getMsg(action));
        }
    </script>

</head>
<body>
    <ext:ScriptManager ID="ScriptManager1" runat="server" />
    
    <ext:ViewPort ID="ViewPort1" runat="server">
        <Body>
            <ext:FitLayout ID="FitLayout1" runat="server">
                <ext:FormPanel 
                    ID="FormPanel1" 
                    runat="server" 
                    IDMode="Ignore" 
                    Url="/Home/SaveForm/"
                    Border="false" 
                    BodyStyle="padding:5px 5px 0px;" 
                    LabelAlign="Top">
                    <Anchors>
                        <ext:Anchor>
                            <ext:Panel ID="Panel1" runat="server" Border="false">
                                <Body>
                                    <ext:ColumnLayout ID="ColumnLayout1" runat="server">
                                        <ext:LayoutColumn ColumnWidth="0.5">
                                            <ext:Panel ID="Panel2" runat="server" Border="false">
                                                <Body>
                                                    <ext:FormLayout ID="FormLayout1" runat="server">
                                                        <ext:Anchor Horizontal="95%">
                                                            <ext:TextField ID="TextField1" runat="server" FieldLabel="First Name" AllowBlank="false" />
                                                        </ext:Anchor>
                                                        <ext:Anchor Horizontal="95%">
                                                            <ext:TextField ID="TextField2" runat="server" FieldLabel="Company" AllowBlank="false" />
                                                        </ext:Anchor>
                                                    </ext:FormLayout>
                                                </Body>
                                            </ext:Panel>
                                        </ext:LayoutColumn>
                                        <ext:LayoutColumn ColumnWidth="0.5">
                                            <ext:Panel ID="Panel3" runat="server" Border="false">
                                                <Body>
                                                    <ext:FormLayout ID="FormLayout2" runat="server">
                                                        <ext:Anchor Horizontal="95%">
                                                            <ext:TextField ID="TextField3" runat="server" FieldLabel="Last Name" AllowBlank="false" />
                                                        </ext:Anchor>
                                                        <ext:Anchor Horizontal="95%">
                                                            <ext:TextField ID="TextField4" runat="server" FieldLabel="Email" Vtype="email" AllowBlank="false" />
                                                        </ext:Anchor>
                                                    </ext:FormLayout>
                                                </Body>
                                            </ext:Panel>
                                        </ext:LayoutColumn>
                                    </ext:ColumnLayout>
                                </Body>
                            </ext:Panel>
                        </ext:Anchor>
                        <ext:Anchor Horizontal="98%">
                            <ext:HtmlEditor ID="HtmlEditor1" runat="server" FieldLabel="Biography" Height="200" AllowBlank="false" />
                        </ext:Anchor>
                    </Anchors>
                    <Buttons>
                        <ext:Button ID="Button1" runat="server" Text="Send">
                            <Listeners>
                                <Click Handler="#{FormPanel1}.form.submit({ params:{action: 'send'},waitMsg:'Sending...', failure: failureHandler, success: successHandler});" />
                            </Listeners>
                        </ext:Button>
                        <ext:Button ID="Button2" runat="server" Text="Send with failure 'Email' field">
                            <Listeners>
                                <Click Handler="#{FormPanel1}.form.submit({ params:{action: 'error'},waitMsg:'Sending...', failure: failureHandler, success: successHandler});" />
                            </Listeners>
                        </ext:Button>
                        <ext:Button ID="Button3" runat="server" Text="Send (emulate exception on server side)">
                            <Listeners>
                                <Click Handler="#{FormPanel1}.form.submit({ params:{action: 'error1'},waitMsg:'Sending...', failure: failureHandler, success: successHandler});" />
                            </Listeners>
                        </ext:Button>
                    </Buttons>
                </ext:FormPanel>
            </ext:FitLayout>
        </Body>
    </ext:ViewPort>
</body>
</html>
