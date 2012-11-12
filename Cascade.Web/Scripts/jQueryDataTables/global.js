$(document).ready(function () {

    alert("Main script loading");
    tableAnalytics.init();
    //modalShow.init();
    jqueryUi.init();
    ajaxErrorHandler.init();
    autoComplete.init();
    addContactTabs.init();
    addCampaignTabs.init();
    campaignForm.init();
    campaignMessageTabs.init();
    currencyInputs.init();
    connectionsHeight.init();
    dashboardSetup.init();
    dataTableHookup.init();
    deleteLinksConvertToPost.init();
    ProspectsGridDelete.init();
    fullfillPledgeFecTerms.init();
    groupEditLinks.init();
    performanceChart.init();
    processDonationPaymentInformation.init();
    processDonationFecTerms.init();
    prospectCardOpenLinks.init();
    prospectCardEditLinks.init();
    //Added for Edit functionality for Notes
    prospectCardEditNoteLinks.init();
    sessionExpirationPrevention.init();
    submitButtonsPreventMultipleClicks.init();
    tooltip.init();
    groupEditLinks.init();

    resetPasswordLinksConvertToPost.init();
    scrollingContacts.init();

    showEventDetails.init();
    campaignMessageTabs.init();
    quickMailDefaultOpenLinks.init();
    unreadMessageCount.init();
    subNavMenu.init();
    prospectRecipientSelectionOpenLinks.init();
    addSourceCode.init();
    eventsTable.init();

    googleContactsImport.init();

    usersIndex.init();

    shareDonorFormModal.init();

    imageSelectCampaign.init();

    var cf = new CustomFormElements({
        selectWidth: 95
    });
});

var currencyInputs = {
    init: function () {
        var $currency_inputs = $('.currency_input input[type="text"]');
        if ($currency_inputs.length !== 0) {
            $currency_inputs.blur(function () {
                var $this = $(this);
                $this.val($this.val().replace(',', ''));
            });
        }
    }
};

var eventsTable = {
    init: function () {

        if ($('.events').length !== 0) {
            eventsTable.bind();
        }
    },
    bind: function () {
        $('.events tr:last-child').addClass('last');
        $('.events tr td:nth-child(7n)').addClass('last');
        $('.events tr:first-child').addClass('first');
        $('.events tr.first td:last-child').addClass('first');
    }
}

var addSourceCode = {
    init: function () {
        if (('#source_codes table').length !== 0) {
            addSourceCode.bind();
        }
    },

    bind: function () {
        $('.source_description_label').wrap('<div class="scd" />')
    }
}

var scrollingContacts = {
    init: function () {
        if ($('.scrolling_contacts').children('li').length > 5)
            $('.scrolling_contacts').css('height', '500px');
    }
}

var showEventDetails = {
    init: function () {
        $('.event_list_scroll').delegate('.single_event_header a', 'click', function () {
            $(this).parent().next('.event_details').slideToggle();
            $(this).parents('li').toggleClass('open');
            return false;
        });
    }
}

var subNavMenu = {

    hideTimer: null,

    init: function () {
        var self = this;
        if ($('#subnav').length !== 0) {
            //self.bindSubnavShow();
            //self.bindSubnavHide();
            self.initActiveTab();
            self.initActiveSubNav();
        }
    },
    bindSubnavShow: function () {

        $('#main_nav .has_subnav').mouseover(function () {
            var activeId = $(this).attr('id').split('_')[2];
            var subnavElement = $('#' + activeId + '_subnav');
            $('#subnav > ul').hide();
            $('#subnav').show();
            $('#' + activeId + '_subnav').show();
            $('#main_nav .subnav_active').removeClass('subnav_active');
            $(this).addClass('subnav_active');
            $('#main_nav .active').removeClass('active');
            $('#subnav').addClass('subnav_hover');
            // if ($('#main_nav li.active_placeholder')) {
            // 	$(subNavElement).removeClass('subnav_hover');
            // 	console.log(suvNavMenu);
            // }
        });
        $('#main_nav li').not('.has_subnav').mouseover(function () {
            subNavMenu.hideSubnav(false);
            $('#main_nav .active').removeClass('active');
        });
    },
    bindSubnavHide: function () {
        $('#main_nav, #subnav').mouseout(function () {
            if (subNavMenu.hideTimer == null) {
                subNavMenu.hideTimer = setTimeout('subNavMenu.hideSubnav(true);', 500);
            }
        });
        $('#main_nav, #subnav').mouseover(function () {
            if (subNavMenu.hideTimer != null) {
                clearTimeout(subNavMenu.hideTimer);
                subNavMenu.hideTimer = null;
            }
        });
    },
    initActiveTab: function () {
        $('#subnav li').last().addClass('last');
        var url = document.URL;
        var urlSplit = url.split('/');
        var topNav = urlSplit[3];
        if (topNav == '') topNav = 'dashboard';
        topNav = topNav.toLowerCase();
        topNav = topNav.split('?')[0];

        var activeElement = $('#main_nav_' + topNav + '_link');

        if (activeElement.length == 0) return;
        activeElement.addClass('active');
        activeElement.addClass('active_placeholder');
        var activeId = activeElement.attr('id').split('_')[2];
        var subnavElement = $('#' + activeId + '_subnav');
        if ($(subnavElement).length !== 0) {
            $('#subnav').removeClass('subnav_hover');
            $('#subnav').show();
            subnavElement.show();
            $('#main_nav').addClass('subnav_active');
        }
    },
    initActiveSubNav: function () {
        var url = document.URL;
        var urlSplit = url.split('/');
        var topNav = urlSplit[4];
        if (topNav == null) return;
        topNav = topNav.toLowerCase();
        topNav = topNav.split('?')[0];

        var activeElement = $('#subnav_' + topNav);
        activeElement.addClass('active_subnav_item');
    },
    hideSubnav: function (reinitializeActive) {
        $('#subnav').hide();
        $('#subnav > ul').hide();
        $('#main_nav .subnav_active').removeClass('subnav_active');
        $('#main_nav .active_placeholder').addClass('active');

        if (subNavMenu.hideTimer != null) {
            clearTimeout(this.hideTimer);
            this.hideTimer = null;
        }
        if (reinitializeActive)
            this.initActiveTab();
    }
}

var jqueryUi = {
    init: function () {
        //$( ".gauge" ).progressbar({
        //    value: 0
        //});
        
        $(".datepicker").datepicker({
             buttonImage: '../images/icon-calendar.gif'
        });
        
    }
}
var ajaxErrorHandler = {
    init: function () {
        var self = this;
        if ($("#ajax_error_dialog").length !== 0) {
            self.attachHandler();
        }
    },
    attachHandler: function () {
        $.ajaxSetup({
            error: function (x, e) {
                if (x.status == 0) return;
                if (e == 'abort') return;
                setTimeout("$('#loading_modal').dialog('close');", 200); // If we do this right away, it clears out the modal background.                  
                $('#ajax_error_dialog').dialog({
                    modal: true,
                    width: 750
                });
            }
        });
    }
}
var connectionsHeight = {
    init: function () {
        var self = this;
        if ($('.connection_chart').length !== 0) {
            self.switchImage();
        }
    },

    switchImage: function () {
        if ($('.connection_chart ol.level_3 li').length !== 0) {
            $('.connection_chart ol.level_3').addClass('shorten_height');
        }
    }

}

