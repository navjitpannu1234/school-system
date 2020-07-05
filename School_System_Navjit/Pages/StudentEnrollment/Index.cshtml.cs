using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using School_System_Navjit.BussinessLayer;
using School_System_Navjit.Data;

namespace School_System_Navjit.Pages.StudentEnrollment
{
    public class IndexModel : PageModel
    {
        private readonly School_System_Navjit.Data.NavjitDbContext _context;

        public IndexModel(School_System_Navjit.Data.NavjitDbContext context)
        {
            _context = context;
        }

        public IList<BussinessLayer.StudentEnrollment> StudentEnrollment { get;set; }

        public async Task OnGetAsync()
        {
            StudentEnrollment = await _context.StudentEnrollments
                .Include(s => s.Course)
                .Include(s => s.Student).ToListAsync();
        }
    }
}
