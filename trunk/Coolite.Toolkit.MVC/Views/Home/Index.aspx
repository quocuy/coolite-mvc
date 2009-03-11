<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Register Assembly="Coolite.Ext.Web" Namespace="Coolite.Ext.Web" TagPrefix="ext" %>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <ext:FitLayout ID="fitHome" runat="server">
        <ext:Panel ID="pnlHome" runat="server" Border="false" Html="Home Tab" />
    </ext:FitLayout>
</asp:Content>