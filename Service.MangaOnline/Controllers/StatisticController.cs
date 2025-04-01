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
        private readonly IConfiguration _configuration;
        public StatisticController(StatisticService statisticService, IConfiguration configuration)
        {
            _statisticService = statisticService;
            _configuration = configuration;
        }
        
        
        
        [HttpGet("numberOfUsersByYears")]
        public async Task<IActionResult> NumberOfUsersByYear(){
            return Ok(await _statisticService.NumberOfUsersByYears(null, null));
        }
        
        [HttpGet("topReadingCategory")]
        public async Task<IActionResult> TopReadingCategory(int? limit){
            return Ok(await _statisticService.TopReadingCategory(limit));
        }
        
        [HttpGet("userRoleStatistic")]
        public async Task<IActionResult> UserRoleStatistic(){
            return Ok(await _statisticService.UserRoleStatistic());
        }
        
        [HttpGet("bottomReadingCategory")]
        public async Task<IActionResult> BottomReadingCategory(int? limit){
            return Ok(await _statisticService.BottomReadingCategory(limit));
        }
    }
}