using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using School_System_Navjit.BussinessLayer;
using School_System_Navjit.Data;

namespace School_System_Navjit.Pages.StudentEnrollment
{
    public class CreateModel : PageModel
    {
        private readonly School_System_Navjit.Data.NavjitDbContext _context;

        public CreateModel(School_System_Navjit.Data.NavjitDbContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
        ViewData["CourseId"] = new SelectList(_context.Courses, "Id", "Name");
        ViewData["StudentId"] = new SelectList(_context.Students, "Id", "FirstName");
            return Page();
        }

        [BindProperty]
        public BussinessLayer.StudentEnrollment StudentEnrollment { get; set; }

        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.StudentEnrollments.Add(StudentEnrollment);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
