/*
 **
 * formatter for values but most of the values if for jqGrid
 * Some of this was inspired and based on how YUI does the table datagrid but in jQuery fashion
 * we are trying to keep it as light as possible
 * Joshua Burnett josh@9ci.com	
 * http://www.greenbill.com
 *
 * Changes from Tony Tomov tony@trirand.com
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl-2.0.html
 * 
 **/

;
(function ($) {
    "use strict";
    $.fmatter = {};
    //格式化
    $.fn.fmatter = function (formatType, cellval, opts, rwd, act, gid) {
        // build main options before element iteration
        var v = cellval;
        opts = $.extend({}, $.jgrid.formatter, opts);

        try {
            var type = window["formatter_" + formatType];
            var formattor = new type(gid, opts);
            v = formattor.format(cellval, rwd);
        } catch (fe) {
        }
        return v;
    };
    //反格式化
    $.unformat = function (cellval, opr, pos, cnt) {
        // specific for jqGrid only
        var ret, formatType = opr.colModel.formatter,
            op = opr.colModel.formatoptions || {}, sep,
            re = /([\.\*\_\'\(\)\{\}\+\?\\])/g,
            unformatFunc = opr.colModel.unformat || ($.fn.fmatter[formatType] && $.fn.fmatter[formatType].unformat),
            options = $.extend(true, {}, opr);
        var cellEditConfig = $("#" + options.gid).jqGrid("getCellEditorConfig", options.rowId, options.colModel.name);
        if (cellEditConfig) {
            formatType = cellEditConfig.formatter;
            if (cellEditConfig.formatter) {
                options.colModel.formatter = formatType;
            }
            if (cellEditConfig.editoptions) {
                options.colModel.editoptions = cellEditConfig.editoptions;
            }
            if (cellEditConfig.formatoptions) {
                options.colModel.formatoptions = cellEditConfig.formatoptions;
            }
        }
        if (typeof unformatFunc !== 'undefined' && $.isFunction(unformatFunc)) {
            ret = unformatFunc.call(this, $(cellval).text(), options, cellval);
        } else if (!$.type.isUndefined(formatType) && $.type.isString(formatType)) {
            var type = window["formatter_" + formatType];
            var formattor = new type(options.gid, options.colModel);
            ret = formattor.unformat(cellval, options.rowId);
        }
        return ret !== undefined ? ret : cnt === true ? $(cellval).text() : $.jgrid.htmlDecode($(cellval).html());
    };


    //showlink
    $.fn.fmatter.rowoperations = function (rid, gid, act, pos, fun) {
        if (fun && $.isFunction(fun)) {
            fun.apply(null, arguments);
        } else if (typeof fun === "string") {
            var method = function () {
                waf.proxyCall(fun, undefined, rid, gid, act, pos);
            }
            method.apply(null, arguments);
        }
    }
    //linkbutton
    $.fn.fmatter.linkoperations = function (rid, gid, act, pos, fun, mbid) {
        var disabled = $("#" + mbid).children("a.ui-linkbutton").hasClass("ui-lb-disabled");
        if (!disabled) {
            if (fun && $.isFunction(fun)) {
                fun.apply(null, arguments);
            } else if (typeof fun === "string") {
                var method = function () {
                    waf.proxyCall(fun, undefined, rid, gid, act, pos);
                }
                method.apply(null, arguments);
            }
        }
    }
    //menubutton
    $.fn.fmatter.rowmenuoperations = function (mbid, menuid, rid, gid, act, pos, fun, openMenu) {
        if (openMenu) {
            var disabled = $("#" + mbid).children("a.ui-linkbutton").hasClass("ui-lb-disabled");
            if (!disabled) {
                var menu = $("#" + menuid);
                //接触menu的绑定信息
                menu.popup("destroy");
                //初始化到当前行
                menu.popup({
                    trigger:$("#" + mbid)
                });
                //触发open事件
                window.setTimeout(function () {
                    $("#" + mbid).trigger("clickopen");
                }, 10);
            }
        } else {
            var disabled = $("#" + mbid).children("a.ui-linkbutton").hasClass("ui-lb-disabled");
            if (!disabled) {
                if (fun && $.isFunction(fun)) {
                    fun.apply(null, arguments);
                } else if (typeof fun === "string") {
                    var method = function () {
                        waf.proxyCall(fun, undefined, rid, gid, act, pos);
                    }
                    method.apply(null, arguments);
                }
            }
        }
    }

    $.fmatter.util = {
        // Taken from YAHOO utils
        NumberFormat : function(nData,opts) {
            if(!$.type.isNumber(nData)) {
                nData *= 1;
            }
            if($.type.isNumber(nData)) {
                var bNegative = (nData < 0);
                var sOutput = nData + "";
                var sDecimalSeparator = (opts.decimalSeparator) ? opts.decimalSeparator : ".";
                var nDotIndex;
                if($.type.isNumber(opts.decimalPlaces)) {
                    // Round to the correct decimal place
                    var nDecimalPlaces = opts.decimalPlaces;
                    var nDecimal = Math.pow(10, nDecimalPlaces);
                    sOutput = Math.round(nData*nDecimal)/nDecimal + "";
                    nDotIndex = sOutput.lastIndexOf(".");
                    if(nDecimalPlaces > 0) {
                        // Add the decimal separator
                        if(nDotIndex < 0) {
                            sOutput += sDecimalSeparator;
                            nDotIndex = sOutput.length-1;
                        }
                        // Replace the "."
                        else if(sDecimalSeparator !== "."){
                            sOutput = sOutput.replace(".",sDecimalSeparator);
                        }
                        // Add missing zeros
                        while((sOutput.length - 1 - nDotIndex) < nDecimalPlaces) {
                            sOutput += "0";
                        }
                    }
                }
                if(opts.thousandsSeparator) {
                    var sThousandsSeparator = opts.thousandsSeparator;
                    nDotIndex = sOutput.lastIndexOf(sDecimalSeparator);
                    nDotIndex = (nDotIndex > -1) ? nDotIndex : sOutput.length;
                    var sNewOutput = sOutput.substring(nDotIndex);
                    var nCount = -1;
                    for (var i=nDotIndex; i>0; i--) {
                        nCount++;
                        if ((nCount%3 === 0) && (i !== nDotIndex) && (!bNegative || (i > 1))) {
                            sNewOutput = sThousandsSeparator + sNewOutput;
                        }
                        sNewOutput = sOutput.charAt(i-1) + sNewOutput;
                    }
                    sOutput = sNewOutput;
                }
                // Prepend prefix
                sOutput = (opts.prefix) ? opts.prefix + sOutput : sOutput;
                // Append suffix
                sOutput = (opts.suffix) ? sOutput + opts.suffix : sOutput;
                return sOutput;

            } else {
                return nData;
            }
        },
        // Tony Tomov
        // PHP implementation. Sorry not all options are supported.
        // Feel free to add them if you want
        DateFormat : function (format, date, newformat, opts)  {
            var	token = /\\.|[dDjlNSwzWFmMntLoYyaABgGhHisueIOPTZcrU]/g,
                timezone = /\b(?:[PMCEA][SDP]T|(?:Pacific|Mountain|Central|Eastern|Atlantic) (?:Standard|Daylight|Prevailing) Time|(?:GMT|UTC)(?:[-+]\d{4})?)\b/g,
                timezoneClip = /[^-+\dA-Z]/g,
                msDateRegExp = new RegExp("^\/Date\\((([-+])?[0-9]+)(([-+])([0-9]{2})([0-9]{2}))?\\)\/$"),
                msMatch = ((typeof date === 'string') ? date.match(msDateRegExp): null),
                pad = function (value, length) {
                    value = String(value);
                    length = parseInt(length,10) || 2;
                    while (value.length < length)  { value = '0' + value; }
                    return value;
                },
                ts = {m : 1, d : 1, y : 1970, h : 0, i : 0, s : 0, u:0},
                timestamp=0, dM, k,hl,
                dateFormat=["i18n"];
            // Internationalization strings
            dateFormat.i18n = {
                dayNames: opts.dayNames,
                monthNames: opts.monthNames
            };
            if( format in opts.masks ) { format = opts.masks[format]; }
            if( !isNaN( date - 0 ) && String(format).toLowerCase() == "u") {
                //Unix timestamp
                timestamp = new Date( parseFloat(date)*1000 );
            } else if(date.constructor === Date) {
                timestamp = date;
                // Microsoft date format support
            } else if( msMatch !== null ) {
                timestamp = new Date(parseInt(msMatch[1], 10));
                if (msMatch[3]) {
                    var offset = Number(msMatch[5]) * 60 + Number(msMatch[6]);
                    offset *= ((msMatch[4] == '-') ? 1 : -1);
                    offset -= timestamp.getTimezoneOffset();
                    timestamp.setTime(Number(Number(timestamp) + (offset * 60 * 1000)));
                }
            } else {
                date = String(date).split(/[\\\/:_;.,\t\T\s-]/);
                format = format.split(/[\\\/:_;.,\t\T\s-]/);
                // parsing for month names
                for(k=0,hl=format.length;k<hl;k++){
                    if(format[k] == 'M') {
                        dM = $.inArray(date[k],dateFormat.i18n.monthNames);
                        if(dM !== -1 && dM < 12){date[k] = dM+1;}
                    }
                    if(format[k] == 'F') {
                        dM = $.inArray(date[k],dateFormat.i18n.monthNames);
                        if(dM !== -1 && dM > 11){date[k] = dM+1-12;}
                    }
                    if(date[k]) {
                        ts[format[k].toLowerCase()] = parseInt(date[k],10);
                    }
                }
                if(ts.f) {ts.m = ts.f;}
                if( ts.m === 0 && ts.y === 0 && ts.d === 0) {
                    return "&#160;" ;
                }
                ts.m = parseInt(ts.m,10)-1;
                var ty = ts.y;
                if (ty >= 70 && ty <= 99) {ts.y = 1900+ts.y;}
                else if (ty >=0 && ty <=69) {ts.y= 2000+ts.y;}
                timestamp = new Date(ts.y, ts.m, ts.d, ts.h, ts.i, ts.s, ts.u);
            }

            if( newformat in opts.masks )  {
                newformat = opts.masks[newformat];
            } else if ( !newformat ) {
                newformat = 'Y-m-d';
            }
            var
                G = timestamp.getHours(),
                i = timestamp.getMinutes(),
                j = timestamp.getDate(),
                n = timestamp.getMonth() + 1,
                o = timestamp.getTimezoneOffset(),
                s = timestamp.getSeconds(),
                u = timestamp.getMilliseconds(),
                w = timestamp.getDay(),
                Y = timestamp.getFullYear(),
                N = (w + 6) % 7 + 1,
                z = (new Date(Y, n - 1, j) - new Date(Y, 0, 1)) / 86400000,
                flags = {
                    // Day
                    d: pad(j),
                    D: dateFormat.i18n.dayNames[w],
                    j: j,
                    l: dateFormat.i18n.dayNames[w + 7],
                    N: N,
                    S: opts.S(j),
                    //j < 11 || j > 13 ? ['st', 'nd', 'rd', 'th'][Math.min((j - 1) % 10, 3)] : 'th',
                    w: w,
                    z: z,
                    // Week
                    W: N < 5 ? Math.floor((z + N - 1) / 7) + 1 : Math.floor((z + N - 1) / 7) || ((new Date(Y - 1, 0, 1).getDay() + 6) % 7 < 4 ? 53 : 52),
                    // Month
                    F: dateFormat.i18n.monthNames[n - 1 + 12],
                    m: pad(n),
                    M: dateFormat.i18n.monthNames[n - 1],
                    n: n,
                    t: '?',
                    // Year
                    L: '?',
                    o: '?',
                    Y: Y,
                    y: String(Y).substring(2),
                    // Time
                    a: G < 12 ? opts.AmPm[0] : opts.AmPm[1],
                    A: G < 12 ? opts.AmPm[2] : opts.AmPm[3],
                    B: '?',
                    g: G % 12 || 12,
                    G: G,
                    h: pad(G % 12 || 12),
                    H: pad(G),
                    i: pad(i),
                    s: pad(s),
                    u: u,
                    // Timezone
                    e: '?',
                    I: '?',
                    O: (o > 0 ? "-" : "+") + pad(Math.floor(Math.abs(o) / 60) * 100 + Math.abs(o) % 60, 4),
                    P: '?',
                    T: (String(timestamp).match(timezone) || [""]).pop().replace(timezoneClip, ""),
                    Z: '?',
                    // Full Date/Time
                    c: '?',
                    r: '?',
                    U: Math.floor(timestamp / 1000)
                };
            return newformat.replace(token, function ($0) {
                return $0 in flags ? flags[$0] : $0.substring(1);
            });
        }
    };
})(jQuery);



//缺省的格式化
function formatter_defaultFormat(gid, opts) {
    this.gid = gid;
    this.opts = opts;
}

//扩展格式化和反格式方法
formatter_defaultFormat.prototype = {
    constructor:formatter_defaultFormat,
    format:function (cellval, rwd) {
        return ($.type.isValue(cellval) && cellval !== "" ) ? cellval : this.opts.defaultValue ? this.opts.defaultValue : "&#160;";
    },
    unformat:function (cellval, rowId) {
    }
};

//格式化email
function formatter_email(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_email.prototype = new formatter_defaultFormat;
formatter_email.prototype.format = function (cellval, rwd) {
    if (!$.type.isEmpty(cellval)) {
        return "<a href=\"mailto:" + cellval + "\">" + cellval + "</a>";
    } else {
        return formatter_defaultFormat.prototype.format.call(this, cellval, rwd);
    }
}

//格式化checkbox
function formatter_checkbox(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_checkbox.prototype = new formatter_defaultFormat;
formatter_checkbox.prototype.format = function (cellval, rwd) {
    var op = $.extend({}, this.opts.checkbox), ds;
    if (this.opts.colModel !== undefined && !$.type.isUndefined(this.opts.colModel.formatoptions)) {
        op = $.extend({}, op, this.opts.colModel.formatoptions);
    }
    if (op.disabled === true) {
        ds = "disabled=\"disabled\"";
    } else {
        ds = "";
    }
    if ($.type.isEmpty(cval) || $.type.isUndefined(cval)) {
        cval = formatter_defaultFormat.prototype.format.call(this, cellval, rwd);
    }
    cval = cval + "";
    cval = cval.toLowerCase();
    var bchk = cval.search(/(false|0|no|off)/i) < 0 ? " checked='checked' " : "";
    return "<input type=\"checkbox\" " + bchk + " value=\"" + cval + "\" offval=\"no\" " + ds + "/>";
}

//格式化链接
function formatter_showlink(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_showlink.prototype = new formatter_defaultFormat;
formatter_showlink.prototype.format = function (cellval, rwd) {
    var op = {baseLinkUrl:this.opts.baseLinkUrl, showAction:this.opts.showAction, addParam:this.opts.addParam || "", target:this.opts.target, idName:this.opts.idName},
        target = "", idUrl;
    if (this.opts.colModel !== undefined && !$.type.isUndefined(this.opts.colModel.formatoptions)) {
        op = $.extend({}, op, this.opts.colModel.formatoptions);
    }
    if (op.target) {
        target = 'target=' + op.target;
    }
    //add by jlg.
    if (op.baseLinkUrl === "#") {
        idUrl = "#";
    } else if (op.baseLinkUrl.indexOf("javascript:") > -1) {
        idUrl = op.baseLinkUrl;
    } else {
        idUrl = op.baseLinkUrl + op.showAction + '?' + op.idName + '=' + this.opts.rowId + op.addParam;
    }
    var click = "";
    if (op.onclick) {
        idUrl = "javascript:void(null)";
        click = "jQuery.fn.fmatter.rowoperations('" + this.opts.rowId + "','" + this.opts.gid + "','" + op.addParam + "'," + this.opts.pos + "," + op.onclick + ");";
    }
    if ($.type.isString(cellval) || $.type.isNumber(cellval)) {    //add this one even if its blank string
        if (click != "") {
            return "<a " + target + " href=\"" + idUrl + "\" onclick=\"" + click + "\" >" + cellval + "</a>";
        } else {
            return "<a " + target + " href=\"" + idUrl + "\">" + cellval + "</a>";
        }
    } else {
        return formatter_defaultFormat.prototype.format.call(this, cellval, rwd);
    }
}

//格式化integer
function formatter_integer(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_integer.prototype = new formatter_defaultFormat;
formatter_integer.prototype.format = function (cellval, rwd) {
    var op = $.extend({}, this.opts.integer);
    if (this.opts.colModel !== undefined && !$.type.isUndefined(this.opts.colModel.formatoptions)) {
        op = $.extend({}, op, this.opts.colModel.formatoptions);
    }
    if ($.type.isEmpty(cellval)) {
        return op.defaultValue;
    }
    return $.fmatter.util.NumberFormat(cellval, op);
}

//格式化number
function formatter_number(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_number.prototype = new formatter_defaultFormat;
formatter_number.prototype.format = function (cellval, rwd) {
    var op = $.extend({}, this.opts.number);
    if (this.opts.colModel !== undefined && !$.type.isUndefined(this.opts.colModel.formatoptions)) {
        op = $.extend({}, op, this.opts.colModel.formatoptions);
    }
    if ($.type.isEmpty(cellval)) {
        return op.defaultValue;
    }
    return $.fmatter.util.NumberFormat(cellval, op);
}

//格式化currency
function formatter_currency(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_currency.prototype = new formatter_defaultFormat;
formatter_currency.prototype.format = function (cellval, rwd) {
    var op = $.extend({}, this.opts.currency);
    if (this.opts.colModel !== undefined && !$.type.isUndefined(this.opts.colModel.formatoptions)) {
        op = $.extend({}, op, this.opts.colModel.formatoptions);
    }
    if ($.type.isEmpty(cellval)) {
        return op.defaultValue;
    }
    return $.fmatter.util.NumberFormat(cellval, op);
}

//格式化date
function formatter_date(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_date.prototype = new formatter_defaultFormat;
formatter_date.prototype.format = function (cellval, rwd) {
    var op = $.extend({}, this.opts.date);
    if (this.opts.colModel !== undefined && !$.type.isUndefined(this.opts.colModel.formatoptions)) {
        op = $.extend({}, op, this.opts.colModel.formatoptions);
    }
    if (!$.type.isEmpty(cellval)) {
        return  $.fmatter.util.DateFormat(op.srcformat, cellval, op.newformat, op);
    } else {
        return $.fn.fmatter.defaultFormat(cellval, this.opts);
    }
}
formatter_date.prototype.unformat = function (cellval, rowId) {
    var op = $.jgrid.formatter.date || {};
    if (!$.type.isUndefined(this.opts.formatoptions)) {
        op = $.extend({}, op, this.opts.formatoptions);
    }
    if (!$.type.isEmpty(cellval)) {
        return  $.fmatter.util.DateFormat(op.newformat, cellval, op.srcformat, op);
    } else {
        return $.fn.fmatter.defaultFormat(cellval, this.opts);
    }
}


//格式化wafcheckbox，格式化为是否等。cellval可以是true,false或者1,0,add by jlg.
function formatter_wafcheckbox(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_wafcheckbox.prototype = new formatter_defaultFormat;
formatter_wafcheckbox.prototype.format = function (cellval, rwd) {
    if ($.type.isUndefined(cellval) || cellval === null) return "";
    cellval = cellval + "";
    var ret = cellval;
    var oBoolean = {"1":$.wafjgrid.booleanCaption.yes, "0":$.wafjgrid.booleanCaption.no};
    if (!$.type.isUndefined(this.opts.colModel.formatoptions) && !$.type.isUndefined(this.opts.colModel.formatoptions.value)) {
        oBoolean = this.opts.colModel.formatoptions.value;
    } else if (!$.type.isUndefined(this.opts.colModel.editoptions) && !$.type.isUndefined(this.opts.colModel.editoptions.value)) {
        oBoolean = this.opts.colModel.editoptions.value;
    }
    if (cellval === "undefined" || $.type.isUndefined(cellval) || cellval === null) {
        cellval = (this.opts.colModel.editoptions && this.opts.colModel.editoptions.defaultValue) || "0";
    }
    if (oBoolean) {
        if (cellval === "true") {
            cellval = "1";
            ret = oBoolean[cellval];
        } else if (cellval === "false") {
            cellval = "0";
            ret = oBoolean[cellval];
        } else {
            var temp = cellval.split(",");
            ret = "";
            for (var i = 0; i < temp.length; i++) {
                if (temp[i].length > 0) {
                    ret = ret + oBoolean[temp[i]] + ",";
                }
            }
            if (ret.length > 0) {
                ret = ret.substring(0, ret.length - 1);
            }

        }

    }
    return cellval === "" ? $.fn.fmatter.defaultFormat(cellval, this.opts) : ret;
}
formatter_wafcheckbox.prototype.unformat = function (cell, rowId) {
    var cellval = $(cell).text();
    var ret;
    var oBoolean = {"1":$.wafjgrid.booleanCaption.yes, "0":$.wafjgrid.booleanCaption.no};
    //获取默认值
    if (cellval == undefined || cellval === "" || $.trim(cellval) === "" || cellval == null || cellval === "null" || cellval === "undefined") {
        cellval = $.wafjgrid.booleanCaption.no;
    }
    if (!$.type.isUndefined(this.opts.colModel.formatoptions) && !$.type.isUndefined(this.opts.colModel.formatoptions.value)) {
        oBoolean = this.opts.colModel.formatoptions.value;
        //获取默认值
        if (cellval == undefined || cellval === "" || $.trim(cellval) === "" || cellval == null || cellval === "null" || cellval === "undefined") {
            cellval = this.opts.colModel.formatoptions.defaultValue;
        }
    } else if (!$.type.isUndefined(this.opts.colModel.editoptions) && !$.type.isUndefined(this.opts.colModel.editoptions.value)) {
        oBoolean = this.opts.colModel.editoptions.value;
        //获取默认值
        if (cellval == undefined || cellval === "" || $.trim(cellval) === "" || cellval == null || cellval === "null" || cellval === "undefined") {
            cellval = this.opts.colModel.editoptions.defaultValue;
        }
    }
    if (oBoolean) {
        if (cellval === "true") cellval = "1";
        if (cellval === "false") cellval = "0";
        for (var tmp in oBoolean) {
            var caption = oBoolean[tmp];
            if (cellval === caption) {
                ret = tmp;
                break;
            }
        }
    }
    if (ret != undefined && (ret === "" || $.trim(ret) === "" || ret === "null" || ret === "undefined")) {
        ret = undefined;
    }
    return ret;
}

//格式化下拉框
function formatter_wafselect(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_wafselect.prototype = new formatter_defaultFormat;
formatter_wafselect.prototype.format = function (cellval, rwd) {
    if ($.type.isUndefined(cellval) || cellval === null) return "";
    if (typeof cellval === "object" && waf.isEnumValue(cellval)) {
        cellval = cellval.value;
    }
    // jqGrid specific,cellval是一个简单值或者一个对象
    cellval = cellval + "";
    //oSelect存放可选值的范围.formatoptions.value是一个数组,[{alias:'xxxx',value:1},{alias:'yyyy',value:2}]
    var oSelect = false, ret = [], msl = false;
    if (!$.type.isUndefined(this.opts.colModel.formatoptions)) {
        oSelect = this.opts.colModel.formatoptions.enumSource;
        if (this.opts.colModel.formatoptions.multiple) {
            msl = this.opts.colModel.formatoptions.multiple;
        }
    } else if (!$.type.isUndefined(this.opts.colModel.editoptions)) {
        oSelect = this.opts.colModel.editoptions.enumSource;
        if (this.opts.colModel.editoptions.multiple) {
            msl = this.opts.colModel.editoptions.multiple;
        }
        if (undefined == oSelect || oSelect === null) {
            if (this.opts.colModel.editoptions.urlSource && this.opts.colModel.editoptions.urlSource != null) {
                $.ajax({
                    type:"get",
                    url:this.opts.colModel.editoptions.urlSource,
                    async:false,
                    success:function (data) {
                        //options.colModel.editoptions.enumSource = data;
                        $("#" + this.opts.gid).wafGrid("setCellEditorConfig", this.opts.colModel.name, "enumSource", data);
                        oSelect = data;
                    },
                    dataType:"json"
                });
            }
        }
    }
    if (oSelect) {
        var scell = [], sv;
        if (msl) {
            scell = cellval.split(",");
            scell = $.map(scell, function (n) {
                return $.trim(n);
            });//去除空格.
        }
        if ($.type.isObject(oSelect)) {
            // this is quicker
            var tmp;
            if (msl) {
                ret = jQuery.map(scell, function (value, i) {
                    if ($.isArray(oSelect)) {
                        tmp = $.map(oSelect, function (n, i) {
                            //枚举值可能是整形，也可能是字符串.
                            if (n) {
                                if (typeof n.value === "number") {
                                    if (parseInt(value) === n.value) {
                                        return n.alias;
                                    }
                                } else {
                                    if (value === n.value) {
                                        return n.alias;
                                    }
                                }
                            }
                        });
                    }
                    return tmp;
                });
            } else {
                if ($.isArray(oSelect)) {
                    var n;
                    for (var i = 0; i < oSelect.length; i++) {
                        n = oSelect[i];
                        if (n) {
                            //枚举值可能是整形，也可能是字符串.
                            if (typeof n.value === "number") {
                                if (parseInt(cellval) === n.value) {
                                    ret.push(n.alias);
                                    break;
                                }
                            } else {
                                if (cellval === n.value) {
                                    ret.push(n.alias);
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    cellval = ret.join(", ");
    return  cellval === "" ? $.fn.fmatter.defaultFormat(cellval, this.opts) : cellval;
}
formatter_wafselect.prototype.unformat = function (cellval, rowId) {
    var ret = [], value;
    var cell = $(cellval).text();
    if (cnt === true) {
        return cell;
    }
    var oSelect = false, msl = false;
    if (!$.type.isUndefined(options.colModel.formatoptions)) {
        oSelect = options.colModel.formatoptions.enumSource;
        if (options.colModel.formatoptions.multiple) {
            msl = options.colModel.formatoptions.multiple;
        }
    } else if (!$.type.isUndefined(options.colModel.editoptions)) {
        oSelect = options.colModel.editoptions.enumSource;
        if (options.colModel.editoptions.multiple) {
            msl = options.colModel.editoptions.multiple;
        }
        if (undefined == oSelect || oSelect === null) {
            if (options.colModel.editoptions.urlSource && options.colModel.editoptions.urlSource != null) {
                $.ajax({
                    type:"get",
                    url:options.colModel.editoptions.urlSource,
                    async:false,
                    success:function (data) {
                        //options.colModel.editoptions.enumSource = data;
                        $("#" + options.gid).wafGrid("setCellEditorConfig", options.colModel.name, "enumSource", data);
                        oSelect = data;
                    },
                    dataType:"json"
                });
            }
        }
    }
    if (oSelect) {
        var scell = [], sv, tmp;
        if (msl) {
            scell = cell.split(",");
            scell = $.map(scell, function (n) {
                return $.trim(n);
            });
            if ($.type.isObject(oSelect) || $.isArray(oSelect)) {
                ret = jQuery.map(scell, function (value, i) {
                    tmp = $.map(oSelect, function (n, val) {
                        //枚举值可能是整形，也可能是字符串.
                        if (n && n.alias === value) {
                            return n.value;
                        }
                    });
                    return tmp;
                });
            }
        } else {
            if ($.type.isObject(oSelect) || $.isArray(oSelect)) {
                if (!msl) {
                    scell[0] = cell;
                }
                ret = jQuery.map(scell, function (n) {
                    var rv;
                    $.each(oSelect, function (i, val) {
                        if (val && val.alias === n) {
                            rv = val.value;
                            return false;
                        }
                    });
                    if (typeof(rv) != 'undefined') {
                        return rv;
                    }
                });
                //如果ret为空，默认单选情况下取第一个值
                if (ret && ret.length == 0) {
                    ret.push(oSelect[0].value);
                }
            }
        }
        value = ret.join(", ");
    } else {
        value = cell || "";
    }
    if (value != undefined && (value === "" || $.trim(value) === "" || value === "null" || value === "undefined")) {
        value = undefined;
    }
    return value;
}

//格式化枚举
function formatter_wafenum(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_wafenum.prototype = new formatter_defaultFormat;
formatter_wafenum.prototype.format = function (cellval, rwd) {
    if ($.type.isUndefined(cellval) || cellval === null) return "";
    if (typeof cellval === "object") {
        //存储数据
        var storeValue = $("#" + this.opts.gid).data("storeValue") || {};
        storeValue[this.opts.colModel.name + "-" + this.opts.rowId] = cellval;
        $("#" + this.opts.gid).data("storeValue", storeValue);
        return cellval.alias;
    } else {
        return $.fn.fmatter.wafselect(cellval, this.opts, rwd);
    }
}
formatter_wafenum.prototype.unformat = function (cellval, rowId) {
    var ret;
    var storeValue = $("#" + options.gid).data("storeValue");
    if (storeValue) {
        ret = storeValue[options.colModel.name + "-" + options.rowId];
    }
    if (!ret) {
        return $.unformat.wafselect(cellval, options, pos, cnt);
    } else {
        return ret.value;
    }
    return ret;
}


//格式化f7
function formatter_f7(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_f7.prototype = new formatter_defaultFormat;
formatter_f7.prototype.format = function (cellval, rwd) {
    if ($.type.isUndefined(cellval) || cellval === null) return "";
    if (typeof cellval === "string") {
        try {
            cellval = $.parseJSON(cellval);
        } catch (e) {
            return cellval === "" ? $.fn.fmatter.defaultFormat(cellval, this.opts) : ret;
        }
    }
    var displayFormat, ret = cellval;
    if (!$.type.isUndefined(this.opts.colModel.formatoptions)) {
        displayFormat = this.opts.colModel.formatoptions.displayFormat;
    } else if (!$.type.isUndefined(this.opts.colModel.editoptions)) {
        displayFormat = this.opts.colModel.editoptions.f7Json.displayFormat;
    }
    if (displayFormat == null) displayFormat = "{name}";
    if (displayFormat) {
        //存储数据
        var storeValue = $("#" + this.opts.gid).data("storeValue") || {};
        storeValue[this.opts.colModel.name + "-" + this.opts.rowId] = cellval;
        $("#" + this.opts.gid).data("storeValue", storeValue);
        return $.wafPromptBox.format(cellval, displayFormat);
    }
    return  cellval === "" ? $.fn.fmatter.defaultFormat(cellval, this.opts) : ret;
}
formatter_f7.prototype.unformat = function (cellval, rowId) {
    var ret, val = $(cellval).text();//有可能删除了数据
    if (val && val.length > 0) {
        var storeValue = $("#" + options.gid).data("storeValue");
        if (storeValue) {
            ret = storeValue[options.colModel.name + "-" + options.rowId];
        }
    }
    if (ret == null) ret = undefined;
    return ret;
}


//格式化datepicker
function formatter_datepicker(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_datepicker.prototype = new formatter_defaultFormat;
formatter_datepicker.prototype.format = function (cellval, rwd) {
    var dateFormat;
    if (!$.type.isUndefined(this.opts.colModel.editoptions)) {
        dateFormat = this.opts.colModel.editoptions.dateFormat;
    }
    if (cellval) {
        if (cellval && cellval.indexOf("-") > -1) {
            if (cellval.indexOf(" ") > -1) {
                //可能的格式是yyyy-mm-dd hh:mm:ss
                cellval = cellval.split(" ")[0];
            }
            try {
                var date = waf.datepicker.parseDate("yy-mm-dd", cellval);
                if (dateFormat) {
                    return waf.datepicker.formatDate(dateFormat, date);
                }
            } catch (e) {
            }
        }
    }
    return  $.fn.fmatter.defaultFormat(cellval, this.opts);
}
formatter_datepicker.prototype.unformat = function (cell, rowId) {
    var cellval = $(cell).text();
    if (cellval != undefined && (cellval === "" || $.trim(cellval) === "" || cellval == "null" || cellval === "undefined")) {
        cellval = undefined;
    }
    return cellval;
}


//格式化numberfield
function formatter_numberfield(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_numberfield.prototype = new formatter_defaultFormat;
formatter_numberfield.prototype.format = function (cellval, rwd) {
    var formatJson;
    if (!$.type.isUndefined(this.opts.colModel.editoptions)) {
        formatJson = this.opts.colModel.editoptions;
    }
    if (formatJson && formatJson.inputJson) {
        if (cellval && typeof cellval == "string") {
            try {
                cellval = parseFloat(cellval);
            } catch (e) {
            }
        }
        if (!$.isNaN(cellval)) {
            return "<span value='" + cellval + "'>" + $.wafNumberField.format(cellval, formatJson.inputJson) + "</span>";
        }
    }
    return  $.fn.fmatter.defaultFormat(cellval, this.opts);
}
formatter_numberfield.prototype.unformat = function (cellval, rowId) {
    var cell = $(cellval).html();
    var ret = $(cell).attr("value");
    if (ret != undefined && (ret === "" || $.trim(ret) === "" || ret === "null" || ret === "undefined")) {
        ret = undefined;
    }
    return ret;
}


//格式化wafTextArea
function formatter_wafTextArea(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_wafTextArea.prototype = new formatter_defaultFormat;
formatter_wafTextArea.prototype.format = function (cellval, rwd) {
    if ($.type.isUndefined(cellval) || cellval === null) return "";
    return $.wafutil.getMultiValue(cellval);
}
formatter_wafTextArea.prototype.unformat = function (cell, rowId) {
    var cellval = $(cell).text();
    if (cellval != undefined && (cellval === "" || $.trim(cellval) === "" || cellval == "null" || cellval === "undefined")) {
        cellval = undefined;
    }
    return cellval;
}


//格式化waftext
function formatter_waftext(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_waftext.prototype = new formatter_defaultFormat;
formatter_waftext.prototype.format = function (cellval, rwd) {
    if ($.type.isUndefined(cellval) || cellval === null) return "";
    return $.wafutil.getMultiValue(cellval);
}
formatter_waftext.prototype.unformat = function (cell, rowId) {
    var cellval = $(cell).text();
    if (cellval != undefined && (cellval === "" || $.trim(cellval) === "" || cellval == "null" || cellval === "undefined")) {
        cellval = undefined;
    }
    return cellval;
}


//格式化wafMultiLangArea
function formatter_wafMultiLangArea(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_wafMultiLangArea.prototype = new formatter_defaultFormat;
formatter_wafMultiLangArea.prototype.format = function (cellval, rwd) {
    if ($.type.isUndefined(cellval) || cellval === null) return "";
    var ret = cellval;
    if (typeof cellval === "object") {
        var defaultlang = "l2";
        if (!$.type.isUndefined(this.opts.colModel.formatoptions) && !$.type.isUndefined(this.opts.colModel.formatoptions.defaultLang)) {
            defaultlang = this.opts.colModel.formatoptions.defaultLang;
        } else if (!$.type.isUndefined(this.opts.colModel.editoptions) && !$.type.isUndefined(this.opts.colModel.editoptions.inputJson.defaultLang)) {
            defaultlang = this.opts.colModel.editoptions.inputJson.defaultLang;
        }
        //将此值存储
        var storeValue = $("#" + this.opts.gid).data("storeValue") || {};
        storeValue[this.opts.colModel.name + "-" + this.opts.rowId] = cellval;
        $("#" + this.opts.gid).data("storeValue", storeValue);
        ret = cellval[defaultlang];
    }
    //如果cellval为字符串，则不管，直接返回.
    return  cellval === "" ? $.fn.fmatter.defaultFormat(cellval, this.opts) : ret;
}
formatter_wafMultiLangArea.prototype.unformat = function (cellval, rowId) {
    var ret;
    var storeValue = $("#" + options.gid).data("storeValue");
    if (storeValue) {
        ret = storeValue[options.colModel.name + "-" + options.rowId];
    }
    if (undefined === ret) {
        ret = $(cellval).text();
        var defaultlang = "l2";
        if (!$.type.isUndefined(options.colModel.formatoptions) && !$.type.isUndefined(options.colModel.formatoptions.defaultLang)) {
            defaultlang = options.colModel.formatoptions.defaultLang;
        } else if (!$.type.isUndefined(options.colModel.editoptions) && !$.type.isUndefined(options.colModel.editoptions.inputJson.defaultLang)) {
            defaultlang = options.colModel.editoptions.inputJson.defaultLang;
        }
        var tmp = {"l1":"", "l2":"", "l3":""};
        tmp[defaultlang] = ret;
        ret = tmp;
    }
    return ret;
}



//格式化wafMultiLangBox
function formatter_wafMultiLangBox(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_wafMultiLangBox.prototype = new formatter_defaultFormat;
formatter_wafMultiLangBox.prototype.format = function (cellval, rwd) {
    if ($.type.isUndefined(cellval) || cellval === null) return "";
    var ret = cellval;
    if (typeof cellval === "object") {
        var defaultlang = "l2";
        if (!$.type.isUndefined(this.opts.colModel.formatoptions) && !$.type.isUndefined(this.opts.colModel.formatoptions.defaultLang)) {
            defaultlang = this.opts.colModel.formatoptions.defaultLang;
        } else if (!$.type.isUndefined(this.opts.colModel.editoptions) && !$.type.isUndefined(this.opts.colModel.editoptions.inputJson.defaultLang)) {
            defaultlang = this.opts.colModel.editoptions.inputJson.defaultLang;
        }
        //将此值存储
        var storeValue = $("#" + this.opts.gid).data("storeValue") || {};
        storeValue[this.opts.colModel.name + "-" + this.opts.rowId] = cellval;
        $("#" + this.opts.gid).data("storeValue", storeValue);
        ret = cellval[defaultlang];
    }
    //如果cellval为字符串，则不管，直接返回.
    return  cellval === "" ? $.fn.fmatter.defaultFormat(cellval, this.opts) : ret;
}
formatter_wafMultiLangBox.prototype.unformat = function (cellval, rowId) {
    var ret;
    var storeValue = $("#" + options.gid).data("storeValue");
    if (storeValue) {
        ret = storeValue[options.colModel.name + "-" + options.rowId];
    }
    if (undefined === ret) {
        ret = $(cellval).text();
        var defaultlang = "l2";
        if (!$.type.isUndefined(options.colModel.formatoptions) && !$.type.isUndefined(options.colModel.formatoptions.defaultLang)) {
            defaultlang = options.colModel.formatoptions.defaultLang;
        } else if (!$.type.isUndefined(options.colModel.editoptions) && !$.type.isUndefined(options.colModel.editoptions.inputJson.defaultLang)) {
            defaultlang = options.colModel.editoptions.inputJson.defaultLang;
        }
        var tmp = {"l1":"", "l2":"", "l3":""};
        tmp[defaultlang] = ret;
        ret = tmp;
    }
    return ret;
}



//格式化autoComplete
function formatter_autoComplete(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_autoComplete.prototype = new formatter_defaultFormat;
formatter_autoComplete.prototype.format = function (cellval, rwd) {
    if ($.type.isUndefined(cellval) || cellval === null) return "";
    return cellval;
}
formatter_autoComplete.prototype.unformat = function (cell, rowId) {
    var cellval = $(cell).text();
    if (cellval != undefined && (cellval === "" || $.trim(cellval) === "" || cellval == "null" || cellval === "undefined")) {
        cellval = undefined;
    }
    return cellval;
}


//格式化operations
function formatter_operations(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}
var formatRowIndex = 0;
formatter_operations.prototype = new formatter_defaultFormat;
formatter_operations.prototype.format = function (cellval, rwd) {
    var op, str = "", rowid = this.opts.rowId;
    if (!$.type.isUndefined(this.opts.colModel.formatoptions)) {
        op = this.opts.colModel.formatoptions;
    }
    var pre = this.opts.gid + "_" + this.opts.pos + "_" + formatRowIndex;
    if ($.isArray(op)) {
        $.each(op, function (index, value) {
            var elem = document.createElement("a"),
                linkjson = value.linkJson,
                visible = value.visible,
                onclick = value.onclick,
                mbid = "mb_" + pre + "_" + linkjson.id;

            elem.ctrlrole = "linkbutton";
            var newid = linkjson.id + "_" + pre;
            var id = "#" + newid;

            if (visible && visible === true) {
                var tmp = {};
                $.extend(tmp, linkjson);
                tmp.id = newid;
                $(elem).wafLinkButton(tmp);
                if (value.actionBindingName) {
                    onclick = "'" + value.actionBindingName + "'";
                }
            }
            var ocl = "onclick=jQuery.fn.fmatter.linkoperations('" + rowid + "','" + this.opts.gid + "','" + linkjson.id + "'," + this.opts.pos + "," + onclick + ",'" + mbid + "');";
            str = str + "<span id='" + mbid + "' style='display:inline-block;margin-left:3px;' class='ui-pg-div ui-inline-operators' " + ocl + ">" + ($(elem).outerHTML()) + "</span>";
        });
    }
    formatRowIndex = formatRowIndex + 1;
    return str;
}


//格式化menuoperations
function formatter_menuoperations(gid, opts) {
    formatter_defaultFormat.call(this,gid,opts);
}

formatter_menuoperations.prototype = new formatter_defaultFormat;
formatter_menuoperations.prototype.format = function (cellval, rwd) {
    var op, str = "", rowid = this.opts.rowId;
    if (!$.type.isUndefined(this.opts.colModel.formatoptions)) {
        op = this.opts.colModel.formatoptions;
    }
    var id = this.opts.gid + "_" + this.opts.pos + "_" + rowid;
    if ($.isArray(op)) {
        $.each(op, function (index, value) {
            var elem = document.createElement("a"),
                linkjson = value.linkJson,
                visible = value.visible,
                onclick = value.onclick,
                menuid = "ul_" + this.opts.gid + "_" + this.opts.colModel.name + "_" + linkjson.id,
                mbid = "mb_" + id + "_" + linkjson.id;

            elem.ctrlrole = "menubutton";

            if (visible && visible === true) {
                var tmp = {};
                $.extend(tmp, linkjson);
                $(elem).wafMenuButton(tmp);
                if (value.actionBindingName) {
                    onclick = "'" + value.actionBindingName + "'";
                }

                //对下拉箭头的处理
                $(elem).children("span.ui-lb-text").after("<span class='ui-menubtn-right icondefault ui-icon-triangle-1-s'></span>");
                //对menu的处理
                if (linkjson.menuWidth) {
                    $("#" + menuid).width(linkjson.menuWidth);
                }
                $("#" + menuid).css({"position":"absolute", "z-index":999}).menu({
                    select:function (event, ui) {
                        if (ui.item) {
                            var link = ui.item.children("a:first");
                            if (link.children("span.ui-icon").length == 0 && !link.hasClass("ui-lb-disabled")) {
                                link.parents("ul.ui-menu-ul").hide();
                            }
                        }
                    }
                });
            }
            //判断onclick是否为空，如果为空，则menubutton直接打开菜单，否则下拉箭头打开打开菜单
            var ocl = "jQuery.fn.fmatter.rowmenuoperations('" + mbid + "','" + menuid + "','" + rowid + "','" + this.opts.gid + "','" + linkjson.id + "'," + this.opts.pos + "," + null + ",true);";
            if (onclick && onclick != null) {
                var onclk = "jQuery.fn.fmatter.rowmenuoperations('" + mbid + "','" + menuid + "','" + rowid + "','" + this.opts.gid + "','" + linkjson.id + "'," + this.opts.pos + "," + onclick + ",false);";
                $(elem).children("span.ui-lb-text").attr("onclick", onclk);
                $(elem).children("span.ui-menubtn-right").attr("onclick", ocl);
            } else {
                $(elem).attr("onclick", ocl).css("display", "inline-block");
            }
            var alink = ($(elem).outerHTML());
            str = str + "<span id='" + mbid + "' style='display:inline-block;margin-left:3px;' class='ui-pg-div ui-inline-operators'>" + (alink) + "</span>";
        });
    }
    return str;
}

