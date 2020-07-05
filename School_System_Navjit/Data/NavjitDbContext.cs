using Microsoft.EntityFrameworkCore;
using School_System_Navjit.BussinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace School_System_Navjit.Data
{
    public class NavjitDbContext : DbContext
    {
        public NavjitDbContext(DbContextOptions<NavjitDbContext> options)
            : base(options)
        {
        }

        public DbSet<Course> Courses { get; set; }
        public DbSet<Department> Departments { get; set; }
        public DbSet<Student> Students { get; set; }
        public DbSet<StudentEnrollment> StudentEnrollments { get; set; }
    }
}
