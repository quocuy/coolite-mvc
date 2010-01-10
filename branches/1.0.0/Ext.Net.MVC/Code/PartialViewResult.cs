using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Compilation;
using System.Web.Mvc;
using System.Web.UI;

namespace Ext.Net.MVC
{
    public class PartialViewResult : ActionResult
    {
        private string containerId;
        private RenderMode renderMode = RenderMode.RenderTo;
        private string controlId;
        private bool wrapByScriptTag=true;

        public string ContainerId
        {
            get { return containerId; }
            set { containerId = value; }
        }

        public RenderMode RenderMode
        {
            get { return renderMode; }
            set { renderMode = value; }
        }

        public string ControlId
        {
            get { return controlId; }
            set { controlId = value; }
        }

        public bool WrapByScriptTag
        {
            get { return wrapByScriptTag; }
            set { wrapByScriptTag = value; }
        }

        public PartialViewResult()
        {
        }

        public PartialViewResult(string containerId)
        {
            this.ContainerId = containerId;
        }

        public PartialViewResult(string containerId, RenderMode renderMode)
        {
            this.ContainerId = containerId;
            this.RenderMode = renderMode;
        }

        public PartialViewResult(string containerId, RenderMode renderMode, string controlId)
        {
            this.ContainerId = containerId;
            this.RenderMode = renderMode;
            this.ControlId = controlId;
        }

        public override void ExecuteResult(ControllerContext context)
        {
            string action = context.RouteData.Values["action"].ToString();
            string controller = context.RouteData.GetRequiredString("controller");

            string[] viewLocationFormats = new[] {
                "~/Views/{1}/{0}.ascx",
                "~/Views/Shared/{0}.ascx"
            };

            string path = string.Format(viewLocationFormats[0], action, controller);
            if(!this.FileExists(path))
            {
                path = string.Format(viewLocationFormats[1], action);
                if(!this.FileExists(path))
                {
                    throw new Exception("View doesn't found");
                }
            }

            string id = this.ControlId ?? "ID_"+Guid.NewGuid().ToString().Replace("-", "");
            string ct = this.ContainerId ?? "={Ext.getBody()}";

            Page pageHolder = new BaseScriptBuilder.SelfRenderingPage();

            ResourceManager rm = new ResourceManager();
            rm.RenderScripts = ResourceLocationType.None;
            rm.RenderStyles = ResourceLocationType.None;
            rm.IDMode = IDMode.Explicit;
            pageHolder.Controls.Add(rm);
            Panel p = new Panel { ID = id, Border = false, Header = false };
            pageHolder.Controls.Add(p);

            UserControl uc = (UserControl)pageHolder.LoadControl(path);
            uc.ID = id+"_UC";
            p.ContentControls.Add(uc);

            string script = p.ToScript(this.RenderMode, ct, true);

            if(X.IsAjaxRequest)
            {
                script = "<Ext.Net.AjaxResponse>" + script + "</Ext.Net.AjaxResponse>";
            }
            else if(this.WrapByScriptTag)
            {
                script = "<script type=\"text/javascript\">" + script + "</script>";
            }

            context.HttpContext.Response.Write(script);
        }

        protected bool FileExists(string virtualPath)
        {
            try
            {
                object viewInstance = BuildManager.CreateInstanceFromVirtualPath(virtualPath, typeof(object));

                return viewInstance != null;
            }
            catch (HttpException he)
            {
                if (he.GetHttpCode() == (int)HttpStatusCode.NotFound)
                {
                    return false;
                }
                
                throw;
            }
            catch
            {
                return false;
            }
        }

    }
}
