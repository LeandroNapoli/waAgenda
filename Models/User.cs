using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace waAgenda.Models
{
    public class User
    {
        public int IdUser { get; set; }
        public string NameUser { get; set; }
        public string EmailUser { get; set; }
        public string PhoneUser { get; set; }
        public int IdStatus { get; set; }
        public virtual Status Status { get; set; }

    }
}