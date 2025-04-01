using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Service.MangaOnline.Commons;
using Service.MangaOnline.Models;

namespace Service.MangaOnline.Services
{
    public class UserService
    {
        private readonly MangaOnlineV1DevContext _context;
        private readonly PriceHistoryService _priceHistoryService;
        public UserService(MangaOnlineV1DevContext context, PriceHistoryService priceHistoryService)
        {
            _context = context;
            _priceHistoryService = priceHistoryService;
        }
        
        public async Task CreateUpgradeRequest(string userId, string paymentId){
            var user = await _context.Payments.FirstOrDefaultAsync(x => x.PaymentId == new Guid(paymentId));
            if(user != null){
                throw new Exception("Payment already exists");
            }
            var NewestPrice = await _priceHistoryService.GetNewestPriceHistory();
            _context.Payments.Add(new Payment{
                UserId = new Guid(userId),
                PaymentId = new Guid(paymentId),
                PriceHistoryId = NewestPrice!.Id,
                PaymentTime = DateTime.Now
            });
            await _context.SaveChangesAsync();
        }
        
        public async Task RemoveUpgradeRequest(string paymentId){
            var payment = await _context.Payments.FirstOrDefaultAsync(x => x.PaymentId == new Guid(paymentId)) ?? throw new Exception("Payment not found");
            _context.Payments.Remove(payment);
            await _context.SaveChangesAsync();
        }
        
        public async Task<Payment> UpgradeUserToVip(string paymentId)
        {
            var payment = await _context.Payments.FirstOrDefaultAsync(x => x.PaymentId == new Guid(paymentId)) ?? throw new Exception("Payment not found");
            var user = await _context.Users.FirstOrDefaultAsync(x => x.Id == payment.UserId) ?? throw new Exception("User not found");
            user.RoleId = (int)UserRoleEnum.UserVip;
            payment.PaymentTime = DateTime.Now;
            payment.User = user;
            await _context.SaveChangesAsync();
            return payment;
        }
    }
}