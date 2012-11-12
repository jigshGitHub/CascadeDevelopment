///////////////////////////////////////////////////////////////////////
// Constants


var SimpleProgress = function () {
    var that = {};

    // Get the current task ID
    that._taskId = 0;

    // Get the timer ID used to push refreshes
    that._timerId = 0;

    // Get the URL to invoke to read status
    that._progressUrl = "";

    // Get the current interval for progress refresh
    that._interval = 500;

    // Get the user-defined callback that refreshes the UI 
    that._userDefinedProgressCallback = null;

    // Get the user-defined callback that finalizes the call 
    that._taskCompletedCallback = null;

    // Get a new task ID
    that.createTaskId = function () {
        //alert("We are creating new TaskID");
        var _minNumber = 100,
            _maxNumber = 1000000000;
        return _minNumber + Math.floor(Math.random() * _maxNumber);
    };

    // Set progress callback
    that.callback = function (userCallback, completedCallback) {
        //alert("Callback function is called");
        //alert(userCallback);
        //alert(completedCallback);
        that._userDefinedProgressCallback = userCallback;
        that._taskCompletedCallback = completedCallback;
        return this;
    };

    // Set frequency of refresh
    that.setInterval = function (interval) {
        //alert(interval);
        that._interval = interval;
        return this;
    };


    // INTERNAL FUNCTION
    that._internalProgressCallback = function () {
        //alert("Internal ProgressCallBack function is called");
        //alert(that._interval);
        that._timerId = window.setTimeout(that._internalProgressCallback, that._interval);
        //alert(that._timerId);
        $.ajax({
            url: that._progressUrl,
            cache: false,
            //type: 'POST',
            headers: { 'X-SimpleProgress-TaskId': that._taskId },
            success: function (status) {
                if (that._userDefinedProgressCallback != null)
                    that._userDefinedProgressCallback(status);
                //alert(status);
            }
        });
    };

    // Invoke the URL and monitor its progress
    that.start = function (url, progressUrl) {
        //alert("Now crating taskId for the process");
        that._taskId = that.createTaskId();
        that._progressUrl = progressUrl;

        //alert(url);
        //alert("Task ID is: " + that._taskId);
        //alert("we are here - Before AJAX call");

        //var form = $("#ValidationForm");
        //var formCollection = form.serialize();
        //alert(formCollection);

        input = $(':input').serialize();
        //input = $(':input[type="checkbox"]');
        //alert(input);

        // Place the Ajax call
        $.ajax({
            url: url,
            type: 'POST',
            //data: formCollection,
            data: input,
            cache: false,
            headers: { 'X-SimpleProgress-TaskId': that._taskId },
            success: function (data) {
                 if (that._taskCompletedCallback != null)
                    that._taskCompletedCallback(data);
                    that.end();
            }
        });


        // Start the callback (if any)
        if (that._userDefinedProgressCallback == null)
            return this;
        that._timerId = window.setTimeout(that._internalProgressCallback, that._interval);
    };

    // Finalize the task
    that.end = function () {
        that._taskId = 0;
        //alert("clearing all");
        window.clearTimeout(that._timerId);
    }

    return that;
};