var tableAnalytics = {
    init: function () {
        $('.analytics_data td:first-child').addClass('first');
        $('.analytics_data td:nth-child(2)').addClass('analytic_recipient');
    }
}


var autoComplete = {
    init: function () {
        var self = this;
        if ($('.auto_complete').length !== 0) {

            self.autoCompleteInput();
        }
    },
    autoCompleteInput: function () {
        var availableTags = [
                "Anderson",
                "Baker",
                "Bard",
                "Carlson",
                "Crensen",
                "Devon",
                "Ellingson",
                "Forte",
                "Greylson",
                "Hamber",
                "Inver",
                "Johnson",
                "Klein",
                "Larsen",
                "Matthews",
                "Nelson",
                "Olson",
                "Pearson",
                "Quax",
                "Reynolds",
                "Swanson",
                "Tongston",
                "Udenberg"
            ];
        $(".auto_complete").autocomplete({
            source: availableTags
        });

    }
}
var addContactTabs = {
    init: function () {
        var self = this;
        if ($('.contact_nav').length !== 0) {
            self.switchContactFields();
            self.highlightValidationErrors();
        }
    },

    switchContactFields: function () {
        $('.contact_nav li a').click(function () {
            var contactNavClass = $(this).attr('class').split(' ')[0];
            $('.contact_fields').hide();
            $('#' + contactNavClass).show();

            $('.contact_nav li a').removeClass('active');
            $(this).addClass('active');

            return false;
        });
    },
    highlightValidationErrors: function () {
        $('.contact_nav li a').each(function () {
            var contactNavClass = $(this).attr('class').split(' ')[0];
            if ($('#' + contactNavClass).find('.field-validation-error').length !== 0) {
                $(this).addClass('tab_validation_error');
            }
        });
    }
}
var addCampaignTabs = {
    init: function () {
        var self = this;
        if ($('#campaign_form').length !== 0) {
            self.switchCampaignFields();
            self.highlightValidationErrors();
        }
    },
    switchCampaignFields: function () {
        $('.campaign_form_nav li a').click(function () {
            var campaignNavClass = $(this).attr('class').split(' ')[0];
            $('.campaign_fields').hide();
            $('#' + campaignNavClass).show();
            $('.campaign_form_nav li a').removeClass('active');
            $(this).addClass('active');
            if (campaignNavClass != 'custom_welcome_email') {
                $('.welcome_email_attach_file').hide();
            }
            return false;
        });
    },
    highlightValidationErrors: function () {
        var initialErrorTabSelected = false;
        $('.campaign_form_nav li a').each(function () {
            var campaignNavClass = $(this).attr('class').split(' ')[0];
            if ($('#' + campaignNavClass).find('.field-validation-error').length !== 0) {
                $(this).addClass('tab_validation_error');
                if (!initialErrorTabSelected) { $(this).click(); initialErrorTabSelected = true; }
            }
        });

    }
}
var dashboardSetup = {
    init: function () {
        var self = this;
        if ($('.widget_header').length !== 0) {
            self.hookupCloseButtons();
            self.hookupMinimizeButtons();
            self.hookupDraggableWidgets();
            self.hookupDownlineButton();  
            self.mobileSetup();          
        }
    },
    hookupDownlineButton: function () {
        $('#downline_connection_print_chooser').click(function () {
            $('#downline_connection_modal').load('/prospects/ChooseDownlineConnection', function () {
                $('#downline_connection_modal').dialog({
                    modal: true,
                    position: 'center',
                    width: 400
                });
            });
        });
    },
    hookupCloseButtons: function () {
        $('.close_widget').click(function () {
            var id = $(this).attr('id').split('-')[2];
            var name = $('#show-widget-' + id).attr('title');
            $.post('/Widgets/Delete/' + id);
            $('#show-widget-' + id).fadeOut();

            $('.btn_collapsed_widget[title="' + name + '"]').fadeIn();
        });
    },
    hookupDraggableWidgets: function () {
        var updateFunction = function (event, ui) {
            if (this === ui.item.parent()[0]) {
                $(".column .widget").each(function () {
                    var column = $(this).parent().attr("id").split("-")[1];
                    var row = $(this).index();
                    var id = $(this).attr("id").split("-")[2];

                    $.post("/Widgets/ChangePosition/" + id,
                    { 'PortletColumn': column, 'PortletRow': row }
                );
                });
            }
        };
        $(".column").sortable({
            connectWith: ".column",
            handle: ".widget_header",
            update: updateFunction
        });
        $(".portlet")
            .find(".portlet-header")
            .end()
            .find(".portlet-content");
        $(".portlet-header .ui-icon").click(function () {
            $(this).toggleClass("ui-icon-minusthick").toggleClass("ui-icon-plusthick");
            $(this).parents(".portlet:first").find(".portlet-content").toggle();
        });
        $(".widget_header, .widget_header > h3").disableSelection();
    },
    hookupMinimizeButtons: function () {
        $('.minimize_widget').click(function () {
            var id = $(this).attr('id').split('-')[2];
            $('#widget-content-' + id).slideToggle();
        });
    },
    mobileSetup: function() {        
        
    }
};
var dataTableHookup = {
    init: function () {
        var self = this;
        if ($('.data_table:not(:has(.no-results))').length !== 0) {
            self.hookupDataTables();
        }
    },
    hookupDataTables: function () {
        var pageLength = 10;
        alert("outside");
        if ($('#full_company_list_container').length !== 0) {
            //pageLength = 20;
            alert("inside");
            pageLength = 2;
        }
        else if ($('.campaign_list_container').length !== 0) {
            pageLength = 10;
        }

        $('.data_table:not(:has(.no-results)):not(.custom)').dataTable({
            'bPaginate': true,
            'sPaginationType': 'full_numbers',
            'iDisplayLength': pageLength
        });
        $('.search_results .data_table:not(:has(.no-results))').dataTable({
            'bPaginate': false,
            'bSort': true

        });
        $('.paginate_button').click(function () {

            deleteLinksConvertToPost.init();
        });
        this.wrapTableHeadings();
        this.deleteClickEvents();

    },
    wrapTableHeadings: function () {
        $('.data_table th:not(.options').wrapInner('<span />');
    },
    deleteClickEvents: function () {
        $('.data_table th.options').unbind('click');
        $('.data_table th.options').unbind('mousedown');
    }

}

