<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Register Assembly="Coolite.Ext.Web" Namespace="Coolite.Ext.Web" TagPrefix="ext" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <ext:ScriptManager ID="ScriptManager1" runat="server" RenderScripts="None" RenderStyles="None" />
    
    <ext:Panel runat="server" Border="false" AutoHeight="true" BodyStyle="padding:5px;">
         <Body>
            Dashboard
         </Body> 
    </ext:Panel>
</body>
</html>