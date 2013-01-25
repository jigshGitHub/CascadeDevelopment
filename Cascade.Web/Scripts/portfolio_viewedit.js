var portfolioViewModels = namespace("cascade.viewModels.portfolio");
function allCommentedCode() {
    //function interestRecord(id, portfolioNumber, agencyName, checkNumber, closingDt, salesPrice, transType) {
    //    this.id = id;
    //    this.portfolioNumber = ko.observable(portfolioNumber);
    //    this.agencyName = ko.observable(agencyName);
    //    this.checkNumber = ko.observable(checkNumber);
    //    this.closingDt = ko.observable(closingDt);
    //    this.salesPrice = ko.observable(salesPrice);
    //    this.interestTransType = ko.observable(transType);
    //};

    //function interestTransVM() {
    //    var self = this;
    //    self.portfolioNumber = ko.observable();
    //    self.editMode = ko.observable(false);
    //    self.interestRecords = ko.computed(function () {
    //        var interestRecords = [];
    //        if (self.portfolioNumber() != '') {
    //            $.ajax({
    //                url: baseUrl + '/api/PortfolioTransactions/',
    //                type: 'GET',
    //                contentType: 'application/json',
    //                data: { portfolioNumber: self.portfolioNumber(), transType: 'Interest' },
    //                dataType: 'json',
    //                async: false,
    //                success: function (data) {
    //                    if (data.length > 0) {
    //                        $.each(data, function (i, item) {
    //                            interestRecords.push(new interestRecord(item.ID, item.Portfolio_,
    //                                item.Inv_AgencyName,item.Check_,
    //                                dateFormat(Date.parse(item.ClosingDate), 'mm/dd/yyyy'),
    //                                formatCurrency(item.SalesPrice),
    //                                item.TransType));
    //                        });
    //                    }
    //                    else {
    //                        interestRecords.push(new interestRecord('', '', '', '', '', '',''));
    //                    }
    //                },
    //                error: function (xhr, status, somthing) {
    //                    log(status);
    //                }
    //            });
    //        }
    //        return interestRecords;
    //    }, self);
    //    self.currentRecordIndex = ko.observable(0);
    //    self.selectedRecordIndexChanged = function (item) {
    //        self.currentInterestRecord(item);
    //        $.each(self.agencies(), function (i, agencyRecord) {
    //            if(agencyRecord.Text === item.agencyName())
    //                self.selectedAgency(agencyRecord.Value);
    //        });
    //    };
    //    self.selectedAgency = ko.observable();
    //    self.currentInterestRecord = ko.observable();
    //    self.agencies = ko.observableArray([]);
    //    self.interestTransTypes = [{ Text: 'Sale', Value: 'Sale' }, { Text: 'Collection', Value: 'Collection' }, { Text: 'Distribution', Value: 'Distribution' }, { Text: 'Interest', Value: 'Interest' }, { Text: 'Investment', Value: 'Investment' }];
    //    self.totalInterest = ko.computed(function () {
    //        var salesTotal = 0;
    //        var val;
    //        $.each(self.interestRecords(), function (i, item) {
    //            val = item.salesPrice().replace(/[^0-9.]/ig, '');
    //            salesTotal += parseFloat(val) || 0;
    //        });
    //        return formatCurrency(salesTotal);
    //    }, self);
    //    $.each(portfolioViewModels.agencies(), function (i, item) {
    //        self.agencies.push(item);
    //    });

    //    self.saveRecord = function () {
    //        //log(self.currentInterestRecord().faceValue());
    //        //log(self.currentInterestRecord().netColls());
    //        //log(self.currentInterestRecord().closingDt());
    //        //log(self.currentInterestRecord().interestAgencyName());
    //        //log(self.currentInterestRecord().id);
    //        //log(self.selectedAgency());
    //        var agency = '';
    //        $.each(self.agencies(), function (i, agencyRecord) {
    //            if (agencyRecord.Value === self.selectedAgency())
    //                agency = agencyRecord.Text;
    //        });
    //        log(agency);
    //        var json = JSON.stringify({
    //            SalesPrice: self.currentInterestRecord().salesPrice().replace(/[^0-9.]/ig, ''),
    //            ClosingDate: self.currentInterestRecord().closingDt(),
    //            Inv_AgencyName: agency,
    //            Check_:self.currentInterestRecord().checkNumber(),
    //            ID: self.currentInterestRecord().id,
    //            TransType: 'Interest'
    //        });

    //        $.ajax({
    //            url: baseUrl + '/api/PortfolioTransactions/',
    //            type: "POST",
    //            data: json,
    //            dataType: "json",
    //            contentType: "application/json; charset=utf-8",
    //            success: function (response) {
    //                log(response);
    //            },
    //            error: function (response, errorText) {
    //            }
    //        });
    //    }

    //};

    //function distributionRecord(id,portfolioNumber,investor,checkNumber,closingDt,distributionTransType,distribution,notes) {
    //    this.id = id,
    //    this.portfolioNumber = ko.observable(portfolioNumber);
    //    this.investor = ko.observable(investor);
    //    this.checkNumber = ko.observable(checkNumber);
    //    this.closingDt = ko.observable(closingDt);
    //    this.distributionTransType = ko.observable(distributionTransType);
    //    this.distribution = ko.observable(distribution);
    //    this.notes = ko.observable(notes);
    //}
    //function distributionsTransVM(portfolioNumber) {
    //    var self = this;
    //    self.portfolioNumber = ko.observable(portfolioNumber);
    //    self.totalDistributions = ko.observable('');
    //    self.distributionRecords = ko.computed(function () {
    //        var distributionRecords = [];
    //        var totalDistributions = 0;
    //        if (self.portfolioNumber() != '') {
    //            $.ajax({
    //                url: baseUrl + '/api/PortfolioTransactions/',
    //                type: 'GET',
    //                contentType: 'application/json',
    //                data: { portfolioNumber: self.portfolioNumber(), transType: 'Distribution' },
    //                dataType: 'json',
    //                async: false,
    //                success: function (data) {
    //                    if (data.length > 0) {
    //                        self.currentRecordIndex(0);
    //                        $.each(data, function (i, item) {
    //                            totalDistributions += item.SalesPrice;
    //                            distributionRecords.push(new distributionRecord(item.ID,self.portfolioNumber(),item.Inv_AgencyName,item.Check_,item.ClosingDate,item.TransType,formatCurrency(item.SalesPrice),item.Notes));
    //                        });
    //                    }
    //                },
    //                error: function (xhr, status, somthing) {
    //                    log(status);
    //                }
    //            });
    //        }
    //        self.totalDistributions(formatCurrency(totalDistributions));
    //        return distributionRecords;
    //    }, self);
    //    self.currentRecordIndex = ko.observable(0);
    //    self.currentDistributionRecord = ko.computed(function () {
    //        if (self.distributionRecords().length > 0)
    //            return self.distributionRecords()[self.currentRecordIndex()];
    //        else
    //            return new distributionRecord('', '', '', '', '', '', '','');
    //    }, self);
    //    self.investorName = ko.observable('');
    //    self.investors = ko.observableArray([]);
    //    $.each(portfolioViewModels.investors(), function (i, item) {
    //        self.investors.push(item);
    //    });
    //    self.distributionTransTypes = [{ Text: 'Sale', Value: 'Sale' }, { Text: 'Collection', Value: 'Collection' }, { Text: 'Distribution', Value: 'Distribution' }, { Text: 'Interest', Value: 'Interest' }, { Text: 'Investment', Value: 'Investment' }];
    //    self.visibleNext = ko.computed(function () {
    //        if (self.currentRecordIndex() + 1 != self.distributionRecords().length && self.distributionRecords().length > 1)
    //            return true;
    //        else
    //            return false;
    //    }, self);
    //    self.visiblePrevious = ko.computed(function () {
    //        if (self.currentRecordIndex() + 1 > 1 && self.distributionRecords().length > 1)
    //            return true;
    //        else
    //            return false;
    //    }, self);

    //    self.recordCounts = ko.computed(function () {
    //        return 'Records ' + (self.currentRecordIndex() + 1) + ' of ' + self.distributionRecords().length;
    //    }, self);

    //    self.nextRecord = function () {
    //        self.currentRecordIndex(self.currentRecordIndex() + 1);
    //    }
    //    self.previousRecord = function () {
    //        self.currentRecordIndex(self.currentRecordIndex() - 1);
    //    }
    //    self.saveRecord = function () {
    //        //log(self.currentdistributionRecord().contribution() + ',' + self.currentdistributionRecord().investor());
    //        var json = JSON.stringify({
    //            Check_:self.currentDistributionRecord().checkNumber(),
    //            SalesPrice: self.currentDistributionRecord().distribution().replace(/[^0-9.]/ig, ''),
    //            Notes: self.currentDistributionRecord().notes(),
    //            ID: self.currentDistributionRecord().id,
    //            Inv_AgencyName: self.currentDistributionRecord().investor(),
    //            ClosingDate:self.currentDistributionRecord().closingDt(),
    //            TransType: 'Distribution'
    //        });

    //        $.ajax({
    //            url: baseUrl + '/api/PortfolioTransactions/',
    //            type: "POST",
    //            data: json,
    //            dataType: "json",
    //            contentType: "application/json; charset=utf-8",
    //            success: function (response) {
    //                log(response);
    //            },
    //            error: function (response, errorText) {
    //            }
    //        });
    //    }
    //};

    //function investmentRecord(id, portfolioNumber, investor, prftShareBfr, prftShareAftr, contribution, interestRate, investmentTransType, notes) {
    //    this.id = id;
    //    this.portfolioNumber = ko.observable(portfolioNumber);
    //    this.investor = ko.observable(investor);
    //    this.prftShareBfr = ko.observable(prftShareBfr);
    //    this.prftShareAftr = ko.observable(prftShareAftr);
    //    this.contribution = ko.observable(contribution);
    //    this.interestRate = ko.observable(interestRate);
    //    this.investmentTransType = ko.observable(investmentTransType);
    //    this.notes = ko.observable(notes);
    //}

    //function investmentsTransVM(portfolioNumber) {
    //    var self = this;
    //    self.portfolioNumber = ko.observable('');
    //    self.totalContributions = ko.observable('');
    //    self.investmentRecords = ko.computed(function () {
    //        var investmentRecords = [];
    //        var totalContributions = 0;
    //        if (self.portfolioNumber() != '') {
    //            $.ajax({
    //                url: baseUrl + '/api/PortfolioTransactions/',
    //                type: 'GET',
    //                contentType: 'application/json',
    //                data: { portfolioNumber: self.portfolioNumber(), transType: 'Investment' },
    //                dataType: 'json',
    //                async: false,
    //                success: function (data) {
    //                    //log(data);
    //                    if (data.length > 0) {
    //                        self.currentRecordIndex(0);
    //                        $.each(data, function (i, item) {
    //                            totalContributions += item.SalesPrice;
    //                            investmentRecords.push(new investmentRecord(item.ID, self.portfolioNumber(), item.Inv_AgencyName, item.ProfitShare_before, item.ProfitShare_after,formatCurrency(item.SalesPrice), item.C_Interest, item.TransType,item.Notes));
    //                        });
    //                    }
    //                },
    //                error: function (xhr, status, somthing) {
    //                    log(status);
    //                }
    //            });
    //        }
    //        self.totalContributions(formatCurrency(totalContributions));
    //        return investmentRecords;
    //    }, self);
    //    self.currentRecordIndex = ko.observable(0);
    //    self.currentInvestmentRecord = ko.computed(function () {
    //        if (self.investmentRecords.length > 0)
    //            return self.investmentRecords()[self.currentRecordIndex()];
    //        else
    //            return new investmentRecord('', '', '', '','','', '', '','');
    //    }, self);

    //    self.investors = ko.observableArray([]);
    //    $.each(portfolioViewModels.investors(), function (i, item) {
    //        self.investors.push(item);
    //    });
    //    self.investmentTransTypes = [{ Text: 'Sale', Value: 'Sale' }, { Text: 'Collection', Value: 'Collection' }, { Text: 'Distribution', Value: 'Distribution' }, { Text: 'Interest', Value: 'Interest' }, { Text: 'Investment', Value: 'Investment' }];
    //    self.visibleNext = ko.computed(function () {
    //        if (self.currentRecordIndex() + 1 != self.investmentRecords().length && self.investmentRecords().length > 1)
    //            return true;
    //        else
    //            return false;
    //    }, self);
    //    self.visiblePrevious = ko.computed(function () {
    //        if (self.currentRecordIndex() + 1 > 1 && self.investmentRecords().length > 1)
    //            return true;
    //        else
    //            return false;
    //    }, self);

    //    self.recordCounts = ko.computed(function () {
    //        return 'Records ' + (self.currentRecordIndex() + 1) + ' of ' + self.investmentRecords().length;
    //    }, self);

    //    self.nextRecord = function () {
    //        self.currentRecordIndex(self.currentRecordIndex() + 1);
    //    }
    //    self.previousRecord = function () {
    //        self.currentRecordIndex(self.currentRecordIndex() - 1);
    //    }
    //    self.saveRecord = function () {
    //        //log(self.currentInvestmentRecord().contribution() + ',' + self.currentInvestmentRecord().investor());
    //        var json = JSON.stringify({
    //            ProfitShare_after: self.currentInvestmentRecord().prftShareAftr(),
    //            ProfitShare_before: self.currentInvestmentRecord().prftShareBfr(),
    //            SalesPrice: self.currentInvestmentRecord().contribution().replace(/[^0-9.]/ig, ''),
    //            InterestRate: self.currentInvestmentRecord().interestRate(),
    //            Notes: self.currentInvestmentRecord().notes(),
    //            ID: self.currentInvestmentRecord().id,
    //            Inv_AgencyName: self.currentInvestmentRecord().investor(),
    //            TransType: 'Investment'
    //        });

    //        $.ajax({
    //            url: baseUrl + '/api/PortfolioTransactions/',
    //            type: "POST",
    //            data: json,
    //            dataType: "json",
    //            contentType: "application/json; charset=utf-8",
    //            success: function (response) {
    //                log(response);
    //            },
    //            error: function (response, errorText) {
    //            }
    //        });
    //    }
    //};

    //function collectionRecord(id, portfolioNumber, agency, closingDt, faceValue, netColls, collectionsTransType) {
    //    this.id = id;
    //    this.portfolioNumber = ko.observable(portfolioNumber);
    //    this.collectionAgencyName = ko.observable(agency);
    //    //this.agencies = ko.observableArray([]);
    //    this.closingDt = ko.observable(closingDt)
    //    this.faceValue = ko.observable(faceValue)
    //    this.netColls = ko.observable(netColls)
    //    this.collectionsTransType = ko.observable(collectionsTransType);
    //}

    //function collectionsTransVM() {
    //    var self = this;
    //    self.portfolioNumber = ko.observable();
    //    self.editMode = ko.observable(false);
    //    self.collectionRecords = ko.computed(function () {
    //        var collectionRecords = [];
    //        if (self.portfolioNumber() != '') {
    //                $.ajax({
    //                    url: baseUrl + '/api/PortfolioTransactions/',
    //                    type: 'GET',
    //                    contentType: 'application/json',
    //                    data: { portfolioNumber: self.portfolioNumber(), transType: 'Collection' },
    //                    dataType: 'json',
    //                    async: false,
    //                    success: function (data) {
    //                        if (data.length > 0) {
    //                            $.each(data, function (i, item) {
    //                                collectionRecords.push(new collectionRecord(item.ID,item.Portfolio_,
    //                                    item.Inv_AgencyName,
    //                                    dateFormat(Date.parse(item.ClosingDate), 'mm/dd/yyyy'),
    //                                    (item.FaceValue == undefined) ? '' : formatCurrency(item.FaceValue),
    //                                    (item.SalesPrice == undefined) ? '' : formatCurrency(item.SalesPrice),
    //                                    item.TransType));
    //                            });
    //                        }
    //                        else {
    //                            collectionRecords.push(new collectionRecord('','','','','',''));
    //                        }
    //                    },
    //                    error: function (xhr, status, somthing) {
    //                        log(status);
    //                    }
    //                });
    //        }
    //        return collectionRecords;
    //    }, self);
    //    self.currentRecordIndex = ko.observable(0);
    //    self.selectedRecordIndexChanged = function (item) {
    //        self.currentCollectionRecord(item);
    //        self.selectedAgency(item.collectionAgencyName());
    //    };
    //    self.selectedAgency = ko.observable();
    //    self.currentCollectionRecord = ko.observable();
    //    self.agencies = ko.observableArray([]);
    //    self.collectionsTransTypes = [{ Text: 'Sale', Value: 'Sale' }, { Text: 'Collection', Value: 'Collection' }, { Text: 'Distribution', Value: 'Distribution' }, { Text: 'Interest', Value: 'Interest' }, { Text: 'Investment', Value: 'Investment' }];
    //    self.totalCollections = ko.computed(function () {
    //        var salesTotal = 0;
    //        var val;
    //        $.each(self.collectionRecords(), function (i, item) {
    //            val = item.netColls().replace(/[^0-9.]/ig, '');
    //            salesTotal += parseFloat(val) || 0;
    //        });
    //        return formatCurrency(salesTotal);
    //    }, self);
    //    $.each(portfolioViewModels.agencies(), function (i, item) {
    //        self.agencies.push(item);
    //    });

    //    self.showMessage = ko.observable(false);
    //    self.message = ko.observable('');
    //    self.saveRecord = function () {
    //        //log(self.currentCollectionRecord().faceValue());
    //        //log(self.currentCollectionRecord().netColls());
    //        //log(self.currentCollectionRecord().closingDt());
    //        //log(self.currentCollectionRecord().collectionAgencyName());
    //        //log(self.currentCollectionRecord().id);
    //        var json = JSON.stringify({
    //            FaceValue: self.currentCollectionRecord().faceValue(),
    //            SalesPrice: self.currentCollectionRecord().netColls(),
    //            ClosingDate: self.currentCollectionRecord().closingDt(),
    //            Inv_AgencyName:self.selectedAgency(),
    //            ID: self.currentCollectionRecord().id,
    //            TransType: 'Collection'
    //        });

    //        $.ajax({
    //            url: baseUrl + '/api/PortfolioTransactions/',
    //            type: "POST",
    //            data: json,
    //            dataType: "json",
    //            contentType: "application/json; charset=utf-8",
    //            success: function (response) {
    //                log(response);
    //            },
    //            error: function (response, errorText) {
    //            }
    //        });

    //        self.showMessage(true);
    //        self.message('Data saved successfully!');
    //    }

    //};
    //portfolioViewModels.interestVM = function () { return $(document).data('interestVM') };
    //portfolioViewModels.distributionsTransVM = function () { return $(document).data('distributionsTransVM') };
    //portfolioViewModels.investmentsTransVM = function () { return $(document).data('investmentsTransVM') };
    //portfolioViewModels.collectionsTransVM = function () { return $(document).data('collectionsTransVM') };


}

