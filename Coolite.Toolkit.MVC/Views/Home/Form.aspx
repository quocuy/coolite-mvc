<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Register Assembly="Coolite.Ext.Web" Namespace="Coolite.Ext.Web" TagPrefix="ext" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        };

        var failureHandler = function (form, action) {
            Ext.MessageBox.show({
                title: 'Failure',
                msg: getMsg(action),
                buttons: Ext.MessageBox.OK,
                icon: Ext.MessageBox.ERROR
            });
        };
        
        var success = function (form,action) {
            eval(action.result.extraParams.script);  
        };
    </script>

</head>
<body>
    <ext:ScriptManager runat="server" />
    
    <ext:FormPanel 
        ID="FormPanel1" 
        runat="server" 
        Url="/Home/SaveForm/"
        Border="false" 
        BodyStyle="padding:5px 5px 0px;" 
        LabelAlign="Top">
        <Body>
            <ext:FormLayout ID="FormLayout1" runat="server">
                <ext:Anchor>
                    <ext:Panel ID="Panel1" runat="server" Border="false">
                        <Body>
                            <ext:ColumnLayout ID="ColumnLayout1" runat="server">
                                <ext:LayoutColumn ColumnWidth="0.5">
                                    <ext:Panel ID="Panel2" runat="server" Border="false">
                                        <Body>
                                            <ext:FormLayout ID="FormLayout2" runat="server">
                                                <ext:Anchor Horizontal="95%">
                                                    <ext:TextField ID="txtName" runat="server" FieldLabel="Name" AllowBlank="false" />
                                                </ext:Anchor>
                                            </ext:FormLayout>
                                        </Body>
                                    </ext:Panel>
                                </ext:LayoutColumn>
                                <ext:LayoutColumn ColumnWidth="0.5">
                                    <ext:Panel ID="Panel3" runat="server" Border="false">
                                        <Body>
                                            <ext:FormLayout ID="FormLayout3" runat="server">
                                                <ext:Anchor Horizontal="95%">
                                                    <ext:TextField ID="txtEmail" runat="server" FieldLabel="Email" AllowBlank="false" />
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
                    <ext:HtmlEditor ID="txtComments" runat="server" FieldLabel="Comments" Height="200" AllowBlank="false" />
                </ext:Anchor>
            </ext:FormLayout>
        </Body>
        <Buttons>
            <ext:Button runat="server" Text="Send">
                <Listeners>
                    <Click Handler="#{FormPanel1}.form.submit({ waitMsg:'Sending...', success: success });" />
                </Listeners>
            </ext:Button>
        </Buttons>
    </ext:FormPanel>
</body>
</html>
