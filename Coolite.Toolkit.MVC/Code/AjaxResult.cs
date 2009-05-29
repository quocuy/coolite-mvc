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

        public AjaxResult(object result)
        {
            this.Result = result;
        }

        public string Script { get; set; }
        public object Result { get; set; }
        public string ErrorMessage { get; set; }

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

            response.Result = this.Result;

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
                    response.ExtraParamsResponse = this.ExtraParamsResponse.ToJson();
                }
            }
            
            response.Return();
        }
    }

}