function salesRecord(id, portfolioNumber, lender, buyer, cutoffDt, closingDt, putbackTerms, putbackDeadline, salesBasis, salesPrice, faceValue, accounts, salesTransType) {
    this.Id = id;
    this.portfolioNumber = ko.observable(portfolioNumber);
    this.lender = ko.observable(lender);
    this.buyer = ko.observable(buyer);
    this.cutoffDt = ko.observable(cutoffDt);
    this.closingDt = ko.observable(closingDt);
    this.putbackTerms = ko.observable(putbackTerms);
    this.putbackDeadline = ko.observable(putbackDeadline);
    this.salesBasis = ko.observable(salesBasis);
    this.salesPrice = ko.observable(salesPrice);
    this.faceValue = ko.observable(faceValue);
    this.accounts = ko.observable(accounts);
    this.salesTransType = ko.observable(salesTransType)
}

function salesTransVM() {
    var self = this;
    self.portfolioNumber = ko.observable('');
    self.salesRecords = ko.computed(function () {
        var salesRecords = [];
        if (self.portfolioNumber() != '') {
            $.ajax({
                url: baseUrl + '/api/PortfolioTransactions/',
                type: 'GET',
                contentType: 'application/json',
                data: { portfolioNumber: self.portfolioNumber(), transType: 'Sale' },
                dataType: 'json',
                async: false,
                success: function (data) {
                    //log(data.length);
                    if (data.length > 0) {
                        self.currentRecordIndex(0);
                        $.each(data, function (i, item) {
                            //log(item);
                            salesRecords.push(new salesRecord(item.ID, self.portfolioNumber(), item.Lender, item.Buyer, ((item.Cut_OffDate == undefined) ? '' : $.datepicker.formatDate('mm/dd/yy', new Date(item.Cut_OffDate))), ((item.ClosingDate == undefined) ? '' : $.datepicker.formatDate('mm/dd/yy', new Date(item.ClosingDate))), item.PutbackTerm_days_, ((item.PutbackDeadline == undefined) ? '' : $.datepicker.formatDate('mm/dd/yy', new Date(item.PutbackDeadline))), item.SalesBasis, item.SalesPrice, item.FaceValue, item.C_ofAccts, item.TransType));
                        });
                    }
                },
                error: function (xhr, status, somthing) {
                    log(status);
                }
            });
        }
        //else {
        //    salesRecords.push(new salesRecord('', '12345', 'lender', '', '', '', '', '', '', '', '', '100', ''));
        //}
        return salesRecords;
    }, self);

    self.currentRecordIndex = ko.observable(0);
    self.currentSalesRecord = ko.computed(function () {
        if (self.portfolioNumber() != '')
            return self.salesRecords()[self.currentRecordIndex()];
        else
            return new salesRecord('', '', '', '', '', '', '', '', '', '', '', '', '');
    }, self);
    self.buyers = ko.observableArray([]);
    self.totalSold = ko.computed(function () {
        var soldTotal = 0;
        $.each(self.salesRecords(), function (i, item) {
            soldTotal += item.accounts();
        });
        return soldTotal;
    }, self);
    self.totalSales = ko.computed(function () {
        var salesTotal = 0;
        $.each(self.salesRecords(), function (i, item) {
            salesTotal += item.salesPrice();
        });
        return formatCurrency(salesTotal);
    }, self);
    self.salesTransTypes = [{ Text: 'Sale', Value: 'Sale' }, { Text: 'Collection', Value: 'Collection' }, { Text: 'Distribution', Value: 'Distribution' }];
    $.each(portfolioViewModels.buyers(), function (i, item) {
        self.buyers.push(item);
    });
    self.visibleNext = ko.computed(function () {
        if (self.currentRecordIndex() + 1 != self.salesRecords().length && self.salesRecords().length > 1)
            return true;
        else
            return false;
    }, self);
    self.visiblePrevious = ko.computed(function () {
        if (self.currentRecordIndex() + 1 > 1 && self.salesRecords().length > 1)
            return true;
        else
            return false;
    }, self);

    self.recordCounts = ko.computed(function () {
        return 'Records ' + (self.currentRecordIndex() + 1) + ' of ' + self.salesRecords().length;
    }, self);

    self.nextRecord = function () {
        self.currentRecordIndex(self.currentRecordIndex() + 1);
    }
    self.previousRecord = function () {
        self.currentRecordIndex(self.currentRecordIndex() - 1);
    }
    self.showMessage = ko.observable(false);
    self.message = ko.observable('');
    self.saveRecord = function () {
        //log(self.currentSalesRecord().accounts());
        //log(self.currentSalesRecord().lender());
        //log(self.currentSalesRecord().buyer());
        //log(self.currentSalesRecord().cutoffDt());
        //log(self.currentSalesRecord().closingDt());
        //log(self.currentSalesRecord().salesBasis());
        //log(self.currentSalesRecord().faceValue());
        //log(self.currentSalesRecord().putbackTerm());
        //log(self.currentSalesRecord().putbackDeadline());
        //log(self.currentSalesRecord().salesPrice());
        var json = JSON.stringify({
            PutbackDeadline: self.currentSalesRecord().putbackDeadline(),
            PutbackTerm_days_: self.currentSalesRecord().putbackTerm(),
            C_ofAccts: self.currentSalesRecord().accounts(),
            FaceValue: self.currentSalesRecord().faceValue(),
            SalesBasis: self.currentSalesRecord().salesBasis(),
            SalesPrice: self.currentSalesRecord().salesPrice(),
            Buyer: self.currentSalesRecord().buyer(),
            Lender: self.currentSalesRecord().lender(),
            ClosingDate: self.currentSalesRecord().closingDt(),
            Cut_OffDate: self.currentSalesRecord().cutoffDt(),
            ID: self.currentSalesRecord().Id,
            TransType: 'Sale'
        });

        $.ajax({
            url: baseUrl + '/api/PortfolioTransactions/',
            type: "POST",
            data: json,
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (response) {
                log(response);
            },
            error: function (response, errorText) {
            }
        });
        self.showMessage(true);
        self.message('Data saved successfully!');
    }
};

