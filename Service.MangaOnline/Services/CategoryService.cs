using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Service.MangaOnline.Models;

namespace Service.MangaOnline.Services
{
    public class CategoryService
    {
        private readonly MangaOnlineV1DevContext _context;
        public CategoryService(MangaOnlineV1DevContext context)
        {
            _context = context;
        }
        
        public async Task<List<Category>> GetAllCategories()
        {
            return await _context.Categories.ToListAsync();
        }
        
        public async Task<Category?> GetCategoryByIdAsync(Guid id)
        {
            return await _context.Categories.FirstOrDefaultAsync(c => c.Id == id);
        }
        
        public Category? GetCategoryById(Guid id)
        {
            return  _context.Categories.FirstOrDefault(c => c.Id == id);
        }
        
    }
}