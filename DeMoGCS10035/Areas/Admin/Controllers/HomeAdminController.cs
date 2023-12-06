using Microsoft.AspNetCore.Mvc;

namespace DeMoGCS10035.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    [Route("admin/home")]
    public class HomeAdminController : Controller
    {
        [Route("")]
        [Route("index")]
        public IActionResult Index()
        {
            if (HttpContext.Session.GetString("user")==null)
            {
                return Redirect("Login");
            }
            return View();
        }
    }
}
