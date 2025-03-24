using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Service.MangaOnline.Commons;
using Service.MangaOnline.Extensions;
using Service.MangaOnline.Models;

namespace Service.MangaOnline.Services
{
    public class StatisticService
    {
        private readonly MangaOnlineV1DevContext _context;
        private readonly IExtensionManga _extensionManga;
        public StatisticService(MangaOnlineV1DevContext context, IExtensionManga extensionManga)
        {
            _context = context;
            _extensionManga = extensionManga;
        }
        
        public async Task<object> UserRoleStatistic(){
            return await _context.Users
                .GroupBy(u => u.RoleId)
                .Select(u => new {
                    role = _extensionManga.CoverIntToEnum<UserRoleEnum>((int)u.Key).ToString(),
                    roleId = u.Key,
                    Count = u.Count()
                })
                // .Cast<dynamic>()
                .ToListAsync()
                
                ;
        }

        internal async Task<object> TopReadingCategory(int limit)
        {
            return await _context.CategoryMangas
                .GroupBy(c => c.CategoryId)
                .Select(c => new {
                    categoryId = c.Key,
                    categoryName = AllCategory.CategoryByID(c.Key)!.Name,
                    viewCount = c.Sum(c => c.Manga.ViewCount),
                    count = c.Count()
                })
                .OrderByDescending(c => c.viewCount)
                .Take(limit)
                .ToListAsync();
        }
    }
}