function purchaseSummaryVM() {
    var self = this;
    self.portfolioNumber = ko.observable('');
    self.company = ko.observable('');
    self.resaleRestrictions = ko.observableArray([]);
    $.each(portfolioViewModels.resaleRestrictions(), function (i, item) {
        self.resaleRestrictions.push(item);
    });
    self.resaleRestriction = ko.observable('');
    self.companies = ko.observableArray([]);
    self.seller = ko.observable('');
    self.lender = ko.observable('');
    self.purchaseDate = ko.observable('');
    //self.sellers = ko.observableArray([]);
    self.cutOffDt = ko.observable('');
    self.closingDt = ko.observable('');
    self.costBasis = ko.observable('');
    self.putbackTerms = ko.observableArray([]);
    $.each(portfolioViewModels.putbackTerms(), function (i, item) {
        self.putbackTerms.push(item);
    });
    self.putbackTerm = ko.observable('');
    self.putbackDeadline = ko.observable('');
    //self.putbackDeadline = ko.computed(function () {
    //    log(self.putbackTerm());
    //    if (self.putbackTerm() == undefined) {
    //        //log(self.purchaseDate());
    //    }
    //    else {
    //        var putbackDeadline = new Date(self.purchaseDate());
    //        putbackDeadline.setDate(putbackDeadline.getDate() + self.putbackTerm());
    //        log(putbackDeadline);
    //        //self.purchaseSummarySectionVM.putbackDeadline($.datepicker.formatDate('mm/dd/yy', putbackDeadline));
    //    }
    //}, self);
    self.putbackTerm.subscribe(function (termValue) {
        if (termValue != undefined) {
            var putbackDeadline = new Date(self.purchaseDate());
            putbackDeadline.setDate(putbackDeadline.getDate() + termValue);
            self.putbackDeadline($.datepicker.formatDate('mm/dd/yy', putbackDeadline));
        }
        else {
            self.putbackDeadline('');
        }
    }.bind(self));
    self.face = ko.observable('');
    self.accounts = ko.observable('');
    self.purchasePrice = ko.observable('');
    self.notes = ko.observable('');
    self.transType = ko.observable('');
    self.transTypes = ko.observableArray([]);
    //self.sellers = ko.observableArray([]);
    $.each(portfolioViewModels.supBrockettCompanies(), function (i, item) {
        self.companies.push(item);
    });
    //$.each(portfolioViewModels.sellers(), function (i, item) {
    //    self.sellers.push(item);
    //});
    self.showMessage = ko.observable(false);
    self.message = ko.observable('');
    self.saveMainRecord = function () {
        var json = JSON.stringify({
            Company: self.company(),
            PutbackDeadline: self.putbackDeadline(),
            PutbackTerm__days_: self.putbackTerm(),
            C_ofAccts: self.accounts(),
            Face: Number(self.face().replace(/[^0-9\.]+/g, "")),
            PurchasePrice: Number(self.purchasePrice().replace(/[^0-9\.]+/g, "")),
            Seller: self.seller(),
            Lender_FileDescription: self.lender(),
            ClosingDate: self.closingDt(),
            Cut_OffDate: self.cutOffDt(),
            CostBasis: self.costBasis(),
            Portfolio_: self.portfolioNumber(),
            ResaleRestrictionId: self.resaleRestriction(),
            Notes: self.notes()
        });
        //log(json);
        $.ajax({
            //url: baseUrl + '/api/Portfolio/',
            url: baseUrl + '/api/MSIPortfolioEdited/',
            type: "POST",
            data: json,
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (response) {
                //log(response);
                self.getUpdated();
            },
            error: function (response, errorText) {
            }
        });
        self.showMessage(true);
        self.message('Data saved successfully!');
    }
    self.saveVisible = ko.observable(false);
    self.makeFieldsEditable = ko.observable(false);
    self.editVisible = ko.observable(false);
    self.editRecord = function () {
        $.ajax({
            //                url: baseUrl + '/api/Portfolio/',
            url: baseUrl + '/api/MSIPortfolioEdited/',
            type: 'GET',
            contentType: 'application/json',
            data: { portfolioNumber: self.portfolioNumber() },
            dataType: 'json',
            async: false,
            success: function (data) {
                //log(data);
                loadPurchaseData(data);

                self.makeFieldsEditable(true);
                self.saveVisible(true);
                self.editVisible(false);
                self.originalData(false);
                self.updatedData(false);
            },
            error: function (xhr, status, somthing) {
                log(status);
            }
        });
    }
    self.originalData = ko.observable(false);
    self.updatedData = ko.observable(false);

    self.companyEditedValue = ko.observable();
    self.resaleEditedValue = ko.observable();
    self.lenderFileEditedValue = ko.observable();
    self.sellerEditedValue = ko.observable();
    self.cuttOfDateEditedValue = ko.observable();
    self.putbackTermEditedValue = ko.observable();
    self.putbackDeadlineEditedValue = ko.observable();
    self.notesEditedValue = ko.observable();

    loadPurchaseData = function (data) {
        self.portfolioNumber(data.Portfolio_);
        self.company(data.Company);
        self.seller(data.Seller);
        self.lender(data.Lender_FileDescription);
        var cutOffDate = new Date(data.Cut_OffDate);
        cutOffDate.setDate(cutOffDate.getDate() + 1);
        self.cutOffDt($.datepicker.formatDate('mm/dd/yy', cutOffDate));
        self.costBasis(data.CostBasis);
        self.putbackTerm(data.PutbackTerm__days_);
        if (data.PutbackDeadline == undefined) {
        }
        else {
            var putbackDeadline = new Date(data.PutbackDeadline);
            putbackDeadline.setDate(putbackDeadline.getDate() + 1);
            self.putbackDeadline($.datepicker.formatDate('mm/dd/yy', putbackDeadline));
        }
        self.purchaseDate($.datepicker.formatDate('mm/dd/yy', cutOffDate));
        self.face(formatCurrency(data.Face));
        self.accounts(data.C_ofAccts);
        self.purchasePrice(formatCurrency(data.PurchasePrice));//formatCurrency({ colorize: true, negativeFormat: '(%s%n)' });
        self.resaleRestriction(data.ResaleRestrictionId);
        self.notes(data.Notes);
    }
    self.getOriginal = function () {
        log('getting original');
        self.companyEditedValue('');
        self.resaleEditedValue('');
        self.lenderFileEditedValue('');
        self.sellerEditedValue('');
        self.cuttOfDateEditedValue('');
        self.putbackTermEditedValue('');
        self.putbackDeadlineEditedValue('');
        self.notesEditedValue('');
        $.ajax({
            //                url: baseUrl + '/api/Portfolio/',
            url: baseUrl + '/api/MSIPortfolioOriginal/',
            type: 'GET',
            contentType: 'application/json',
            data: { portfolioNumber: self.portfolioNumber() },
            dataType: 'json',
            async: false,
            success: function (data) {
                //log(data);
                loadPurchaseData(data);
                //self.portfolioNumber(data.Portfolio_);
                //self.company(data.Company);
                //self.seller(data.Seller);
                //self.lender(data.Lender_FileDescription);
                //var cutOffDate = new Date(data.Cut_OffDate);
                //cutOffDate.setDate(cutOffDate.getDate() + 1);
                //self.cutOffDt($.datepicker.formatDate('mm/dd/yy', cutOffDate));
                //self.costBasis(data.CostBasis);
                //self.putbackTerm(data.PutbackTerm__days_);
                //if (data.PutbackDeadline == undefined) {
                //}
                //else {
                //    var putbackDeadline = new Date(data.PutbackDeadline);
                //    putbackDeadline.setDate(putbackDeadline.getDate() + 1);
                //    self.putbackDeadline($.datepicker.formatDate('mm/dd/yy', putbackDeadline));
                //}
                //self.purchaseDate($.datepicker.formatDate('mm/dd/yy', cutOffDate));
                //self.face(formatCurrency(data.Face));
                //self.accounts(data.C_ofAccts);
                //self.purchasePrice(formatCurrency(data.PurchasePrice));//formatCurrency({ colorize: true, negativeFormat: '(%s%n)' });
                //self.resaleRestriction(data.ResaleRestrictionId);
                //self.notes(data.Notes);
                self.updatedData(false);
                self.originalData(true);
            },
            error: function (xhr, status, somthing) {
                log(status);
            }
        });
    }
    self.getUpdated = function () {
        log('getting updated');
        $.ajax({
            //                url: baseUrl + '/api/Portfolio/',
            url: baseUrl + '/api/MSIPortfolioEdited/',
            type: 'GET',
            contentType: 'application/json',
            data: { portfolioNumber: self.portfolioNumber() },
            dataType: 'json',
            async: false,
            success: function (data) {
                //log(data);
                if (data == null) {
                    self.message('Record has not been updated yet');
                    self.showMessage(true);
                }
                else {
                    if (self.company() != data.Company) 
                        self.companyEditedValue('company');
                    if (self.seller() != data.Seller)
                        self.sellerEditedValue('seller');
                    if (self.lender() != data.Lender_FileDescription)
                        self.lenderFileEditedValue('lender');
                    var cutOffDate = new Date(data.Cut_OffDate);
                    cutOffDate.setDate(cutOffDate.getDate() + 1);
                    if (self.cutOffDt() != $.datepicker.formatDate('mm/dd/yy', cutOffDate))
                        self.cuttOfDateEditedValue('cutOffDt');
                    if (self.putbackTerm() != data.PutbackTerm__days_)
                        self.putbackTermEditedValue('putbackTerm');
                    if (self.resaleRestriction() != data.ResaleRestrictionId)
                        self.resaleEditedValue('reSale');
                    if (self.notes() != data.Notes) 
                        self.notesEditedValue('notesEdited')

                    loadPurchaseData(data);
                    //self.portfolioNumber(data.Portfolio_);
                    //self.company(data.Company);
                    //self.seller(data.Seller);
                    //self.lender(data.Lender_FileDescription);
                    //var cutOffDate = new Date(data.Cut_OffDate);
                    //cutOffDate.setDate(cutOffDate.getDate() + 1);
                    //self.cutOffDt($.datepicker.formatDate('mm/dd/yy', cutOffDate));
                    //self.costBasis(data.CostBasis);
                    //self.putbackTerm(data.PutbackTerm__days_);
                    //if (data.PutbackDeadline == undefined) {
                    //}
                    //else {
                    //    var putbackDeadline = new Date(data.PutbackDeadline);
                    //    putbackDeadline.setDate(putbackDeadline.getDate() + 1);
                    //    self.putbackDeadline($.datepicker.formatDate('mm/dd/yy', putbackDeadline));
                    //}
                    //self.purchaseDate($.datepicker.formatDate('mm/dd/yy', cutOffDate));
                    //self.face(formatCurrency(data.Face));
                    //self.accounts(data.C_ofAccts);
                    //self.purchasePrice(formatCurrency(data.PurchasePrice));//formatCurrency({ colorize: true, negativeFormat: '(%s%n)' });
                    //self.resaleRestriction(data.ResaleRestrictionId);
                    //self.notes(data.Notes);

                    self.updatedData(true);
                    self.originalData(false);
                }
            },
            error: function (xhr, status, somthing) {
                log(status);
            }
        });
    }
};

