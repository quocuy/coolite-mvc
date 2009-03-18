<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="System.Collections.Generic" %>

<%@ Register Assembly="Coolite.Ext.Web" Namespace="Coolite.Ext.Web" TagPrefix="ext" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <ext:ScriptManager ID="ScriptManager1" runat="server"/>
    
    <ext:Panel ID="Panel1" runat="server" Border="false" AutoHeight="true" BodyStyle="padding:5px;" Html="Dashboard Here... need stuff here" />
    
    <%--<ext:Store runat="server" ID="Store1" AutoLoad="true" DataSource='<%# ViewData["Data"] as List<string> %>'>
        <Reader>
            <ext:JsonReader>
                <Fields>
                    <ext:RecordField Name="title" />
                </Fields>
            </ext:JsonReader>
        </Reader>
    </ext:Store>--%>

    <%--<ext:ViewPort ID="ViewPort1" runat="server">
        <Body>
            <ext:FitLayout ID="FitLayout2" runat="server">    
                <ext:Panel ID="ImagePanel" runat="server" Cls="images-view" AutoHeight="true" Border="false">
                    <Body>
                        <ext:FitLayout ID="FitLayout1" runat="server">
                            <ext:DataView 
                                ID="DataView1" 
                                runat="server" 
                                StoreID="Store1"
                                SingleSelect="true"
                                OverClass="x-view-over" 
                                ItemSelector="div.thumb-wrap" 
                                AutoHeight="true" 
                                EmptyText="No examples to display">
                                <Template ID="Template1" runat="server">
                                    <div id="sample-ct">
                                        <tpl for=".">
                                            <div>
                                                <a name="{id}"></a>
                                                <h2><div>{title}</div></h2>
                                                <dl>
                                                    <tpl for="samples">
                                                        <div class="thumb-wrap" ext:url="{url}" ext:id="{id}">
                                                            <img src="{imgUrl}" title="{title}"/>
                                                            <div>
                                                                <H6>{sub}</H6>
                                                                <H4>{title}</H4>
                                                                <P>{desc}</P>
                                                            </div>
                                                        </div>
                                                    </tpl>
                                                    <div style="clear:left"></div>
                                                 </dl>
                                            </div>
                                        </tpl>
                                    </div>
                                </Template>
                                <Listeners>
                                    <SelectionChange Fn="selectionChaged" />
                                    <ContainerClick Fn="viewClick" />
                                </Listeners>
                            </ext:DataView>
                        </ext:FitLayout>
                    </Body>
                </ext:Panel>
            </ext:FitLayout>
        </Body>
    </ext:ViewPort>--%>
</body>
</html>