﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Cascade.Data.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class CascadeDBEntities : DbContext
    {
        public CascadeDBEntities()
            : base("name=CascadeDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Port_Acq> Port_Acq { get; set; }
        public DbSet<Port_DPS> Port_DPS { get; set; }
        public DbSet<Port_Media> Port_Media { get; set; }
        public DbSet<Port_Recall> Port_Recall { get; set; }
        public DbSet<Port_Trans> Port_Trans { get; set; }
        public DbSet<Sup_Company> Sup_Company { get; set; }
        public DbSet<Sup_PmtType> Sup_PmtType { get; set; }
        public DbSet<Sup_Status> Sup_Status { get; set; }
        public DbSet<Sup_TransCode> Sup_TransCode { get; set; }
        public DbSet<Sup_TransSource> Sup_TransSource { get; set; }
        public DbSet<TBL_CHART> TBL_CHART { get; set; }
        public DbSet<TBL_COMPANIES> TBL_COMPANIES { get; set; }
        public DbSet<TBL_Portfolio> TBL_Portfolio { get; set; }
        public DbSet<TBL_State> TBL_State { get; set; }
    }
}
