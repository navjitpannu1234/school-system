using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace School_System_Navjit.BussinessLayer
{
    public class Department
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string HeadName { get; set; }

        public virtual ICollection<Course> Courses { get; set; }
    }
}
