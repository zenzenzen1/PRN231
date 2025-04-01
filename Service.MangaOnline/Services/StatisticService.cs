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
        private readonly IConfiguration _configuration;
        private readonly CategoryService _categoryService;
        public StatisticService(CategoryService categoryService, MangaOnlineV1DevContext context, IExtensionManga extensionManga, IConfiguration configuration)
        {
            _categoryService = categoryService;
            _context = context;
            _extensionManga = extensionManga;
            _configuration = configuration;
        }
        
        public async Task<List<dynamic>> User(){
            return null;
        }
        
        public async Task<List<dynamic>> NumberOfUsersByYears(int? fromYear, int? toYear){
            fromYear ??= _configuration.GetValue<int>("Statistic:FromYear");
            toYear ??= DateTime.Now.Year;
            var years = Enumerable.Range(fromYear.Value, toYear.Value - fromYear.Value + 1).ToList();
            var roles = _extensionManga.GetEnumList<UserRoleEnum>().Select(e => new { RoleId = (int)e, Name = e.ToString()}).ToList();
            var users = await _context.Users
                .Select(u => new { u.Id, u.RoleId, u.CreatedAt })
                .ToListAsync();
            _extensionManga.GetEnumList<UserRoleEnum>().ForEach(e => System.Console.WriteLine((int)e + ": " + e));
            var roleCounts =  users
                .GroupBy(u => new { u.CreatedAt!.Value.Year, u.RoleId })
                .ToDictionary(g => g.Key, g => g.Count())
                ;
            var allCombinations = 
                from year in years
                from role in roles
                select new { Year = year, RoleId = (int?)role.RoleId, RoleName = role.Name };
            var completeStats = allCombinations
                .Select(x => new
                {
                    Year = x.Year,
                    RoleId = x.RoleId,
                    RoleName = x.RoleName,
                    Count = roleCounts.ContainsKey(new { x.Year, x.RoleId }) ? roleCounts[new { x.Year, x.RoleId }] : 0
                })
                .OrderBy(x => x.Year)
                .ThenBy(x => x.RoleId)
                .GroupBy(x => x.Year) 
                .Select(g => new
                {
                    Year = g.Key,
                    Roles = g.Select(r => new { r.RoleId, r.RoleName, r.Count }).ToList()
                })
                .ToList();
                
                
            
            return completeStats.Cast<dynamic>().ToList();
        }
        
        public async Task<List<dynamic>> NumberOfUsersByYears(int? fromYear, int? toYear, int NoUsed){
            fromYear ??= _configuration.GetValue<int>("Statistic:FromYear");
            toYear ??= DateTime.Now.Year;
            _extensionManga.GetEnumList<UserRoleEnum>().ForEach(e => System.Console.WriteLine((int)e + ": " + e));
            var roleCounts = await _context.Users
                .GroupBy(u => new { u.CreatedAt!.Value.Year, u.RoleId })
                .Select(u => new {
                    year = u.Key.Year,
                    count = u.Count()
                    // UserCount = _extensionManga.GetEnumList<UserRoleEnum>().Select(e => new {
                    //     role = e.ToString(),
                    //     count = u.Where(u => u.RoleId == (int)e).Count()
                    // }),
                    // UserNormalCount = u.Where(u => u.RoleId == (int)UserRoleEnum.UserNormal).Count(),
                })
                .Where(u => u.year >= fromYear && u.year <= toYear)
                .Cast<dynamic>()
                .ToListAsync()
                
                ;
            return new List<dynamic>();
            // for (int i = fromYear ?? _configuration.GetValue<int>("Statistic:FromYear"); i <= toYear; i++)
            // {
            //     if (!list.Any(u => u.year == i))
            //     {
            //         list.Add(new { year = i, count = 0 });
            //     }
            // }
            // return list.OrderBy(u => u.year).ToList();
        }
        
        public async Task<List<dynamic>> BottomReadingCategory(int? limit){
            limit ??= _configuration.GetValue<int>("Statistic:DefaultReadingCategoryLimit");
            return await _context.CategoryMangas
                .GroupBy(c => c.CategoryId)
                .Select(c => new {
                    categoryId = c.Key,
                    viewCount = c.Sum(c => c.Manga.ViewCount),
                    count = c.Count()
                })
                .Join(_context.Categories, c => c.categoryId, ct => ct.Id, (c, ct) => new {
                    categoryId = c.categoryId,
                    categoryName = ct.Name,
                    viewCount = c.viewCount,
                    numberOfMangas = c.count
                })
                .OrderBy(c => c.viewCount)
                .Take(limit ?? _configuration.GetValue<int>("Statistic:DefaultReadingCategoryLimit"))
                .Cast<dynamic>()
                .ToListAsync();
        }
        
        public async Task<object> UserRoleStatistic(){
            return await _context.Users
                .GroupBy(u => u.RoleId)
                .Select(u => new {
                    role = _extensionManga.CoverIntToEnum<UserRoleEnum>((int)u.Key!).ToString(),
                    roleId = u.Key,
                    Count = u.Count()
                })
                // .Cast<dynamic>()
                .ToListAsync()
                
                ;
        }

        internal async Task<object> TopReadingCategory(int? limit)
        {
            limit ??= _configuration.GetValue<int>("Statistic:DefaultReadingCategoryLimit");
            return await _context.CategoryMangas
                .GroupBy(c => c.CategoryId)
                .Select(c => new {
                    categoryId = c.Key,
                    viewCount = c.Sum(c => c.Manga.ViewCount),
                    numberOfMangas = c.Count()
                })
                .Join(_context.Categories, c => c.categoryId, ct => ct.Id, (c, ct) => new {
                    categoryId = c.categoryId,
                    categoryName = ct.Name,
                    viewCount = c.viewCount,
                    numberOfMangas = c.numberOfMangas
                })
                .OrderByDescending(c => c.viewCount)
                .Take(limit ?? _configuration.GetValue<int>("Statistic:DefaultReadingCategoryLimit"))
                .ToListAsync();
        }
    }
}