function portfolioVM() {
    var self = this;
    self.portfolios = ko.observableArray([]);

    $.each(portfolioViewModels.portfolios(), function (i, item) {
        self.portfolios.push(item);
    });
    self.portfolioNumber = ko.observable();
    self.portfolioNumber.subscribe(function (number) {
        if (number != '') {
            self.portfolioNumber(number);
            //load acqusitions portfolio data

            $.ajax({
                //                url: baseUrl + '/api/Portfolio/',
                url: baseUrl + '/api/MSIPortfolioOriginal/',
                type: 'GET',
                contentType: 'application/json',
                data: { portfolioNumber: self.portfolioNumber() },
                dataType: 'json',
                async: false,
                success: function (data) {
                    log(data);
                    self.purchaseSummarySectionVM.portfolioNumber(data.Portfolio_);
                    self.purchaseSummarySectionVM.company(data.Company);
                    self.purchaseSummarySectionVM.seller(data.Seller);
                    self.purchaseSummarySectionVM.lender(data.Lender_FileDescription);
                    //self.purchaseSummarySectionVM.resaleRestriction(data.ResaleRestriction);
                    //self.purchaseDate(data.PurchaseDate);
                    var cutOffDate = new Date(data.Cut_OffDate);
                    cutOffDate.setDate(cutOffDate.getDate() + 1);

                    //self.purchaseSummarySectionVM.cutOffDt($.datepicker.formatDate('mm/dd/yy', new Date(data.Cut_OffDate)));
                    self.purchaseSummarySectionVM.cutOffDt($.datepicker.formatDate('mm/dd/yy', cutOffDate));
                    //self.purchaseSummarySectionVM.closingDt($.datepicker.formatDate('mm/dd/yy', new Date(data.ClosingDate)));
                    self.purchaseSummarySectionVM.costBasis(data.CostBasis);
                    self.purchaseSummarySectionVM.putbackTerm(data.PutbackTerm__days_);
                    if (data.PutbackDeadline == undefined) {
                    }
                    else {
                        var putbackDeadline = new Date(data.PutbackDeadline);
                        putbackDeadline.setDate(putbackDeadline.getDate() + 1);
                        self.purchaseSummarySectionVM.putbackDeadline($.datepicker.formatDate('mm/dd/yy', putbackDeadline));
                    }
                    self.purchaseSummarySectionVM.purchaseDate($.datepicker.formatDate('mm/dd/yy', cutOffDate));
                    self.purchaseSummarySectionVM.face(formatCurrency(data.Face));
                    //self.costBasisputbackTermsputbackDeadlineface(data.Face);
                    self.purchaseSummarySectionVM.accounts(data.C_ofAccts);
                    self.purchaseSummarySectionVM.purchasePrice(formatCurrency(data.PurchasePrice));//formatCurrency({ colorize: true, negativeFormat: '(%s%n)' });
                    self.purchaseSummarySectionVM.resaleRestriction(data.ResaleRestrictionId);
                    self.purchaseSummarySectionVM.notes(data.Notes);

                    self.purchaseSummarySectionVM.editVisible(true);
                    self.purchaseSummarySectionVM.saveVisible(false);
                    self.purchaseSummarySectionVM.makeFieldsEditable(false);
                    self.purchaseSummarySectionVM.originalData(true);
                    self.purchaseSummarySectionVM.updatedData(false);

                    self.purchaseSummarySectionVM.companyEditedValue('');
                    self.purchaseSummarySectionVM.resaleEditedValue('');
                    self.purchaseSummarySectionVM.lenderFileEditedValue('');
                    self.purchaseSummarySectionVM.sellerEditedValue('');
                    self.purchaseSummarySectionVM.cuttOfDateEditedValue('');
                    self.purchaseSummarySectionVM.putbackTermEditedValue('');
                    self.purchaseSummarySectionVM.putbackDeadlineEditedValue('');
                    self.purchaseSummarySectionVM.notesEditedValue('');
                },
                error: function (xhr, status, somthing) {
                    log(status);
                }
            });
            self.salesTabVM.portfolioNumber(self.portfolioNumber());
            //self.collectionsTabVM.portfolioNumber(self.portfolioNumber());
            //self.investmentsTabVM.portfolioNumber(self.portfolioNumber());
            //self.distributionsTabVM.portfolioNumber(self.portfolioNumber());
            //self.interestTabVM.portfolioNumber(self.portfolioNumber());
        }

    }.bind(self));

    self.purchaseSummarySectionVM = new purchaseSummaryVM();
    self.salesTabVM = new salesTransVM();
    //self.collectionsTabVM = new collectionsTransVM();
    //self.investmentsTabVM = new investmentsTransVM();
    //self.distributionsTabVM = new distributionsTransVM();
    //self.interestTabVM = new interestTransVM();

}

