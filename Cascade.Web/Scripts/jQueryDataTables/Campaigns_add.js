$(document).ready(function () {
    var originalURL = $("#URL").val();

    $('#source_code').watermark('Code');
    $('#source_code_description').watermark('Description');


    $('.edit_source_code').click(function () {
        var closestRow = $(this).closest('tr');
        EditRow(closestRow);

    });

    function hookUpEditDeleteAndSave(tableRow) {

        tableRow.find('.edit_source_code').click(function () {
            var closestRow = $(this).closest('tr');
            EditRow(closestRow);

        });
        tableRow.find('.delete_source_code').click(function () {
            var closestRow = $(this).closest('tr');
            var sourceCodeId = closestRow.find('.source_id_hidden').val();
            closestRow.remove();
        });

        tableRow.find('.save_source_code').click(function () {
            var closestRow = $(this).closest('tr');
            var sourceCodeLabel = closestRow.find('.source_code_label');
            var sourceDescriptionLabel = closestRow.find('.source_description_label');

            var sourceCodeTextBox = closestRow.find('.source_code_text');
            var sourceCodeDescription = closestRow.find('.source_description_text');
            var updateSourceCode = sourceCodeTextBox.val();
            var description = sourceCodeDescription.val();

            sourceCodeLabel.text(updateSourceCode);
            sourceDescriptionLabel.text(description);
            UnEditRow(closestRow);

        });

    }


    $('.delete_source_code').click(function () {
        var closestRow = $(this).closest('tr');
        var sourceCodeId = closestRow.find('.source_id_hidden').val();
        closestRow.remove();
    });

    $('.save_source_code').click(function () {
        var closestRow = $(this).closest('tr');
        var sourceCodeLabel = closestRow.find('.source_code_label');
        var sourceDescriptionLabel = closestRow.find('.source_description_label');

        var sourceCodeTextBox = closestRow.find('.source_code_text');
        var sourceCodeDescription = closestRow.find('.source_description_text');
        var updateSourceCode = sourceCodeTextBox.val();
        var description = sourceCodeDescription.val();
        var sourceCodeId = closestRow.find('.source_id_hidden').val();

        var isActive = closestRow.find('.active_checkbox').attr("checked");

        var isDefault = closestRow.find('.default_checkbox').attr("checked");

        if (updateSourceCode.length == 0) {
            sourceCodeTextBox.css({ "background-color": "yellow" });
            return;
        }
        else {
            sourceCodeTextBox.css({ "background-color": "" });
        }
        sourceCodeLabel.text(updateSourceCode);
        sourceDescriptionLabel.text(description);
        UnEditRow(closestRow);

    });


    function UncheckAllRows() {
        $('.default_checkbox').attr('checked', 'false');
    }

    function EditRow(tableRow) {
        tableRow.find('.source_code_label').hide();
        tableRow.find('.source_description_label').hide();
        tableRow.find('.edit_source_code').hide();
        tableRow.find('.save_source_code').show();
        tableRow.find('.source_code_text').show();
        tableRow.find('.source_description_text').show();
        tableRow.find('.default_checkbox').attr('disabled', '');
        tableRow.find('.active_checkbox').attr('disabled', '');
    }

    function UnEditRow(tableRow) {
        tableRow.find('.source_code_label').show();
        tableRow.find('.source_description_label').show();
        tableRow.find('.save_source_code').hide();
        tableRow.find('.edit_source_code').show();
        tableRow.find('.source_code_text').hide();
        tableRow.find('.source_description_text').hide();
        tableRow.find('.default_checkbox').attr('disabled', 'disabled');
        tableRow.find('.active_checkbox').attr('disabled', 'disabled');
    }



    $('#add_source_code').click(function () {

        var sourceCode = $('#source_code').val();
        var description = $('#source_code_description').val();
        var campaignId = $('#CampaignId').val();
        var closestRow = $('#add_source_code').closest('tr');
        var count = closestRow.parent().next().find('tr').length
        if (sourceCode.length == 0) {
            $('#source_code').css({ "background-color": "yellow" });
            return;
        }
        else {
            $('#source_code').css({ "background-color": "" });
        }
        $.ajax(
            {
                type: "POST",
                url: "/Campaigns/GetSourceCodeRow",
                data: "SourceCode=" + sourceCode + "&Description=" + description + "&count=" + count,
                success: function (result) {
                    closestRow.parent().next().append(result);
                    hookUpEditDeleteAndSave(closestRow.parent().next().find('tr:last'));
                    $('#source_code').val('');
                    $('#source_code_description').val('');
                },
                erro: function () {
                    alert('alert');
                }
            });
    });
});