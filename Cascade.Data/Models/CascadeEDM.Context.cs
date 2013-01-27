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
    
        public DbSet<AccountActivity> AccountActivities { get; set; }
        public DbSet<AccountPaymentPlan> AccountPaymentPlans { get; set; }
        public DbSet<AccountStatute> AccountStatutes { get; set; }
        public DbSet<aspnet_Applications> aspnet_Applications { get; set; }
        public DbSet<aspnet_Membership> aspnet_Membership { get; set; }
        public DbSet<aspnet_Paths> aspnet_Paths { get; set; }
        public DbSet<aspnet_PersonalizationAllUsers> aspnet_PersonalizationAllUsers { get; set; }
        public DbSet<aspnet_PersonalizationPerUser> aspnet_PersonalizationPerUser { get; set; }
        public DbSet<aspnet_Profile> aspnet_Profile { get; set; }
        public DbSet<aspnet_Roles> aspnet_Roles { get; set; }
        public DbSet<aspnet_SchemaVersions> aspnet_SchemaVersions { get; set; }
        public DbSet<aspnet_Users> aspnet_Users { get; set; }
        public DbSet<aspnet_WebEvent_Events> aspnet_WebEvent_Events { get; set; }
        public DbSet<CBA> CBAs { get; set; }
        public DbSet<CBRAccountStatu> CBRAccountStatus { get; set; }
        public DbSet<CBRBankruptStatu> CBRBankruptStatus { get; set; }
        public DbSet<CBRDisputeStatu> CBRDisputeStatus { get; set; }
        public DbSet<CBRSpecialStatu> CBRSpecialStatus { get; set; }
        public DbSet<Client> Clients { get; set; }
        public DbSet<DebtorsEmployer> DebtorsEmployers { get; set; }
        public DbSet<DebtorsVehicle> DebtorsVehicles { get; set; }
        public DbSet<Division> Divisions { get; set; }
        public DbSet<Industry> Industries { get; set; }
        public DbSet<LastCallResult> LastCallResults { get; set; }
        public DbSet<MSI_DPSForm> MSI_DPSForm { get; set; }
        public DbSet<MSI_MediaForm> MSI_MediaForm { get; set; }
        public DbSet<MSI_Port_Acq_Edited> MSI_Port_Acq_Edited { get; set; }
        public DbSet<MSI_Port_Acq_Original> MSI_Port_Acq_Original { get; set; }
        public DbSet<MSI_Port_SalesTrans_Edited> MSI_Port_SalesTrans_Edited { get; set; }
        public DbSet<MSI_Port_SalesTrans_Original> MSI_Port_SalesTrans_Original { get; set; }
        public DbSet<MSI_RecallForm> MSI_RecallForm { get; set; }
        public DbSet<MSI_ResaleRestriction> MSI_ResaleRestriction { get; set; }
        public DbSet<PaperType> PaperTypes { get; set; }
        public DbSet<Port_Acq> Port_Acq { get; set; }
        public DbSet<Port_DPS> Port_DPS { get; set; }
        public DbSet<Port_Media> Port_Media { get; set; }
        public DbSet<Port_Recall> Port_Recall { get; set; }
        public DbSet<Port_Trans> Port_Trans { get; set; }
        public DbSet<RACCBKRP> RACCBKRPs { get; set; }
        public DbSet<RACCOUNT> RACCOUNTs { get; set; }
        public DbSet<RACCTLGL> RACCTLGLs { get; set; }
        public DbSet<RACCTREL> RACCTRELs { get; set; }
        public DbSet<RACTPLAC> RACTPLACs { get; set; }
        public DbSet<RAGENCY> RAGENCies { get; set; }
        public DbSet<recallmaster> recallmasters { get; set; }
        public DbSet<ResponsibilityType> ResponsibilityTypes { get; set; }
        public DbSet<RFINTRAN> RFINTRANs { get; set; }
        public DbSet<RINTRATE> RINTRATEs { get; set; }
        public DbSet<RPRODCDE> RPRODCDEs { get; set; }
        public DbSet<RSTATU> RSTATUS { get; set; }
        public DbSet<RTRANCDE> RTRANCDEs { get; set; }
        public DbSet<Score> Scores { get; set; }
        public DbSet<Segment> Segments { get; set; }
        public DbSet<SegmentType> SegmentTypes { get; set; }
        public DbSet<SettlementRequest> SettlementRequests { get; set; }
        public DbSet<StatusType> StatusTypes { get; set; }
        public DbSet<StatuteType> StatuteTypes { get; set; }
        public DbSet<Sup_BrockettCompanies> Sup_BrockettCompanies { get; set; }
        public DbSet<Sup_Company> Sup_Company { get; set; }
        public DbSet<Sup_PmtType> Sup_PmtType { get; set; }
        public DbSet<Sup_Reason> Sup_Reason { get; set; }
        public DbSet<Sup_Status> Sup_Status { get; set; }
        public DbSet<Sup_TransCode> Sup_TransCode { get; set; }
        public DbSet<Sup_TransSource> Sup_TransSource { get; set; }
        public DbSet<Sup_UploadDPS> Sup_UploadDPS { get; set; }
        public DbSet<Sup_UploadRecalls> Sup_UploadRecalls { get; set; }
        public DbSet<Surname> Surnames { get; set; }
        public DbSet<TaskCategory> TaskCategories { get; set; }
        public DbSet<Tbl_Categories> Tbl_Categories { get; set; }
        public DbSet<TBL_CHART> TBL_CHART { get; set; }
        public DbSet<TBL_COMPANIES> TBL_COMPANIES { get; set; }
        public DbSet<Tbl_Expense> Tbl_Expense { get; set; }
        public DbSet<Tbl_ExpenseDetails> Tbl_ExpenseDetails { get; set; }
        public DbSet<Tbl_ExpenseDetailsUpdated> Tbl_ExpenseDetailsUpdated { get; set; }
        public DbSet<Tbl_Money> Tbl_Money { get; set; }
        public DbSet<Tbl_People> Tbl_People { get; set; }
        public DbSet<TBL_Portfolio> TBL_Portfolio { get; set; }
        public DbSet<Tbl_Source> Tbl_Source { get; set; }
        public DbSet<TBL_State> TBL_State { get; set; }
        public DbSet<tblIRR> tblIRRs { get; set; }
        public DbSet<TimeZone> TimeZones { get; set; }
        public DbSet<TOT_CALL_ATMPS> TOT_CALL_ATMPS { get; set; }
        public DbSet<TOT_CALL_COST> TOT_CALL_COST { get; set; }
        public DbSet<TOT_CALL_DURATION> TOT_CALL_DURATION { get; set; }
        public DbSet<WKDY_CALL_ATMPS> WKDY_CALL_ATMPS { get; set; }
        public DbSet<WKND_CALL_ATMPS> WKND_CALL_ATMPS { get; set; }
        public DbSet<WorkStatu> WorkStatus { get; set; }
        public DbSet<MSI_vwMediaData> MSI_vwMediaData { get; set; }
        public DbSet<MSI_vwPurchases> MSI_vwPurchases { get; set; }
        public DbSet<MSI_vwRecallData> MSI_vwRecallData { get; set; }
        public DbSet<MSI_vwSales> MSI_vwSales { get; set; }
        public DbSet<MSI_vwSearch> MSI_vwSearch { get; set; }
        public DbSet<vw_AddDPSCheck> vw_AddDPSCheck { get; set; }
        public DbSet<vw_CollectionsRecon> vw_CollectionsRecon { get; set; }
        public DbSet<vw_PortfolioCashFlow> vw_PortfolioCashFlow { get; set; }
        public DbSet<vw_PortfolioCashPosition> vw_PortfolioCashPosition { get; set; }
        public DbSet<vw_PortfolioSummary> vw_PortfolioSummary { get; set; }
        public DbSet<vw_PortfolioTransactions> vw_PortfolioTransactions { get; set; }
        public DbSet<vw_QueryIRR> vw_QueryIRR { get; set; }
        public DbSet<vw_QueryPortCashPosSum> vw_QueryPortCashPosSum { get; set; }
        public DbSet<vwAccount> vwAccounts { get; set; }
        public DbSet<vwBankruptData> vwBankruptDatas { get; set; }
        public DbSet<vwCoDebtor> vwCoDebtors { get; set; }
        public DbSet<vwDebtor> vwDebtors { get; set; }
        public DbSet<vwFinancialTransaction> vwFinancialTransactions { get; set; }
    }
}