portfolioViewModels.setActiveTabViewModel = function (viewModel) {
    $(document).data("portfolioViewModels.activeTabViewmodel", viewModel);
}

portfolioViewModels.getActiveTabViewModel = function () {
    return $(document).data("portfolioViewModels.activeTabViewmodel");
}

portfolioViewModels.salesTransVM = function () { return $(document).data('salesTransVM') };
portfolioViewModels.purchaseSummaryVM = function () { return $(document).data('purchaseSummaryVM') };

portfolioViewModels.supBrockettCompanies = function () {
    if ($(document).data('supBrockettCompanies') == undefined) {
        function setCompanies(data) {
            $(document).data('supBrockettCompanies', data);
        };

        $.ajax({
            url: baseUrl + '/api/Lookup/',
            type: 'GET',
            contentType: 'application/json',
            data: { id: 'SupBrockettCompanies' },
            dataType: 'json',
            async: false,
            success: function (data) {
                setCompanies(data);
            },
            error: function (xhr, status, somthing) {
                log(status);
            }
        });
    }
    return $(document).data('supBrockettCompanies');
}

portfolioViewModels.sellers = function () {
    if ($(document).data('sellers') == undefined) {

        function setSellers(data) {
            $(document).data('sellers', data);
        };

        $.ajax({
            url: baseUrl + '/api/Lookup/',
            type: 'GET',
            contentType: 'application/json',
            data: { id: 'Seller' },
            dataType: 'json',
            async: false,
            success: function (data) {
                setSellers(data);
            },
            error: function (xhr, status, somthing) {
                log(status);
            }
        });
    }
    return $(document).data('sellers');
}