var campaignForm = {
    init: function () {
        var self = this;
        if ($('.campaign_form').length !== 0) {
            self.initFileAttachmentToggle();
        }
    },
    initFileAttachmentToggle: function () {
        $('.attach_file_label').click(function () {
            var $this = $(this);
            var $file_container = $('.welcome_email_attach_file');
            $file_container.css('top', ($this.offset().top + 25));
            $file_container.css('display', 'block');
            return false;
        });
    }
};

var ProspectsGridDelete = {
    init: function () {
        var self = this;
        if ($('#prospects-grid').length !== 0) {
            self.delegateEventForProspectsTable();
        }
        if ($('#full_contact_list_container').length !== 0) {
            self.delegateEventForProspectsTable();

        }
    },
    delegateEventForProspectsTable: function () {
        $('.data_table').delegate('a[data-method="delete"]', 'click', function () {
            if (confirm("Are you sure you want to delete this item?")) {
                $.post($(this).attr('href'), function (data) {
                    location.reload();
                });
                return false;
            }
            else {
                return false;
            }
        });
    }

};

var deleteLinksConvertToPost = {
    init: function () {
        var self = this;
        if ($('a[data-method="delete"]')) {
            self.convertDeleteLinksToPost();

        }
    },
    convertDeleteLinksToPost: function () {
        //$('#content').delegate('a[data-method="delete"]', 'click', function () {
        $('a[data-method="delete"]').unbind('click');
        $('a[data-method="delete"]').click(function () {
            if (confirm("Are you sure you want to delete this item?")) {
                $.post($(this).attr('href'), function (data) {
                    location.reload();
                });
                return false;
            }
            else {
                return false;
            }
        });
    }
};
var resetPasswordLinksConvertToPost = {
    init: function () {
        var self = this;
        if (($('a.reset_password').length !== 0)) {
            self.initPasswordLinks();
        }
    },
    initPasswordLinks: function () {
        $('a.reset_password').click(function () {
            var href = $(this).attr('href');
            $.post($(this).attr('href'), function (data) {
                var dialog = $('#reset_password_confirm');
                dialog.html($('<p>' + data.Message + '</p>'));
                dialog.dialog({ modal: true, width: 328 });
            });
            return false;
        });
    }
};
var fullfillPledgeFecTerms = {
    init: function () {
        var self = this;
        if ($('#fulfill_pledge_payment_information').length !== 0) {
            self.hookupFecConfirmationButtons();
        }
    },
    hookupFecConfirmationButtons: function () {
        $('#fulfill_pledge_payment_information .btn_lg').click(function () {
            var valid = $('#fulfill_pledge_step_2_form').valid();
            if (!valid) {
                try {
                    $('#fulfill_pledge_step_2_form').showErrors();
                }
                catch (err) { }
                return false;
            }
            else {
                $('#fulfill_pledge_payment_information').hide();
                $('#fulfill_pledge_fec_terms').show();

                $('#step_2').addClass('inactive');
                $('#step_2').removeClass('active');
                $('#step_3').removeClass('inactive');
                $('#step_3').addClass('active');
            }

            return false;
        });
        $('#fulfill_pledge_fec_terms .back').click(function () {
            $('#fulfill_pledge_fec_terms').hide();
            $('#fulfill_pledge_payment_information').show();

            $('#step_2').addClass('active');
            $('#step_2').removeClass('inactive');
            $('#step_3').removeClass('active');
            $('#step_3').addClass('inactive');

            return false;
        });
    }
}
var loadingModal = {
    init: function () {
        var self = this;
        if ($("#loading_modal").length !== 0) {
            self.displayLoadingModal();
        }
    },
    displayLoadingModal: function () {
        $('#loading_modal').dialog({
            modal: true,
            position: 'center'
        });
        $.ajaxSetup({
            success: function (x, e) {
                setTimeout("$('#loading_modal').dialog('close');", 200);
            }
        });
    },
    hideLoadingModal: function () {
        $('#loading_modal').dialog('close');
    }
}
var shareDonorFormModal = {
    init: function () {
        var self = this;
        if ($("#sharelink_modal").length !== 0) {
            self.displayShareLinkModal();
        }
    },
    displayShareLinkModal: function () {
        $('#share_donation_form_link').click(function () {
            $('#sharelink_modal').html('<img src="/Content/images/loading.gif" class="loading" alt="Loading..."/> <strong>Loading...</strong>');
            $('#sharelink_modal').dialog({
                height: 341,
                modal: true,
                position: 'center',
                title: "Loading...",
                width: 395
            });
            $('#sharelink_modal').dialog('close');
            loadingModal.init();
            $('#sharelink_modal').load('/Donor/LinkGeneration', function () {
                $('#sharelink_modal').dialog({
                    height: 341,
                    modal: true,
                    position: 'center',
                    title: "Loading...",
                    width: 395
                });
                $('#sharelink_modal').dialog("option", "title", $("#sharelink_modal .modal_header h4").text());
            });
        });
    }

}
var numberHelpers = {
    init: function () {
        Number.prototype.commify = function () {
            var nStr = this.toString();
            nStr += '';
            x = nStr.split('.');
            x1 = x[0];
            x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            while (rgx.test(x1)) {
                x1 = x1.replace(rgx, '$1' + ',' + '$2');
            }
            return x1 + x2;
        };
    }
}
var unreadMessageCount = {
    init: function () {
        if ($('.icon_message').length !== 0) {
            $.ajax({
                data: { x: new Date().getTime() },
                dataType: 'json',
                method: 'POST',
                url: '/Messages/UnreadMessageCount',
                success: function (data) {
                    if (data.UnreadMessageCount > 0) {
                        $('#main_nav_messaging_link').addClass('message_tab');
                        $('.icon_message').text(data.UnreadMessageCount);
                        $('.icon_message').removeClass('hidden');
                    }
                }
            });
        }
    }
}
var performanceChartUpdating = false;

