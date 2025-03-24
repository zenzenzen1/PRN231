using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Service.MangaOnline.Services;

namespace Service.MangaOnline.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class StatisticController : ControllerBase
    {
        private readonly StatisticService _statisticService;
        public StatisticController(StatisticService statisticService)
        {
            _statisticService = statisticService;
        }
        
        [HttpGet("topReadingCategory")]
        public async Task<IActionResult> TopReadingCategory(int limit = 10){
            return Ok(await _statisticService.TopReadingCategory(limit));
        }
        
        [HttpGet("userRoleStatistic")]
        public async Task<IActionResult> UserRoleStatistic(){
            return Ok(await _statisticService.UserRoleStatistic());
        }
    }
}