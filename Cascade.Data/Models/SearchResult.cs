﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cascade.Data.Models
{
    public class SearchResult
    {
        public string Name;
        public string ProductDescription;
        public string WorkStatusDescription;
        public string RespAgency;
        public string StatusDescription;
        public string DIVISION_ID;
        public string ACCOUNT;
        public string PrimaryAccount;
        public string InvoiceID;
        public string ToolSetID;
        public string WorkStatusID;
        public string DateWorked;
        public string DEBT_TYPE;
        public string PRODUCT_CODE;
        public string BRANCH_NUMBER;
        public string CREDIT_LIMIT;
        public string CONTRACT_DATE;
        public string INT_RATE_CODE;
        public string INT_START_DATE;
        public string CYCLE_CODE;
        public string LAST_POST_DATE;
        public string CHGOFF_DATE;
        public string CHGOFF_RSN_CODE;
        public string CHGOFF_PRINCPAL;
        public string CHGOFF_INTEREST;
        public string CHGOFF_OTH_AMTS;
        public string REASON_INTO_COL;
        public string FIRST_PAY_DEFAULT;
        public string CYCLES_DELQ;
        public string LAST_PAY_DATE;
        public string LAST_CONT_DATE;
        public string LAST_NOTE_DATE;
        public string LAST_NOTE_CODE;
        public string Transfer_By;
        public string Previous_Responsibility;
        public string Previous_Date_Placed;
        public string RESPONSIBILITY;
        public string RESP_TYPE;
        public string STATUS;
        public string Status_Change_Date;
        public string Previous_Status;
        public string Previous_Status_Date;
        public string ALLOC_CODE;
        public string TOT_CHARGES;
        public string TOT_PRINCIPAL;
        public string TOT_INTEREST;
        public string TOT_COST;
        public string TOT_OTHER;
        public string TOT_NUM_PMTS;
        public string TOT_PTD;
        public string TOT_PRIN_PTD;
        public string TOT_INT_PTD;
        public string TOT_COST_PTD;
        public string TOT_OTH_INC_PTD;
        public string TOT_DELQ_AMT;
        public string TOT_DUE_AMT;
        public string TOT_PRIN_DUE;
        public string TOT_INT_DUE;
        public string TOT_COSTS_DUE;
        public string TOT_OTHER_DUE;
        public string SETTLE_ALLOW;
        public string TOT_NSF_AMT;
        public string NUM_NSF_PMNTS;
        public string DATE_LAST_NSF;
        public string LAST_NSF_AMT;
        public string FRST_PMT_DATE;
        public string FIRST_PMT_AMOUNT;
        public string NEXT_CYCLE;
        public string CALL_ATMPS_CONT;
        public string WKDY_CALL_ATMPS;
        public string WKNT_CALL_ATMPS;
        public string WKND_CALL_ATMPS;
        public string PLACEMENT_CODE;
        public string DATE_SENT_AGENCY;
        public string DATE_LAST_RECALL;
        public string BAD_PHONE_FLAG;
        public string BAD_ADDR_FLAG;
        public string HOME_OWN_FLAG;
        public string HOLD_FLAG;
        public string FIRST_CONT_FLAG;
        public string LAST_CALL_NUM;
        public string LAST_CALL_DATE;
        public string LAST_CALL_TIME;
        public string LAST_CALL_RESULT;
        public string LAST_CALL_STATUS;
        public string LAST_LETTER_GENERATED;
        public string LAST_LETTER_GENERATED_DATE;
        public string LAST_LETTER_PRINTED;
        public string LAST_LETTER_PRINTED_DATE;
        public string HEADER_NOTE;
        public string UPDATE_DATE;
        public string UPDATE_TYPE;
        public string UPDATE_ID;
        public string FLAGS;
        public string LAST_PMT_AMT;
        public string REPORT_TO_BUREAU;
        public string BUR_UPDATE_DATE;
        public string BUR_UPDATE_TIME;
        public string BUR_STATUS;
        public string BUR_DISPUTE_STATUS;
        public string BUR_BKT_STATUS;
        public string BUR_SPECIAL_STATUS;
        public string BUR_STATUS_DATE;
        public string SCORE_STRATEGY;
        public string CREDIT_SCORE;
        public string BEHAVIOR_SCORE;
        public string PurchaseDate;
        public string PutbackDeadline;
        public string Putback;
        public string PutbackDate;
        public string SoldTo;
        public string Sold;
        public string SoldDate;
        public string Buyback;
        public string BuybackDate;
        public string PreviousOwner;
        public string PreviousAcct;
        public string OriginalBalance;
        public string OriginalPrincipal;
        public string OriginalInterest;
        public string Originator;
        public string OriginalAccount;
        public string oLastPayDate;
        public string oLastPayAmt;
        public string Client;
        public string ClientAccount;
        public string cLastPayDate;
        public string cLastPayAmt;
        public string Commission;
        public string Seller;
        public string SellerAccount;
        public string sLastPayDate;
        public string sLastPayAmt;
        public string Bankrupt;
        public string POE;
        public string Stage;
        public string Legal;
        public string LegalReject;
        public string PreLegalReject;
        public string Note;
        public string RetailVendor;
        public string WIP;
        public string WIPDate;
        public string PortfolioID;
        public string User1;
        public string User2;
        public string User3;
        public string User4;
        public string User5;
        public string User6;
        public string User7;
        public string User8;
        public string User9;
        public string User10;
        public string LastChargeDate;
        public string LastChargeAmt;
        public string DateOfOccur;
        public string YearsSinceLastActivity;
        public string CreateDate;
        public string FileID;
        public string LastCashAdvance;
        public string LastCashAdvanceAmt;
        public string LastPDCDate;
        public string LastPDCAmount;
        public string insight_score;
        public string FieldParse;
        public string Archive;
        public string Purge;
        public string MonthlyPayment;
        public string Terms;
        public string MatureDate;
        public string ScriptID;
        public string StartingPayments;
        public string StartingPaymentAmount;
        public string PaymentPlanDate;
        public string LAST_LETTER_CODE;
        public string LAST_LETTER_DATE;
        public string MEDIA_FLAG;
        public string OriginalInterestDate;
        public string ClientID;
        public string CollectorCommission;
        public string User11;
        public string User12;
        public string User13;
        public string User14;
        public string User15;
        public string User16;
        public string User17;
        public string User18;
        public string User19;
        public string User20;
        public string LastCCDDate;
        public string LastCCDAmount;
        public string LastPRMDate;
        public string LastPRMAmount;
        public string DateLastPRMEntered;
        public string FileNo;
        public string Forw_File;
        public string Masco_File;
        public string Forw_ID;
        public string Firm_ID;
        public string AssignDate;
        public string CheckFeeType;
        public string CreditCardFeeType;
        public string CheckFee;
        public string CreditCardFee;
        public string Claim_Date;
        public string Law_List;
        public string sFee;
        public string Rate_Pre;
        public string Rates_Post;
        public string CreditorName;
        public string CreditorName2;
        public string CreditorStreet;
        public string CreditorCS;
        public string CreditorZip;
        public string Debt_Bal;
        public string Debtor_No;
        public string Batch_No;
        public string SOL_Date;
        public string TU_Score;
        public string PimsLoadDate;
        public string Closed;
        public string DateClosed;
        public string LastTranCode;
        public string LastTranSource;
        public string LastReturnCode;
        public string AnnualRateCodeID;
        public string LastMediaAttachDate;
        public string StatuteTypeID;
        public string RestrictedAccount;
        public string Previous_WorkStatusID;
        public string WorkStatusID_ChangeDate;
        public string WorkStatusID_UpdateID;
        public string CitationCount;
        public string DONOTACH;
        public string Liquidation;
        public string AgencyAccount;
        public string PurchasePrice;
        public string SalesPrice;
        public SearchResult()
        {
        }
    }
}