var performanceChart = {
    init: function () {
        var self = this;
        if ($("#performance_chart").length !== 0 && $(".no_data").length == 0) {
            numberHelpers.init();
            self.attachDateNavigation();
            self.attachDateSelections();
            self.attachPreviousNextButtons();
            self.refreshData();
        }
    },
    attachPreviousNextButtons: function () {
        $('#performance_chart_previous_button').click(function () {
            return false;
        });
        $('#performance_chart_next_button').click(function () {
            return false;
        });
    },
    attachDateSelections: function () {
        // Populate the dropdowns...
        var monthNames = ["Jan.", "Feb.", "Mar.", "Apr.", "May", "June", "July", "Aug.", "Sept.", "Oct.", "Nov.", "Dec."];
        var dates = new Array();
        for (i = 0; i <= 12; i++) {
            var date = new Date();
            date.setDate(1);
            date.setMonth(date.getMonth() - i);
            dates.push(date);
        }
        $(dates).each(function (i, el) {
            var opt = '<option value=' + (el.getMonth() + 1) + '/' + el.getDate() + '/' + el.getFullYear() + '>' + monthNames[el.getMonth()] + ' ' + el.getFullYear() + '</option>';
            $('#performance_chart_start_date, #performance_chart_end_date').append(opt);
        });
        $('#performance_chart_start_date, #performance_chart_end_date').change(performanceChart.refreshData);

        // Instantiate the defaults...
        $('#performance_chart_start_date option:nth-child(4)').attr('selected', 'selected');
        $('#performance_chart_end_date option:nth-child(1)').attr('selected', 'selected');

        var cf = new CustomFormElements({
            selectWidth: 95
        });
    },
    attachDateNavigation: function () {
        $('#performance_chart_previous_button').click(function () {
            if (performanceChartUpdating) return;
            var options = $('#performance_chart_start_date option:selected:not(:last-child), #performance_chart_end_date option:selected:not(:last-child)');
            if (options.length != 2) return false; // We don't want to scroll over the edge.
            options.attr('selected', '').next().attr('selected', 'selected');

            performanceChart.refreshData();
            return false;
        });
        $('#performance_chart_next_button').click(function () {
            if (performanceChartUpdating) return;
            var options = $('#performance_chart_start_date option:selected:not(:first-child), #performance_chart_end_date option:selected:not(:first-child)');
            if (options.length != 2) return false; // We don't want to scroll over the edge.
            options.attr('selected', '').prev().attr('selected', 'selected');

            performanceChart.refreshData();
            return false;
        });
    },
    attachTooltips: function (google_chart_uri, data_series) {
        var uri = google_chart_uri + "&chof=json";
        $.ajax({
            url: uri,
            dataType: "jsonp",
            success: function (json) {
                $('#performance_chart_map area').remove();
                $.each(json.chartshape, function (key, val) {
                    var bar_name = val.name.match('bar([0-9])_([0-9])');
                    if (bar_name !== null) {
                        var domain_value = data_series[bar_name[1]].split(',')[bar_name[2]];
                        domain_value = parseInt(domain_value).commify();
                        var area = $("<area></area>");
                        area.attr("name", val.name);
                        area.attr("shape", val.type);
                        area.attr("coords", val.coords.join(","));
                        area.attr("href", "#");
                        area.attr("title", '$' + domain_value);
                        area.click(function () { return false; });
                        $('#performance_chart_map').append(area);
                    }
                });
                performanceChart.attachTooltipDivs();
            }
        });
    },
    /**
    * Reads the existing textarea elements and inserts tooltip divs to allow
    * mobile support
    **/
    attachTooltipDivs: function() {        
        var performanceChart = $('#performance_chart');                
        var tooltips = $('<ul class="performance-chart-tooltips"></ul>');
        performanceChart.find('.performance-chart-tooltips').remove();
        performanceChart.find('area').each(function() {            
            var area = $(this);
            $('<li id="performance-chart-tooltip-'+area.index()+'"><strong>Selected Value:</strong> <span>'+area.attr('title')+'</span></li>').appendTo(tooltips);
            area.click(function() {
                $('.performance-chart-tooltips > li').hide();
                var tooltip = $('#performance-chart-tooltip-'+$(this).index());                
                tooltip.fadeIn();                
            });
            area.mouseleave(function() {
               $('.performance-chart-tooltips > li').hide(); 
            });
        });
        
        tooltips.appendTo(performanceChart);        
    },
    refreshData: function () {
        var cf = new CustomFormElements({
            selectWidth: 95
        });
        if (performanceChartUpdating) return;

        if ($('#performance_chart_start_date option:selected').index() < $('#performance_chart_end_date option:selected').index()) {
            $('#performance_chart_end_date option:selected').attr('selected', '');
            $('#performance_chart_end_date option:nth-child(' + ($('#performance_chart_start_date option:selected').index() + 1) + ')').attr('selected', 'selected');
            var cf = new CustomFormElements({
                selectWidth: 95
            });
            alert('Start date cannot be less than end date.');
        }
        $('#performance_chart_graph').attr('src', '/Content/images/loading_bar.gif');

        var startDate = $('#performance_chart_start_date option:selected').val();
        var endDate = new Date($('#performance_chart_end_date option:selected').val());
        endDate.setMonth(endDate.getMonth() + 1);
        endDate = (endDate.getMonth() + 1) + '/' + endDate.getDate() + '/' + endDate.getFullYear();

        performanceChartUpdating = true;
        setTimeout('performanceChartUpdating = false;', 500);

        $.getJSON('/Money/PerformanceChart?startDate=' + startDate + '&endDate=' + endDate, function (data) {
            var dataSeries = data.dataSeries.outstandingPledges.join(',') + '|' + data.dataSeries.performanceRollup.join(',') + '|' + data.dataSeries.moneyRaised.join(',');
            var seriesColors = ['E4EB1A', '1AA5EB', '47EB1A'].join(',');
            var seriesTitles = ['Outstanding', 'Roll-up', 'Raised'].join('|');
            var xAxisLabels = data.xAxisSeries.join('|');
            var yMax = data.yAxisMaxValue;
            var yStepSize = data.yAxisStepSize;

            var googleUri = 'https://chart.googleapis.com/chart?cht=bvs&chs=300x198&chd=t:' + dataSeries + '&chxt=x,y&' +
                        'chxl=0:|' + xAxisLabels + '&chco=' + seriesColors + '&chdl=' + seriesTitles + '&chbh=a&chxr=1,0,' + yMax +
                        ',' + yStepSize + '&chds=0,' + yMax + '&chdls=000000,11&chdlp=b';

            $('#performance_chart_graph').attr('src', googleUri);
            performanceChart.attachTooltips(googleUri, dataSeries.split('|'));
        });
        return false;
    }
}
var processDonationPaymentInformation = {
    init: function () {
        var self = this;
        if ($("#Donation_RecurringFrequency_Once").length !== 0) {
            self.hookupRecurringRadioButtons();
        }
    },
    hookupRecurringRadioButtons: function () {
        $('#Donation_RecurringFrequency_Once').click(function () {
            $('#recurring_quantity').slideUp();
            $('#recurring_quantity input').val(0);
        });
        $('#Donation_RecurringFrequency_Weekly, #Donation_RecurringFrequency_Monthly').click(function () {
            $('#recurring_quantity').slideDown();
        });

    }
}
var processDonationFecTerms = {
    init: function () {
        var self = this;
        if ($('#donation_payment_information').length !== 0) {
            self.hookupFecConfirmationButtons();
        }
    },
    hookupFecConfirmationButtons: function () {
        $('#donation_payment_information .btn_lg').click(function () {
            $('#process_donation_step_2_form').validate();
            var valid = $('#process_donation_step_2_form').valid();
            if (!valid) {
                try {
                    $('#process_donation_step_2_form').showErrors();
                }
                catch (err) { }
                return false;
            }
            else {
                $('#donation_payment_information').hide();
                $('#donation_fec_terms').show();

                $('#step_2').addClass('inactive');
                $('#step_2').removeClass('active');
                $('#step_3').removeClass('inactive');
                $('#step_3').addClass('active');
            }

            return false;
        });
        $('#donation_fec_terms .back').click(function () {
            $('#donation_fec_terms').hide();
            $('#donation_payment_information').show();

            $('#step_2').addClass('active');
            $('#step_2').removeClass('inactive');
            $('#step_3').removeClass('active');
            $('#step_3').addClass('inactive');

            return false;
        });
    }
}

