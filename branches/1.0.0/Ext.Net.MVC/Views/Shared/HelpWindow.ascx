<%@ Control Language="C#" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<ext:Window 
    ID="winAbout" 
    runat="server" 
    Title="About" 
    Icon="Information" 
    Modal="true"
    Height="225" 
    Width="350"
    Layout="fit"
    InitHidden="true">
    <Items>
            <ext:TabPanel ID="tpHelp" runat="server" Border="false">
                <Items>
                    <ext:Panel ID="tabInfo" runat="server" Title="Info" BodyStyle="padding:5px;background-color:#fff;">
                        <Content>
                            Northind Traders Web Administration v1.0 using:<br /><br />
                            <a href="http://www.ext.net/" target="_blank">Ext.Net Toolkit v1.0</a><br /><br />
                            <a href="http://www.extjs.com/" target="_blank">ExtJS v3.0</a><br /><br /> 
                            <a href="http://www.asp.net/mvc/" target="_blank">ASP.NET MVC V1.0</a>
                        </Content>
                    </ext:Panel>
                    <ext:Panel ID="tabCredits" runat="server" Title="Credits" BodyStyle="padding:5px;background-color:#fff;">
                        <Content>
                            Many icons provided by <a href="http://www.famfamfam.com/lab/icons/silk/" target="_blank">FamFamFam</a> under <a href="http://creativecommons.org/licenses/by/2.5/" target="_blank">Creative Commons Attribution 2.5 License</a>.
                        </Content>
                    </ext:Panel>
                    <ext:Panel 
                        ID="tabLicense" 
                        runat="server" 
                        Title="License" 
                        BodyStyle="padding:5px;background-color:#fff;">
                        <Content>
                            Source code for the Ext.Net.MVC project is release by Coolite Inc, under an MIT open source license, see <a href="/License/License.txt" target="_blank">license</a>.
                            <br />
                            <br />
                            Download project source code from GoogleCode, see <a href="http://coolite-mvc.googlecode.com/" target="_blank">http://coolite-mvc.googlecode.com/</a>
                            <br />
                            <br />
                            Licensing information and download of the Ext.Net Toolkit for ASP.NET is available at <a href="http://www.ext.net/download/" target="_blank">http://www.ext.net/download/</a>.
                        </Content>
                    </ext:Panel>
                </Items>
            </ext:TabPanel>
    </Items>
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