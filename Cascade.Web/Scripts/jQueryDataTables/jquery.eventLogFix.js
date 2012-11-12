/*!
 *
 * jQuery Event Log Fix
 * http://stackoverflow.com/questions/7825448/webkit-issues-with-event-layerx-and-event-layery
 *
 * Patch to fix an issue introduced by recent Chrome builds that logs a deprecation warning
 * on some standard jQuery ops causing performance degredation when console logging is present.
 */

(function(){
    // remove layerX and layerY
    var all = $.event.props,
        len = all.length,
        res = [];
    while (len--) {
      var el = all[len];
      if (el != 'layerX' && el != 'layerY') res.push(el);
    }
    $.event.props = res;
}());