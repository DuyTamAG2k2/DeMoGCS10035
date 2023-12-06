using DeMoGCS10035.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace DeMoGCS10035.Controllers
{
    public class AuthController : Controller
    {
        FptbookdbContext db = new FptbookdbContext();
       
        [HttpGet]
        [Route("login")]
        public IActionResult Login()
        {
    
            if (HttpContext.Session.GetString("user") == null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        [HttpPost]
        [Route("login")]
        public IActionResult Login(User user)
        {
            Console.WriteLine("user"+user.Username.ToString());
            var loggedInUser = db.Users.FirstOrDefault(u => u.Username == user.Username && u.Password == user.Password);

            if (loggedInUser != null)
            {
                // Đăng nhập thành công, lưu thông tin người dùng vào Session hoặc Cookie
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.Error = "Tên đăng nhập hoặc mật khẩu không đúng.";
                return View();
            }
        }
        [Route("signup")]
        [HttpGet]
        public IActionResult SignUp()
        {
            if (HttpContext.Session.GetString("user") == null)
            {
                return View();
            }
            return RedirectToAction("Index", "Home");
        } 
        [HttpPost]
        public IActionResult SignUp(User user)
        {
            var u = db.Users.Where(x => x.Username.Equals(user.Username));
            if(u != null)
            {
                db.Add(user);
                TempData["RegistSuccess"] = "Đăng ký thành công";
                return RedirectToAction("Login");
            }
            TempData["ErrorMessage"] = "Đăng ký không thành công. Vui lòng kiểm tra thông tin và thử lại.";
            return RedirectToAction("SignUp");
        }

    }
}
