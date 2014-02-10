(function ($) {
    $.type = $.type || {};
    $.extend($.type, {
        isBoolean:function (o) {
            return typeof o === 'boolean';
        },
        isObject:function (o) {
            return (o && (typeof o === 'object' || $.isFunction(o))) || false;
        },
        isString:function (o) {
            return typeof o === 'string';
        },
        isNumber:function (o) {
            return typeof o === 'number' && isFinite(o);
        },
        isNull:function (o) {
            return o === null;
        },
        isUndefined:function (o) {
            return typeof o === 'undefined';
        },
        isValue:function (o) {
            return (this.isObject(o) || this.isString(o) || this.isNumber(o) || this.isBoolean(o));
        },
        isEmpty:function (o) {
            if (!this.isString(o) && this.isValue(o)) {
                return false;
            } else if (!this.isValue(o)) {
                return true;
            }
            o = $.trim(o).replace(/\&nbsp\;/ig, '').replace(/\&#160\;/ig, '');
            return o === "";
        },
        isJson:function (o) {
            var isJson = typeof(o) == "object" && Object.prototype.toString.call(o).toLowerCase() == "[object object]" && !o.length;
            return isJson;
        },
        isEquals:function (obj1, obj2) {
            if (( obj1 === obj2 )) {
                return true;
            }
            if (( obj1 == obj2 )) {
                return true;
            }
            if (!( obj2 instanceof Object ) || ( obj2 === null )) {
                return false;
            } // null is not instanceof Object.
            if (!( obj1 instanceof Object ) || ( obj1 === null )) {
                return false;
            } // null is not instanceof Object.
            var i = 0; // object property counter.
            for (var k in obj1) {
                i++;
                var o1 = obj1[k];
                var o2 = obj2[k];
                if ((o1 != null ) && !($.type.isEquals(o1, o2))) {
                    return false;
                } // inner object.
            }
            for (var k in obj2) { // compare object property counter.
                i--;
            }
            return i === 0;
        }
    });


    $.colorutil = $.colorutil || {};

    $.extend($.colorutil, {
        rgbToHex:function (rgbString) {
            var parts = rgbString.match(/^rgba\((\d+),\s*(\d+),\s*(\d+),(\d+)\)$/);

            delete (parts[0]);
            for (var i = 1; i <= 3; ++i) {
                parts[i] = parseInt(parts[i]).toString(16);
                if (parts[i].length == 1) parts[i] = '0' + parts[i];
            }
            return '#' + parts.join('').toUpperCase(); // "#0070FF"
        }
    });

    $.wafutil = $.wafutil || {};
    $.extend($.wafutil, {
        getMultiValue:function (value) {
            if (typeof value === "object") {
                if (waf.isMultiLangValue && waf.isMultiLangValue(value)) {
                    var local = "l2" || (waf.getContext().locale ? waf.getContext().locale : "l2");
                    return value[local]
                } else {
                    return value;
                }
            } else {
                return value;
            }
        },
        getValueByPath: function(data, path){
            var paths = path.split("."),
                current = data;
            for(var i = 0, length = paths.length; i < length; i++){
                if(i == length -1){
                    return current[paths[i]];
                } else {
                    if(current[paths[i]] == null){
                        return null;
                    }
                    current = current[paths[i]];
                }
            }
            return null;
        }
    });


    $.fn.handleFunction = function (eventName, eventFunction) {
        var tag = $(this);
        tag.unbind(eventName);
        if (eventFunction && eventFunction != null) {
            if ($.isFunction(eventFunction)) {
                tag.bind(eventName, eventFunction);
            } else if (typeof eventFunction === "string") {
                if (eventFunction.indexOf("(") > -1) {
                    tag.bind(eventName, function () {
                        return eval(eventFunction);
                    });
                } else {
                    var fun = eval(eventFunction);
                    if ($.isFunction(fun)) {
                        tag.bind(eventName, fun);
                    }
                }
            }
        }
    }

    jQuery.fn.outerHTML = function () {
        return $("<div></div>").append(this.eq(0).clone()).html();
    };

    $.ieHack = $.ieHack || {};
    var widthVar = "resize$Width",
        heightVar = "resize$Height";
    $.extend($.ieHack, {
        //屏蔽ie下无限制的resize循环问题
        hackResize:function (srcFun, elem) {
            var winNewWidth = $(window).width(), winNewHeight = $(window).height(), resizeTimeout;
            var win$Width = $(elem).data(widthVar) || -1, win$Height = $(elem).data(heightVar) || -1;
            if (win$Width != winNewWidth || win$Height != winNewHeight) {
                window.clearTimeout(resizeTimeout);
                resizeTimeout = window.setTimeout(srcFun, 10);
            }
            //Update the width and height
            $(elem).data(widthVar, winNewWidth);
            $(elem).data(heightVar, winNewHeight);
        }
    })



})(jQuery);