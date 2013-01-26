﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.Entity;
using System.Linq.Expressions;
using Cascade.Data.Models;
//Testing
namespace Cascade.Data.Repositories
{

    public abstract class RepositoryBase<T> where T : class
    {
        private DbContext dataContext;
        private readonly IDbSet<T> dbset;
        protected RepositoryBase(IDatabaseFactory databaseFactory)
        {
            DatabaseFactory = databaseFactory;
            dbset = DataContext.Set<T>();
        }

        protected IDatabaseFactory DatabaseFactory
        {
            get;
            private set;
        }

        protected DbContext DataContext
        {
            get { return dataContext ?? (dataContext = DatabaseFactory.Get()); }
        }
        public void Add(T entity)
        {
            dbset.Add(entity);
            dataContext.SaveChanges();
        }
        public void Update(T entity)
        {
            dbset.Attach(entity);
            dataContext.Entry(entity).State = EntityState.Modified;
            dataContext.SaveChanges();
        }
        public void Delete(T entity)
        {
            dbset.Remove(entity);
            dataContext.SaveChanges();
        }
        public void Delete(Expression<Func<T, bool>> where)
        {
            IEnumerable<T> objects = dbset.Where<T>(where).AsEnumerable();
            foreach (T obj in objects)
                dbset.Remove(obj);
        }
        public T GetById(long id)
        {
            return dbset.Find(id);
        }
        public T GetById(string id)
        {
            return dbset.Find(id);
        }
        public T GetById(int id)
        {
            return dbset.Find(id);
        }
        public IEnumerable<T> GetAll()
        {
            return dbset.ToList();
        }
        public IEnumerable<T> GetMany(Expression<Func<T, bool>> where)
        {
            return dbset.Where(where).ToList();
        }
        public T Get(Expression<Func<T, bool>> where)
        {
            return dbset.Where(where).FirstOrDefault<T>();
        }
    }
    public class ChartRepository : RepositoryBase<TBL_CHART>
    {
        public ChartRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public ChartRepository()
            : base(new DBFactory())
        {
        }
    }
    //Used for CRM - Company Module
    public class CompanyRepository : RepositoryBase<TBL_COMPANIES>
    {
        public CompanyRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public CompanyRepository()
            : base(new DBFactory())
        {
        }
    }
    
   

    #region Sup Tables
    //Used for SupTransCode
    public class SupTransCodeRepository : RepositoryBase<Sup_TransCode>
    {
        public SupTransCodeRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public SupTransCodeRepository() : base(new DBFactory())
        {
        }
    }
    //Used for SupCompany
    public class SupCompanyRepository : RepositoryBase<Sup_Company>
    {
        public SupCompanyRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public SupCompanyRepository() : base(new DBFactory())
        {
        }
    }
    //Used for SupPmtType
    public class SupPmtTypeRepository : RepositoryBase<Sup_PmtType>
    {
        public SupPmtTypeRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public SupPmtTypeRepository() : base(new DBFactory())
        {
        }
    }
    //Used for SupStatus
    public class SupStatusRepository : RepositoryBase<Sup_Status>
    {
        public SupStatusRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public SupStatusRepository() : base(new DBFactory())
        {
        }
    }
    //Used for SupTransSource
    public class SupTransSourceRepository : RepositoryBase<Sup_TransSource>
    {
        public SupTransSourceRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public SupTransSourceRepository() : base(new DBFactory())
        {
        }
    }
    public class SupReasonRepository : RepositoryBase<Sup_Reason>
    {
        public SupReasonRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public SupReasonRepository() : base(new DBFactory())
        {
        }
    }
    
    #endregion

    #region Port Tables
    //Used for Port Acq
    public class PortAcqRepository : RepositoryBase<Port_Acq>
    {
        public PortAcqRepository(IDatabaseFactory dbFactory)  : base(dbFactory)
        {
        }
        public PortAcqRepository() : base(new DBFactory())
        {
        }
    }
    //Used for Port DPS
    public class PortDPSRepository : RepositoryBase<Port_DPS>
    {
        public PortDPSRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public PortDPSRepository() : base(new DBFactory())
        {
        }
    }
    //Used for Port Media
    public class PortMediaRepository : RepositoryBase<Port_Media>
    {
        public PortMediaRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public PortMediaRepository() : base(new DBFactory())
        {
        }
    }
    //Used for Port Recall
    public class PortRecallRepository : RepositoryBase<Port_Recall>
    {
        public PortRecallRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public PortRecallRepository() : base(new DBFactory())
        {
        }
    }
    //Used for Port Trans
    public class PortTransRepository : RepositoryBase<Port_Trans>
    {
        public PortTransRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public PortTransRepository() : base(new DBFactory())
        {
        }
    }
    #endregion
    
    //Used for BockettCompany Table
    public class BockettCompanyRepository : RepositoryBase<Sup_BrockettCompanies>
    {
        public BockettCompanyRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public BockettCompanyRepository()
            : base(new DBFactory())
        {
        }
    }

