using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Service.MangaOnline.Models;

namespace Service.MangaOnline.Services
{
    public class PriceHistoryService
    {
        private readonly MangaOnlineV1DevContext _context;
        public PriceHistoryService(MangaOnlineV1DevContext context)
        {
            _context = context;
        }
        public async Task AddPriceHistory(PriceHistory priceHistory)
        {
            await _context.PriceHistories.AddAsync(priceHistory);
            await _context.SaveChangesAsync();
        }
        public async Task<PriceHistory?> GetNewestPriceHistory()
        {
            return await _context.PriceHistories.OrderByDescending(x => x.ChangedTime).FirstOrDefaultAsync();
        }
    }
}