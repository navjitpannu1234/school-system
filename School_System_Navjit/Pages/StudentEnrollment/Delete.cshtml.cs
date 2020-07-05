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
    public class DeleteModel : PageModel
    {
        private readonly School_System_Navjit.Data.NavjitDbContext _context;

        public DeleteModel(School_System_Navjit.Data.NavjitDbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public BussinessLayer.StudentEnrollment StudentEnrollment { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            StudentEnrollment = await _context.StudentEnrollments
                .Include(s => s.Course)
                .Include(s => s.Student).FirstOrDefaultAsync(m => m.Id == id);

            if (StudentEnrollment == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            StudentEnrollment = await _context.StudentEnrollments.FindAsync(id);

            if (StudentEnrollment != null)
            {
                _context.StudentEnrollments.Remove(StudentEnrollment);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