portfolioViewModels.resaleRestrictions = function () {
    if ($(document).data('resaleRestrictions') == undefined) {
        function setPortfolios(data) {
            $(document).data('resaleRestrictions', data);
        };
        $.ajax({
            url: baseUrl + '/api/Lookup/',
            type: 'GET',
            contentType: 'application/json',
            data: { id: 'ResaleRestriction' },
            async: false,
            success: function (data) {
                setPortfolios(data);
            },
            error: function (xhr, status, somthing) {
                log('error:' + status);
            }
        });
    }
    return $(document).data('resaleRestrictions');
}

portfolioViewModels.putbackTerms = function () {
    if ($(document).data('putbackTerms') == undefined) {
        function setPortfolios(data) {
            $(document).data('putbackTerms', data);
        };
        $.ajax({
            url: baseUrl + '/api/Lookup/',
            type: 'GET',
            contentType: 'application/json',
            data: { id: 'PutbackTerm' },
            async: false,
            success: function (data) {
                setPortfolios(data);
            },
            error: function (xhr, status, somthing) {
                log('error:' + status);
            }
        });
    }
    return $(document).data('putbackTerms');
}

portfolioViewModels.portfolios = function () {
    if ($(document).data('portfolios') == undefined) {
        function setPortfolios(data) {
            log('here');
            $(document).data('portfolios', data);
        };
        $.ajax({
            url: baseUrl + '/api/Lookup/',
            type: 'GET',
            contentType: 'application/json',
            data: { id: 'PortfolioOriginal' },
            async: false,
            success: function (data) {
                //log(data);
                setPortfolios(data);
            },
            error: function (xhr, status, somthing) {
                log('error:' + status);
            }
        });
    }
    //log($(document).data('portfolios'));
    return $(document).data('portfolios');
}

