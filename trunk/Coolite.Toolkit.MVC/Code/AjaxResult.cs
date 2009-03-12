using System.Web.Mvc;

namespace Coolite.Ext.Web.MVC
{
    public class AjaxResult : ActionResult
    {
        public AjaxResult() { }

        public AjaxResult(string script)
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

        private ParameterCollection extraParamsResponse;
        public ParameterCollection ExtraParamsResponse
        {
            get
            {
                if (this.extraParamsResponse == null)
                {
                    this.extraParamsResponse = new ParameterCollection();
                }

                return this.extraParamsResponse;
            }
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

                if (this.ExtraParamsResponse.Count > 0)
                {
                    response.ExtraParamsResponse = this.ExtraParamsResponse.ToJsonObject();
                }
            }
            
            response.Return();
        }
    }

}
