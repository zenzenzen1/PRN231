using System.Text;
using System.Text.Json;
using final_project.Models.ViewModel;

namespace final_project.Services.ClientServices.Payment
{
    public class VnPayService
    {
        private readonly IConfiguration _configuration;
        public VnPayService(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        
        /*
        vnp_Amount 10000000
        vnp_BankCode NCB
        vnp_BankTranNo VNP14633950
        vnp_CardType ATM
        vnp_OrderInfo Refund for order: 2
        vnp_PayDate 20241026203328
        vnp_ResponseCode 00
        vnp_TmnCode J2QNQ4ER
        vnp_TransactionNo 14633950
        vnp_TransactionStatus 00
        vnp_TxnRef 638655715568180339
        vnp_SecureHash b2ae1ebecbe8954dd97e433b3d39671974a22ec7bc6e0f16336ddbde12fadc9acf83c0e6274460e8fdb0721208747b042d72e383a655d0b9ad4f762ac410c6f0
        
        vnp_Amount 10000000
        vnp_BankCode NCB
        vnp_BankTranNo VNP14633932
        vnp_CardType ATM
        vnp_OrderInfo Pay for order: 10
        vnp_PayDate 20241026202217
        vnp_ResponseCode 00
        vnp_TmnCode J2QNQ4ER
        vnp_TransactionNo 14633932
        vnp_TransactionStatus 00
        vnp_TxnRef 638655708935949973
        vnp_SecureHash 3d5303017b249b324cbdc20da8f92ba0f27d3c1afce6aeb76611243519cfa4cb2759b3991f8951ec801bd52f3ff693fc4606712898bf066ef9138e27fc1e7295
        */
        public VnPaymentRequestModel CreateRefundUrl(HttpContext httpContext, double amount, DateTime createdDate, int orderId){
            var tick = DateTime.Now.Ticks.ToString();
            var vnpay = new VnPayLibrary();
            
            vnpay.AddRequestData("vnp_Version", _configuration["VnPay:Version"]);
            vnpay.AddRequestData("vnp_Command", "refund");
            vnpay.AddRequestData("vnp_TmnCode", _configuration["VnPay:TmnCode"]);
            vnpay.AddRequestData("vnp_Amount", (amount * 100).ToString());
            //Số tiền thanh toán. Số tiền không 
            // mang các ký tự phân tách thập phân, phần nghìn, ký tự tiền tệ. Để gửi số tiền thanh toán là 100,000 VND 
            // (một trăm nghìn VNĐ) thì merchant cần nhân thêm 100 lần (khử phần thập phân), sau đó gửi sang VNPAY 
            // là: 10000000

            vnpay.AddRequestData("vnp_CreateDate", createdDate.ToString("yyyyMMddHHmmss"));
            vnpay.AddRequestData("vnp_CurrCode", _configuration["VnPay:CurrCode"]);
            vnpay.AddRequestData("vnp_IpAddr", Utils.GetIpAddress(context: httpContext));
            vnpay.AddRequestData("vnp_Locale", _configuration["VnPay:Locale"]);
            
            vnpay.AddRequestData("vnp_OrderInfo", "Refund for order: " + orderId);
            vnpay.AddRequestData("vnp_OrderType", "other"); //default value: other
            vnpay.AddRequestData("vnp_ReturnUrl", _configuration["VnPay:PaymentBackReturnUrl"]);
            
            vnpay.AddRequestData("vnp_TxnRef", tick);
            
            var paymentUrl = vnpay.CreateRequestUrl(_configuration["VnPay:RefundUrl"], _configuration["VnPay:HashSecret"]);
            var Request = new VnPaymentRequestModel{
                Url = _configuration["VnPay:RefundUrl"],
                vnp_RequestId = tick,
                vnp_Version = _configuration["VnPay:Version"],
                vnp_Command = "querydr",
                vnp_TmnCode = _configuration["VnPay:TmnCode"],
                vnp_Amount = (amount * 100).ToString(),
                vnp_CreateDate = createdDate.ToString("yyyyMMddHHmmss"),
                vnp_IpAddr = Utils.GetIpAddress(context: httpContext),
                vnp_OrderInfo = "Refund for order: " + orderId,
                vnp_TxnRef = "638655755806304945",
                vnp_SecureHash = _configuration["VnPay:HashSecret"],
                vnp_TransactionDate = createdDate.ToString("yyyyMMddHHmmss"),
                vnp_CreateBy = "admin",
                vnp_TransactionType = "00",
                vnp_TransactionNo = "14634039"
                
            };
            string querydrData = Request.vnp_RequestId + "|" + Request.vnp_Version + "|" + Request.vnp_Command + "|" + Request.vnp_TmnCode + "|" + Request.vnp_TxnRef + "|" + Request.vnp_TransactionDate + "|" + Request.vnp_CreateDate + "|" + Request.vnp_IpAddr + "|" + Request.vnp_OrderInfo;
            string refundData = Request.vnp_RequestId + "|" + Request.vnp_Version + "|" + Request.vnp_Command + "|" + Request.vnp_TmnCode + "|" + Request.vnp_TransactionType + "|" + Request.vnp_TxnRef + "|" + Request.vnp_Amount + "|" + Request.vnp_TransactionNo + "|" + Request.vnp_TransactionDate + "|" + Request.vnp_CreateBy + "|" + Request.vnp_CreateDate + "|" + Request.vnp_IpAddr + "|" + Request.vnp_OrderInfo;
            
            Request.vnp_SecureHash = Utils.HmacSHA512(_configuration["VnPay:HashSecret"], querydrData);
            return Request;
        }
        
        public async Task<object?> GetQuerydrData(HttpContext httpContext){
            using HttpClient client = new HttpClient();
            /*
            "success": true,
            "paymentMethod": "VnPay",
            "orderDescription": "Pay for order: 68",
            "orderId": "638780076958796440",
            "paymentId": "",
            "transactionId": "14855219",
            "token": "e7a2cd37b9359719beea6d7c03c75f7937a9fb06508ea83786ff43fa056edf5758e87ad580816d288555fdd6d687313bed3652057d71a1997cadca972280cd8b",
            "vnPayResponseCode": "00",
            "vnpPayDate": "20250319190248",
            "vnpTxnRef": "638780076958796440"
            */
            string vnp_RequestId = DateTime.Now.Ticks.ToString();
            // string vnp_RequestId = 
            string vnp_Version = _configuration["VnPay:Version"];
            string vnp_Command = "querydr";
            string vnp_TmnCode = _configuration["VnPay:TmnCode"];
            string vnp_TxnRef = "638780076958796441";
            string vnp_OrderInfo = "Query for order";
            string vnp_TransactionDate = "20250319190248";
            string vnp_CreateDate = DateTime.Now.ToString("yyyyMMddHHmmss");
            string vnp_IpAddr = Utils.GetIpAddress(context: httpContext);
            string vnp_SecureHash = "";
            string data = vnp_RequestId + "|" + vnp_Version + "|" + vnp_Command + "|" 
                + vnp_TmnCode + "|" + vnp_TxnRef + "|" + vnp_TransactionDate + "|" 
                + vnp_CreateDate + "|" + vnp_IpAddr + "|" + vnp_OrderInfo;
            vnp_SecureHash = Utils.HmacSHA512(_configuration["VnPay:HashSecret"], data);
            dynamic requestData = new
            {
                vnp_RequestId = DateTime.Now.Ticks.ToString(),
                vnp_Version = _configuration["VnPay:Version"],
                vnp_Command = "querydr",
                vnp_TmnCode = _configuration["VnPay:TmnCode"],
                vnp_TxnRef = "638780076958796440",
                vnp_OrderInfo = "Query for order",
                vnp_TransactionDate = "20250319190248",
                vnp_CreateDate = DateTime.Now.ToString("yyyyMMddHHmmss"),
                vnp_IpAddr = Utils.GetIpAddress(context: httpContext),
                vnp_SecureHash
            };
            
            
            string json = JsonSerializer.Serialize(requestData);
            StringContent content = new StringContent(json, Encoding.UTF8, "application/json");
            // HttpResponseMessage response = await client.PostAsync(_configuration["VnPay:QueryUrl"], content);
            HttpResponseMessage response = await client.PostAsync("https://sandbox.vnpayment.vn/merchant_webapi/api/transaction", content);
            string responseBody = await response.Content.ReadAsStringAsync();
            var result = JsonSerializer.Deserialize<dynamic>(responseBody);
            return result;
            
            
            
            // var vnpay = new VnPayLibrary();
            // long orderId = Convert.ToInt64(vnpay.GetResponseData("vnp_TxnRef"));
            // long vnpayTranId = Convert.ToInt64(vnpay.GetResponseData("vnp_TransactionNo"));
            // // string vnp_SecureHash = queryCollection.FirstOrDefault(p => p.Key == "vnp_SecureHash").Value;
            // string vnp_ResponseCode = vnpay.GetResponseData("vnp_ResponseCode");
            // string vnp_TransactionStatus = vnpay.GetResponseData("vnp_TransactionStatus");
            // var vnp_OrderInfo = vnpay.GetResponseData("vnp_OrderInfo");
            
            // return null;
        }
        
        public string CreatePaymentUrl(HttpContext httpContext, double amount, DateTime createdDate, string orderId, string? txnRef = null)
        {
            var tick = DateTime.Now.Ticks.ToString();
            var vnpay = new VnPayLibrary();
            vnpay.AddRequestData("vnp_Version", _configuration["VnPay:Version"]);
            vnpay.AddRequestData("vnp_Command", _configuration["VnPay:Command"]);
            vnpay.AddRequestData("vnp_TmnCode", _configuration["VnPay:TmnCode"]);
            vnpay.AddRequestData("vnp_Amount", (amount * 100).ToString());
            //Số tiền thanh toán. Số tiền không 
            // mang các ký tự phân tách thập phân, phần nghìn, ký tự tiền tệ. Để gửi số tiền thanh toán là 100,000 VND 
            // (một trăm nghìn VNĐ) thì merchant cần nhân thêm 100 lần (khử phần thập phân), sau đó gửi sang VNPAY 
            // là: 10000000

            vnpay.AddRequestData("vnp_CreateDate", createdDate.ToString("yyyyMMddHHmmss"));
            vnpay.AddRequestData("vnp_CurrCode", _configuration["VnPay:CurrCode"]);
            vnpay.AddRequestData("vnp_IpAddr", Utils.GetIpAddress(context: httpContext));
            vnpay.AddRequestData("vnp_Locale", _configuration["VnPay:Locale"]);
            
            vnpay.AddRequestData("vnp_OrderInfo", orderId);
            vnpay.AddRequestData("vnp_OrderType", "other"); //default value: other
            vnpay.AddRequestData("vnp_ReturnUrl", _configuration["VnPay:PaymentBackReturnUrl"]);
            
            vnpay.AddRequestData("vnp_TxnRef", txnRef ?? tick);
            
            var paymentUrl = vnpay.CreateRequestUrl(_configuration["VnPay:BaseUrl"], _configuration["VnPay:HashSecret"]);
            return paymentUrl;
        }
        
        public VnPaymentResponseModel PaymentExecute(IQueryCollection queryCollection)
        {
            var vnpay = new VnPayLibrary();
            foreach(var (key, value) in queryCollection)
            {
                if(!string.IsNullOrEmpty(key) && key.StartsWith("vnp_"))
                {
                    vnpay.AddResponseData(key, value.ToString());
                }
            }
            long orderId = Convert.ToInt64(vnpay.GetResponseData("vnp_TxnRef"));
            long vnpayTranId = Convert.ToInt64(vnpay.GetResponseData("vnp_TransactionNo"));
            string vnp_SecureHash = queryCollection.FirstOrDefault(p => p.Key == "vnp_SecureHash").Value;
            string vnp_ResponseCode = vnpay.GetResponseData("vnp_ResponseCode");
            string vnp_TransactionStatus = vnpay.GetResponseData("vnp_TransactionStatus");
            var vnp_OrderInfo = vnpay.GetResponseData("vnp_OrderInfo");
            string vnp_PayDate = vnpay.GetResponseData("vnp_PayDate");
            
            bool checkSignature = vnpay.ValidateSignature(vnp_SecureHash, _configuration["VnPay:HashSecret"]);
            if(!checkSignature)
            {
                System.Console.WriteLine("Invalid signature");
                return new(){
                    Success = false
                };
            }
            return new(){
                Success = true,
                PaymentMethod = "VnPay",
                OrderInfo = vnp_OrderInfo,
                OrderId = orderId.ToString(),
                TransactionId = vnpayTranId.ToString(),
                Token = vnp_SecureHash,
                VnPayResponseCode = vnp_ResponseCode,
                VnpPayDate = vnp_PayDate,
                VnpTxnRef = vnpay.GetResponseData("vnp_TxnRef"),
            };
            
        }
    }
}