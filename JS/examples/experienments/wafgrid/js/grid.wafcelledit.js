 ;
(function ($) {
    $.jgrid.extend({
        editCell:function (iRow, iCol, ed) {
            return this.each(function () {
                var $t = this, nm, tmp, cc, cm;
                if (!$t.grid || $t.p.cellEdit !== true) {
                    return;
                }
                iCol = parseInt(iCol, 10);
                // select the row that can be used for other methods
                $t.p.selrow = $t.rows[iRow].id;
                if (!$t.p.knv) {
                    $($t).jqGrid("GridNav");
                }
                // check to see if we have already edited cell
                if ($t.p.savedRow.length > 0) {
                    // prevent second click on that field and enable selects
                    if (ed === true) {
                        if (iRow == $t.p.iRow && iCol == $t.p.iCol) {
                            return;
                        }
                    }
                    // save the cell
                    $($t).jqGrid("saveCell", $t.p.savedRow[0].id, $t.p.savedRow[0].ic);
                } else {
                    window.setTimeout(function () {
                        $("#" + $.jgrid.jqID($t.p.knv)).attr("tabindex", "-1").focus();
                    }, 0);
                }
                cm = $t.p.colModel[iCol];
                nm = cm.name;
                if (nm == 'subgrid' || nm == 'cb' || nm == 'rn') {
                    return;
                }
                //如果没有记录则返回
                if ($($t).find("tr.norecord").length > 0) {
                    return;
                }
                cc = $("td:eq(" + iCol + ")", $t.rows[iRow]);
                if (cm.editable === true && ed === true && !cc.hasClass("not-editable-cell")) {
                    //移除上个的编辑单元格class
                    if (parseInt($t.p.iCol, 10) >= 0 && parseInt($t.p.iRow, 10) >= 0) {
                        $("td:eq(" + $t.p.iCol + ")", $t.rows[$t.p.iRow]).removeClass("edit-cell ui-state-highlight");
                        $($t.rows[$t.p.iRow]).removeClass("selected-row ui-state-hover");
                    }
                    $($t.rows[iRow]).addClass("selected-row ui-state-hover");
                    //获取单元格的值
                    try {
                        tmp = $.unformat.call($t, cc, {rowId:$t.rows[iRow].id, colModel:cm, gid:$($t).attr("id")}, iCol);
                    } catch (_) {
                        tmp = ( cm.edittype && cm.edittype == 'textarea' ) ? $(cc).text() : $(cc).html();
                    }
                    if ($t.p.autoencode) {
                        tmp = $.jgrid.htmlDecode(tmp);
                    }
                    if (tmp === undefined || tmp == "&nbsp;" || tmp == "&#160;" || (tmp.length === 1 && tmp.charCodeAt(0) == 160)) {
                        tmp = '';
                    }
                    //格式化单元格的值
                    if ($.isFunction($t.p.formatCell)) {
                        var tmp2 = $t.p.formatCell.call($t, $t.rows[iRow].id, nm, tmp, iRow, iCol);
                        if (tmp2 !== undefined) {
                            tmp = tmp2;
                        }
                    }
                    //获取当前行的值，并调用beforeCellEditor
                    var rowdata = $("#" + $t.p.id).jqGrid("getRowData", $t.rows[iRow].id);
                    var editable = ed;
                    $($t).triggerHandler("jqGridBeforeEditCell", [$t.rows[iRow].id, nm, tmp, iRow, iCol]);
                    if ($.isFunction($t.p.beforeEditCell)) {
                        var tmp3 = $t.p.beforeEditCell.call($t, $t.rows[iRow].id, nm, tmp, iRow, iCol, rowdata);
                        if (tmp3 != undefined && typeof tmp3 === "boolean") editable = tmp3;
                    }
                    //如果没有编辑选项，则不能编辑,如果动态更改编辑器就不行了。
//                    if(!cm.editoptions){editable = false}
                    //判断是否可编辑
                    if (editable === undefined || editable === true) {
                        //可编辑单元格增加CLASS
                        $(cc).addClass("edit-cell ui-state-highlight");
                        //可编辑时需要将当前行保存到savedRow中
                        if (!cm.edittype) {
                            cm.edittype = "text";
                        }
                        $t.p.savedRow.push({id:iRow, ic:iCol, name:nm, v:tmp});
                        if ($.isFunction($t.p.formatCellEditor)) {
                            $t.p.formatCellEditor.call($t, $t.rows[iRow].id, nm, tmp, iCol, rowdata);
                        }

                        //modify by jlg
                        var cellEditorConfig = $("#" + $t.p.id).jqGrid("getCellEditorConfig", $t.rows[iRow].id, cm.name);
                        var edittype = (cellEditorConfig && cellEditorConfig.edittype) ? cellEditorConfig.edittype : cm.edittype,
                            editoptions = (cellEditorConfig && cellEditorConfig.editoptions) ? cellEditorConfig.editoptions : cm.editoptions;
                        //end by jlg.
                        var opt = $.extend({grid:$t}, editoptions || {cm:cm}, {id:iRow + "_" + nm, name:nm});
                        var elc;
                        try {
                            elc = $.jgrid.createWafEl(edittype, opt, tmp, true, $.extend({}, $.jgrid.ajaxOptions, $t.p.ajaxSelectOptions || {}));
                        } catch (e) {
                            alert(e);
                        }

                        $(cc).html("").append(elc).attr("tabindex", "0");

                        //find form,add by jlg.
                        var form = $("#" + $t.p.id).jqGrid("findParentForm");
                        var validator = null;
                        if (form && form != null) {
                            validator = $.data(form[0], "validator");
                        }
                        //将wafselect对应的button加入到当前对象中.
                        if (edittype === "wafselect") {
                            if (validator && validator != null && editoptions.validateJson) {
                                validator.initElement($("#" + opt.id));
                            }
                            window.setTimeout(function () {
                                $(elc).children("div").focus()
                            }, 0);
                        } else if (edittype === "f7") {
                            if (validator && validator != null && editoptions.validateJson) {
                                validator.initElement($("#" + opt.id));
                            }
                            window.setTimeout(function () {
                                $("#" + opt.id).focus().select();
                            }, 0);
                        } else if (edittype === "datepicker") {
                            if (validator && validator != null && editoptions.validateJson) {
                                validator.initElement($("#" + opt.id));
                            }
                            window.setTimeout(function () {
                                $("#" + opt.id).focus().select();
                            }, 0);
                        } else if (edittype === "numberfield") {
                            if (validator && validator != null && editoptions.validateJson) {
                                validator.initElement($("#" + opt.id));
                            }
                            window.setTimeout(function () {
                                $("#" + opt.id).focus().select();
                            }, 0);
                        } else if (edittype === "wafMultiLangArea" || edittype === "wafMultiLangBox") {
                            if (validator && validator != null && editoptions.validateJson) {
                                validator.initElement($("#" + opt.id));
                            }
                            window.setTimeout(function () {
                                $("#" + opt.id).focus().select();
                            }, 0);
                        } else {
                            if (validator && validator != null && editoptions.validateJson) {
                                validator.initElement($(elc));
                            }
                            window.setTimeout(function () {
                                $(elc).focus().select();
                            }, 0);
                        }
                        //TODO:对于Select的情况如何处理.
                        $("input, select, textarea,div.ui-multiselect", cc).bind("keydown", function (e) {
                            if (e.keyCode === 27) {
                                if ($("input.hasDatepicker", cc).length > 0) {
                                    if ($(".ui-datepicker").is(":hidden")) {
                                        $($t).jqGrid("restoreCell", iRow, iCol);
                                    }
                                    else {
                                        $("input.hasDatepicker", cc).datepicker('hide');
                                    }
                                } else {
                                    $($t).jqGrid("restoreCell", iRow, iCol);
                                }
                            } //ESC
                            //add by jlg.相应键盘事件
                            if (e.keyCode === 13 || e.keyCode == 9) {
                                if (e.ctrlKey) {
                                    $($t).jqGrid("saveCell", iRow, iCol);
                                    window.setTimeout(function () {
                                        $("#" + $t.p.knv).blur();
                                        $($t).focus();
                                        if (parseInt($t.p.iCol, 10) >= 0 && parseInt($t.p.iRow, 10) >= 0) {
                                            $("td:eq(" + $t.p.iCol + ")", $t.rows[$t.p.iRow]).removeClass("edit-cell ui-state-highlight");
                                            $($t.rows[$t.p.iRow]).removeClass("selected-row ui-state-hover");
                                        }
                                        if ($.enter2tab) {
                                            $.enter2tab.enter($t.p.id);
                                        }
                                    }, 0);
                                } else {
                                    $($t).jqGrid("saveCell", iRow, iCol);
                                    //add by jlg.
                                    if (!$t.grid.hDiv.loading) {
                                        if (e.shiftKey) {
                                            $($t).jqGrid("prevCell", iRow, iCol);
                                        } //Shift Enter
                                        else {
                                            $($t).jqGrid("nextCell", iRow, iCol);
                                        } //Enter
                                    } else {
                                        return false;
                                    }
                                }

                            }//Enter
//                            if (e.keyCode == 9)  {
//                                if(!$t.grid.hDiv.loading ) {
//                                    if (e.shiftKey) {$($t).jqGrid("prevCell",iRow,iCol);} //Shift TAb
//                                    else {$($t).jqGrid("nextCell",iRow,iCol);} //Tab
//                                } else {
//                                    return false;
//                                }
//                            }
                            e.stopPropagation();
                        });
                        $($t).triggerHandler("jqGridAfterEditCell", [$t.rows[iRow].id, nm, tmp, iRow, iCol]);
                        if ($.isFunction($t.p.afterEditCell)) {
                            $t.p.afterEditCell.call($t, $t.rows[iRow].id, nm, tmp, iRow, iCol);
                        }
                    }
                } else {
                    if (parseInt($t.p.iCol, 10) >= 0 && parseInt($t.p.iRow, 10) >= 0) {
                        $("td:eq(" + $t.p.iCol + ")", $t.rows[$t.p.iRow]).removeClass("edit-cell ui-state-highlight");
                        $($t.rows[$t.p.iRow]).removeClass("selected-row ui-state-hover");
                    }
                    cc.addClass("edit-cell ui-state-highlight");
                    $($t.rows[iRow]).addClass("selected-row ui-state-hover");
                    tmp = cc.html().replace(/\&#160\;/ig, '');
                    $($t).triggerHandler("jqGridSelectCell", [$t.rows[iRow].id, nm, tmp, iRow, iCol]);
                    if ($.isFunction($t.p.onSelectCell)) {
                        $t.p.onSelectCell.call($t, $t.rows[iRow].id, nm, tmp, iRow, iCol);
                    }
                }
                $t.p.iCol = iCol;
                $t.p.iRow = iRow;
            });
        },
        saveCell:function (iRow, iCol) {
            return this.each(function () {
                var $t = this, fr;
                if (!$t.grid || $t.p.cellEdit !== true) {
                    return;
                }
                if ($t.p.savedRow.length >= 1) {
                    fr = 0;
                } else {
                    fr = null;
                }
                try {
                    if (fr !== null) {
                        var cc = $("td:eq(" + iCol + ")", $t.rows[iRow]), v, v2,
                            cm = $t.p.colModel[iCol], nm = cm.name, nmjq = $.jgrid.jqID(nm);
                        //add by jlg
                        cm = $("#" + $t.p.id).jqGrid("getCellEditorConfig", $t.rows[iRow].id, cm.name);
                        switch (cm.edittype) {
                            case "select":
                                if (!cm.editoptions.multiple) {
                                    v = $("#" + iRow + "_" + nmjq + " option:selected", $t.rows[iRow]).val();
                                    v2 = $("#" + iRow + "_" + nmjq + " option:selected", $t.rows[iRow]).text();
                                } else {
                                    var sel = $("#" + iRow + "_" + nmjq, $t.rows[iRow]), selectedText = [];
                                    v = $(sel).val();
                                    if (v) {
                                        v.join(",");
                                    } else {
                                        v = "";
                                    }
                                    $("option:selected", sel).each(
                                        function (i, selected) {
                                            selectedText[i] = $(selected).text();
                                        }
                                    );
                                    v2 = selectedText.join(",");
                                }
                                if (cm.formatter) {
                                    v2 = v;
                                }
                                break;
                            case "checkbox":
                                var cbv = ["Yes", "No"];
                                if (cm.editoptions) {
                                    cbv = cm.editoptions.value.split(":");
                                }
                                v = $("#" + iRow + "_" + nmjq, $t.rows[iRow]).is(":checked") ? cbv[0] : cbv[1];
                                v2 = v;
                                break;
                            case "password":
                            case "wafpassword":
                            case "text":
                            case "textarea":
                            case "button" :
                            case "waftext":
                            case "wafTextArea":
                            case "wafradio":
                            case "autoComplete":
                                v = $("#" + iRow + "_" + nmjq, $t.rows[iRow]).val();
                                v2 = v;
                                break;
                            case 'custom' :
                                try {
                                    if (cm.editoptions && $.isFunction(cm.editoptions.custom_value)) {
                                        v = cm.editoptions.custom_value.call($t, $(".customelement", cc), 'get');
                                        if (v === undefined) {
                                            throw "e2";
                                        } else {
                                            v2 = v;
                                        }
                                    } else {
                                        throw "e1";
                                    }
                                } catch (e) {
                                    if (e == "e1") {
                                        $.jgrid.info_dialog(jQuery.jgrid.errors.errcap, "function 'custom_value' " + $.jgrid.edit.msg.nodefined, jQuery.jgrid.edit.bClose);
                                    }
                                    if (e == "e2") {
                                        $.jgrid.info_dialog(jQuery.jgrid.errors.errcap, "function 'custom_value' " + $.jgrid.edit.msg.novalue, jQuery.jgrid.edit.bClose);
                                    }
                                    else {
                                        $.jgrid.info_dialog(jQuery.jgrid.errors.errcap, e.message, jQuery.jgrid.edit.bClose);
                                    }
                                }
                                break;
                            case "datepicker":
                                v = waf.datepicker.formatDate("yy-mm-dd", $("#" + iRow + "_" + nmjq, $t.rows[iRow]).wafDatePicker("getDate"));
                                v2 = $("#" + iRow + "_" + nmjq, $t.rows[iRow]).val();
                                break;
                            case "wafselect":
                                v = $("#" + iRow + "_" + nmjq, $t.rows[iRow]).wafSelect("getValue");
                                v2 = $("#" + iRow + "_" + nmjq, $t.rows[iRow]).wafSelect("getSelectedAlias");
                                if (cm.formatter) {
                                    v2 = v;
                                }
                                break;
                            case "wafcheckbox":
                                v = $("#" + iRow + "_" + nmjq, $t.rows[iRow]).attr("checked") === "checked" ? "1" : "0";
                                v2 = v;
                                break;
                            case "f7":
                                v = $("#" + iRow + "_" + nmjq, $t.rows[iRow]).wafPromptBox("getValue");
                                v2 = v;
                                if(v2==null){v2=undefined;}
                                if (v2 === undefined || v2 == "&nbsp;" || v2 == "&#160;" || (v2 instanceof Array && v2.length===0) || (typeof v2==="string" && v2.length === 1 && v2.charCodeAt(0) == 160)) {
                                    v2 = '';
                                }
                                break;
                            case "numberfield":
                                v = $("#" + iRow + "_" + nmjq, $t.rows[iRow]).wafNumberField("getValue");
                                v2 = v;
                                if(v2==null){v2=undefined;}
                                if (v2 === undefined || v2 == "&nbsp;" || v2 == "&#160;" || (v2.length === 1 && v2.charCodeAt(0) == 160)) {
                                    v2 = '';
                                }
                                break;
                            case "wafMultiLangArea":
                                v = $("#" + iRow + "_" + nmjq, $t.rows[iRow]).wafMultiLangArea("option","value");
                                v2 = v;
                                break;
                            case "wafMultiLangBox":
                                v = $("#" + iRow + "_" + nmjq, $t.rows[iRow]).wafMultiLangBox("option","value");
                                v2 = v;
                                break;
                        }
                        // The common approach is if nothing changed do not do anything
                        if (!$.type.isEquals(v2,$t.p.savedRow[fr].v)) {
                            var vvv = $($t).triggerHandler("jqGridBeforeSaveCell", [$t.rows[iRow].id, nm, v, iRow, iCol]);
                            if (vvv) {
                                v = vvv;
                                v2 = vvv;
                            }
                            if ($.isFunction($t.p.beforeSaveCell)) {
                                var vv = $t.p.beforeSaveCell.call($t, $t.rows[iRow].id, nm, v, iRow, iCol);
                                if (vv) {
                                    v = vv;
                                    v2 = vv;
                                }
                            }
                            v2 = v;//add by jlg.
                            var cv = $.jgrid.checkValues(v, iCol, $t);
                            if (cv[0] === true) {
                                var addpost = $($t).triggerHandler("jqGridBeforeSubmitCell", [$t.rows[iRow].id, nm, v, iRow, iCol]) || {};
                                if ($.isFunction($t.p.beforeSubmitCell)) {
                                    addpost = $t.p.beforeSubmitCell.call($t, $t.rows[iRow].id, nm, v, iRow, iCol);
                                    if (!addpost) {
                                        addpost = {};
                                    }
                                }
                                if ($("input.hasDatepicker", cc).length > 0) {
                                    $("input.hasDatepicker", cc).datepicker('hide');
                                }
                                if ($t.p.cellsubmit == 'remote') {
                                    if ($t.p.cellurl) {
                                        var postdata = {};
                                        if ($t.p.autoencode) {
                                            v = $.jgrid.htmlEncode(v);
                                        }
                                        postdata[nm] = v;
                                        var idname, oper, opers;
                                        opers = $t.p.prmNames;
                                        idname = opers.id;
                                        oper = opers.oper;
                                        postdata[idname] = $.jgrid.stripPref($t.p.idPrefix, $t.rows[iRow].id);
                                        postdata[oper] = opers.editoper;
                                        postdata = $.extend(addpost, postdata);
                                        $("#lui_" + $.jgrid.jqID($t.p.id)).show();
                                        $t.grid.hDiv.loading = true;
                                        $.ajax($.extend({
                                            url:$t.p.cellurl,
                                            data:$.isFunction($t.p.serializeCellData) ? $t.p.serializeCellData.call($t, postdata) : postdata,
                                            type:"POST",
                                            complete:function (result, stat) {
                                                $("#lui_" + $t.p.id).hide();
                                                $t.grid.hDiv.loading = false;
                                                if (stat == 'success') {
                                                    var ret = $($t).triggerHandler("jqGridAfterSubmitCell", [$t, result, postdata.id, nm, v, iRow, iCol]) || [true, ''];
                                                    if (ret[0] === true && $.isFunction($t.p.afterSubmitCell)) {
                                                        ret = $t.p.afterSubmitCell.call($t, result, postdata.id, nm, v, iRow, iCol);
                                                    }
                                                    if (ret[0] === true) {
                                                        $(cc).empty();
                                                        $($t).jqGrid("setCell", $t.rows[iRow].id, iCol, v2, false, false, true);
                                                        $(cc).addClass("dirty-cell");
                                                        $($t.rows[iRow]).addClass("edited");
                                                        $($t).triggerHandler("jqGridAfterSaveCell", [$t.rows[iRow].id, nm, v, iRow, iCol]);
                                                        if ($.isFunction($t.p.afterSaveCell)) {
                                                            $t.p.afterSaveCell.call($t, $t.rows[iRow].id, nm, v, iRow, iCol);
                                                        }
                                                        $t.p.savedRow.splice(0, 1);
                                                    } else {
                                                        $.jgrid.info_dialog($.jgrid.errors.errcap, ret[1], $.jgrid.edit.bClose);
                                                        $($t).jqGrid("restoreCell", iRow, iCol);
                                                    }
                                                }
                                            },
                                            error:function (res, stat, err) {
                                                $("#lui_" + $.jgrid.jqID($t.p.id)).hide();
                                                $t.grid.hDiv.loading = false;
                                                $($t).triggerHandler("jqGridErrorCell", [res, stat, err]);
                                                if ($.isFunction($t.p.errorCell)) {
                                                    $t.p.errorCell.call($t, res, stat, err);
                                                    $($t).jqGrid("restoreCell", iRow, iCol);
                                                } else {
                                                    $.jgrid.info_dialog($.jgrid.errors.errcap, res.status + " : " + res.statusText + "<br/>" + stat, $.jgrid.edit.bClose);
                                                    $($t).jqGrid("restoreCell", iRow, iCol);
                                                }
                                            }
                                        }, $.jgrid.ajaxOptions, $t.p.ajaxCellOptions || {}));
                                    } else {
                                        try {
                                            $.jgrid.info_dialog($.jgrid.errors.errcap, $.jgrid.errors.nourl, $.jgrid.edit.bClose);
                                            $($t).jqGrid("restoreCell", iRow, iCol);
                                        } catch (e) {
                                        }
                                    }
                                }
                                if ($t.p.cellsubmit == 'clientArray') {
                                    $(cc).empty();
                                    $($t).jqGrid("setCell", $t.rows[iRow].id, iCol, v2, false, false, true);
                                    $(cc).addClass("dirty-cell");
                                    $($t.rows[iRow]).addClass("edited");
                                    //modiby by jlg. change its location from last line here.上面的步骤做完之后，就认为已经保存了。
                                    //因此从savedRow中删除，为了防止在afterSaveRow事件中调用getRowRealData方法造成的死循环问题.
                                    $t.p.savedRow.splice(0, 1);
                                    $($t).triggerHandler("jqGridAfterSaveCell", [$t.rows[iRow].id, nm, v, iRow, iCol]);
                                    if ($.isFunction($t.p.afterSaveCell)) {
                                        $t.p.afterSaveCell.call($t, $t.rows[iRow].id, nm, v, iRow, iCol);
                                    }
                                }
                            } else {
                                try {
                                    window.setTimeout(function () {
                                        $.jgrid.info_dialog($.jgrid.errors.errcap, v + " " + cv[1], $.jgrid.edit.bClose);
                                    }, 100);
                                    $($t).jqGrid("restoreCell", iRow, iCol);
                                } catch (e) {
                                }
                            }
                        } else {
                            $($t).jqGrid("restoreCell", iRow, iCol);
                        }
                        if ($.browser.opera) {
                            $("#" + $.jgrid.jqID($t.p.knv)).attr("tabindex", "-1").focus();
                        } else {
                            window.setTimeout(function () {
                                $("#" + $.jgrid.jqID($t.p.knv)).attr("tabindex", "-1").focus();
                            }, 0);
                        }
                        //add by jlg.
                        //删除f7控件和下拉框控件加入的多余的元素.
                        if (cm.edittype === "wafselect") {
                            $("#ui-multiselect-menu-" + iRow + "_" + cm.name).remove();
                        } else if (cm.edittype === "f7") {
                            $("#f7-panel-" + iRow + "_" + cm.name).remove();
                        }
                    }
                } catch (e) {
//                    alert(e);
                }
                if ($.browser.opera) {
                    $("#" + $t.p.knv).attr("tabindex", "-1").focus();
                } else {
                    window.setTimeout(function () {
                        $("#" + $t.p.knv).attr("tabindex", "-1").focus();
                    }, 0);
                }
            });
        },
        restoreCell:function (iRow, iCol) {
            return this.each(function () {
                var $t = this, fr;
                if (!$t.grid || $t.p.cellEdit !== true) {
                    return;
                }
                if ($t.p.savedRow.length >= 1) {
                    fr = 0;
                } else {
                    fr = null;
                }
                if (fr !== null) {
                    var cc = $("td:eq(" + iCol + ")", $t.rows[iRow]);
                    // datepicker fix
                    if ($.isFunction($.fn.datepicker)) {
                        try {
                            $("input.hasDatepicker", cc).datepicker('hide');
                        } catch (e) {
                        }
                    }
                    $(cc).empty().attr("tabindex", "-1");
                    $($t).jqGrid("setCell", $t.rows[iRow].id, iCol, $t.p.savedRow[fr].v, false, false, true);
                    $($t).triggerHandler("jqGridAfterRestoreCell", [$t.rows[iRow].id, $t.p.savedRow[fr].v, iRow, iCol]);
                    if ($.isFunction($t.p.afterRestoreCell)) {
                        $t.p.afterRestoreCell.call($t, $t.rows[iRow].id, $t.p.savedRow[fr].v, iRow, iCol);
                    }
                    $t.p.savedRow.splice(0, 1);
                    //add by jlg.

                }
                window.setTimeout(function () {
                    $("#" + $t.p.knv).attr("tabindex", "-1").focus();
                }, 0);
            });
        },
        nextCell:function (iRow, iCol) {
            return this.each(function () {
                var $t = this, nCol = false;
                if (!$t.grid || $t.p.cellEdit !== true) {
                    return;
                }
                // try to find next editable cell
                for (var i = iCol + 1; i < $t.p.colModel.length; i++) {
                    if ($t.p.colModel[i].editable === true && $t.p.colModel[i].editoptions && !$t.p.colModel[i].hidden) { //add by jlg
                        nCol = i;
                        break;
                    }
                }
                if (nCol !== false) {
                    $($t).jqGrid("editCell", iRow, nCol, true);
                } else {
                    if ($t.p.savedRow.length > 0) {
                        $($t).jqGrid("saveCell", iRow, iCol);
                    }
                    //add by jlg.
                    var nextRow = iRow + 1;
                    var row = $t.rows[nextRow];
                    if (row != undefined) {
                        $($t).jqGrid("nextCell", nextRow, 0);
                    } else {
                        $($t).jqGrid("addRow");
                    }
                }
            });
        },
        prevCell:function (iRow, iCol) {
            return this.each(function () {
                var $t = this, nCol = false;
                if (!$t.grid || $t.p.cellEdit !== true) {
                    return;
                }
                // try to find next editable cell
                for (var i = iCol - 1; i >= 0; i--) {
                    if ($t.p.colModel[i].editable === true && $t.p.colModel[i].editoptions  && !$t.p.colModel[i].hidden) {//add by jlg.
                        nCol = i;
                        break;
                    }
                }
                if (nCol !== false) {
                    $($t).jqGrid('removeSelect');
                    $($t).jqGrid("editCell", iRow, nCol, true);
                } else {
                    if ($t.p.savedRow.length > 0) {
                        $($t).jqGrid("saveCell", iRow, iCol);
                    }
                    //add by jlg.
                    var previousRow = iRow - 1;
                    if (previousRow > 0) {
                        $($t).jqGrid("prevCell", previousRow, ($t.p.colModel.length));
                    } else {
                        window.setTimeout(function () {
                            $("#" + $t.p.knv).blur();
                            $($t).blur();
                            if (parseInt($t.p.iCol, 10) >= 0 && parseInt($t.p.iRow, 10) >= 0) {
                                $("td:eq(" + $t.p.iCol + ")", $t.rows[$t.p.iRow]).removeClass("edit-cell ui-state-highlight");
                                $($t.rows[$t.p.iRow]).removeClass("selected-row ui-state-hover");
                            }
                            if ($.enter2tab) {
                                $.enter2tab.enter($t.p.id, true);
                            }
                        }, 0);
                    }
                }
            });
        },
        GridNav:function () {
            return this.each(function () {
                var $t = this;
                if (!$t.grid || $t.p.cellEdit !== true) {
                    return;
                }
                // trick to process keydown on non input elements
                $t.p.knv = $t.p.id + "_kn";
                var selection = $("<span style='width:0px;height:0px;background-color:black;' tabindex='0'><span tabindex='-1' style='width:0px;height:0px;background-color:grey' id='" + $t.p.knv + "'></span></span>"),
                    i, kdir;
                function scrollGrid(iR, iC, tp) {
                    if (tp.substr(0, 1) == 'v') {
                        var ch = $($t.grid.bDiv)[0].clientHeight,
                            st = $($t.grid.bDiv)[0].scrollTop,
                            nROT = $t.rows[iR].offsetTop + $t.rows[iR].clientHeight,
                            pROT = $t.rows[iR].offsetTop;
                        if (tp == 'vd') {
                            if (nROT >= ch) {
                                $($t.grid.bDiv)[0].scrollTop = $($t.grid.bDiv)[0].scrollTop + $t.rows[iR].clientHeight;
                            }
                        }
                        if (tp == 'vu') {
                            if (pROT < st) {
                                $($t.grid.bDiv)[0].scrollTop = $($t.grid.bDiv)[0].scrollTop - $t.rows[iR].clientHeight;
                            }
                        }
                    }
                    if (tp == 'h') {
                        var cw = $($t.grid.bDiv)[0].clientWidth,
                            sl = $($t.grid.bDiv)[0].scrollLeft,
                            nCOL = $t.rows[iR].cells[iC].offsetLeft + $t.rows[iR].cells[iC].clientWidth,
                            pCOL = $t.rows[iR].cells[iC].offsetLeft;
                        if (nCOL >= cw + parseInt(sl, 10)) {
                            $($t.grid.bDiv)[0].scrollLeft = $($t.grid.bDiv)[0].scrollLeft + $t.rows[iR].cells[iC].clientWidth;
                        } else if (pCOL < sl) {
                            $($t.grid.bDiv)[0].scrollLeft = $($t.grid.bDiv)[0].scrollLeft - $t.rows[iR].cells[iC].clientWidth;
                        }
                    }
                }

                function findNextVisible(iC, act) {
                    var ind, i;
                    if (act == 'lft') {
                        ind = iC + 1;
                        for (i = iC; i >= 0; i--) {
                            if ($t.p.colModel[i].hidden !== true) {
                                ind = i;
                                break;
                            }
                        }
                    }
                    if (act == 'rgt') {
                        ind = iC - 1;
                        for (i = iC; i < $t.p.colModel.length; i++) {
                            if ($t.p.colModel[i].hidden !== true) {
                                ind = i;
                                break;
                            }
                        }
                    }
                    return ind;
                }

                $(selection).insertBefore($t.grid.cDiv);
                $("#" + $t.p.knv)
                    .focus()
                    .keydown(function (e) {
                        kdir = e.keyCode;
                        if ($t.p.direction == "rtl") {
                            if (kdir === 37) {
                                kdir = 39;
                            }
                            else if (kdir === 39) {
                                kdir = 37;
                            }
                        }
                        switch (kdir) {
                            case 38:
                                if ($t.p.iRow - 1 > 0) {
                                    scrollGrid($t.p.iRow - 1, $t.p.iCol, 'vu');
                                    $($t).jqGrid("editCell", $t.p.iRow - 1, $t.p.iCol, false);
                                }
                                break;
                            case 40 :
                                if ($t.p.iRow + 1 <= $t.rows.length - 1) {
                                    scrollGrid($t.p.iRow + 1, $t.p.iCol, 'vd');
                                    $($t).jqGrid("editCell", $t.p.iRow + 1, $t.p.iCol, false);
                                }
                                break;
                            case 37 :
                                if ($t.p.iCol - 1 >= 0) {
                                    i = findNextVisible($t.p.iCol - 1, 'lft');
                                    scrollGrid($t.p.iRow, i, 'h');
                                    $($t).jqGrid("editCell", $t.p.iRow, i, false);
                                }
                                break;
                            case 39 :
                                if ($t.p.iCol + 1 <= $t.p.colModel.length - 1) {
                                    i = findNextVisible($t.p.iCol + 1, 'rgt');
                                    scrollGrid($t.p.iRow, i, 'h');
                                    $($t).jqGrid("editCell", $t.p.iRow, i, false);
                                }
                                break;
                            case 13:
                                if (parseInt($t.p.iCol, 10) >= 0 && parseInt($t.p.iRow, 10) >= 0) {
                                    $($t).jqGrid("editCell", $t.p.iRow, $t.p.iCol, true);
                                }
                                break;
                            default :
                                return true;
                        }
                        return false;
                    });


            });
        }
    });


    $.jgrid.extend({
        getCurrentEditCellXY:function () {
            var ret;
            this.each(function () {
                var $t = this;
                ret = {rowIndex:$t.p.iRow, colIndex:$t.p.iCol};
            });
            return ret;
        },
        /**此方法不再建议使用，请用addRow代替**/
        addEntryRow:function (p) {
            return this.each(function () {
                $(this).wafGrid("addRow", p);
            })
        },
        /**此方法不再建议使用，请用delRow代替**/
        delEntryRow:function (rowid, p) {
            return this.each(function () {
                $(this).wafGrid("delRow", rowid, p);
            });
        },
        getChangedRows:function () {
            var ret = [], del = [],mthd;
            if (!mthd) {
                mthd = 'dirty'; //modify by jlg. 只取 mthd==all or dirty
            }
            this.each(function () {
                var $t = this, nm;
                if (!$t.grid || $t.p.cellEdit !== true) {
                    return;
                }
                //可能最后一个单元格还没有保存。add by jlg.
                if ($t.p.savedRow.length > 0) {
                    $(this).jqGrid("saveLastCell");
                }
                $($t.rows).each(function (j) {
                    var res = {},dirty = false;//add by jlg 通过这个参数来判断没修改的记录不提交到后台
                    if ($(this).hasClass("edited")) {
                        $('td', this).each(function (i) {
                            nm = $t.p.colModel[i].name;
                            if (nm !== 'cb' && nm !== 'subgrid') {
                                if (mthd == 'dirty') {
                                    if ($(this).hasClass('dirty-cell')) {
                                        try {
                                            dirty = true;//add by jlg
                                            res[nm] = $.unformat(this, {rowId:$t.rows[j].id, colModel:$t.p.colModel[i], gid:$($t).attr("id")}, i);
                                        } catch (e) {
                                            res[nm] = $.jgrid.htmlDecode($(this).html());
                                        }
                                    }
                                } else {
                                    try {
                                        res[nm] = $.unformat(this, {rowId:$t.rows[j].id, colModel:$t.p.colModel[i], gid:$($t).attr("id")}, i);
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
                        res.id = this.id;
                        //modiby by jlg.
                        if(dirty){
                            ret.push(res);
                        }
                    }
                });
                del = $t.p.havedDelRowKey || [];
            });
            var tmp = {};
            tmp["modifys"] = ret;
            tmp["deletes"] = del;
            return tmp;
        },
        saveLastCell:function () {
            var $t = this[0];
            //add by jlg.
            //可能最后一个单元格还没有保存。add by jlg.
            if ($t.p.savedRow.length > 0) {
                // save the cell
                $($t).jqGrid("saveCell", $t.p.savedRow[0].id, $t.p.savedRow[0].ic);
            }
        },
        getChangedCells:function (mthd) {
            var ret = [];
            if (!mthd) {
                mthd = 'all';
            }
            this.each(function () {
                var $t = this, nm;
                if (!$t.grid || $t.p.cellEdit !== true) {
                    return;
                }
                $($t.rows).each(function (j) {
                    var res = {};
                    if ($(this).hasClass("edited")) {
                        $('td', this).each(function (i) {
                            nm = $t.p.colModel[i].name;
                            if (nm !== 'cb' && nm !== 'subgrid') {
                                if (mthd == 'dirty') {
                                    if ($(this).hasClass('dirty-cell')) {
                                        try {
                                            res[nm] = $.unformat.call($t, this, {rowId:$t.rows[j].id, colModel:$t.p.colModel[i], gid:$t.p.id}, i);
                                        } catch (e) {
                                            res[nm] = $.jgrid.htmlDecode($(this).html());
                                        }
                                    }
                                } else {
                                    try {
                                        res[nm] = $.unformat.call($t, this, {rowId:$t.rows[j].id, colModel:$t.p.colModel[i], gid:$t.p.id}, i);
                                    } catch (e) {
                                        res[nm] = $.jgrid.htmlDecode($(this).html());
                                    }
                                }
                            }
                        });
                        res.id = this.id;
                        ret.push(res);
                    }
                });
            });
            return ret;
        }
    });

    $.extend($.jgrid, {
        createWafEl:function (eltype, options, vl, autowidth, ajaxso) {
            var elem = "";

            function filterOptions(options) {
                var exclude = ['dataInit', 'dataEvents', 'dataUrl', 'buildSelect', 'sopt', 'searchhidden',
                    'defaultValue', 'attr', 'textJson', 'autoCompleteJson',
                    'datepickerjson', 'selectJson', 'enumJson', 'inputJson', 'filterJson',
                    'f7Json', 'displayFormat', 'editFormat', 'subWidgetName', 'subTagJson' , 'grid'
                ];

                for (var item in options) {
                    if ($.inArray(item, exclude) === -1) {
                    } else {
                        options[item] = undefined;
                        delete options[item];
                    }
                }
            }

            function createInput(eltype, options, vl, autowidth, ajaxso, role) {
                var elem;
                elem = document.createElement("input");
                elem.id = options.id;
                elem.type = eltype;
                elem.value = vl;
                elem.ctrlrole = role;
                return elem;
            }

            switch (eltype) {
                case "wafpassword" :
                    var tmptype = "password";
                    elem = createInput(tmptype, options, vl, autowidth, ajaxso, tmptype);
                    $(elem).attr("ctrlrole", "wafpassword").attr("grid", options.id);
                    var inputJson = options.inputJson;
                    filterOptions(options);
                    options.value = vl;
                    if (inputJson) {
                        inputJson = $.extend(inputJson, options);
                        $(elem).wafPassword(inputJson);
                        if (options.validateJson) {
                            options.validateJson.errorShowMode = "float";
                            options.validateJson.validateOnSumbit = false;
                            $(elem).wafValidator("loadElemValidator", options.validateJson);
                        }
                    }
                    break;
                case "wafcheckbox":
                    var tmptype = "checkbox";
                    elem = createInput(tmptype, options, vl, autowidth, ajaxso, tmptype);
                    $(elem).attr("ctrlrole", "wafcheckbox").attr("grid", options.grid.id + "$" + options.id);
                    var inputJson = options.inputJson;
                    filterOptions(options);
                    options.checked = vl;
                    if (inputJson) {
                        inputJson = $.extend(inputJson, options);
                        $(elem).wafCheckbox(inputJson);
                        if (options.validateJson) {
                            options.validateJson.errorShowMode = "float";
                            options.validateJson.validateOnSumbit = false;
//                            waf.validator.loadValidateAttr($(elem),options.validateJson);
                            $(elem).wafValidator("loadElemValidator", options.validateJson);
                        }
                    }
                    break;
                case "wafradio":
                    var tmptype = "radio";
                    elem = createInput(tmptype, options, vl, autowidth, ajaxso, tmptype);
                    var inputJson = options.inputJson;
                    filterOptions(options);
                    options.value = vl;
                    if (inputJson) {
                        inputJson = $.extend(inputJson, options);
                        //TODO:Radio
                    }
                    break;
                case "waftext":
                    var tmptype = "text";
                    elem = createInput(tmptype, options, vl, autowidth, ajaxso, tmptype);
                    $(elem).attr("ctrlrole", "waftext").attr("grid", options.grid.id + "$" + options.id);
                    //以下内容为WAF所加.
                    var inputJson = options.inputJson;
                    filterOptions(options);
                    options.value = vl;
                    if (inputJson) {
                        inputJson = $.extend(inputJson, options);
                        $(elem).wafText(inputJson);
                        if (options.validateJson) {
                            options.validateJson.errorShowMode = "float";
                            options.validateJson.validateOnSumbit = false;
//                            waf.validator.loadValidateAttr($(elem),options.validateJson);
                            $(elem).wafValidator("loadElemValidator", options.validateJson);
                        }
                    }
                    $(elem).css("width", "100%");
                    break;
                case "wafMultiLangBox":
                    var tmptype = "multiLangBox";
                    elem = createInput(tmptype, options, vl, autowidth, ajaxso, tmptype);
                    $(elem).attr("ctrlrole", "multiLangBox").attr("grid", options.grid.id + "$" + options.id);
                    //以下内容为WAF所加.
                    var inputJson = options.inputJson;
                    filterOptions(options);
                    options.value = vl;
                    if (inputJson) {
                        inputJson = $.extend(inputJson, options);
                        $(elem).wafMultiLangBox(inputJson);
                        if (options.validateJson) {
                            options.validateJson.errorShowMode = "float";
                            options.validateJson.validateOnSumbit = false;
                            $(elem).wafValidator("loadElemValidator", options.validateJson);
                        }
                    }
                    elem = $(elem).closest("div.ui-multiLangBox");
                    $(elem).css({"width":"100%", "height":"100%"});
                    break;
                case "autoComplete":
                    elem = createInput("text", options, vl, autowidth, ajaxso, "autoComplete");
                    $(elem).attr("ctrlrole", "autoComplete").attr("grid", options.grid.id + "$" + options.id);
                    var inputJson = options.inputJson;
                    var autoCompleteJson = options.autoCompleteJson;
                    filterOptions(options);
                    options.value = vl;
                    if (inputJson) {
                        inputJson = $.extend(inputJson, options);
                        $(elem).wafText(inputJson);
                        if (options.validateJson) {
                            options.validateJson.errorShowMode = "float";
                            options.validateJson.validateOnSumbit = false;
//                            waf.validator.loadValidateAttr($(elem),options.validateJson);
                            $(elem).wafValidator("loadElemValidator", options.validateJson);
                        }
                    }
                    if (autoCompleteJson) {
                        $(elem).autocomplete(autoCompleteJson);
                    }
                    $(elem).css("width", "100%");
                    break;
                case "f7":
                    var input = createInput("text", options, vl, autowidth, ajaxso, "f7");
                    $(input).attr("ctrlrole", "f7").attr("grid", options.grid.id + "$" + options.id);
                    if (options) {
                        var f7Json = options.f7Json, subWidgetName = options.subWidgetName, subTagJson = options.subTagJson;
                        filterOptions(options);
                        var f7_json = f7Json || {};
                        f7_json = $.extend(f7_json, options);
                        f7_json.subWidgetName = subWidgetName;
                        f7_json.subWidgetOptions = subTagJson;
                        $(input).wafPromptBox(f7_json);
                        if (vl && vl != null && typeof vl === "object") {
                            $(input).wafPromptBox("setValue", vl);
                        }
                        if (options.validateJson) {
                            options.validateJson.errorShowMode = "float";
                            options.validateJson.validateOnSumbit = false;
//                            waf.validator.loadValidateAttr($(input),options.validateJson);
                            $(input).wafValidator("loadElemValidator", options.validateJson);
                        }

                        //创建hidden
                        var hidden = document.createElement("input");
                        hidden.type = "hidden";
                        hidden.value = vl;
                        hidden.name = "hidd_name_" + options.id;
                        hidden.id = options.id + "_el";

                        $(input).css("width", "100%");
                        elem = $(input).closest(".ui-f7-frame").eq(0);
                        $(hidden).appendTo($(elem));
                        $(elem).css("width", "100%");
                    }
                    break;
                case "datepicker" :
                    elem = createInput("text", options, vl, autowidth, ajaxso, "datepicker");
                    $(elem).attr("ctrlrole", "datepicker").attr("grid", options.grid.id + "$" + options.id);
                    //以下内容为WAF所加.
                    var datepickerjson = options.datepickerjson;
                    datepickerjson.value = vl;
                    filterOptions(options);
                    if (datepickerjson) {
                        datepickerjson = $.extend(datepickerjson, options);
                        datepickerjson.altField = "#" + options.id + "_el";
                        datepickerjson.altFormat = "yy-mm-dd";
                        $(elem).wafDatePicker(datepickerjson);
                        if (options.validateJson) {
                            options.validateJson.errorShowMode = "float";
                            options.validateJson.validateOnSumbit = false;
//                            waf.validator.loadValidateAttr($(elem),options.validateJson);
                            $(elem).wafValidator("loadElemValidator", options.validateJson);
                        }
                    }

                    //创建hidden
                    var hidden = document.createElement("input");
                    hidden.type = "hidden";
                    if (datepickerjson.dateFormat && vl) {
                        var date = $.datepicker.parseDate(datepickerjson.dateFormat, vl);
                        hidden.value = $.datepicker.formatDate("yy-mm-dd", date);
                    }
                    hidden.name = "hidd_name_" + options.id;
                    hidden.id = options.id + "_el";

                    $(elem).css("width", "100%");
                    elem = $(elem).closest(".ui-datepicker-frame").eq(0);
                    $(hidden).appendTo($(elem));
                    $(elem).css("width", "100%");
                    break;
                case "wafselect":
                    elem = document.createElement("select");
                    $(elem).attr("ctrlrole", "select").attr("grid", options.grid.id + "$" + options.id);
                    elem.id = options.id;
                    var selectJson = options.selectJson;
                    if (options.filterJson) {
                        selectJson.filterJson = options.filterJson;
                    }
                    filterOptions(options);
                    selectJson = $.extend(selectJson, options);
                    selectJson.value = vl;
                    $(elem).wafSelect(selectJson);
                    if (options.validateJson) {
                        options.validateJson.errorShowMode = "float";
                        options.validateJson.validateOnSumbit = false;
//                        waf.validator.loadValidateAttr($(elem),options.validateJson);
                        $(elem).wafValidator("loadElemValidator", options.validateJson);
                    }
                    $(elem).wrap("<div></div>");
                    $(elem).parent().css("width", "100%");
                    var tmp = $(elem).data("multiselect");
                    $(tmp.button).appendTo($(elem).parent());

                    //创建hidden
                    var hidden = document.createElement("input");
                    hidden.type = "hidden";
                    hidden.value = vl;
                    hidden.name = "hidd_name_" + options.id;
                    hidden.id = options.id + "_hidden";
                    $(hidden).appendTo($(elem).parent());

                    $(tmp.button).css("width", "100%");
                    elem = $(elem).parent();
                    break;
                case "numberfield":
                    var tmptype = "text";
                    elem = createInput(tmptype, options, vl, autowidth, ajaxso, tmptype);
                    $(elem).attr("ctrlrole", "numberfield").attr("grid", options.grid.id + "$" + options.id);
                    //以下内容为WAF所加.
                    var inputJson = options.inputJson;
                    filterOptions(options);
                    options.value = vl;
                    if (inputJson) {
                        inputJson = $.extend(inputJson, options);
                        $(elem).wafNumberField(inputJson);
                        $(elem).css("width", "100%");
                        if (options.validateJson) {
                            options.validateJson.errorShowMode = "float";
                            options.validateJson.validateOnSumbit = false;
//                            waf.validator.loadValidateAttr($(elem),options.validateJson);
                            $(elem).wafValidator("loadElemValidator", options.validateJson);
                        }
                        //创建hidden
                        var hidden = document.createElement("input");
                        hidden.type = "hidden";
                        hidden.value = vl;
                        hidden.name = "hidd_name_" + options.id;
                        hidden.id = options.id + "_el";

                        $(elem).wrap("<div></div>");
                        elem = $(elem).parent();
                        $(elem).css("width", "100%");
                        $(hidden).appendTo($(elem));
                    }
                    break;
                case "wafTextArea":
                    var elem = document.createElement("textarea");
                    elem.id = options.id;
                    elem.value = vl;
                    $(elem).attr("ctrlrole", "textarea").attr("grid", options.grid.id + "$" + options.id);
                    var inputJson = options.inputJson;
                    filterOptions(options);
                    options.value = vl;
                    if (inputJson) {
                        inputJson = $.extend(inputJson, options);
                        $(elem).wafTextarea(inputJson);
                        if (options.validateJson) {
                            options.validateJson.errorShowMode = "float";
                            options.validateJson.validateOnSumbit = false;
//                            waf.validator.loadValidateAttr($(elem),options.validateJson);
                            $(elem).wafValidator("loadElemValidator", options.validateJson);
                        }
                    }
                    $(elem).css({"width":"100%", "height":"100%", "overflow-y":"auto"});
                    break;
                case "wafMultiLangArea":
                    var elem = document.createElement("textarea");
                    elem.id = options.id;
                    elem.value = vl;
                    $(elem).attr("ctrlrole", "multiLangArea").attr("grid", options.grid.id + "$" + options.id);
                    var inputJson = options.inputJson;
                    filterOptions(options);
                    options.value = vl;
                    if (inputJson) {
                        inputJson = $.extend(inputJson, options);
                        $(elem).wafMultiLangArea(inputJson);
                        if (options.validateJson) {
                            options.validateJson.errorShowMode = "float";
                            options.validateJson.validateOnSumbit = false;
                            $(elem).wafValidator("loadElemValidator", options.validateJson);
                        }
                    }
                    $(elem).css("height","100%");
                    elem =$(elem).closest("div.ui-multiLangArea");
                    $(elem).css({"width":"100%"});
                    break;
                default:
//                    return $.jgrid.createEl(eltype, options, vl, autowidth, ajaxso);
            }
            return elem;
        },
        setCellEditorConfig:function (colModel, propName, value, isPromptSelf) {
            var eltype = colModel.edittype;
            //var validatorProp = ["forgroup","rules","customvalidate","validatetrigger","errMsg","errorLabelPosition","errorShowMode","remoteRule","validateOnSumbit","suspend"];
            switch (eltype) {
                case "wafpassword" :
                case "wafcheckbox":
                case "wafradio":
                case "numberfield":
                case "wafMultiLangArea":
                case "wafMultiLangBox":
                case "wafTextArea":
                case "waftext":
                    if (colModel.editoptions && colModel.editoptions.inputJson) {
                        colModel.editoptions.inputJson[propName] = value;
                    }
                    break;
                case "autoComplete":
                    if (colModel.editoptions && colModel.editoptions.autoCompleteJson) {
                        colModel.editoptions.autoCompleteJson[propName] = value;
                    }
                    break;
                case "f7":
                    if (isPromptSelf) {
                        if (colModel.editoptions && colModel.editoptions.f7Json) {
                            colModel.editoptions.f7Json[propName] = value;
                        }
                    } else {
                        if (colModel.editoptions && colModel.editoptions.subTagJson) {
                            colModel.editoptions.subTagJson[propName] = value;
                        }
                    }
                    break;
                case "datepicker" :
                    if (colModel.editoptions && colModel.editoptions.datepickerjson) {
                        colModel.editoptions.datepickerjson[propName] = value;
                    }
                    if (propName === "dateFormat") colModel.editoptions.dateFormat = value;
                    break;
                case "wafselect":
                    if("enumSource"===propName || "urlSource"===propName ||"filterJson"===propName ||"multiple"===propName){
                        if (colModel.editoptions) {
                            colModel.editoptions[propName] = value;
                        }
                    }else{
                        if (colModel.editoptions && colModel.editoptions.selectJson) {
                            colModel.editoptions.selectJson[propName] = value;
                        }
                    }
                    break;
            }
            return colModel;
        },
        checkDate:function (format, date) {
            var daysInFebruary = function (year) {
                // February has 29 days in any year evenly divisible by four,
                // EXCEPT for centurial years which are not also divisible by 400.
                return (((year % 4 === 0) && ( year % 100 !== 0 || (year % 400 === 0))) ? 29 : 28 );
            },
                DaysArray = function (n) {
                    for (var i = 1; i <= n; i++) {
                        this[i] = 31;
                        if (i == 4 || i == 6 || i == 9 || i == 11) {
                            this[i] = 30;
                        }
                        if (i == 2) {
                            this[i] = 29;
                        }
                    }
                    return this;
                };

            var tsp = {}, sep;
            format = format.toLowerCase();
            //we search for /,-,. for the date separator
            if (format.indexOf("/") != -1) {
                sep = "/";
            } else if (format.indexOf("-") != -1) {
                sep = "-";
            } else if (format.indexOf(".") != -1) {
                sep = ".";
            } else {
                sep = "/";
            }
            format = format.split(sep);
            date = date.split(sep);
            if (date.length != 3) {
                return false;
            }
            var j = -1, yln, dln = -1, mln = -1;
            for (var i = 0; i < format.length; i++) {
                var dv = isNaN(date[i]) ? 0 : parseInt(date[i], 10);
                tsp[format[i]] = dv;
                yln = format[i];
                if (yln.indexOf("y") != -1) {
                    j = i;
                }
                if (yln.indexOf("m") != -1) {
                    mln = i;
                }
                if (yln.indexOf("d") != -1) {
                    dln = i;
                }
            }
            if (format[j] == "y" || format[j] == "yyyy") {
                yln = 4;
            } else if (format[j] == "yy") {
                yln = 2;
            } else {
                yln = -1;
            }
            var daysInMonth = DaysArray(12),
                strDate;
            if (j === -1) {
                return false;
            } else {
                strDate = tsp[format[j]].toString();
                if (yln == 2 && strDate.length == 1) {
                    yln = 1;
                }
                if (strDate.length != yln || (tsp[format[j]] === 0 && date[j] != "00")) {
                    return false;
                }
            }
            if (mln === -1) {
                return false;
            } else {
                strDate = tsp[format[mln]].toString();
                if (strDate.length < 1 || tsp[format[mln]] < 1 || tsp[format[mln]] > 12) {
                    return false;
                }
            }
            if (dln === -1) {
                return false;
            } else {
                strDate = tsp[format[dln]].toString();
                if (strDate.length < 1 || tsp[format[dln]] < 1 || tsp[format[dln]] > 31 || (tsp[format[mln]] == 2 && tsp[format[dln]] > daysInFebruary(tsp[format[j]])) || tsp[format[dln]] > daysInMonth[tsp[format[mln]]]) {
                    return false;
                }
            }
            return true;
        },
        isEmpty:function (val) {
            if (val.match(/^\s+$/) || val === "") {
                return true;
            } else {
                return false;
            }
        },
        checkTime:function (time) {
            // checks only hh:ss (and optional am/pm)
            var re = /^(\d{1,2}):(\d{2})([ap]m)?$/, regs;
            if (!this.isEmpty(time)) {
                regs = time.match(re);
                if (regs) {
                    if (regs[3]) {
                        if (regs[1] < 1 || regs[1] > 12) {
                            return false;
                        }
                    } else {
                        if (regs[1] > 23) {
                            return false;
                        }
                    }
                    if (regs[2] > 59) {
                        return false;
                    }
                } else {
                    return false;
                }
            }
            return true;
        },
        checkValues:function (val, valref, g, customobject, nam) {
            var edtrul, i, nm, dft, len;
            if (typeof(customobject) === "undefined") {
                if (typeof(valref) == 'string') {
                    for (i = 0, len = g.p.colModel.length; i < len; i++) {
                        if (g.p.colModel[i].name == valref) {
                            edtrul = g.p.colModel[i].editrules;
                            valref = i;
                            try {
                                nm = g.p.colModel[i].formoptions.label;
                            } catch (e) {
                            }
                            break;
                        }
                    }
                } else if (valref >= 0) {
                    edtrul = g.p.colModel[valref].editrules;
                }
            } else {
                edtrul = customobject;
                nm = nam === undefined ? "_" : nam;
            }
            if (edtrul) {
                if (!nm) {
                    nm = g.p.colNames[valref];
                }
                if (edtrul.required === true) {
                    if (this.isEmpty(val)) {
                        return [false, nm + ": " + $.jgrid.edit.msg.required, ""];
                    }
                }
                // force required
                var rqfield = edtrul.required === false ? false : true;
                if (edtrul.number === true) {
                    if (!(rqfield === false && this.isEmpty(val))) {
                        if (isNaN(val)) {
                            return [false, nm + ": " + $.jgrid.edit.msg.number, ""];
                        }
                    }
                }
                if (typeof edtrul.minValue != 'undefined' && !isNaN(edtrul.minValue)) {
                    if (parseFloat(val) < parseFloat(edtrul.minValue)) {
                        return [false, nm + ": " + $.jgrid.edit.msg.minValue + " " + edtrul.minValue, ""];
                    }
                }
                if (typeof edtrul.maxValue != 'undefined' && !isNaN(edtrul.maxValue)) {
                    if (parseFloat(val) > parseFloat(edtrul.maxValue)) {
                        return [false, nm + ": " + $.jgrid.edit.msg.maxValue + " " + edtrul.maxValue, ""];
                    }
                }
                var filter;
                if (edtrul.email === true) {
                    if (!(rqfield === false && this.isEmpty(val))) {
                        // taken from $ Validate plugin
                        filter = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i;
                        if (!filter.test(val)) {
                            return [false, nm + ": " + $.jgrid.edit.msg.email, ""];
                        }
                    }
                }
                if (edtrul.integer === true) {
                    if (!(rqfield === false && this.isEmpty(val))) {
                        if (isNaN(val)) {
                            return [false, nm + ": " + $.jgrid.edit.msg.integer, ""];
                        }
                        if ((val % 1 !== 0) || (val.indexOf('.') != -1)) {
                            return [false, nm + ": " + $.jgrid.edit.msg.integer, ""];
                        }
                    }
                }
                if (edtrul.date === true) {
                    if (!(rqfield === false && this.isEmpty(val))) {
                        if (g.p.colModel[valref].formatoptions && g.p.colModel[valref].formatoptions.newformat) {
                            dft = g.p.colModel[valref].formatoptions.newformat;
                        } else {
                            dft = g.p.colModel[valref].datefmt || "Y-m-d";
                        }
                        if (!this.checkDate(dft, val)) {
                            return [false, nm + ": " + $.jgrid.edit.msg.date + " - " + dft, ""];
                        }
                    }
                }
                if (edtrul.time === true) {
                    if (!(rqfield === false && this.isEmpty(val))) {
                        if (!this.checkTime(val)) {
                            return [false, nm + ": " + $.jgrid.edit.msg.date + " - hh:mm (am/pm)", ""];
                        }
                    }
                }
                if (edtrul.url === true) {
                    if (!(rqfield === false && this.isEmpty(val))) {
                        filter = /^(((https?)|(ftp)):\/\/([\-\w]+\.)+\w{2,3}(\/[%\-\w]+(\.\w{2,})?)*(([\w\-\.\?\\\/+@&#;`~=%!]*)(\.\w{2,})?)*\/?)/i;
                        if (!filter.test(val)) {
                            return [false, nm + ": " + $.jgrid.edit.msg.url, ""];
                        }
                    }
                }
                if (edtrul.custom === true) {
                    if (!(rqfield === false && this.isEmpty(val))) {
                        if ($.isFunction(edtrul.custom_func)) {
                            var ret = edtrul.custom_func.call(g, val, nm);
                            if ($.isArray(ret)) {
                                return ret;
                            } else {
                                return [false, $.jgrid.edit.msg.customarray, ""];
                            }
                        } else {
                            return [false, $.jgrid.edit.msg.customfcheck, ""];
                        }
                    }
                }
            }
            return [true, "", ""];
        }
    });
})(jQuery);