    #region For Views
    //Used for Portfolio Cash Flow Report
    public class PortCashFlowRepository : RepositoryBase<vw_PortfolioCashFlow>
    {
        public PortCashFlowRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public PortCashFlowRepository() : base(new DBFactory())
        {
        }
    }
    //Used for Portfolio Cash Position Report
    public class PortCashPositionRepository : RepositoryBase<vw_PortfolioCashPosition>
    {
        public PortCashPositionRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public PortCashPositionRepository() : base(new DBFactory())
        {
        }
    }
    //Used for Collections Recon
    public class CollectionsReconRepository : RepositoryBase<vw_CollectionsRecon>
    {
        public CollectionsReconRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public CollectionsReconRepository() : base(new DBFactory())
        {
        }
    }
    //Used for Portfolio Summary
    public class PortfolioSummaryRepository : RepositoryBase<vw_PortfolioSummary>
    {
        public PortfolioSummaryRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public PortfolioSummaryRepository() : base(new DBFactory())
        {
        }
    }
    //Used for Portfolio Transactions
    public class PortfolioTransactionsRepository : RepositoryBase<vw_PortfolioTransactions>
    {
        public PortfolioTransactionsRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public PortfolioTransactionsRepository() : base(new DBFactory())
        {
        }
    }
    //Used for Add DPS check
    public class AddDPSCheckRepository : RepositoryBase<vw_AddDPSCheck>
    {
        public AddDPSCheckRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public AddDPSCheckRepository() : base(new DBFactory())
        {
        }
    }

    //Used for vwAccounts
    public class vwAccountRepository : RepositoryBase<vwAccount>
    {
        public vwAccountRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public vwAccountRepository() : base(new DBFactory())
        {
        }
    }


    


    //For Recall Data
    public class RecallDataRepository : RepositoryBase<MSI_vwRecallData>
    {
        public RecallDataRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public RecallDataRepository() : base(new DBFactory())
        {
        }
    }

    //Used Media Data - MSI
    public class MSIMediaFormRepository : RepositoryBase<MSI_MediaForm>
    {
        public MSIMediaFormRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public MSIMediaFormRepository()
            : base(new DBFactory())
        {
        }
    }


    //For Recall Data - MSI
    public class MSIRecallFormRepository : RepositoryBase<MSI_RecallForm>
    {
        public MSIRecallFormRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public MSIRecallFormRepository() : base(new DBFactory())
        {
        }
    }

    //For DPS Data - MSI
    public class MSIDPSFormDataRepository : RepositoryBase<MSI_DPSForm>
    {
        public MSIDPSFormDataRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public MSIDPSFormDataRepository() : base(new DBFactory())
        {
        }
    }


    //For Media Data
    public class MediaDataRepository : RepositoryBase<MSI_vwMediaData>
    {
        public MediaDataRepository(IDatabaseFactory dbFactory)  : base(dbFactory)
        {
        }
        public MediaDataRepository() : base(new DBFactory())
        {
        }
    }
    #endregion

    #region R Tables
    public class RProductCodeRepository : RepositoryBase<RPRODCDE>
    {
        public RProductCodeRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public RProductCodeRepository() : base(new DBFactory())
        {
        }
    }
    
    public class RAgencyRepository : RepositoryBase<RAGENCY>
    {
        public RAgencyRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public RAgencyRepository() : base(new DBFactory())
        {
        }
    }
    
    public class RTranCodeRepository : RepositoryBase<RTRANCDE>
    {
        public RTranCodeRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public RTranCodeRepository() : base(new DBFactory())
        {
        }
    }
        
    #endregion

    public class PeopleDataRepository : RepositoryBase<Tbl_People>
    {
        public PeopleDataRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public PeopleDataRepository() : base(new DBFactory())
        {
        }
    }

    public class MoneyDataRepository : RepositoryBase<Tbl_Money>
    {
        public MoneyDataRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public MoneyDataRepository() : base(new DBFactory())
        {
        }
    }
    
    public class SourceDataRepository : RepositoryBase<Tbl_Source>
    {
        public SourceDataRepository(IDatabaseFactory dbFactory) : base(dbFactory)
        {
        }
        public SourceDataRepository() : base(new DBFactory())
        {
        }
    }

    public class RACCOUNTRepository : RepositoryBase<RACCOUNT>
    {
        public RACCOUNTRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public RACCOUNTRepository()
            : base(new DBFactory())
        {
        }
    }

    public class ReSaleRestrictionRepository : RepositoryBase<MSI_ResaleRestriction>
    {
        public ReSaleRestrictionRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public ReSaleRestrictionRepository()
            : base(new DBFactory())
        {
        }
    }

    public class MSI_Port_Acq_OriginalRepository : RepositoryBase<MSI_Port_Acq_Original>
    {
        public MSI_Port_Acq_OriginalRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public MSI_Port_Acq_OriginalRepository()
            : base(new DBFactory())
        {
        }
    }
    public class MSI_Port_Acq_EditedRepository : RepositoryBase<MSI_Port_Acq_Edited>
    {
        public MSI_Port_Acq_EditedRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public MSI_Port_Acq_EditedRepository()
            : base(new DBFactory())
        {
        }
    }
}
