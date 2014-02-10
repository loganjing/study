/**
 * User: jinglg
 * Date: 11-12-26
 * Time: 上午11:40
 * To change this template use File | Settings | File Templates.
 * 与Group Merge有关系.
 */
(function ($) {
    $.fn.wafGrid = $.fn.jqGrid;
    var formatRowIndex = 0;
    $.jgrid.extend({
        addElementToNavBar:function (elem, p) {
            p = $.extend({
                position:"last",
                onclick:null
            }, p || {});
            return this.each(function () {
                if (!this.grid) {
                    return
                }
                if (elem.indexOf("#") != 0) {
                    elem = "#" + elem
                }
                var findnav = $(".navtable")[0], $t = this;
                if (findnav) {
                    var tbd = $("<td></td>");
                    $(tbd).addClass('ui-pg-button ui-corner-all').append("<div class='ui-pg-div'>" + $(elem).html() + "</div>");
                    if (p.position == 'first') {
                        if (findnav.rows[0].cells.length === 0) {
                            $("tr", findnav).append(tbd);
                        } else {
                            $("tr td:eq(0)", findnav).before(tbd);
                        }
                    } else {
                        $("tr", findnav).append(tbd);
                    }
                    $(tbd, findnav).click(
                        function (e) {
                            if (!$(this).hasClass('ui-state-disabled')) {
                                if ($.isFunction(p.onclick)) {
                                    p.onclick.call($t, findnav, e);
                                }
                                return false;
                            }
                        }).hover(function () {
                            if (!$(this).hasClass("ui-state-disabled")) {
                                $(this).addClass("ui-state-hover");
                            }
                        }, function () {
                            $(this).removeClass("ui-state-hover");
                        });
                }
            });
        },
        addFrozenColumn:function (colName) {
            return this.each(function () {
                if (!this.grid) return;
                var $t = this;
                //去掉所有的冻结列
                $($t).jqGrid("destroyFrozenColumns");
                //将已经存在的动态列重新加上
                var cM = $t.p.colModel;
                for (var i = 0; i < cM.length; i++) {
                    var coljson = $($t).jqGrid("getColProp", cM[i].name);
                    if (coljson.frozen) {
                        $($t).jqGrid("setColProp", cM[i].name, {frozen:true});
                    }
                }
                //重新设置
                $($t).jqGrid("setColProp", colName, {frozen:true});
                $($t).jqGrid("setFrozenColumns").trigger("reloadGrid", [
                    {current:true}
                ]);
            });
        },
        removeFrozenColumn:function (colName) {
            return this.each(function () {
                if (!this.grid) return;
                var $t = this;
                //去掉所有的冻结列
                $($t).jqGrid("destroyFrozenColumns");
                //将已经存在的动态列重新加上
                var cM = $t.p.colModel;
                for (var i = 0; i < cM.length; i++) {
                    var coljson = $($t).jqGrid("getColProp", cM[i].name);
                    if (coljson.frozen) {
                        if (cM[i].name === colName) {
                            $($t).jqGrid("setColProp", cM[i].name, {frozen:false});
                        } else {
                            $($t).jqGrid("setColProp", cM[i].name, {frozen:true});
                        }
                    }
                }
                $($t).jqGrid("setFrozenColumns").trigger("reloadGrid", [
                    {current:true}
                ]);
            });
        },
        option:function (key, value) {
            var options = key;

            if (arguments.length === 0) {
                return null;
            }

            if (typeof key === "string") {
                if (value === undefined) {
                    return this.jqGrid("getGridParam", key);
                } else {
                    options = {};
                    options[key] = value;
                    this.jqGrid("setGridParam", options);
                }
            } else {
                this.jqGrid("setGridParam", options);
            }
            return this;
        },
        optionColumn:function (col, obj) {

            if (arguments.length === 0) {
                return null;
            }

            if (obj === undefined) {
                if ($.isNaN(col)) {
                    return this.jqGrid("getColProp", col);
                } else {
                    if (this[0].p.rownumbers) {
                        col++;
                    }
                    if (this[0].p.multiselect) {
                        col++;
                    }
                    return this[0].p.colModel[col];
                }
            } else {
                if (typeof obj === "object") {
                    this.jqGrid("setColProp", col, obj);
                }
            }
            return this;
        },
        findParentForm:function (formId) {
            var form = null, $t = this[0];
            if (formId && formId != null) {
                form = $(formId);
            }
            if (form == null) {
                //搜索form
                var parent = $("#gbox_" + $t.p.id).parent();
                var tagName = parent[0].tagName.toUpperCase();
                while (tagName != "BODY" && form == null) {
                    if ("FORM" === parent.get(0).tagName.toUpperCase()) {
                        form = parent;
                        break;
                    } else {
                        parent = parent.parent()
                        tagName = parent[0].tagName.toUpperCase();
                    }
                }
            }
            return form;
        },
        initForm:function (formId) {
            this.each(function () {
                var $t = this, form = $($t).jqGrid("findParentForm");
                if (form) {
                    if ($t.p.cellEdit) {
                        var grids = form.data("grids") || [];
                        grids.push($t.p.id);
                        $(form).data("grids", grids);
                    }
                    form.bind("onSubmit", function (cur, data) {
                        var grids = $(this).data("grids");
                        if (grids) {
                            for (var index = 0; index < grids.length; index++) {
                                var id = grids[index];
                                var t = $("#" + id)[0];
                                var saveWhenSubmit = t.p.saveWhenSubmit;
                                var saveAllHidden = t.p.saveAllHidden;
                                var entryProp = t.p.entryProp;
                                if (saveWhenSubmit) {
                                    var rows = t.rows;
                                    var datas = [];
                                    var styleClass = entryProp + "_" + t.p.id;
                                    //$("."+styleClass).remove();
                                    for (var i = 0; i < rows.length; i++) {
                                        var rowId = $(rows[i]).attr("id");
                                        if (rowId) {
                                            //判断新增的行是否是空行
                                            if ($(rows[i]).hasClass("jqgrid-new-row")) {
                                                if ($("td.dirty-cell", $(rows[i])).length == 0) {
                                                    continue;
                                                }
                                            }
                                            var res = $(t).jqGrid("getRowRealData", rowId);
                                            if (saveAllHidden) {
                                                for (var column in res) {
                                                    var hiddenId = t.p.id + "_" + column + "_" + i;
                                                    var tmp = $("#" + hiddenId);
                                                    if (tmp.length == 0) {
                                                        tmp = document.createElement("input");
                                                    } else {
                                                        tmp = tmp[0];
                                                    }
                                                    tmp.type = "hidden";
                                                    tmp.id = hiddenId;
                                                    tmp.name = (entryProp + "[" + i + "]." + column);
                                                    if (typeof res[column] === "object") {
                                                        tmp.value = waf.toJSONString(res[column]);
                                                    } else {
                                                        tmp.value = res[column];
                                                    }
                                                    $(tmp).addClass(styleClass);
                                                    $(this).append(tmp);
                                                }
                                            } else {
                                                datas.push(res);
                                            }
                                        }
                                    }
                                    if (!saveAllHidden) {
                                        var hidden = $("#" + entryProp);
                                        if (hidden.length == 0) {
                                            var hidden = document.createElement("input");
                                            hidden.type = "hidden";
                                            hidden.id = entryProp;
                                            $(this).append(hidden);
                                        }
                                        $(hidden).attr("value", waf.toJSONString(datas));
                                        $(hidden).attr("name", entryProp);
                                        $(hidden).addClass("tmphidden");
                                    }
                                }
                            }
                        }
                    });
                }
            });
        },
        changeCellEditor:function (rowId, colName, config) {
            var p = {
                edittype:null,
                editoptions:null,
                formatter:null,
                formatoptions:null
            };
            $.extend(p, config);
            //将editor的配置存放到表格中
            if (config && !$.isEmptyObject(p)) {
                var $t = this[0],
                    keyStr = rowId + "-" + colName,
                    cellEditorConfig = this.data("cellEditorConfig") || {};
                cellEditorConfig[keyStr] = config;
                this.data("cellEditorConfig", cellEditorConfig);
            }
        },
        getCellEditorConfig:function (rowId, colName) {
            //是否设置过单元格的编辑器
            var col = (undefined === rowId || null === rowId), ret = {};
            if (col) {
                ret = this.wafGrid("optionColumn", colName);
            } else {
                var keyStr = rowId + "-" + colName,
                    cellEditorConfig = this.data("cellEditorConfig") || {};
                var tmp = cellEditorConfig[keyStr];
                if (tmp) {
                    ret = tmp;
                } else {
                    ret = this.wafGrid("optionColumn", colName);
                }
            }
            return $.extend(true, {}, ret);
        },
        setCellEditorConfig:function (colName, propName, value, rowId, isPromptSelf) {
            //是否设置过单元格的编辑器
            var col = (undefined === rowId || null === rowId);
            var colModel = this.wafGrid("getCellEditorConfig", rowId, colName);
            var tmp = $.extend(true, {}, colModel);
            //更新属性
            tmp = $.jgrid.setCellEditorConfig(tmp, propName, value, isPromptSelf);
            //更新到存储位置
            if (col) {
                this.wafGrid("optionColumn", colName, tmp);
            } else {
                this.wafGrid("changeCellEditor", rowId, colName, tmp);
            }
        },
        getErrorInput:function () {
            var ts = this[0];
            if (ts.p.cellEdit === false) return null;
            var errorInput = this.find("tr.jqgrow td.errorinput");
            if (errorInput && errorInput.length > 0) {
                return errorInput;
            }
            return null;
        },
        removeSelect:function (rowId) {
            var t = this[0], ind, one = rowId != undefined;
            var froz = t.p.frozenColumns === true ? t.p.id + "_frozen" : "";
            if (t.p.multiselect) {
                $(t.p.selarrrow).each(function (i, n) {
                    ind = t.rows.namedItem(n);
                    if (one) {
                        if (rowId === n) {
                            $(ind).removeClass("ui-state-highlight").attr("aria-selected", "false");
                            $("#jqg_" + $.jgrid.jqID(t.p.id) + "_" + $.jgrid.jqID(n))[t.p.useProp ? 'prop' : 'attr']("checked", false);
                            if (froz) {
                                $("#jqg_" + $.jgrid.jqID(t.p.id) + "_" + $.jgrid.jqID(this.id), t.grid.fbDiv)[t.p.useProp ? 'prop' : 'attr']("checked", false);
                                $("#" + $.jgrid.jqID(t.p.id), t.grid.fbDiv).removeClass("ui-state-highlight");
                            }
                            t.p.selarrrow.splice(i, 1);
                            return;
                        }
                    } else {
                        $(ind).removeClass("ui-state-highlight").attr("aria-selected", "false");
                        $("#jqg_" + $.jgrid.jqID(t.p.id) + "_" + $.jgrid.jqID(n))[t.p.useProp ? 'prop' : 'attr']("checked", false);
                        if (froz) {
                            $("#jqg_" + $.jgrid.jqID(t.p.id) + "_" + $.jgrid.jqID(this.id), t.grid.fbDiv)[t.p.useProp ? 'prop' : 'attr']("checked", false);
                            $("#" + $.jgrid.jqID(t.p.id), t.grid.fbDiv).removeClass("ui-state-highlight");
                        }
                        t.p.selarrrow.splice(0, 1);
                    }
                });
            } else {
                ind = t.rows.namedItem(t.p.selrow);
                $(ind).removeClass("ui-state-highlight").attr("aria-selected", "false");
                $("#jqg_" + $.jgrid.jqID(t.p.id) + "_" + $.jgrid.jqID(t.p.selrow))[t.p.useProp ? 'prop' : 'attr']("checked", false);
                t.p.selrow = null;
            }
        },
        gridRowSpan:function (col) {
            return this.each(function () {
                if (col === null || col === undefined || col.length <= 0) return;
                var arr = col.split(",");
                var cM = this.p.colModel;
                //按照colModel的顺序排序,否则，rowSpan后通过td:eq取得的值是错误的，排序后按照从后到前的顺序来合并
                for (var len = 0; len < arr.length; len++) {
                    var cName = $.isNaN(arr[i]);
                    if (cName && cName === true) {
                        for (var tmp = 0; tmp < cM.length; tmp++) {
                            if (cM[tmp].name === arr[len]) {
                                arr[len] = tmp;
                                break;
                            }
                        }
                    }
                }
                //排序
                function sort(array) {
                    var i = 0, len = array.length,
                        j, d;
                    for (; i < len; i++) {
                        for (j = 0; j < len; j++) {
                            if (array[i] < array[j]) {
                                d = array[j];
                                array[j] = array[i];
                                array[i] = d;
                            }
                        }
                    }
                    return array;
                }

                arr = sort(arr);
                var that = null, rowspan = 1;
                for (var i = arr.length - 1; i >= 0; i--) {
                    var colIdx = arr[i];
                    that = null;
                    rowspan = 1;
                    $('tbody tr', this).each(function (row) {
                        $('td:eq(' + colIdx + ')', this).each(function (col) {
                            if (that != null && $(this).html() == $(that).html()) {
                                rowspan += 1;
                                $(this).remove();
                                $(that).attr("rowSpan", rowspan);
                            } else {
                                that = this;
                                rowspan = 1;
                            }
                        });
                    });
                }
                //判断是否是IE8
                if (this.p.autowidth === true && this.p.shrinkToFit === true && jQuery.support.boxModel) {
                    var tmp = $(this).closest(".ui-jqgrid-bdiv").eq(0);
                    if (tmp && tmp.length > 0) {
                        tmp.css("overflow", "hidden");
                    }
                }
            });
        },
        removeColumn:function (colName, loaddata) {
            //删除某列
            this.each(function () {
                var p = $.extend(true, {}, this.p);
                var cm = p.colModel;
                for (var i = 0; i < cm.length; i++) {
                    if (colName === cm[i].name) {
                        p.colModel.splice(i, 1);
                        p.colNames.splice(i, 1);
                        break;
                    }
                }
                if (p.colModel.length > 0 && p.colModel[0].name == "rn") {
                    p.colModel.splice(0, 1);
                    p.colNames.splice(0, 1);
                }
                p.loadInit = loaddata;
                $(this).jqGrid("gridUnload");
                $("#" + p.id).jqGrid(p);
            })
        },
        removeAllColumn:function () {
            //删除某列
            this.each(function () {
                var p = $.extend(true, {}, this.p);
                p.colModel = [];
                p.colNames = [];
                p.loadInit = false;
                $(this).jqGrid("gridUnload");
                $("#" + p.id).jqGrid(p);
            })
        },
        addColumn:function (config, index, loaddata) {
            config = $.extend({
                align:"center",
                formatoptions:null,
                formatter:null,
                frozen:false,
                hidden:false,
                index:null,
                key:false,
                label:"new column",
                name:"newcolumn",
                sortable:false,
                sorttype:"asc",
                width:null,
                rowspan:false,
                cellattr:null,
                fixed:false,
                editable:false
            }, config || {});
            this.each(function () {
                var p = $.extend(true, {}, this.p);
                p.colModel = p.colModel || [];
                p.colNames = p.colNames || [];
                for (var i = 0; i < p.colModel.length; i++) {
                    if (p.colModel[i].name != "rn") {
                        p.colModel[i].width = p.colModel[i].widthOrg;
                    }
                }
                if (index == undefined || $.isNaN(index)) {
                    p.colModel.push(config);
                    p.colNames.push(config.label);
                } else {
                    p.colModel.splice(index, 0, config);
                    p.colNames.splice(index, 0, config.label);
                }
                if (p.colModel.length > 0 && p.colModel[0].name == "rn") {
                    p.colModel.splice(0, 1);
                    p.colNames.splice(0, 1);
                }
                p.loadInit = loaddata;
                $(this).jqGrid("gridUnload");
                $("#" + p.id).jqGrid(p);
            })
        },
        getGridConfig:function () {
            return this[0].p;
        },
        gridRestore:function (p) {
            if (p != undefined && p.colModel != undefined && p.colModel.length > 0) {
                if (p.colModel.length > 0 && p.colModel[0].name == "rn") {
                    p.colModel.splice(0, 1);
                    p.colNames.splice(0, 1);
                }
                $("#" + p.id).jqGrid(p);
            }
        },
        //TODO:插入正确的分录后，rowid是bosid还是整数id
        addLocalRowData:function (data, pos, src) {
            this.each(function () {
                if ($.isArray(data)) {
                    if (data.length > 0) {
                        var idn = "id";
                        for (i = 0; i < this.p.colModel.length; i++) {
                            if (this.p.colModel[i].key === true) {
                                idn = this.p.colModel[i].name;
                                break;
                            }
                        }
                        for (var i = 0; i < data.length; i++) {
                            waf(this).wafGrid('addRowData', (data[i][idn] ? data[i][idn] : (i + 1)), data[i], pos, src);
                        }
                    }
                }
                $(this).jqGrid("showNoRecords");
            })
        },
        setGridParam:function (newParams) {
            return this.each(function () {
                if (this.grid && typeof(newParams) === 'object') {
                    $.extend(true, this.p, newParams);
                }
                for (var key in newParams) {
                    if (key === "ondblClickRow") {
                        $(this).dblclick(function (e) {
                            var td = e.target;
                            var ptr = $(td, this.rows).closest("tr.jqgrow");
                            if ($(ptr).length === 0) {
                                return false;
                            }
                            var ri = ptr[0].rowIndex;
                            var ci = $.jgrid.getCellIndex(td);
                            this.p.ondblClickRow.call(this, $(ptr).attr("id"), ri, ci, e);
                            return false;
                        });
                    }
                    if (key === "onRightClickRow") {
                        $(this).bind('contextmenu', function (e) {
                            var td = e.target;
                            var ptr = $(td, this.rows).closest("tr.jqgrow");
                            if ($(ptr).length === 0) {
                                return false;
                            }
                            if (!this.p.multiselect) {
                                $(this).jqGrid("setSelection", ptr[0].id, true);
                            }
                            var ri = ptr[0].rowIndex;
                            var ci = $.jgrid.getCellIndex(td);
                            this.p.onRightClickRow.call(this, $(ptr).attr("id"), ri, ci, e);
                            return false;
                        });
                    }
                    if (key === "rowNum") {
                        if ($('.ui-pg-selbox', "#pager" + this.p.id).length > 0) {
                            $('.ui-pg-selbox', "#pager" + this.p.id)[0].value = this.p.rowNum;
                            $('.ui-pg-selbox', "#pager" + this.p.id).trigger("change");
                        }
                    }
                }
            });
        },
        //TODO:和4.3.3比较
        getRowRealData:function (rowid) {
            var res = {}, resall, getall = false, len, j = 0;
            this.each(function () {
                var $t = this, nm, ind;
                //add by jlg.
                //可能最后一个单元格还没有保存。add by jlg.
                if ($t.p.savedRow.length > 0) {
                    // save the cell
                    $($t).jqGrid("saveCell", $t.p.savedRow[0].id, $t.p.savedRow[0].ic);
                }
                if (typeof(rowid) == 'undefined') {
                    getall = true;
                    resall = [];
                    len = $t.rows.length;
                } else {
                    ind = $t.rows.namedItem(rowid);
                    if (!ind) {
                        return res;
                    }
                    len = 2;
                }
                while (j < len) {
                    if (getall) {
                        ind = $t.rows[j];
                    }
                    if ($(ind).hasClass('jqgrow')) {
                        $('td', ind).each(function (i) {
                            nm = $t.p.colModel[i].name;
                            if (nm !== 'cb' && nm !== 'subgrid' && nm !== 'rn') {
                                if ($t.p.treeGrid === true && nm == $t.p.ExpandColumn) {
                                    res[nm] = $.jgrid.htmlDecode($("span:first", this).html());
                                } else {
                                    try {
                                        res[nm] = $.unformat(this, {rowId:ind.id, colModel:$t.p.colModel[i], gid:$t.p.id}, i);
                                    } catch (e) {
                                        res[nm] = $.jgrid.htmlDecode($(this).html());
                                    }
                                }
                                if (res[nm]) {
                                    //处理日期
                                    var formatType = $t.p.colModel[i].formatter;
                                    var cellEditConfig = $($t).jqGrid("getCellEditorConfig", $t.rows[j].id, $t.p.colModel[i].name);
                                    if (cellEditConfig) {
                                        formatType = cellEditConfig.formatter;
                                    }
                                    if (formatType && formatType === "datepicker") {
                                        if (!$.fmatter.isUndefined($t.p.colModel[i].editoptions)) {
                                            var dateFormat = $t.p.colModel[i].editoptions.dateFormat;
                                            try {
                                                var date = waf.datepicker.parseDate(dateFormat, res[nm]);
                                                res[nm] = waf.datepicker.formatDate("yy-mm-dd", date);
                                            } catch (e1) {
                                            }
                                        }
                                    }
                                }
                            }
                        });
                        if (getall) {
                            resall.push(res);
                            res = {};
                        }
                    }
                    j++;
                }
            });
            return resall ? resall : res;
        },
        getCellObject:function (rowid, col) {
            var ret = false;
            this.each(function () {
                var $t = this, pos = -1;
                if (!$t.grid) {
                    return;
                }
                if (isNaN(col)) {
                    $($t.p.colModel).each(function (i) {
                        if (this.name === col) {
                            pos = i;
                            return false;
                        }
                    });
                } else {
                    pos = parseInt(col, 10);
                }
                if (pos >= 0) {
                    var ind = $t.rows.namedItem(rowid);
                    if (ind) {
                        ret = $("td:eq(" + pos + ")", ind);
                    }
                }
            });
            return ret;
        },
        getRowIndex:function (rowid) {
            var ret = false, rw;
            this.each(function () {
                rw = this.rows.namedItem(rowid);
                if (rw) {
                    ret = rw.rowIndex;
                }
            });
            return ret;
        },
        getRowObject:function (rowid) {
            var ret = false;
            this.each(function () {
                ret = this.rows.namedItem(rowid);
            });
            return ret;
        },
        adjustWidthInTab:function () {
            this.each(function () {
                var id = this.p.id, datagrid = $("#" + id + "_outer");
                var grid = $("#" + id).closest(".ui-jqgrid").eq(0);
                if (datagrid.length <= 0) {
                    datagrid = grid;
                }
                var parent = datagrid.parent();
                var wid = $.boxLayoutUtil.getBorderWidth(grid) + $.boxLayoutUtil.getMarginWidth(grid) + $.boxLayoutUtil.getPaddingWidth(grid);
                $("#" + id).wafGrid("setGridWidth", parent.width() - wid, true);
            })
        },
        initFinish:function () {
            this.each(function () {
                var $t = this, ts = this;
                if ($t.p.cellEdit) {
                    $(this).jqGrid("initForm", null);
                }
                $(this).keydown(function (e) {
                    if (e.keyCode == 13 && !e.ctrlKey) {
                        if ($($t).find("tr.norecord").length > 0) {
                            $(this).jqGrid("addRow");
                        } else {
                            $(this).jqGrid("nextCell", 1, 0);
                        }
                    }
                });
                $(this).focus(function () {
                    if ($t.p.cellEdit) {
                        $(this).closest(".ui-jqgrid").eq(0).css("border", "1px solid #ffba00");
                    }
                });
                $(this).blur(function () {
                    if ($t.p.cellEdit) {
                        $(this).closest(".ui-jqgrid").eq(0).css("border", "1px solid #8E8E8D");
                    }
                });
                if ($t.p.cellEdit && $.fn.enter2tab) {
                    $(this).enter2tab();
                }
                //注册endReq内部事件代码
                this.p._endReq = function () {
                    //add by jlg.
                    if (this.p.cellEdit === false) {
                        var cm = this.p.colModel;
                        for (var i = cm.length - 1; i >= 0; i--) {
                            if (cm[i].rowspan != undefined && cm[i].rowspan === true) {
                                $(this).jqGrid("gridRowSpan", cm[i].name);
                            }
                        }
                    }
                    $(this).jqGrid("showNoRecords");
                }
                //注册内部jqGridGridComplete事件
                $(this).bind("jqGridGridComplete", function () {
                    $(this).jqGrid("showNoRecords");
                });

                //处理mouseover事件
                $(this).bind('mouseover',
                    function (e) {
                        var ptd = $(e.target), ptr = $(ptd).closest("tr.jqgrow"), rowspan = ptd.attr("rowspan") || 1;
                        if(ptd && ptd.length>0 && ptd[0].tagName=="TD"&&ptr.length>0){
                            for (var i = 0; i < rowspan; i++) {
                                //取消tr上的ui-state-hover
                                ptr.removeClass("ui-state-hover");
                                //将ui-state-hover加入到td上
                                $("td", ptr[0]).each(function () {
                                    if(!($(this).attr("rowspan") && $.jgrid.getCellIndex(this)<$.jgrid.getCellIndex(ptd))){
                                        $(this).addClass("ui-state-hover");
                                    }
                                });
                                //如果当前单元格为合并后的单元格
                                ptr = ptr.next("tr.jqgrow");
                            }
                        }
                    }).bind('mouseout',
                    function (e) {
                        var ptd = $(e.target), ptr = $(ptd).closest("tr.jqgrow"), rowspan = ptd.attr("rowspan") || 1;
                        if(ptd && ptd.length>0 && ptd[0].tagName=="TD"&&ptr.length>0){
                            for (var i = 0; i < rowspan; i++) {
                                //取消tr上的ui-state-hover
                                ptr.removeClass("ui-state-hover");
                                //将ui-state-hover加入到td上
                                $("td", ptr[0]).each(function () {
                                    $(this).removeClass("ui-state-hover");
                                });
                                //如果当前单元格为合并后的单元格
                                ptr = ptr.next("tr.jqgrow");
                            }
                        }
                    }).bind("click", function (e) {
                        var td = $(e.target), ptr = $(td).closest("tr.jqgrow"), rowspan = (parseInt(td.attr("rowspan"))) || 1;
                        if(td && td.length>0 && td[0].tagName=="TD"&&ptr.length>0){
                            td.removeClass("ui-rowspan-none");
                            var cSel = ptr.hasClass("ui-state-highlight");
                            if(cSel === true) {
                                if ( !ts.p.cellEdit) {
                                    if(ts.p.multiselect){
                                        //多选,一次性选择多个
                                        for (var i = 0; i < rowspan; i++) {
                                            //未选中的行先选中
                                            if(!ptr.hasClass("ui-state-highlight")){
                                                $(ts).jqGrid("setSelection",ptr[0].id,true,e);
                                            }
                                            //当前选中行的ui-state-highlight
//                                        ptr.removeClass("ui-state-highlight");
                                            //将ui-state-highlight加入到td上
                                            $("td", ptr[0]).each(function () {
                                                if(($(this).attr("rowspan") && $.jgrid.getCellIndex(this)<$.jgrid.getCellIndex(td))){
                                                    $(this).addClass("ui-rowspan-none");
                                                }
                                            });
                                            ptr = ptr.next("tr.jqgrow");
                                        }
                                    }else{
                                        //单选
                                        //当前选中行的ui-state-highlight
//                                    ptr.removeClass("ui-state-highlight");
                                        //将ui-state-highlight加入到td上
                                        $("td", ptr[0]).each(function () {
                                            if(($(this).attr("rowspan"))){
                                                $(this).addClass("ui-rowspan-none");
                                            }
                                        });
                                    }
                                }
                            }else{
                                //已经删除了
                                if ( !ts.p.cellEdit && ts.p.multiselect ) {
                                    if(ts.p.multiselect){
                                        rowspan -=1;
                                        for (var i = 0; i < rowspan; i++) {
                                            if (i <= (rowspan - 1)) {
                                                ptr = ptr.next("tr.jqgrow");
                                            }
                                            $(ts).jqGrid("removeSelect",ptr[0].id);
                                            //删除td上的ui-state-hightlight
                                            $("td", ptr[0]).each(function () {
                                                $(this).removeClass("ui-rowspan-none");
                                            });
                                        }
                                    }else{
                                        //删除td上的ui-state-hightlight
                                        $("td", ptr[0]).each(function () {
                                            $(this).removeClass("ui-rowspan-none");
                                        });
                                    }

                                }
                            }
                        }
                    });
            })
        },
        showNoRecords:function () {
            this.each(function () {
                //add by jlg.
                if ($(this).find("tr.jqgrow").length == 0) {
                    if ($(this).find("tr.norecord").length == 0) {
                        var rowData = [];
                        rowData.push("<tr role=\"row\" class= \"norecord\">");
                        rowData.push("<td style='text-align:center' colspan='" + this.p.colModel.length + "'>" + $.wafjgrid.noquerydata.info + "</td>");
                        rowData.push("</tr>");
                        $("#" + $.jgrid.jqID(this.p.id) + " tbody:first").append(rowData.join(''));
                        $("#pager" + this.p.id).hide();
                        rowData = [];
                    }
                } else {
                    $(this).find("tr.norecord").remove();
                    $("#pager" + this.p.id).show();
                }
            });
        },
        //TODO:和4.3.3比较
        addRow:function (p) {
            p = $.extend(true, {
                rowID:"new_row",
                data:{},
                position:"last",
                useDefValues:true,
                useFormatter:false,
                src:null,
                addRowParams:{extraparam:{}},
                afterAddRow:null
            }, p || {});
            return this.each(function () {
                if (!this.grid) {
                    return;
                }
                function findNextId(ts) {
                    var maxId = 0;
                    $("#" + $(ts)[0].p.id + " tr").each(function () {
                        var id = $(this).attr("id");
                        try {
                            id = parseInt(id);
                            if (id > maxId) {
                                maxId = id;
                            }
                        } catch (e) {
                        }
                    });
                    maxId = parseInt(maxId) + 1;
                    return maxId;
                }

                var $t = this;
                //可能最后一个单元格还没有保存。add by jlg.
                if ($t.p.savedRow.length > 0) {
                    // save the cell
                    $($t).jqGrid("saveCell", $t.p.savedRow[0].id, $t.p.savedRow[0].ic);
                }
                //找到下一个最大的rowId
                if (p.rowID === "new_row") {
                    p.rowID = findNextId($t);
                }
                if (p.useDefValues === true) {
                    $($t.p.colModel).each(function (i) {
                        if (this.editoptions && this.editoptions.defaultValue) {
                            var opt = this.editoptions.defaultValue,
                                tmp = $.isFunction(opt) ? opt.call($t) : opt;
                            p.data[this.name] = tmp;
                        }
                    });
                }
                $($t).jqGrid('addRowData', p.rowID, p.data, p.position, p.src);
                $("#" + $.jgrid.jqID(p.rowID), "#" + $.jgrid.jqID($t.p.id)).addClass("jqgrid-new-row");
                if (p.useFormatter) {
                    $("#" + $.jgrid.jqID(p.rowID) + " .ui-inline-edit", "#" + $.jgrid.jqID($t.p.id)).click();
                } else {
                    var opers = $t.p.prmNames,
                        oper = opers.oper;
                    p.addRowParams.extraparam[oper] = opers.addoper;
                    //找到第一个可以编辑的Cell.TODO:如果某个单元格可编辑怎么办？
                    $($t).jqGrid('removeSelect');
                    $($t).jqGrid('setSelection', p.rowID);
                    var iCol = 0, nm;
                    for (var i = 0; i < $t.p.colModel.length; i++) {
                        nm = $t.p.colModel[i];
                        if (nm.name !== 'cb' && nm.name !== 'subgrid') {
                            if (nm.editable && nm.editoptions) {//add by jlg.
                                iCol = i;
                                break;
                            }
                        }
                    }
                    if ($t.p.cellEdit === true) {
                        var rowInd = $t.rows.namedItem(p.rowID);
                        if (rowInd) {
                            $($t).jqGrid('editCell', rowInd.rowIndex, iCol, true);
                        }
                    }
                }
                if ($.isFunction(p.afterAddRow)) {
                    p.afterAddRow.call(this, $t, $t.p.colModel, p.rowID);
                }
            });
        },
        //TODO:和4.3.3比较
        delRow:function (rowid, p) {
            p = $.extend(true, {
                beforeDelRow:null,
                afterDelRow:null
            }, p || {});
            var success = false, rowInd, ia, ri, keyValue, delObject;
            this.each(function () {
                var $t = this;
                rowInd = $t.rows.namedItem(rowid);
                if (!rowInd) {
                    return false;
                }
                else {
                    ri = rowInd.rowIndex;
                    if ($.isFunction(p.beforeDelRow)) {
                        var bfr = p.beforeDelRow.call(this, rowid, $t, $t.p.colModel);
                        if (bfr === undefined) {
                            bfr = true;
                        }
                        if (bfr === false) {
                            return;
                        }
                    }
                    $("td", rowInd).each(function (i) {
                        var nm = $t.p.colModel[i];
                        if (nm.name !== 'cb' && nm.name !== 'subgrid') {
                            if (nm.key && nm.key === true) {
                                keyValue = $.unformat(this, {rowId:rowInd.id, colModel:$t.p.colModel[i], gid:$($t).attr("id")}, i);
                            }
                        }
                    });
                    delObject = $("#" + $t.p.id).jqGrid("getRowRealData", rowid);
                    $(rowInd).remove();
                    $t.p.records--;
                    $t.p.reccount--;
                    $t.updatepager(true, false);
                    success = true;
                    if ($t.p.multiselect) {
                        ia = $.inArray(rowid, $t.p.selarrrow);
                        if (ia != -1) {
                            $t.p.selarrrow.splice(ia, 1);
                        }
                    }
                    if (rowid == $t.p.selrow) {
                        $t.p.selrow = null;
                    }
                }
                if ($t.p.datatype == 'local') {
                    var pos = $t.p._index[rowid];
                    if (typeof(pos) != 'undefined') {
                        $t.p.data.splice(pos, 1);
                        $t.refreshIndex();
                    }
                }
                if ($t.p.altRows === true && success) {
                    var cn = $t.p.altclass;
                    $($t.rows).each(function (i) {
                        if (i % 2 == 1) {
                            $(this).addClass(cn);
                        }
                        else {
                            $(this).removeClass(cn);
                        }
                    });
                }
                if (success) {
                    if ($.isFunction(p.afterDelRow)) {
                        p.afterDelRow.call(this, $t, $t.p.colModel);
                    }
                    if (keyValue) {
                        havedDelRowKey = $t.p.havedDelRowKey || [];
                        havedDelRowKey.push(delObject);
                        $t.p.havedDelRowKey = havedDelRowKey;
                    }
                }
            });
            return success;
        },
        resizeGrid:function (p) {
            p = $.extend(true, {
                base:this[0],
                offset:0
            }, p || {});
            this.each(function () {
                if (this.p.autowidth === true) {
                    var jqgrid = $(p.base).closest('div.ui-jqgrid');
                    var parent = jqgrid.parent();
                    var realWid = parent.width() - $.boxLayoutUtil.getBorderWidth(jqgrid) - $.boxLayoutUtil.getMarginWidth(jqgrid) - $.boxLayoutUtil.getPaddingWidth(jqgrid);
                    $(this).jqGrid("setGridWidth", (realWid), this.p.shrinkToFit);
                }
            });
        }
    });





})(jQuery);


