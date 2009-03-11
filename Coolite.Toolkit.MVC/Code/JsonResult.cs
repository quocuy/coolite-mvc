using System.Web.Mvc;

namespace Coolite.Ext.Web.MVC
{
    public class JsonResult : ActionResult
    {
        public JsonResult() { }

        public JsonResult(string script)
        {
            this.Script = script;
        }

        private string script;

        public string Script
        {
            get { return this.script; }
            set { this.script = value; }
        }

        private string errorMessage;

        public string ErrorMessage
        {
            get { return this.errorMessage; }
            set { this.errorMessage = value; }
        }

        public override void ExecuteResult(ControllerContext context)
        {
            AjaxResponse response = new AjaxResponse();

            if (!string.IsNullOrEmpty(this.ErrorMessage))
            {
                response.Success = false;
                response.ErrorMessage = this.ErrorMessage;
            }
            else
            {
                if (!string.IsNullOrEmpty(this.Script))
                {
                    response.Script = string.Concat("<string>", this.Script);
                }
            }
            
            response.Return();
        }
    }

}