var groupEditLinks = {
    init: function () {
        var self = this;
        if ($('#group_edit_container').length !== 0) {
            self.hookupLinks();
        }
    },
    hookupLinks: function () {
        $('#groups_table').delegate('.open-group-edit', 'click', function () {
            var id = $(this).attr("id").split("-")[3];
            $('#group_edit_container').html('<img src="/Content/images/loading.gif" class="loading" alt="Loading..."/> <strong>Loading...</strong>');
            $('#group_edit_container').dialog({
                modal: true,
                position: 'center',
                title: "Loading...",
                width: 750
            });
            $('#group_edit_container').dialog('close'); // TODO: HACK, figure this out.
            loadingModal.init();
            $('#group_edit_container').load('/Groups/Edit/' + id, function () {
                $('#group_edit_container').dialog({
                    modal: true,
                    position: 'center',
                    title: "Loading...",
                    width: 750
                });
                $('#group_edit_container').dialog("option", "title", $("#group_edit_container .modal_header h4").text());
            });

            return false;
        });
    }
}

var prospectRecipientSelectionOpenLinks = {
    init: function () {
        var self = this;
        if ($('#recipient-user-container').length !== 0) {
            self.hookupLinks();
        }
    },
    hookupLinks: function () {
        $('.email_composition').delegate('.add_recipients_link2', 'click', function () {
            $('#recipient-user-container').html('<img src="/Content/images/loading.gif" class="loading" alt="Loading..."/> <strong>Loading...</strong>');
            $('#recipient-user-container').dialog({
                height: 555,
                modal: true,
                position: 'center',
                title: "Loading...",
                width: 950
            });
            $('#recipient-user-container').dialog('close');
            loadingModal.init();
            $('#recipient-user-container').load('/QuickMails/RecipientSelection', function () {
                $('#recipient-user-container').dialog({
                    height: 555,
                    modal: true,
                    position: 'center',
                    title: "Loading...",
                    width: 950
                });
                $('#recipient-user-container').dialog("option", "title", $("#recipient-user-container .modal_header h4").text());
            });
        });
    }
}


var quickMailDefaultOpenLinks = {
    init: function () {
        var self = this;
        if ($('#quickmail-default-container').length !== 0) {
            self.hookupLinks();
        }
    },
    hookupLinks: function () {
        $('#source_code_tbody').delegate('.edit-quickmail-default', 'click', function () {
            var id = $(this).attr("id").split("-")[3];
            $('#quickmail-default-container').html('<img src="/Content/images/loading.gif" class="loading" alt="Loading..."/> <strong>Loading...</strong>');

            $('#quickmail-default-container').dialog({
                height: 555,
                modal: true,
                position: 'center',
                title: "Loading...",
                width: 750
            });
            $('#quickmail-default-container').dialog('close');
            loadingModal.init();
            $('#quickmail-default-container').load('/SourceCodes/QuickMailDefaults/' + id, function () {
                $('#quickmail-default-container').dialog({
                    height: 555,
                    modal: true,
                    position: 'center',
                    title: "Loading...",
                    width: 750
                });
                $('#quickmail-default-container').dialog("option", "title", $("#quickmail-default-container .modal_header h4").text());
            });
        });
    }
}



var prospectCardOpenLinks = {
    init: function () {
        var self = this;
        if ($('#prospect-card-container').length !== 0) {
            self.hookupLinks();
        }
    },
    hookupLinks: function () {
        $('#donation_to_date ,#prospects-grid, .full_contact_list').delegate('.open-prospect-card', 'click', function () {
            var id = $(this).attr("id").split("-")[3];
            //alert("test");
            $('#prospect-card-container').html('<img src="/Content/images/loading.gif" class="loading" alt="Loading..."/> <strong>Loading...</strong>');

            $('#prospect-card-container').dialog({
                height: 520,
                modal: true,
                position: 'center',
                title: "Loading...",
                width: 750
            });
            $('#prospect-card-container').dialog('close'); // TODO: HACK, figure this out.
            loadingModal.init();
            $('#prospect-card-container').load('/Prospects/ProspectCard/' + id, function () {
                $('#prospect-card-container').dialog({
                    height: 520,
                    modal: true,
                    position: 'center',
                    title: "Loading...",
                    width: 750
                });
                $('#prospect-card-container').dialog("option", "title", $("#prospect-card-container .modal_header h4").text());
                $('#prospect-card-container a[data-method="delete"]').click(function () {
                    if (confirm("Are you sure you want to delete this item?")) {
                        $.post($(this).attr('href'), function (data) {
                            location.reload();
                        });
                        return false;
                    }
                    else {
                        return false;
                    }
                });
                prospectCardOpenLinks.hookupEmailLink();
            });

            AddNavButtons('#prospect-card-container', id);

            //Performance Chart - Start and End Dates DDL - Disable them as we are on Model Popup page - Comment: Pivotal Tracker id 28463153
            if ($('#performance_chart_end_date').length !== 0) {
                if (!$('#performance_chart_end_date').attr("disabled")) { $('#performance_chart_end_date').attr("disabled", "true"); }
            }
            if ($('#performance_chart_start_date').length !== 0) {
                if (!$('#performance_chart_start_date').attr("disabled")) { $('#performance_chart_start_date').attr("disabled", "true"); }
            }

            return false;
        });
    },
    hookupEmailLink: function () {
        $('li.email_contact > a').click(function () {
            loadingModal.init();
            var id = $('#prospect-card-container .edit_contact').attr('id').split('-')[3];
            quickMailComposition.init(id);
        });
    }
}

function GetProspectIdFromAnchor(prospect) {
    return prospect.attr('id').split("-")[3];
}

