﻿function namespace(namespaceString) {
    var parts = namespaceString.split('.'),
        parent = window,
        currentPart = '';

    for (var i = 0, length = parts.length; i < length; i++) {
        currentPart = parts[i];
        parent[currentPart] = parent[currentPart] || {};
        parent = parent[currentPart];
    }

    return parent;
}

var cascade = namespace("cascade");
var viewModels = namespace("cascade.viewModels");
cascade.viewModels.getActiveViewModel = function () {
    return $(document).data("cascade.viewModels.activeViewmodel");
}

cascade.viewModels.setActiveViewModel = function (viewModel) {
    $(document).data("cascade.viewModels.activeViewmodel", viewModel);
}

