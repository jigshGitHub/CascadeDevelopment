using System;
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

    //Used for Collections
    public class PortfolioRepository : RepositoryBase<TBL_Portfolio>
    {
        public PortfolioRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public PortfolioRepository()
            : base(new DBFactory())
        {
        }
    }
    
    //Used for States - Testing Purpose
    public class StateRepository : RepositoryBase<TBL_State>
    {
        public StateRepository(IDatabaseFactory dbFactory)  : base(dbFactory)
        {
        }
        public StateRepository() : base(new DBFactory())
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


}
