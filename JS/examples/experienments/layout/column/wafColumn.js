/*
 * Column列布局
 */
(function ($, undefined) {

    var bordersizeClass = "border-sizing";

    var defaultColumnClass = "ui-column";
    var equlizeClass = "col-equlize";
    var splitClass = "col-splitable";
    var splitpanelClass = "col-splitpanel";
    var splitWidth = "5px";
    var splitletterspaceing = "-0.5em";

    var defaultColumnLayoutClass = "ui-columnLayout";
    var completeEvent = "completeCreate";

    $.widget("ui.wafColumn", {
        options:{
            id:null,
            tagClass:null,
            style:null,
            colWidth:"100%",
            equalize:false,
            split:false,
            splitClass:"splitpanelClass",
            shrink:false,
            draggable:false,
            afterDragStop:null,
            afterShrink:null,
            afterInsertSplit:null
        },
        _create:function () {
            var self = this;
            //增加默认的class
            if(!self.element.hasClass(defaultColumnClass)){
                self.element.addClass(defaultColumnClass);
            }
            if(!self.element.hasClass(bordersizeClass)){
                self.element.addClass(bordersizeClass);
            }
            //设置Option属性
            this.options.create=true;
            $.each(this.options, function (key, value) {
                self._setOption(key, value);
            });
            var parent = this.getParent();
            if (this.options.split) {
                var elem = this;
                if (parent && parent != null) {
                    $(parent).bind(completeEvent, function () {
                        //父类创建完成之后创建split.
                        elem._createSplit(elem.options.splitClass, elem.options.shrink,elem.options.draggable);
                    });
                }
            }
            //注册事件
            if(this.options.afterDragStop && this.options.afterDragStop!=null){
                self.element.bind("column.afterDragStop",this.options.afterDragStop);
            }
            if(this.options.afterShrink && this.options.afterShrink!=null){
                self.element.bind("column.afterShrink",this.options.afterDragStop);
            }
            if(this.options.afterInsertSplit && this.options.afterInsertSplit!=null){
                self.element.bind("column.afterInsertSplit",this.options.afterInsertSplit);
            }
            this.options.create=false;
        },
        _setOption:function (key, value) {
            if (key === "tagClass") {
                this.element.removeClass(this.options.tagClass).addClass(value);
                this.options.tagClass = value;
            }
            if (key==="style" && value!=null) {
                this.element.attr("style", value);
            }
            if (key==="colWidth") {
                var colWidth = value;
                if (!$.isNaN(colWidth)) {
                    colWidth = $.trim(colWidth) + "%";
                }
                this.element.css("width", colWidth);
            }
            if(key ==="equalize"){
                //有可能先是通过equlizeClass设置了属性，以后不再设置了。
                if (value!=undefined && value === true) {
                    this.element.addClass(equlizeClass);
                    var parent = this.getParent();
                    //create时不调用adjustLayout
                    if (parent && parent != null && this.options.create===false) {
                        $(parent).wafColumnLayout("adjustLayout");
                    }
                } else if(value!=undefined && value === false){
                    if (this.element.hasClass(equlizeClass)) {
                        this.element.removeClass(equlizeClass);
                        this.element.css("height", "auto");
                    }
                }
            }
        },
        getParent:function () {
            var parent = this.element.parent();
            if (parent.hasClass(defaultColumnLayoutClass)) {
                return parent;
            }
            return null;
        },
        _createSplit:function (splitClass, shrink,draggable) {
            //仅在需要拖动的列元素的左边或者上面加上SPLIT.
            //如果是第一个column则不增加
            var tmp = $(this.element).prev("." + defaultColumnClass);
            if (tmp && tmp.length > 0) {
                //创建SPLIT DIV
                var parent = this.getParent();
                if (parent && parent != null) {
                    var totalWidth = $(parent).width();
                    var elem = $(parent).wafColumnLayout("addSplitColumn", {colWidth:splitWidth,equalize:true, tagClass:(splitpanelClass + " " + splitClass)}, $(this.element), totalWidth, $.boxLayoutUtil.getBorderWidth(parent));
                    if (shrink) {
                        var div = document.createElement("div");
                        $(div).addClass("shrink").addClass("shrink-left");
                        $(div).click(function () {
                            var status = $(elem).prev().css("display");
                            $(elem).prev().toggle();
                            if (status != "none") {
                                $(div).removeClass("shrink-right").removeClass("shrink-left");
                                $(div).addClass("shrink-right");
                                //获取前一个容器的宽度，它的宽度=内容的宽度+border的宽度.
                                var prewid = $.boxLayoutUtil.getElementWidth($(elem).prev());
                                var nextWid = $.boxLayoutUtil.getElementWidth($(elem).next()) + prewid;
                                $(elem).next().width(nextWid);
                            } else {
                                $(div).removeClass("shrink-right").removeClass("shrink-left");
                                $(div).addClass("shrink-left");

                                var percentage = $(elem).prev().attr("originalPercentage");
                                if (percentage) {
                                    $(elem).prev().width(percentage * totalWidth);
                                }

                                percentage = $(elem).next().attr("originalPercentage");
                                if (percentage) {
                                    $(elem).next().width(percentage * totalWidth);
                                }
                            }
                            //触发事件
                            $(elem).next().trigger("column.afterShrink");
                        });
                        $(elem).append($(div));
                        //加了shrink后，调整下布局，否则收缩图标位置会有跳跃现象
                        $(parent).wafColumnLayout("adjustLayout");
                    }
                    if(draggable!=undefined && draggable===true){
                        var containment = $.columnLayoutUtil.getContainment(elem);
                        //改变树表的样式
                        $(elem).css("cursor","col-resize");
                        //增加事件
                        $(elem).draggable({
                            "axis":"x",
                            helper:"clone",
                            containment:containment,
                            opacity:0.35,
                            stop:function (event, ui) {
                                var prevWid=0,nextWid=0,rangeWid=0,status = $(elem).prev().css("display");
                                var hidden = status === "none";
                                if(hidden && hidden === true){
                                    prevWid = 0;

                                    var percentage = $(elem).prev().attr("originalPercentage");
                                    if (percentage) {
                                        rangeWid += percentage * totalWidth;
                                    }
                                    percentage = $(elem).next().attr("originalPercentage");
                                    if (percentage) {
                                        rangeWid += percentage * totalWidth;
                                    }
                                    nextWid = rangeWid;
                                }else{
                                    prevWid = $.boxLayoutUtil.getElementWidth($(elem).prev());
                                    nextWid = $.boxLayoutUtil.getElementWidth($(elem).next());
                                }

                                var offset = ui.position.left - ui.originalPosition.left;

                                $(elem).prev().width(offset + prevWid);
                                $(elem).next().width(nextWid - offset);
                                if(hidden){
                                    $(div).removeClass("shrink-right").removeClass("shrink-left");
                                    $(div).addClass("shrink-left");
                                    $(elem).prev().css("display","inline-block");
                                }
                                if (totalWidth && totalWidth>0) {
                                    $(elem).prev().attr("originalPercentage", (offset + prevWid) / totalWidth);
                                    $(elem).next().attr("originalPercentage", (nextWid - offset) / totalWidth);
                                }
                                //删除clone的splitpanel内容
                                var splitpanels = $(elem).parent().children("." + defaultColumnClass + "." + splitpanelClass);
                                if (splitpanels && splitpanels.length > 0) {
                                    splitpanels.each(function () {
                                        var id = $(this).attr("id");
                                        if (id === undefined || id==="") {
                                            $(this).remove();
                                        }
                                    });
                                }
                                $(parent).wafColumnLayout("adjustLayout");
                                //触发事件
                                $(elem).next().trigger("column.afterDragStop");
                            }
                        });
                    }
                    //调用afterInsertSplit事件
                    if(elem){
                        $(elem).next().trigger("column.afterInsertSplit");
                    }
                }
            }
        },
        remove:function(){
            //向前删除
            var forwardRet = this._innerRemove(true);
            if(forwardRet!=undefined && forwardRet===false){
                //向后删除
                this._innerRemove(false);
            }
            this.element.remove();
        },
        _innerRemove:function(forward){
            var offset = 0;
            var split = (forward && forward===true)?this.element.prev("." + defaultColumnClass + "." + splitpanelClass):
                this.element.next("." + defaultColumnClass + "." + splitpanelClass);
            var hasSplit = split!=null && split.length>0?true:false;
            if(hasSplit){
                offset += $.boxLayoutUtil.getElementWidth(split);
            }
            offset += $.boxLayoutUtil.getElementWidth(this.element);

            var relativeCol = null;
            if(forward && forward === true){
                relativeCol = hasSplit?split.prev("." + defaultColumnClass):this.element.prev("." + defaultColumnClass);
            }else{
                relativeCol = hasSplit?split.next("." + defaultColumnClass):this.element.next("." + defaultColumnClass);
            }
            if(hasSplit){
                split.remove();
            }
            if(relativeCol!=null && relativeCol.length>0){
                var parent = this.getParent();
                var totalWidth = $(parent).width();
                var newWidth = $.boxLayoutUtil.getElementWidth(relativeCol)+offset;
                relativeCol.width(newWidth);
                if (totalWidth && totalWidth>0) {
                    relativeCol.attr("originalPercentage", newWidth / totalWidth);
                }
                return true;
            }
            return false;
        }
    });
    var $splitNum$= 0;
    $.widget("ui.wafColumnLayout", {
        options:{
            tagClass:null,
            style:null
        },
        _create:function () {
            var self = this;
            //增加默认的class
            self.element.addClass(defaultColumnLayoutClass).addClass(bordersizeClass);
            this._setOptions(this.options);

        },
        _setOption:function (key,value) {
            if (key==="tagClass" && value!=null) {
                this.element.removeClass(this.options.tagClass).addClass(value);
            }
            if (key==="style" && value!=null) {
                this.element.attr("style", value);
            }
        },
        getChildren:function () {
            //返回直接儿子
            var self = this;
            return self.element.children("." + defaultColumnClass);
        },
        adjustLayout:function () {
            var adjustelem = this.element.children("." + defaultColumnClass + "." + equlizeClass);
            if (adjustelem.length > 0) {
                adjustelem.css("height", "auto");
                var maxHeight = this.getMaxHeight();
                adjustelem.each(function () {
                    if (maxHeight) {
                        try {
                            var hei = parseFloat(maxHeight);
                            $(this).height(hei);
                        } catch (e) {
                        }
                    }
                });
            }
            this.adjustSplitWidth();
        },
        getMaxHeight:function () {
            var kids = this.getChildren();
            var maxHeight = 0;
            kids.each(function () {
                if ($(this).height() > maxHeight) {
                    maxHeight = $(this).height();
                }
            });
            return maxHeight;
        },
        adjustSplitWidth:function () {
            //改变大小时，同比例缩放
            var splitelem = this.element.children("." + defaultColumnClass);
            if (splitelem&&splitelem.length > 0) {
                var self = this, totalWidth = this.element.width();
                splitelem.each(function () {
                    if (!$(this).hasClass(splitpanelClass)) {
                        var percentage = $(this).attr("originalPercentage");
                        if (percentage) {
                            $(this).width(percentage * totalWidth);
                        }
                    }
                });
            }
            //改变拖动的限定范围
            var splitpanels = this.element.children("." + defaultColumnClass + "." + splitpanelClass);
            if (splitpanels && splitpanels.length > 0) {
                splitpanels.each(function () {
                    if($(this).attr("id") !=null && $(this).attr("id")!="" && $(this).next()!=null){
                        $(this).draggable("option", "containment", $.columnLayoutUtil.getContainment($(this)));
                    }
                });
            }
        },
        addSplitColumn:function (op, target, totalWidth, parentBorderWidth) {
            var o = {
                id:null,
                tagClass:null,
                style:null,
                colWidth:"100%",
                equalize:false
            };
            o = $.extend(o, op);
            if (o.id || o.id === null) {
                o.id = "splitpanel" + $splitNum$;
                $splitNum$++;
            }
            if(!$.browser.opera){
                this.element.css("letter-spacing", splitletterspaceing);
            }
            var elem = document.createElement("div");
            elem.id = o.id;
            $(elem).wafColumn(o);
            if (target) {
                //加载target的左边
                $(elem).insertBefore($(target));

                //计算当前的element同级别的所有的栏目宽度
                //找到所有的splitpanel
                var splitpanels = this.element.children("." + defaultColumnClass + "." + splitpanelClass);
                var tpanelWid = splitpanels.length * 5;

                var hasAllocateWid = 0, wid, percentage, id, kid;
                var children = this.getChildren();
                if (children && children.length > 0) {
                    children.each(function () {
                        kid = this;
                        if (!$(kid).hasClass(splitpanelClass)) {
                            id = $(kid).attr("id");
                            if (id != $(target).attr("id")) {
                                percentage = $(kid).attr("originalPercentage");
                                if (percentage && percentage > 0) {
                                    wid = (percentage) * (totalWidth - tpanelWid);
                                } else {
                                    wid = $.boxLayoutUtil.getElementWidth($(kid));
                                }
                                $(kid).width(wid);
                                if (totalWidth) {
                                    $(kid).attr("originalPercentage", (wid / totalWidth));
                                }
                                hasAllocateWid += wid;
                            }
                        }
                    });
                }
                //纠正target的宽度
                var wid = totalWidth - hasAllocateWid - tpanelWid;
                $(target).width(wid);
                if (totalWidth) {
                    $(target).attr("originalPercentage", (wid / totalWidth));
                }
            } else {
                $(elem).appendTo(this.element);
            }
            return elem;
        },
        remove:function(){
            //把相关联的Script也删除
            var script = this.element.next("script");
            if(script && script.length>0 && script.html().indexOf(completeEvent)>-1){
                script.remove();
            }
            this.element.remove();
        }
    });


    $.columnLayoutUtil = $.columnLayoutUtil || {};
    $.extend($.columnLayoutUtil, {
        getContainment:function (elem) {
            var prev = $(elem).prev();
            var next = $(elem).next();
            return [prev.offset().left, prev.offset().top,
                $.boxLayoutUtil.getElementWidth(next) + next.offset().left - parseInt(splitWidth,10)
                , next.offset().top
            ];
        }
    });


    window.onload = function () {
        $("." + defaultColumnLayoutClass).wafColumnLayout("adjustLayout");
    }

}(jQuery));

$(function(){
    var win$column$Width = $(window).width(),win$column$Height = $(window).height();
    $(window).resize(function () {
        var winNewWidth = $(window).width(),winNewHeight = $(window).height(),resizeTimeout;
        if(win$column$Width!=winNewWidth || win$column$Height!=winNewHeight){
            window.clearTimeout(resizeTimeout);
            resizeTimeout = window.setTimeout(function(){
                $(".ui-columnLayout").wafColumnLayout("adjustLayout");
            }, 10);
        }
        //Update the width and height
        win$column$Width = winNewWidth;
        win$column$Height = winNewHeight;
    });
});