portfolioViewModels.buyers = function () {
    if ($(document).data('buyers') == undefined) {
        log('Firsttime getting buyers');
        function setBuyers(data) {
            $(document).data('buyers', data);
        };

        $.ajax({
            url: baseUrl + '/api/Lookup/',
            type: 'GET',
            contentType: 'application/json',
            data: { id: 'Buyer' },
            dataType: 'json',
            async: false,
            success: function (data) {
                setBuyers(data);
            },
            error: function (xhr, status, somthing) {
                log(status);
            }
        });
    }
    return $(document).data('buyers');
}

portfolioViewModels.agencies = function () {
    if ($(document).data('agencies') == undefined) {
        log('Firsttime getting agencies');
        function setAgencies(data) {
            $(document).data('agencies', data);
        };

        $.ajax({
            url: baseUrl + '/api/Lookup/',
            type: 'GET',
            contentType: 'application/json',
            data: { id: 'Seller' },
            dataType: 'json',
            async: false,
            success: function (data) {
                setAgencies(data);
            },
            error: function (xhr, status, somthing) {
                log(status);
            }
        });
    }
    return $(document).data('agencies');
}

portfolioViewModels.investors = function () {
    if ($(document).data('investors') == undefined) {
        function setAgencies(data) {
            $(document).data('investors', data);
        };

        $.ajax({
            url: baseUrl + '/api/Lookup/',
            type: 'GET',
            contentType: 'application/json',
            data: { id: 'Investor' },
            dataType: 'json',
            async: false,
            success: function (data) {
                setAgencies(data);
            },
            error: function (xhr, status, somthing) {
                log(status);
            }
        });
    }
    return $(document).data('investors');
}