function AddNavButtons(prospectContainer, id) {

    $('.ui-widget-header').find('.btn_next').remove();
    $('.ui-widget-header').find('.btn_prev').remove();

    var lastProspectId = 0;
    var nextProspectId = 0;
    var prospectId = 0;
    var TempProspectId = 0;
    var lastTableRow = $('.data_table tr:last').find('.view .open-prospect-card');
    if (lastTableRow.length == 0) {
        return;
    }
    var lastTableRowId = $('.data_table tr:last').find('.view .open-prospect-card').attr('id').split("-")[3];



    $('.data_table tr').each(function () {
        var prospect = $(this).find('.view .open-prospect-card');

        if (prospect.length) {

            TempProspectId = prospect.attr('id').split("-")[3];
            if (TempProspectId == id) {
                prospectId = id;
                prospect = $(this).closest('tr').next().find('.view .open-prospect-card');
                if (prospect.length) {
                    nextProspectId = prospect.attr('id').split("-")[3];
                }
                prospect = $(this).closest('tr').prev().find('.view .open-prospect-card');
                if (prospect.length) {
                    lastProspectId = prospect.attr('id').split("-")[3];
                }
            }
        }


    });

    var pageNumber = $('.paginate_active').text();
    if (nextProspectId == 0 && prospectId != 0) {

        $('.next').click();
        $('.data_table tr').each(function () {
            prospect = $(this).find('.view .open-prospect-card');

            if (prospect.length && nextProspectId == 0) {
                nextProspectId = GetProspectIdFromAnchor(prospect);
            }
        });
        if (pageNumber == $('.paginate_active').text()) {
            nextProspectId = 0;
        }
        else {
            $('.previous').click();
        }

        if (nextProspectId == prospectId) {

            nextProspectId = 0;
        }
    }
    else if (prospectId != 0 && lastProspectId == 0) {
        $('.previous').click();
        $('.data_table tr').each(function () {
            prospect = $(this).find('.view .open-prospect-card');
            if (prospect.length) {
                lastProspectId = GetProspectIdFromAnchor(prospect);
            }
        });

        if (pageNumber == $('.paginate_active').text()) {
            lastProspectId = 0;
        }
        else {
            $('.next').click();
        }
        if (lastProspectId == prospectId) {
            lastProspectId = 0;
        }
    }
    else if (prospectId == 0) {
        $('.data_table tr').each(function () {
            prospect = $(this).find('.view .open-prospect-card');
            if (prospect.length) {
                lastProspectId = GetProspectIdFromAnchor(prospect);
            }
        });
        $('.next').click();
        $('.data_table tr').each(function () {
            var prospect = $(this).find('.view .open-prospect-card');

            if (prospect.length) {

                TempProspectId = prospect.attr('id').split("-")[3];
                if (TempProspectId == id) {
                    prospectId = id;
                    prospect = $(this).closest('tr').next().find('.view .open-prospect-card');
                    if (prospect.length) {
                        nextProspectId = prospect.attr('id').split("-")[3];
                    }
                }
            }


        });
        if (nextProspectId == 0) {
            $('.previous').click();
            $('.data_table tr').each(function () {
                prospect = $(this).find('.view .open-prospect-card');

                if (prospect.length && nextProspectId == 0) {
                    nextProspectId = GetProspectIdFromAnchor(prospect);
                }
            });
            $('.previous').click();

        }

    }

    var navBtns = $('<a href="#" class="btn_prev" id="prev-link-' + lastProspectId + '">Previous</a><a href="#" class="btn_next" id="next-link-' + nextProspectId + '">Next</a>');
    $(prospectContainer).prev('.ui-widget-header').append(navBtns);
    if (lastProspectId == 0) {
        $('.btn_prev').hide();
    }
    if (nextProspectId == 0) {
        $('.btn_next').hide();
    }

    $('.btn_next').click(function () {
        var id = $(this).attr("id").split("-")[2];
        $(this).remove();
        $('#prospect-card-container').html('<img src="/Content/images/loading.gif" class="loading" alt="Loading..."/> <strong>Loading...</strong>');

        $('#prospect-card-container').dialog({
            height: 520,
            modal: true,
            position: 'center',
            title: "Loading...",
            width: 750
        });
        $('#prospect-card-container').load('/Prospects/ProspectCard/' + id, function () {
            $('#prospect-card-container').dialog("option", "title", $("#prospect-card-container .modal_header h4").text());
            prospectCardOpenLinks.hookupEmailLink();
            deleteLinksConvertToPost.init();
        });

        AddNavButtons('#prospect-card-container', id);

        //Performance Chart - Start and End Dates DDL - Disable them as we are on Model Popup page - Comment: Pivotal Tracker id 28463153
        if ($('#performance_chart_end_date').length !== 0) {
            if (!$('#performance_chart_end_date').attr("disabled")) { $('#performance_chart_end_date').attr("disabled", "true"); }
        }
        if ($('#performance_chart_start_date').length !== 0) {
            if (!$('#performance_chart_start_date').attr("disabled")) { $('#performance_chart_start_date').attr("disabled", "true"); }
        }

        return false;
    });

    $('.btn_prev').click(function () {
        var id = $(this).attr("id").split("-")[2];
        $(this).remove();
        $('#prospect-card-container').html('<img src="/Content/images/loading.gif" class="loading" alt="Loading..."/> <strong>Loading...</strong>');

        $('#prospect-card-container').dialog({
            height: 520,
            modal: true,
            position: 'center',
            title: "Loading...",
            width: 750
        });
        $('#prospect-card-container').load('/Prospects/ProspectCard/' + id, function () {
            $('#prospect-card-container').dialog("option", "title", $("#prospect-card-container .modal_header h4").text());
            prospectCardOpenLinks.hookupEmailLink();
            deleteLinksConvertToPost.init();
        });

        AddNavButtons('#prospect-card-container', id);

        //Performance Chart - Start and End Dates DDL - Disable them as we are on Model Popup page - Comment: Pivotal Tracker id 28463153
        if ($('#performance_chart_end_date').length !== 0) {
            if (!$('#performance_chart_end_date').attr("disabled")) { $('#performance_chart_end_date').attr("disabled", "true"); }
        }
        if ($('#performance_chart_start_date').length !== 0) {
            if (!$('#performance_chart_start_date').attr("disabled")) { $('#performance_chart_start_date').attr("disabled", "true"); }
        }

        return false;
    });
}

var prospectCardEditLinks = {
    init: function () {
        var self = this;
        if ($('#prospect-card-container').length !== 0 && $('#prospect-edit-container').length !== 0) {
            self.hookupDelegateLinks();
        }
    },
    hookupDelegateLinks: function () {
        $('#prospect-card-container').delegate('.edit_contact', 'click', function () {
            var id = $(this).attr("id").split("-")[3];
            $('#prospect-edit-container').html('<img src="/Content/images/loading.gif" class="loading" alt="Loading..."/> <strong>Loading...</strong>');
            $('#prospect-edit-container').dialog({
                height: 610,
                modal: true,
                title: "Loading...",
                width: 750
            });
            $('#prospect-edit-container').load("/Prospects/Edit/" + id + "?wantsAjax=true", function () {
                $('#prospect-edit-container').dialog("option", "title", "Edit Contact");
                prospectAjaxEditForm.init();
                addContactTabs.init();
                var cf = new CustomFormElements({
                    selectWidth: 95
                });
            });
           //alert("hello edit mode for contact - complete information");
            return false;
        });
    }
}

