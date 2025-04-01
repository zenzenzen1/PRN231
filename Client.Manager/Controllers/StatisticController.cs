using Microsoft.AspNetCore.Mvc;

namespace Client.Manager.Controllers;

public class StatisticController : Controller{
    [HttpGet]
    public IActionResult Index(){
        return View();
    }
    
}