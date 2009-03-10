using System.Web.Mvc;

namespace Coolite.Ext.Web.MVC
{
    public class JsonResult : ActionResult
    {
        private string script;
        private string errorMessage;

        public string Script
        {
            get { return this.script; }
            set { this.script = value; }
        }

        public string ErrorMessage
        {
            get { return this.errorMessage; }
            set { this.errorMessage = value; }
        }

        public JsonResult()
        {
        }

        public JsonResult(string script)
        {
            this.script = script;
        }

        public override void ExecuteResult(ControllerContext context)
        {
            AjaxResponse responseObject = new AjaxResponse();
            if (!string.IsNullOrEmpty(this.ErrorMessage))
            {
                responseObject.Success = false;
                responseObject.ErrorMessage = this.ErrorMessage;
            }
            else
            {
                if (!string.IsNullOrEmpty(script))
                {
                    responseObject.Script = string.Concat("<string>", script);
                }
            }
            
            responseObject.Return();
        }
    }

}