//Added for Edit Functinality for Notes
var prospectCardEditNoteLinks =
{
    init: function () {
        var self = this;
        if ($('#prospect-card-container').length !== 0) {
            self.hookupDelegateLinks();
        }
    },
    hookupDelegateLinks: function () {
        $('#prospect-card-container').delegate('.edit_contact_note', 'click', function () {
            var id = $(this).attr("id").split("-")[4];

            $('#prospect-card-container').load("/Prospects/EditNote/" + id, function () {
                prospectAjaxEditNoteForm.init();
                var cf = new CustomFormElements({
                    selectWidth: 95
                });
            });
            //alert("hello");
            return false;
        });
    }

}
//Added for Edit Functinality for Notes
var prospectAjaxEditNoteForm = {
    init: function () {
        var self = this;
        if ($('#prospect-card-container').length !== 0) {
            self.hookupNoteCancelButton();
            self.hookupNoteSaveButton();
        }
    },
    hookupNoteCancelButton: function () {
        $(".edit-note-cancel-button").click(function () {
            //alert("note cancel test");
            var id = $('.edit-note-form').attr('id').split('-')[3];
            //alert(id);
            $('#prospect-card-container').dialog("close");
            $('html, body').animate(
                     {
                         scrollTop: 0
                     }, 0);
            $('#open-prospect-card-' + id).click();
            return false;

        });
    },
    hookupNoteSaveButton: function () {
        $('.edit-note-button').click(function () {
            $('.edit-note-form').ajaxForm(function (responseText, statusText, xhr, $form) {
                var id = $('.edit-note-form').attr('id').split('-')[3];
                //alert(id);
                $('#prospect-card-container').dialog("close");
                $('html, body').animate(
                    {
                        scrollTop: 0
                    }, 0);
                $('#open-prospect-card-' + id).click();
            });
        });
    }
}


    var prospectAjaxEditForm = {
        init: function () {
            var self = this;
            if ($('.edit_contact').length !== 0) {
                self.hookupCancelButton();
                self.hookupSaveButton();
            }
        },
        hookupCancelButton: function () {
            $(".edit-cancel-button").click(function () {
                //alert("test");
                //$(this).parent().parent().parent().parent().dialog("close");
                $('#prospect-edit-container').dialog("close");
                $('html, body').animate({
                    scrollTop: 0
                }, 0);
                return false;
            });
        },
        hookupSaveButton: function () {
            $('.edit-save-button').click(function () {
                if (!$('.edit-contact-form').valid()) {
                    addContactTabs.init();
                }
                $('.edit-contact-form').ajaxForm(function (responseText, statusText, xhr, $form) {
                    //alert("hello we are here");
                    var id = $('.edit-contact-form').attr('id').split('-')[3];
                    $('#prospect-edit-container').dialog("close");
                    $('html, body').animate({
                        scrollTop: 0
                    }, 0);
                    $('#open-prospect-card-' + id).click();
                });
            });
        }
    }

var quickMailAttachments = {
    init: function () {
        var self = this;
        if ($('#quickmail_composition').length !== 0) {
            self.hookupAddAttachmentLinks();
            self.loadAttachments();
            self.hookupSendEmailButton();
            self.hookupUploadButton();
            self.togglePledgeAmount();
        }
    },
    hookupAddAttachmentLinks: function () {
        $('.attach_file_label').click(function () {
            $('.file_upload_error').hide();
            $('.file_upload_container').toggle();
            return false;
        });
    },
    hookupDeleteAttachmentLinks: function () {
        $('#file_attachments a.delete').click(function () {
            if (confirm("Are you sure you want to delete this item?")) {
                $.post($(this).attr('href'), function (data) {
                    //quickMailAttachments.loadAttachments();
                });
                $(this).parent().fadeOut();
                return false;
            }
            else {
                return false;
            }
        });
    },
    hookupSendEmailButton: function () {
        $('#send_email').click(function () {
            if ($('#quickmail_composition form').valid()) {
                $('#quickmail_composition').hide();
                $('#quickmail_sending').fadeIn();
                $('#quickmail_composition form').ajaxForm(function (responseText, statusText, xhr, $form) {
                    $('#quickmail_sending').hide();
                    var success = responseText.indexOf('200 OK') > -1;
                    if (success) {
                        $('#success_modal').show();
                    }
                    else {
                        $('#failure_modal').show();
                    }

                });
            }
        });
    },
    hookupUploadButton: function () {
        $('.file_upload_container input[type="submit"]').click(function () {
            $('.loading_bar').fadeIn(1000);
            $('.file_upload_error').hide();
            $('.file_upload_container').hide();
            // Protip: You cannot use error handling; since this must be done through an iframe.
            $('.file_upload_container > form').ajaxForm(function (responseText, statusText, xhr, $form) {
                quickMailAttachments.loadAttachments();
                $('.file_upload_container input[type="file"]').val('');
                var error = (responseText.indexOf('200 OK') == -1); // status will not be properly set b/c of the iframe.
                if (error) {
                    $('.loading_bar').hide();
                    $('.file_upload_error').fadeIn(1000);
                    $('.file_upload_container').fadeIn(1000);
                }
                else {
                    $('.loading_bar').fadeOut(1000);
                }
            });
        });
    },
    loadAttachments: function () {
        $('#file_attachments').addClass('loading');
        $('#file_attachments').load('/Attachments/UserIndex?x=' + new Date().getTime(), function (response, status, xhr) {
            $('#file_attachments').removeClass('loading');
            quickMailAttachments.hookupDeleteAttachmentLinks();
        });
    },
    showError: function () {
        alert('error');
    }
}
var quickMailComposition = {
    init: function (contactId) {
        var self = this;
        if ($('#email_modal').length !== 0) {
            self.loadAndShowModal(contactId);
        }
        else {
            alert('We attempted to initialize a QuickMail composition window on a page that does not support this.');
        }
    },
    loadAndShowModal: function (contactId) {
        $('#email_modal').load('/quickmails/add?prospectId=' + contactId, function () {
            $('#email_modal').dialog({
                modal: true,
                position: 'center',
                open: function () {
                    var cf = new CustomFormElements({
                        selectWidth: 95
                    });
                    tooltip.init();
                    quickMailComposition._hookupPledgeRadios();
                    quickMailComposition._togglePledgeAmount();
                    /*$('textarea').htmlarea({
                    toolbar: [
                    ["bold", "italic", "underline"],
                    ["increasefontsize", "decreasefontsize"],
                    ["h1", "h2", "h3", "h4"],
                    ["link", "unlink"],
                    ["orderedlist", "unorderedlist"]
                    ]
                    });*/
                },
                close: function () {
                    $('body').css('background-color', '#ffffff');
                    $('body').css('color', '#000000');
                },
                width: 750
            });
        });
    },
    _hookupPledgeRadios: function () {
        $('#email_pledge_no, #email_pledge_yes').click(function () {
            quickMailComposition._togglePledgeAmount();
        });
    },
    _togglePledgeAmount: function () {
        if ($('#email_pledge_yes').attr('checked')) {
            $('#PledgeAmount').val($('#default_pledge_amount').text());
            $('#pledge_amount_container').slideDown();
        }
        else {
            $('#pledge_amount_container').slideUp();
            $('#PledgeAmount').val('0');
        }
    }
}
var sessionExpirationPrevention = {
    init: function () {
        var self = this;
        setInterval('sessionExpirationPrevention.keepAlive()', 60000 * 10);
    },
    keepAlive: function () {
        $.ajax({
            type: 'GET',
            url: '/Account/KeepAlive',
            error: function (xhr, statusText) {
                alert('Your session has expired and we are automatically redirecting you back to the login page.');
                window.location('/Users/Login');
            }
        });
    }
}

