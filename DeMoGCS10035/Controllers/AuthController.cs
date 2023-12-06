using Microsoft.AspNetCore.Mvc;

namespace DeMoGCS10035.Controllers
{
    public class AuthController : Controller
    {
        [Route("login")]
        public IActionResult Login()
        {
            return View();
        }
        [Route("signup")]
        public IActionResult SignUp()
        {
            return View();
        }
    }
}
