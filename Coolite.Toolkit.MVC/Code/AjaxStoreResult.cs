using System.Web.Mvc;

namespace Coolite.Ext.Web.MVC
{
    public class AjaxStoreResult : ActionResult
    {
        public AjaxStoreResult() { }

        public AjaxStoreResult(object data)
        {
            this.Data = data;
        }

        public AjaxStoreResult(object data, int totalCount) : this(data)
        {
            this.TotalCount = totalCount;
        }

        public AjaxStoreResult(object data, int totalCount, ConfirmationList confirmationList) : this(data, totalCount)
        {
            this.ConfirmationList = confirmationList;
        }

        public object Data { get; set; }
        public int TotalCount { get; set; }
        public ConfirmationList ConfirmationList { get; set; }

        public override void ExecuteResult(ControllerContext context)
        {
            StoreResponseData storeResponse = new StoreResponseData();
            storeResponse.Data = JSON.Serialize(this.Data);
            storeResponse.TotalCount = this.TotalCount;
            storeResponse.Confirmation = this.ConfirmationList;

            storeResponse.Return();
        }
    }
}