﻿using AspNetCoreHero.ToastNotification.Abstractions;
using WebFigure.Extension;
using WebFigure.Helpper;
using WebFigure.Models;
using WebFigure.ModelsView;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace WebFigure.Controllers
{
    public class CheckoutController : Controller
    {
        private readonly SieuThiContext _context;
        public INotyfService _notyfService { get; }
        public CheckoutController(SieuThiContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
        }
        public List<CartItem> GioHang
        {
            get
            {
                var gh = HttpContext.Session.Get<List<CartItem>>("GioHang");
                if (gh == default(List<CartItem>))
                {
                    gh = new List<CartItem>();
                }
                return gh;
            }
        }
        [Route("checkout.html", Name = "Checkout")]
        public IActionResult Index(string? returnUrl = null)
        {
            //Lay gio hang ra de xu ly
            var cart = HttpContext.Session.Get<List<CartItem>>("GioHang");
            var taikhoanID = HttpContext.Session.GetString("CustomerId");
            MuaHangVM model = new MuaHangVM();
            if (taikhoanID != null)
            {
                var khachhang = _context.TbCustomers.AsNoTracking().SingleOrDefault(x => x.CustomerId == Convert.ToInt32(taikhoanID));
                model.CustomerId = khachhang.CustomerId;
                model.FullName = khachhang.FullName;
                model.Email = khachhang.Email;
                model.Phone = khachhang.Phone;
                model.Address = khachhang.Address;
            }
            //ViewData["lsTinhThanh"] = new SelectList(_context.TbLocations.Where(x => x.Levels == 1).OrderBy(x => x.Type).ToList(), "Location", "Name");
            ViewBag.GioHang = cart;
            return View(model);
        }

        [HttpPost]
        [Route("checkout.html", Name = "Checkout")]
        public IActionResult Index(MuaHangVM muaHang)
        {
            //Lay ra gio hang de xu ly
            var cart = HttpContext.Session.Get<List<CartItem>>("GioHang");
            var taikhoanID = HttpContext.Session.GetString("CustomerId");
            MuaHangVM model = new MuaHangVM();
            if (taikhoanID != null)
            {
                var khachhang = _context.TbCustomers.AsNoTracking().SingleOrDefault(x => x.CustomerId == Convert.ToInt32(taikhoanID));
                model.CustomerId = khachhang.CustomerId;
                model.FullName = khachhang.FullName;
                model.Email = khachhang.Email;
                model.Phone = khachhang.Phone;
                model.Address = khachhang.Address;

                //khachhang.LocationId = muaHang.TinhThanh;
               // khachhang.District = muaHang.QuanHuyen;
                //.Ward = muaHang.PhuongXa;
                khachhang.Address = muaHang.Address;
                _context.Update(khachhang);
                _context.SaveChanges();
            }
            try
            {
                if (ModelState.IsValid)
                {
                    //Khoi tao don hang
                    TbOrder donhang = new TbOrder();
                    donhang.CustomerId = model.CustomerId;
                    donhang.Address = model.Address;
                    //donhang.LocationId = model.TinhThanh;
                    //donhang.District = model.QuanHuyen;
                    //donhang.Ward = model.PhuongXa;

                    donhang.OrderDate = DateTime.Now;
                    donhang.TransactStatusId = 1;//Don hang moi
                    donhang.Deleted = false;
                    donhang.Paid = false;
                  
                    donhang.TotalMoney = Convert.ToInt32(cart.Sum(x => x.TotalMoney));
                    _context.Add(donhang);
                    _context.SaveChanges();
                    //tao danh sach don hang

                    foreach (var item in cart)
                    {
                        TbOrderDetaill orderDetail = new TbOrderDetaill();
                        orderDetail.OrderId = donhang.OrderId;
                        orderDetail.ProductId = item.product.ProductId;
                        orderDetail.Amount = item.amount;
                        orderDetail.TotalMoney = donhang.TotalMoney;
                        orderDetail.Price = item.product.Price;
                        orderDetail.CreateDate = DateTime.Now;
                        _context.Add(orderDetail);
                    }
                    _context.SaveChanges();
                    //clear gio hang
                    HttpContext.Session.Remove("GioHang");
                    //Xuat thong bao
                    _notyfService.Success("Đơn hàng đặt thành công");
                    //cap nhat thong tin khach hang
                    return RedirectToAction("Success");


                }
            }
            catch
            {
                //ViewData["lsTinhThanh"] = new SelectList(_context.TbLocations.Where(x => x.Levels == 1).OrderBy(x => x.Type).ToList(), "Location", "Name");
                ViewBag.GioHang = cart;
                return View(model);
            }
            //ViewData["lsTinhThanh"] = new SelectList(_context.TbLocations.Where(x => x.Levels == 1).OrderBy(x => x.Type).ToList(), "Location", "Name");
            ViewBag.GioHang = cart;
            return View(model);
        }
        [Route("dat-hang-thanh-cong.html", Name = "Success")]
        public IActionResult Success()
        {
            try
            {
                var taikhoanID = HttpContext.Session.GetString("CustomerId");
                if (string.IsNullOrEmpty(taikhoanID))
                {
                    return RedirectToAction("Login", "Account", new { returnUrl = "/dat-hang-thanh-cong.html" });
                }
                var khachhang = _context.TbCustomers.AsNoTracking().SingleOrDefault(x => x.CustomerId == Convert.ToInt32(taikhoanID));
                var donhang = _context.TbOrders
                    .Where(x => x.CustomerId == Convert.ToInt32(taikhoanID))
                    .OrderByDescending(x => x.OrderDate)
                    .FirstOrDefault();
                MuaHangSuccessVM successVM = new MuaHangSuccessVM();
                successVM.FullName = khachhang.FullName;
                successVM.DonHangID = donhang.OrderId;
                successVM.Phone = khachhang.Phone;
                successVM.Address = khachhang.Address;
               // successVM.PhuongXa = GetNameLocation(donhang.Ward.Value);
                //successVM.TinhThanh = GetNameLocation(donhang.District.Value);
                return View(successVM);
            }
            catch
            {
                return View();
            }
        }
        /*public string GetNameLocation(int idlocation)
        {
            try
            {
                var location = _context.TbLocations.AsNoTracking().SingleOrDefault(x => x.LocationId == idlocation);
                if (location != null)
                {
                    return location.NameWithType;
                }
            }
            catch
            {
                return string.Empty;
            }
            return string.Empty;
        }*/
    }
}
