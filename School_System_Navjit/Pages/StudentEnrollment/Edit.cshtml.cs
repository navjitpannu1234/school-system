using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using School_System_Navjit.BussinessLayer;
using School_System_Navjit.Data;

namespace School_System_Navjit.Pages.StudentEnrollment
{
    public class EditModel : PageModel
    {
        private readonly School_System_Navjit.Data.NavjitDbContext _context;

        public EditModel(School_System_Navjit.Data.NavjitDbContext context)
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
           ViewData["CourseId"] = new SelectList(_context.Courses, "Id", "Name");
           ViewData["StudentId"] = new SelectList(_context.Students, "Id", "FirstName");
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(StudentEnrollment).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!StudentEnrollmentExists(StudentEnrollment.Id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool StudentEnrollmentExists(int id)
        {
            return _context.StudentEnrollments.Any(e => e.Id == id);
        }
    }
}