var submitButtonsPreventMultipleClicks = {
    init: function () {
        var self = this;
        if ($('form').length !== 0) {
            self.enableSubmits();
            self.preventMultipleClicks();
        }
    },
    enableSubmits: function () {
        $('input[type="submit"]').attr('enabled', 'true');
        $('input[type="submit"]').attr('disabled', '');
    },
    preventMultipleClicks: function () {
        $('form:not(.multiple_submits)').submit(function () {
            try {
                $(this).validate();
                if ($(this).valid()) {
                    $(this).find('input[type="submit"]').attr('disabled', 'true');
                    return true;
                }
                else {
                    $(this).find('input[type="submit"]').attr('disabled', '');
                    addCampaignTabs.init();
                    addContactTabs.init();
                }
            }
            catch (err) {
                $(this).find('input[type="submit"]').attr('disabled', 'true');
                return true;
            }
            return false;
        });
    }
}

var campaignMessageTabs = {

    init: function () {
        var self = this;
        if ($('.tab_content').length !== 0) {
            this.bind();
        }
    },

    bind: function () {
        $('.tab_content').hide();
        //$('#view_email').show();

        $('.messages_tabs li').click(function () {

            var tabId = $(this).attr('id');
            var tabIdName = tabId.split('tab_');
            tabIdName = tabIdName[1];
            $('.tab_content').hide();
            $('#' + tabIdName).fadeIn();

            $('.messages_tabs li').removeClass('active');
            $(this).addClass('active');

            return false;
        });

        $('.message_view_header .cc a').click(function () {
            var hideText = "hide all";
            var showText = "show all";
            var contactList = $('.more_names');

            if (contactList.is(':visible')) {
                contactList.addClass('hidden')
                $(this).text(showText);

            } else {
                contactList.removeClass('hidden'); ;
                $(this).text(hideText);
            }

            return false;
        });

    }
}

var tooltip = {
    init: function () {
        var self = this;
        if ($('.tooltip').length !== 0) {
            self.attachCloseTooltipLinks();
            self.showTooltip();
        }
    },
    attachCloseTooltipLinks: function () {
        $('.close_tooltip').click(function () {
            //alert("we are closing tooltip");
            $(this).parent().parent().parent().hide();
            if ($('#secondalink').length > 0) {
                document.getElementById("secondalink").style.display = 'block';
            }
            if ($('#thirdalink').length > 0) {
                document.getElementById("thirdalink").style.display = 'block';
            }
            $('#quickmail_body').removeClass('modal_textarea');
            return false;
        });
    },
    showTooltip: function () {
        $('.question').click(function () {
            $(this).parent('li').children('.tooltip').show();
            $('#quickmail_body').addClass('modal_textarea');
            return false;
        });

        $('.question_first').click(function () {
            //alert("hello first");
            //Check if secondalink and thirdalink exists
            if ($('#secondalink').length>0) {
                document.getElementById("secondalink").style.display = 'none';
            }
            if ($('#thirdalink').length > 0) {
                document.getElementById("thirdalink").style.display = 'none';
            }
            $(this).parent('li').children('.tooltip').show();
            $('#quickmail_body').addClass('modal_textarea');
            return false;
        });


        $('.question_second').click(function () {
            //alert("hello second");
            $(this).parent('li').children('.tooltip').show();
            $('#quickmail_body').addClass('modal_textarea');
            return false;
        });

        $('.question_third').click(function () {
            //alert("hello third");
            $(this).parent('li').children('.tooltip').show();
            $('#quickmail_body').addClass('modal_textarea');
            return false;
        });
        
    }
}
var googleContactsImport = {
    init: function () {
        if ($('.google_contacts_import').length !== 0) {
            $('#select_all_contacts').click(function () {
                $('.google_contacts_import input[type="checkbox"]').attr('checked', 'checked');
                return false;
            });
            $('#deselect_all_contacts').click(function () {
                $('.google_contacts_import input[type="checkbox"]').attr('checked', '');
                return false;
            });
        }
    }
}

var usersIndex = {
    dataTable: null,
    init: function () {
        if ($('#full_user_list').length !== 0) {
            this.initDataTable();
        }
    },
    initDataTable: function () {
        $('#full_user_list').dataTable().fnDestroy();
        $('#full_user_list').dataTable({
            "bServerSide": true,
            "bAutoWidth": false,
            "sAjaxSource": "/Users/UserList2",
            "bProcessing": true,
            'bPaginate': true,
            'sPaginationType': 'full_numbers',
            'iDisplayLength': 10,
            'fnDrawCallback': function () {
                usersIndex.initDeleteLinks();                                
            }
        });
    },
    initDeleteLinks: function () {
        $('.delete').click(function () {
            if (confirm("Are you sure that you want to delete this?")) {
                var $this = $(this);

                $.ajax({
                    dataType: 'json',
                    url: this.href,
                    success: function (data) {
                        if (data.Success == false) { alert('There was an error deleting this user.'); console.log(data.Message); return; }
                        var row = $this.closest('tr');
                        row.hide();
                        $('.data_table').dataTable().fnDeleteRow(row.get(0));
                    }
                });
            }
            return false;
        });
    }
}

var imageSelectCampaign = {
    init: function () {
        if ($('.header_image_preview').length !== 0) {
            this.initImageEvents();
        }
    },
    initImageEvents: function () {
        $('.header_image_preview').click(function () {
            $('.header_image_upload_file').fadeIn();
        });
        $('.login_image_preview').click(function () {
            $('.login_image_upload_file').fadeIn();
        });
    }
}

