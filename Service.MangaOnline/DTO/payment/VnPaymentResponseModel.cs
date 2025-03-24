using final_project.Services.ClientServices.Payment;

namespace final_project.Models.ViewModel
{
     public class VnPaymentResponseModel
    {
        public bool Success { get; set; }
        public string PaymentMethod { get; set; } = string.Empty;
        public string OrderInfo { get; set; } = string.Empty;
        public string OrderId { get; set; } = string.Empty;
        public string PaymentId { get; set; } = string.Empty;
        public string TransactionId { get; set; } = string.Empty;
        public string Token { get; set; } = string.Empty;
        public string VnPayResponseCode { get; set; } = string.Empty;
        public string? VnpPayDate { get; set; }
        public string VnpTxnRef { get; set; } = string.Empty;
    }
    
    public class VnPaymentRequestModel{
        public string Url { get; set; } = string.Empty;
        public string vnp_TransactionNo { get; set; } = string.Empty;
        public string vnp_CreateBy { get; set; } = string.Empty;
        public string vnp_RequestId { get; set; } = string.Empty;
        public string vnp_Version { get; set; } = string.Empty;
        public string vnp_Command { get; set; } = string.Empty;
        public string vnp_TmnCode { get; set; } = string.Empty;
        public string vnp_Amount { get; set; } = string.Empty;
        public string vnp_CreateDate { get; set; } = string.Empty;
        public string vnp_CurrCode { get; set; } = string.Empty;
        public string vnp_IpAddr { get; set; } = string.Empty;
        public string vnp_Locale { get; set; } = string.Empty;
        public string vnp_OrderInfo { get; set; } = string.Empty;
        public string vnp_TxnRef { get; set; } = string.Empty;
        public string vnp_SecureHash { get; set; } = string.Empty;
        public string vnp_TransactionDate { get; set; } = string.Empty;
        public string vnp_TransactionType { get; set; } = "02";

        public override string ToString()
        {
            return $"Url: {Url}, vnp_Version: {vnp_Version}, vnp_Command: {vnp_Command}, vnp_TmnCode: {vnp_TmnCode}, vnp_Amount: {vnp_Amount}, vnp_CreateDate: {vnp_CreateDate}, vnp_CurrCode: {vnp_CurrCode}, vnp_IpAddr: {vnp_IpAddr}, vnp_Locale: {vnp_Locale}, vnp_OrderInfo: {vnp_OrderInfo}, vnp_TxnRef: {vnp_TxnRef}, vnp_SecureHash: {vnp_SecureHash}, vnp_TransactionType: {vnp_TransactionType}";
        }
    }
}