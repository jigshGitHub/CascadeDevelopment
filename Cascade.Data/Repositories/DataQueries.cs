using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cascade.Data.Models;
using System.Data.SqlClient;
namespace Cascade.Data.Repositories
{
    public class DataQueries
    {
        public IEnumerable<PortfolioPieRpt> GetPortfolioWorkStationDescription()
        {
            DBFactory db;
            SqlDataReader rdr;
            List<PortfolioPieRpt> data = null;
            try
            {
                db = new DBFactory();
                rdr = db.ExecuteReader("sp_PortfolioWorkStationDescriptionReport");
                data = new List<PortfolioPieRpt>();
                while(rdr.Read())
                {
                    data.Add(new PortfolioPieRpt { Count = rdr["Count"].ToString(), KeyText = rdr["WorkStatusDescription"].ToString() });
                }

            }
            catch (Exception ex)
            {
                throw new Exception("Exception in DataQueries.GetPortfolioWorkStationDescription:" + ex.Message);
            }
            return data.AsEnumerable<PortfolioPieRpt>();
        }

        public IEnumerable<PortfolioPieRpt> GetPortfolioOwner()
        {
            DBFactory db;
            SqlDataReader rdr;
            List<PortfolioPieRpt> data = null;
            try
            {
                db = new DBFactory();
                rdr = db.ExecuteReader("sp_PortfolioOwnerReport");
                data = new List<PortfolioPieRpt>();
                while (rdr.Read())
                {
                    data.Add(new PortfolioPieRpt { Count = rdr["Count"].ToString(), KeyText = rdr["PortfolioOwner"].ToString() });
                }

            }
            catch (Exception ex)
            {
                throw new Exception("Exception in DataQueries.GetPortfolioOwner:" + ex.Message);
            }
            return data.AsEnumerable<PortfolioPieRpt>();
        }

        public IQueryable<SearchResult> GetSearchResults(string name)
        {
            DBFactory db;
            SqlDataReader rdr;
            List<SearchResult> data = null;
            try
            {
                db = new DBFactory();
                rdr = db.ExecuteReader("MSI_spBasicSearch", new SqlParameter("@name", name));
                data = new List<SearchResult>();
                SearchResult record;
                while (rdr.Read())
                {
                    record = new SearchResult();

                    CreateSearchResult(rdr, record);

                    data.Add(record);
                }

            }
            catch (Exception ex)
            {
                throw new Exception("Exception in DataQueries.GetSearchResults:" + ex.Message);
            }
            return data.AsQueryable<SearchResult>();
        }

        public IQueryable<SearchResult> GetSearchResults(string account, string originator, string seller, string _4digitsSSN)
        {
            DBFactory db;
            SqlDataReader rdr;
            List<SearchResult> data = null;
            object _account, _originator, _seller, __4digitsSSN = null;
            if (string.IsNullOrEmpty(account))
                _account = DBNull.Value;
            else
                _account = account;
            if (string.IsNullOrEmpty(originator))
                _originator = DBNull.Value;
            else
                _originator = originator;
            if (string.IsNullOrEmpty(seller))
                _seller = DBNull.Value;
            else
                _seller = seller;
            if (string.IsNullOrEmpty(_4digitsSSN))
                __4digitsSSN = DBNull.Value;
            else
                __4digitsSSN = _4digitsSSN;

            try
            {
                db = new DBFactory();
                rdr = db.ExecuteReader("MSI_spAdvanceSearch",
                    new SqlParameter("@accountNumber", _account),
                    new SqlParameter("@originator", _originator),
                    new SqlParameter("@seller", _seller),
                    new SqlParameter("@ssnFourDigits", __4digitsSSN));
                data = new List<SearchResult>();
                SearchResult record;
                while (rdr.Read())
                {
                    record = new SearchResult();

                    CreateSearchResult(rdr, record);

                    data.Add(record);
                }

            }
            catch (Exception ex)
            {
                throw new Exception("Exception in DataQueries.GetSearchResults:" + ex.Message);
            }
            return data.AsQueryable<SearchResult>();
        }

        private void CreateSearchResult(SqlDataReader rdr, SearchResult record)
        {
            try
            {
                record.Name = rdr["Name"].ToString();
                record.ProductDescription = rdr["ProductDescription"].ToString();
                record.WorkStatusDescription = rdr["WorkStatusDescription"].ToString();
                record.RespAgency = rdr["RespAgency"].ToString();
                record.StatusDescription = rdr["StatusDescription"].ToString();
                record.ACCOUNT = rdr["ACCOUNT"].ToString();
                record.Originator = rdr["Originator"].ToString();
                record.Seller = rdr["Seller"].ToString();
            }
            catch (Exception ex)
            {
                throw new Exception("Exception in DataQueries.CreateSearchResult:" + ex.Message);
            }

        }

        public MSI_Port_Acq_Original GetPortfolioPurchaseSummary(string productCode)
        {
            MSI_Port_Acq_Original portfolio = null;
            DBFactory db;
            System.Data.DataSet ds;
            System.Data.DataRow dr;
            try
            {
                portfolio = new MSI_Port_Acq_Original();
                db = new DBFactory();
                ds = db.ExecuteDataset("sp_GetPortfolioPurchaseSummary", "PurchaseSummary", new SqlParameter("@productCode", productCode));

                dr = ds.Tables["PurchaseSummary"].Rows[0];
                portfolio.Portfolio_ = dr["Portfolio#"].ToString();
                portfolio.Company = dr["Company"].ToString();
                portfolio.Seller = dr["Seller"].ToString();
                portfolio.CostBasis = Convert.ToDouble(dr["CostBasis"].ToString());
                portfolio.Face = Convert.ToDecimal(dr["Face"].ToString());
                portfolio.Cut_OffDate = DateTime.Parse(dr["Cut-OffDate"].ToString());
                portfolio.C_ofAccts = Convert.ToDouble(dr["#ofAccts"].ToString());
                portfolio.PurchasePrice = Convert.ToDecimal(dr["PurchasePrice"].ToString());
                DateTime closingDate;
                if(DateTime.TryParse(dr["ClosingDate"].ToString(),out closingDate))
                    portfolio.ClosingDate = closingDate;
                portfolio.Lender_FileDescription = dr["Lender/FileDescription"].ToString();
                int putbackTermDays;
                if (int.TryParse(dr["PutBackTerm"].ToString(), out putbackTermDays))
                    portfolio.PutbackTerm__days_ = putbackTermDays;
                DateTime putbackDeadLine;
                if(DateTime.TryParse(dr["PutbackDeadLine"].ToString(),out putbackDeadLine))
                    portfolio.PutbackDeadline = putbackDeadLine;
                portfolio.Notes = dr["Notes"].ToString();
                int resaleId;
                if (int.TryParse(dr["ResaleRestrictionId"].ToString(), out resaleId))
                    portfolio.ResaleRestrictionId = resaleId;

            }
            catch (Exception ex)
            {
            }
            return portfolio;
        }
    }
}
