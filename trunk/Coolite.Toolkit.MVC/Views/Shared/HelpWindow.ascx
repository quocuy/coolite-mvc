<%@ Control Language="C#" %>

<%@ Register Assembly="Coolite.Ext.Web" Namespace="Coolite.Ext.Web" TagPrefix="ext" %>

<ext:Window 
    ID="winAbout" 
    runat="server" 
    Title="About" 
    Icon="Information" 
    Modal="true"
    Height="225" 
    Width="350"
    ShowOnLoad="false">
    <Body>
        <ext:FitLayout ID="fitHelp" runat="server">
            <ext:TabPanel ID="tpHelp" runat="server" Border="false">
                <Tabs>
                    <ext:Tab ID="tabInfo" runat="server" Title="Info" BodyStyle="padding:5px;background-color:#fff;">
                        <Body>
                            Northind Traders Web Administration v0.8 using:<br /><br />
                            <a href="http://www.coolite.com/" target="_blank">Coolite Toolkit v0.8</a><br /><br />
                            <a href="http://www.extjs.com/" target="_blank">ExtJS v2.2.1</a><br /><br /> 
                            <a href="http://www.asp.net/mvc/" target="_blank">ASP.NET MVC V1.0</a>
                        </Body>
                    </ext:Tab>
                    <ext:Tab ID="tabCredits" runat="server" Title="Credits" BodyStyle="padding:5px;background-color:#fff;">
                        <Body>
                            Many icons provided by <a href="http://www.famfamfam.com/lab/icons/silk/" target="_blank">FamFamFam</a> under <a href="http://creativecommons.org/licenses/by/2.5/" target="_blank">Creative Commons Attribution 2.5 License</a>.
                        </Body>
                    </ext:Tab>
                    <ext:Tab 
                        ID="tabLicense" 
                        runat="server" 
                        Title="License" 
                        BodyStyle="padding:5px;background-color:#fff;">
                        <Body>
                            Source code for the Coolite.Toolkit.MVC project is release by Coolite Inc, under an MIT open source license, see <a href="/License/License.txt" target="_blank">license</a>.
                            <br />
                            <br />
                            Download project source code from GoogleCode, see <a href="http://coolite-mvc.googlecode.com/" target="_blank">http://coolite-mvc.googlecode.com/</a>
                            <br />
                            <br />
                            Licensing information and download of the Coolite Toolkit for ASP.NET is available at <a href="http://www.coolite.com/download/" target="_blank">http://www.coolite.com/download/</a>.
                        </Body>
                    </ext:Tab>
                </Tabs>
            </ext:TabPanel>
        </ext:FitLayout>
    </Body>
    <BottomBar>
        <ext:Toolbar runat="server">
            <Items>
                <ext:ToolbarFill ID="fill2" runat="server" />
                <ext:ToolbarTextItem ID="txtCopyright" runat="server" Text="Copyright 2006-2009 Coolite, Inc<br />" />
                <ext:ToolbarSpacer ID="spacer2" runat="server" />
            </Items>
        </ext:Toolbar>
    </BottomBar>
</ext:Window>