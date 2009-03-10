using System.Web.Mvc;

namespace Coolite.Ext.Web.MVC
{
    public class StoreResult : ActionResult
    {
        private object data;
        private int totalCount;
        private ConfirmationList confirmationList;

        public object Data
        {
            get { return this.data; }
            set { this.data = value; }
        }

        public int TotalCount
        {
            get { return this.totalCount; }
            set { this.totalCount = value; }
        }

        public ConfirmationList ConfirmationList
        {
            get { return this.confirmationList; }
            set { this.confirmationList = value; }
        }


        public StoreResult()
        {
        }

        public StoreResult(object data)
        {
            this.Data = data;
        }

        public StoreResult(object data, int totalCount) : this(data)
        {
            this.TotalCount = totalCount;
        }

        public StoreResult(object data, int totalCount, ConfirmationList confirmationList) : this(data, totalCount)
        {
            this.ConfirmationList = confirmationList;
        }

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
