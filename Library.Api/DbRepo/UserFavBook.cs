//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Library.Api.DbRepo
{
    using System;
    using System.Collections.Generic;
    
    public partial class UserFavBook
    {
        public int UserBookCode { get; set; }
        public int UserID { get; set; }
        public int BookID { get; set; }
    
        public virtual User User { get; set; }
        public virtual UserBook UserBook { get; set; }
    }
}
