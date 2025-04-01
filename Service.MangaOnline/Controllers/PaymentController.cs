using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using final_project.Services.ClientServices.Payment;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Service.MangaOnline.Hubs;
using Service.MangaOnline.Services;

namespace Service.MangaOnline.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PaymentController : ControllerBase
    {
        private readonly VnPayService _vnPayService;
        private readonly IHubContext<PaymentHub> _paymentHub;
        private readonly IConfiguration _configuration;
        private readonly UserService _userService; 
        
        public PaymentController(VnPayService vnPayService, IHubContext<PaymentHub> paymentHub, IConfiguration configuration, UserService userService)
        {
            _userService = userService;
            _vnPayService = vnPayService;
            _configuration = configuration;
            _paymentHub = paymentHub;
            
        }
        [HttpGet("getVnpayPaymentUrl")]
        public async Task<IActionResult> GetVnpayPaymentUrl([FromQuery] string userId)
        {
            HttpContext.Session.SetString("userId", userId);
            // HttpContext.Session.Keys.ToList().ForEach(x => System.Console.WriteLine("Key: " + x + " Value: " + HttpContext.Session.GetString(x) + "\n"));
            // _paymentHub.Clients.Client(PaymentHub.GetConnectionId(userId)).SendAsync(PaymentHub.SendMessageToUserMessage, HttpContext.Session.GetString("userId") );
            // return Ok(new {success = true});
            //http://localhost:5098/api/payment/vnpayPaymentCallback?vnp_Amount=1000000&vnp_BankCode=NCB&vnp_BankTranNo=VNP14856676
            // &vnp_CardType=ATM&vnp_OrderInfo=Pay+for+order%3A+6&vnp_PayDate=20250320123412&
            // vnp_ResponseCode=00&vnp_TmnCode=J2QNQ4ER&vnp_TransactionNo=14856676&vnp_TransactionStatus=00
            // &vnp_TxnRef=638780707468271474
            // &vnp_SecureHash=2d900199d0c273943c468fd45be9004a3f94b5974529510003b83aef3f3c2588d9408c9e8c515337e7b02eead6c4967bbddf7e31057c1c7b02c86ade0338a04f
            string paymentId = Guid.NewGuid().ToString();
            await _userService.CreateUpgradeRequest(userId, paymentId);
            return Ok(new { url = _vnPayService.CreatePaymentUrl(HttpContext, 10000, DateTime.Now, paymentId) });
        }
        
        [HttpGet("vnpayPaymentCallback")]
        public async Task<IActionResult> VnpayPaymentCallback()
        {
            System.Console.WriteLine("Vnpaycallback" + " " + HttpContext.Session.GetString("userId"));
            var response = _vnPayService.PaymentExecute(Request.Query);
            if(response == null || response.VnPayResponseCode != "00"){
                if(response != null)
                    await _userService.RemoveUpgradeRequest(response.OrderInfo);
                /*
                http://localhost:5098/api/payment/vnpayPaymentCallback?vnp_Amount=1000000&vnp_BankCode=VNPAY&vnp_CardType=QRCODE&
                // vnp_OrderInfo=ebf7bb50-7353-48df-bc55-c3b8440e3118
                // &vnp_PayDate=20250320145345&vnp_ResponseCode=24
                // &vnp_TmnCode=J2QNQ4ER&vnp_TransactionNo=0&vnp_TransactionStatus=02
                // &vnp_TxnRef=638780792240782706&vnp_SecureHash=77c85948a68e22c242fd08e88a363112dbc6430da8c93ced7f063eae992ab76a16ade4c6ad714a2b56b856c2d68a8a57ed86ce4f0742106ff32a65afcff0ddd8
                */
                // return Content("<script>window.location.href='" + _configuration["frontend:url"] + "';</script>", "text/html");
                return BadRequest();
            }
            /*
            "success": true,
"paymentMethod": "VnPay",
"orderDescription": "Pay for order: 50",
"orderId": "638780059991401704",
"paymentId": "",
"transactionId": "14855187",
"token": "5d0bdcad8b119d0092bafc55469b4ec94c26f04f504e9be4a92ea8ade1532b8584f88f88c36e9e2fcc1be37d07e7a1c6af9472d106d9b3cb491306c847ba434b",
"vnPayResponseCode": "00"
            
            */
            // string userId = HttpContext.Session.GetString("userId")!;
            // System.Console.WriteLine("Vnpycallback: " + userId);
            // _paymentHub.Clients.Client(PaymentHub.GetConnectionId(userId)).SendAsync(PaymentHub.SendMessageToUserMessage, userId );
            var payment = await _userService.UpgradeUserToVip(response.OrderInfo);
            await _paymentHub.Clients.Client(PaymentHub.GetConnectionId(payment.UserId.ToString())).SendAsync(PaymentHub.SendMessageToUserMessage, "success");
            // return Content($"<script>window.location.href='" + _configuration["frontend:url"] + "'; if(GetUserData()){localStorage.setItem(\"USER_DATA\", JSON.stringify({...GetUserData(), role: \"UserVip\"}) )}; </script>", "text/html");
            // return Content($"<script>const s = `Thanh Toán Thành Công :" + "). Tự động đóng sau <span id=\'t\'>5</span> giây` ; document.body.innerHTML = s; </script>", "text/html", Encoding.UTF8);
            return Content("Thanh Toán Thành Công <script>setTimeout(() => {window.open('', '_self').close();}, 5000);</script>", "text/html", Encoding.UTF8);
        }
        
        // [HttpGet("getVnpayQueryDrData")]
        // public async Task<IActionResult> GetVnpayQueryDrData()
        // {
        //     return Ok(await _vnPayService.GetQuerydrData(httpContext: HttpContext));
        // }
    }
}