portfolioViewModels.inittializeVMS = function (portfolioNumber) {
    //log('inittializeVMS');
    //$(document).data('interestVM', new interestVM(portfolioNumber));
    //$(document).data('distributionsTransVM', new distributionsTransVM(portfolioNumber));
    //$(document).data('investmentsTransVM', new investmentsTransVM(portfolioNumber));
    //$(document).data('collectionsTransVM', new collectionsTransVM(portfolioNumber));
    $(document).data('salesTransVM', new salesTransVM(portfolioNumber));
    $(document).data('purchaseSummaryVM', new purchaseSummaryVM(portfolioNumber));
}

portfolioViewModels.resetVMS = function () {
    $(document).data('purchaseSummaryVM', '');
    //$(document).data('interestVM', '');
    //$(document).data('distributionsTransVM', '');
    //$(document).data('investmentsTransVM', '');
    //$(document).data('collectionsTransVM', '');
    $(document).data('salesTransVM', '');
}

ko.bindingHandlers.fadeVisible = {
    init: function (element, valueAccessor) {
        var value = valueAccessor();
    },
    update: function (element, valueAccessor) {
        var value = valueAccessor();
        ko.utils.unwrapObservable(value) ? $(element).fadeIn(3000, function () {
            $(element).fadeOut(5000);
            value(false)
        }) : $(element).fadeOut();
    }
};
