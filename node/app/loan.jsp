<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="msgArea1" class="ui-msgarea" ctrlrole="msgArea" data-domcreated="true" style="display: none;">
    <div class="buttonpanel cf">
        <div class="detail-box"></div>
        <div class="close-box"></div>
    </div>
    <div class="contentpanel cf">
        <div class="summaryMsg"></div>
    </div>
    <div class="detailMsg"></div>
</div>
<form id="form" class="ui-form wform" ctrlrole="form" data-domcreated="true" aria-disabled="false"
      validateOptions="{errorContainer:waf('#msgArea1')}" novalidate="novalidate" style="display: ;">
    <div class="ui-toolbar cf" ctrlrole="toolBar" id="toolBar" style="display: ;" data-domcreated="true">
        <div class="ui-toolbar-main ui-div-showmenu">
            <ul class="ui-toolbar-ul ui-ul-showmenu" style="">
                <li id="toolBar_submit_content"><a id="toolBar_submit" ctrlrole="linkButton"
                                                   class="ui-linkbutton enter2tab btn" data-domcreated="true"
                                                   style="display: ;" href="javascript:void(null)"><span
                        class="ui-lb-text" style="display: ;">提交</span></a></li>
                <li id="toolBar_save_content"><a id="toolBar_save" ctrlrole="linkButton"
                                                 class="ui-linkbutton enter2tab btn" data-domcreated="true"
                                                 style="display: ;" href="javascript:void(null)"><span
                        class="ui-lb-text" style="display: ;">保存</span></a></li>
                <li id="toolBar_delete_content"><a id="toolBar_delete" ctrlrole="linkButton"
                                                   class="ui-linkbutton enter2tab btn" data-domcreated="true"
                                                   style="display: ;" href="javascript:void(null)"><span
                        class="ui-lb-text" style="display: ;">删除</span></a></li>
                <li id="toolBar_viewProcessDiagram_content"><a id="toolBar_viewProcessDiagram" ctrlrole="linkButton"
                                                               class="ui-linkbutton enter2tab btn"
                                                               data-domcreated="true" style="display: ;"
                                                               href="javascript:void(null)"><span class="ui-lb-text"
                                                                                                  style="display: ;">流程图</span></a>
                </li>
                <li id="toolBar_viewOpinion_content"><a id="toolBar_viewOpinion" ctrlrole="linkButton"
                                                        class="ui-linkbutton enter2tab btn" data-domcreated="true"
                                                        style="display: ;" href="javascript:void(null)"><span
                        class="ui-lb-text" style="display: ;">审批意见</span></a></li>
                <li id="toolBar_viewHis_content"><a id="toolBar_viewHis" ctrlrole="linkButton"
                                                    class="ui-linkbutton enter2tab btn" data-domcreated="true"
                                                    style="display: ;" href="javascript:void(null)"><span
                        class="ui-lb-text" style="display: ;">查看借还款</span></a></li>
                <li id="toolBar_viewBudget_content"><a id="toolBar_viewBudget" ctrlrole="linkButton"
                                                       class="ui-linkbutton enter2tab btn" data-domcreated="true"
                                                       style="display: ;" href="javascript:void(null)"><span
                        class="ui-lb-text" style="display: ;">查看预算</span></a></li>
                <li id="toolBar_traceUp_content"><a id="toolBar_traceUp" ctrlrole="linkButton"
                                                    class="ui-linkbutton enter2tab btn" data-domcreated="true"
                                                    style="display: ;" href="javascript:void(null)"><span
                        class="ui-lb-text" style="display: ;">上查</span></a></li>
                <li id="toolBar_more_content"><a id="toolBar_more"
                                                 class="ui-menubutton ui-linkbutton btn grayer enter2tab"
                                                 ctrlrole="menuButton" data-domcreated="true" tabIndex="0"
                                                 style="display: ;" href="javascript:void(null)" aria-haspopup="true"
                                                 aria-owns="toolBar_more_ul"><span class="ui-lb-text">更多</span><span
                        class="ui-menubtn-right icondefault ui-icon-triangle-1-s"
                        style="display: ; display: ; display: ; display: ;"></span></a></li>
                <li id="toolBar_report_content"><a id="toolBar_report" ctrlrole="linkButton"
                                                   class="ui-linkbutton enter2tab btn" data-domcreated="true"
                                                   style="display: ;" href="javascript:void(null)"><span
                        class="ui-lb-text" style="display: ;">打印</span></a></li>
                <li id="toolBar_exit_content"><a id="toolBar_exit" ctrlrole="linkButton"
                                                 class="ui-linkbutton enter2tab btn" data-domcreated="true"
                                                 style="display: ;" href="javascript:void(null)"><span
                        class="ui-lb-text" style="display: ;">返回</span></a></li>
            </ul>
        </div>
    </div>
    <div class="ui-section" id="section" ctrlrole="section" data-domcreated="true" aria-disabled="false"
         style="display: ;">
        <div class="sheader"><span class="title ui-section-minus">基本信息</span></div>
        <div class="content" id="section_content" style="display: ;">
            <table id="section_gridLayoutPanel" border="0" width="100%" class="commontable">
                <tr>
                    <td id="section_gridLayoutPanel_0" style="padding:0" rowspan="1" colspan="1" width="100%">
                        <div ctrlrole="panel" class="ui-panel ui-columnLayout border-sizing"
                             id="columnLayout_baseInfoSummary" data-domcreated="true" aria-disabled="false"
                             style="background-color:#F5F5F5;padding-top: 9px; padding-bottom: 9px; padding-right: 9px;">
                            <div id="layoutColumn" ctrlrole="column" class="ui-column border-sizing span11"
                                 data-domcreated="true"><input type="text" name="baseInfo_el" id="webTextField"
                                                               class="enter2tab ui-text ui-wafText-disabled ui-state-disabled ui-state-readonly"
                                                               ctrlrole="text" data-domcreated="true"
                                                               disabled="disabled" aria-disabled="true"
                                                               readonly="readonly"
                                                               style="background: transparent; border: none; width: 100%; color: #363636; display: ; display: ;"
                                                               tabIndex="0"/><input type="hidden" class="text-hidden"
                                                                                    name="baseInfo"
                                                                                    id="webTextField_el"/><label
                                    class="viewStatus" id="webTextField_view" style="display: none;"></label></div>
                            <div id="layoutColumn1" ctrlrole="column" class="ui-column border-sizing span1"
                                 data-domcreated="true" style="text-align:right"><a id="buttonBaseInfoEdit"
                                                                                    ctrlrole="linkButton"
                                                                                    class="ui-linkbutton enter2tab btn"
                                                                                    data-domcreated="true"
                                                                                    style="min-width: 42px; display: ;"
                                                                                    href="javascript:void(null)"><span
                                    class="ui-lb-text" style="display: ;">展开</span></a></div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td id="section_gridLayoutPanel_1" style="padding:0" rowspan="1" colspan="1" width="100%">
                        <div ctrlrole="panel" class="ui-panel ui-columnLayout border-sizing two"
                             id="columnLayout_baseInfo" data-domcreated="true" aria-disabled="false">
                            <div id="layoutColumn2" ctrlrole="column" class="ui-column border-sizing span6"
                                 data-domcreated="true">
                                <div id="labellayoutColumn2_applier" class="ui-lablecontainer" ctrlrole="labelContainer"
                                     labelPosition="left" style="display: ;" data-domcreated="true"><label
                                        id="labellayoutColumn2_applier_label" class="label leftPosition rightalign"
                                        role="label"><span role="required"
                                                           class="requiredspan requiredDisplay"></span><span
                                        role="label" class="inner-label">申请人</span></label><span
                                        id="labellayoutColumn2_applier_ctrl" class="userinput" role="lc-userinput"
                                        labelPosition="left" style="display: ;" data-domcreated="true"><div
                                        class="ui-f7-frame" aria-disabled="false"
                                        style="display: ; display: ; display: ;">
                                    <div class="ui-f7-layout">
                                        <div class="ui-f7-inputframe"><input type="text" id="layoutColumn2_applier"
                                                                             name="applier_el"
                                                                             class="enter2tab ui-f7 ui-f7iframe"
                                                                             ctrlrole="promptBox" data-domcreated="true"
                                                                             tabIndex="100" value=""
                                                                             validate="required:true"
                                                                             errMsg="required:'申请人不能为空。'"/><input
                                                type="hidden" id="layoutColumn2_applier_el" name="applier" value=""/>
                                        </div>
                                        <div class="ui-f7-icon"><span class="ui-f7-trigger"></span></div>
                                    </div>
                                </div><label class="viewStatus" id="layoutColumn2_applier_view"
                                             style="display: none;"></label></span><span
                                        id="labellayoutColumn2_applier_img" class="help"
                                        style="display: none;">&nbsp;</span></div>
                                <div id="labellayoutColumn2_position" class="ui-lablecontainer"
                                     ctrlrole="labelContainer" labelPosition="left" style="display: ;"
                                     data-domcreated="true"><label id="labellayoutColumn2_position_label"
                                                                   class="label leftPosition rightalign"
                                                                   role="label"><span role="required"
                                                                                      class="requiredspan requiredDisplay"></span><span
                                        role="label" class="inner-label">职位</span></label><span
                                        id="labellayoutColumn2_position_ctrl" class="userinput" role="lc-userinput"
                                        labelPosition="left" style="display: ;" data-domcreated="true"><div
                                        class="ui-f7-frame" aria-disabled="false"
                                        style="display: ; display: ; display: ;">
                                    <div class="ui-f7-layout">
                                        <div class="ui-f7-inputframe"><input type="text" id="layoutColumn2_position"
                                                                             name="position_el"
                                                                             class="enter2tab ui-f7 ui-promptTable"
                                                                             ctrlrole="promptBox" data-domcreated="true"
                                                                             tabIndex="102" value=""
                                                                             validate="required:true"
                                                                             errMsg="required:'职位不能为空。'"/><input
                                                type="hidden" id="layoutColumn2_position_el" name="position" value=""/>
                                        </div>
                                        <div class="ui-f7-icon"><span class="ui-f7-trigger"></span></div>
                                    </div>
                                </div><label class="viewStatus" id="layoutColumn2_position_view"
                                             style="display: none;"></label></span><span
                                        id="labellayoutColumn2_position_img" class="help"
                                        style="display: none;">&nbsp;</span></div>
                                <div id="labellayoutColumn2_applierCompany" class="ui-lablecontainer"
                                     ctrlrole="labelContainer" labelPosition="left" style="display: ;"
                                     data-domcreated="true"><label id="labellayoutColumn2_applierCompany_label"
                                                                   class="label leftPosition rightalign"
                                                                   role="label"><span role="required"
                                                                                      class="requiredspan requiredDisplay"></span><span
                                        role="label" class="inner-label">公司</span></label><span
                                        id="labellayoutColumn2_applierCompany_ctrl" class="userinput"
                                        role="lc-userinput" labelPosition="left" style="display: ;"
                                        data-domcreated="true"><div
                                        class="ui-f7-frame ui-wafPromptBox-disabled ui-state-disabled"
                                        aria-disabled="true" style="display: ; display: ; display: ;">
                                    <div class="ui-f7-layout">
                                        <div class="ui-f7-inputframe"><input type="text"
                                                                             id="layoutColumn2_applierCompany"
                                                                             name="applierCompany_el"
                                                                             class="enter2tab ui-f7 ui-f7quick"
                                                                             ctrlrole="promptBox" data-domcreated="true"
                                                                             disabled="disabled" readonly="readonly"
                                                                             tabIndex="104" value=""
                                                                             validate="required:true"
                                                                             errMsg="required:'申请人公司不能为空。'"/><input
                                                type="hidden" id="layoutColumn2_applierCompany_el" name="applierCompany"
                                                value="" style=""/></div>
                                        <div class="ui-f7-icon"><span class="ui-f7-trigger"></span></div>
                                    </div>
                                </div><label class="viewStatus" id="layoutColumn2_applierCompany_view"
                                             style="display: none;"></label></span><span
                                        id="labellayoutColumn2_applierCompany_img" class="help" style="display: none;">&nbsp;</span>
                                </div>
                                <div id="labellayoutColumn2_costedDept" class="ui-lablecontainer"
                                     ctrlrole="labelContainer" labelPosition="left" style="display: ;"
                                     data-domcreated="true"><label id="labellayoutColumn2_costedDept_label"
                                                                   class="label leftPosition rightalign"
                                                                   role="label"><span role="required"
                                                                                      class="requiredspan requiredDisplay"></span><span
                                        role="label" class="inner-label">费用承担部门</span></label><span
                                        id="labellayoutColumn2_costedDept_ctrl" class="userinput" role="lc-userinput"
                                        labelPosition="left" style="display: ;" data-domcreated="true"><div
                                        class="ui-f7-frame" aria-disabled="false"
                                        style="display: ; display: ; display: ;">
                                    <div class="ui-f7-layout">
                                        <div class="ui-f7-inputframe"><input type="text" id="layoutColumn2_costedDept"
                                                                             name="costedDept_el"
                                                                             class="enter2tab ui-f7 ui-promptTable"
                                                                             ctrlrole="promptBox" data-domcreated="true"
                                                                             tabIndex="106" value=""
                                                                             validate="required:true"
                                                                             errMsg="required:'费用支付部门不能为空。'"/><input
                                                type="hidden" id="layoutColumn2_costedDept_el" name="costedDept"
                                                value=""/></div>
                                        <div class="ui-f7-icon"><span class="ui-f7-trigger"></span></div>
                                    </div>
                                </div><label class="viewStatus" id="layoutColumn2_costedDept_view"
                                             style="display: none;"></label></span><span
                                        id="labellayoutColumn2_costedDept_img" class="help" style="display: none;">&nbsp;</span>
                                </div>
                                <div id="labellayoutColumn3_foreseeDate" class="ui-lablecontainer"
                                     ctrlrole="labelContainer" labelPosition="left" style="display: ;"
                                     data-domcreated="true"><label id="labellayoutColumn3_foreseeDate_label"
                                                                   class="label leftPosition rightalign"
                                                                   role="label"><span role="required"
                                                                                      class="requiredspan requiredDisplay"></span><span
                                        role="label" class="inner-label">预计还款日期</span></label><span
                                        id="labellayoutColumn3_foreseeDate_ctrl" class="userinput" role="lc-userinput"
                                        labelPosition="left" style="display: ;" data-domcreated="true"><div
                                        class="ui-datepicker-frame" style="width: nullpx; height: nullpx; display: ;">
                                    <div class="ui-datepicker-layout">
                                        <div class="ui-datepicker-inputframe"><input type="text"
                                                                                     id="layoutColumn3_foreseeDate"
                                                                                     name="foreseeDate_el"
                                                                                     class="hasDatepicker enter2tab ui-datepicker-input"
                                                                                     data-domcreated="true"
                                                                                     tabIndex="108"
                                                                                     ctrlrole="datePicker"
                                                                                     validate="required:true"
                                                                                     errMsg="required:'预计还款日期不能为空。'"/><input
                                                type="hidden" id="layoutColumn3_foreseeDate_el" name="foreseeDate"/>
                                        </div>
                                        <div class="ui-datepicker-icon"><span class="ui-datepicker-iconTrigger"></span>
                                        </div>
                                    </div>
                                </div><label class="viewStatus" id="layoutColumn3_foreseeDate_view"
                                             style="display: none;"></label></span><span
                                        id="labellayoutColumn3_foreseeDate_img" class="help" style="display: none;">&nbsp;</span>
                                </div>
                                <div id="labellayoutColumn2_currencyType" class="ui-lablecontainer"
                                     ctrlrole="labelContainer" labelPosition="left" style="display: none;"
                                     data-domcreated="true"><label id="labellayoutColumn2_currencyType_label"
                                                                   class="label leftPosition rightalign"
                                                                   role="label"><span role="required"
                                                                                      class="requiredspan requiredDisplay"></span><span
                                        role="label" class="inner-label">币别</span></label><span
                                        id="labellayoutColumn2_currencyType_ctrl" class="userinput" role="lc-userinput"><div
                                        class="ui-f7-frame ui-wafPromptBox-disabled ui-state-disabled"
                                        aria-disabled="true" style="display: none;">
                                    <div class="ui-f7-layout">
                                        <div class="ui-f7-inputframe"><input type="text" id="layoutColumn2_currencyType"
                                                                             name="currencyType_el"
                                                                             class="enter2tab ui-f7 ui-f7quick"
                                                                             ctrlrole="promptBox" data-domcreated="true"
                                                                             disabled="disabled" tabIndex="110"
                                                                             value=""/><input type="hidden"
                                                                                              id="layoutColumn2_currencyType_el"
                                                                                              name="currencyType"
                                                                                              value=""/></div>
                                        <div class="ui-f7-icon"><span class="ui-f7-trigger"></span></div>
                                    </div>
                                </div><label class="viewStatus" id="layoutColumn2_currencyType_view"
                                             style="display: none;"></label></span><span
                                        id="labellayoutColumn2_currencyType_img" class="help" style="display: none;">&nbsp;</span>
                                </div>
                            </div>
                            <div id="layoutColumn3" ctrlrole="column" class="ui-column border-sizing span6"
                                 data-domcreated="true" style="text-align:right;">
                                <div id="labellayoutColumn3_bizReqDate" class="ui-lablecontainer"
                                     ctrlrole="labelContainer" labelPosition="left" style="display: ;"
                                     data-domcreated="true"><label id="labellayoutColumn3_bizReqDate_label"
                                                                   class="label leftPosition rightalign"
                                                                   role="label"><span role="required"
                                                                                      class="requiredspan requiredDisplay"></span><span
                                        role="label" class="inner-label">申请日期</span></label><span
                                        id="labellayoutColumn3_bizReqDate_ctrl" class="userinput" role="lc-userinput"
                                        labelPosition="left" style="display: ;" data-domcreated="true"><div
                                        class="ui-datepicker-frame" style="width: nullpx; height: nullpx; display: ;">
                                    <div class="ui-datepicker-layout">
                                        <div class="ui-datepicker-inputframe"><input type="text"
                                                                                     id="layoutColumn3_bizReqDate"
                                                                                     name="bizReqDate_el"
                                                                                     class="hasDatepicker enter2tab ui-datepicker-input"
                                                                                     data-domcreated="true"
                                                                                     tabIndex="101"
                                                                                     ctrlrole="datePicker"
                                                                                     validate="required:true"
                                                                                     errMsg="required:'申请日期不能为空。'"/><input
                                                type="hidden" id="layoutColumn3_bizReqDate_el" name="bizReqDate"/></div>
                                        <div class="ui-datepicker-icon"><span class="ui-datepicker-iconTrigger"></span>
                                        </div>
                                    </div>
                                </div><label class="viewStatus" id="layoutColumn3_bizReqDate_view"
                                             style="display: none;"></label></span><span
                                        id="labellayoutColumn3_bizReqDate_img" class="help" style="display: none;">&nbsp;</span>
                                </div>
                                <div id="labellayoutColumn3_orgUnit" class="ui-lablecontainer" ctrlrole="labelContainer"
                                     labelPosition="left" style="display: ;" data-domcreated="true"><label
                                        id="labellayoutColumn3_orgUnit_label" class="label leftPosition rightalign"
                                        role="label"><span role="required"
                                                           class="requiredspan requiredDisplay"></span><span
                                        role="label" class="inner-label">部门</span></label><span
                                        id="labellayoutColumn3_orgUnit_ctrl" class="userinput" role="lc-userinput"
                                        labelPosition="left" style="display: ;" data-domcreated="true"><div
                                        class="ui-f7-frame" aria-disabled="false"
                                        style="display: ; display: ; display: ;">
                                    <div class="ui-f7-layout">
                                        <div class="ui-f7-inputframe"><input type="text" id="layoutColumn3_orgUnit"
                                                                             name="orgUnit_el"
                                                                             class="enter2tab ui-f7 ui-promptTable"
                                                                             ctrlrole="promptBox" data-domcreated="true"
                                                                             tabIndex="103" value=""
                                                                             validate="required:true"
                                                                             errMsg="required:'申请部门不能为空。'"/><input
                                                type="hidden" id="layoutColumn3_orgUnit_el" name="orgUnit" value=""/>
                                        </div>
                                        <div class="ui-f7-icon"><span class="ui-f7-trigger"></span></div>
                                    </div>
                                </div><label class="viewStatus" id="layoutColumn3_orgUnit_view"
                                             style="display: none;"></label></span><span
                                        id="labellayoutColumn3_orgUnit_img" class="help"
                                        style="display: none;">&nbsp;</span></div>
                                <div id="labellayoutColumn3_tel" class="ui-lablecontainer" ctrlrole="labelContainer"
                                     labelPosition="left" style="display: ;" data-domcreated="true"><label
                                        id="labellayoutColumn3_tel_label" class="label leftPosition rightalign"
                                        role="label"><span role="required"
                                                           class="requiredspan requiredDisplay"></span><span
                                        role="label" class="inner-label">联系电话</span></label><span
                                        id="labellayoutColumn3_tel_ctrl" class="userinput" role="lc-userinput"><input
                                        type="text" name="tel_el" id="layoutColumn3_tel" class="enter2tab ui-text"
                                        ctrlrole="text" data-domcreated="true" aria-disabled="false" tabIndex="105"
                                        style="display: ; display: ;"/><input type="hidden" class="text-hidden"
                                                                              name="tel"
                                                                              id="layoutColumn3_tel_el"/><label
                                        class="viewStatus" id="layoutColumn3_tel_view"
                                        style="display: none;"></label></span><span id="labellayoutColumn3_tel_img"
                                                                                    class="help" style="display: none;">&nbsp;</span>
                                </div>
                                <div id="labellayoutColumn3_company" class="ui-lablecontainer" ctrlrole="labelContainer"
                                     labelPosition="left" style="display: ;" data-domcreated="true"><label
                                        id="labellayoutColumn3_company_label" class="label leftPosition rightalign"
                                        role="label"><span role="required"
                                                           class="requiredspan requiredDisplay"></span><span
                                        role="label" class="inner-label">费用承担公司</span></label><span
                                        id="labellayoutColumn3_company_ctrl" class="userinput" role="lc-userinput"
                                        labelPosition="left" style="display: ;" data-domcreated="true"><div
                                        class="ui-f7-frame" aria-disabled="false"
                                        style="display: ; display: ; display: ;">
                                    <div class="ui-f7-layout">
                                        <div class="ui-f7-inputframe"><input type="text" id="layoutColumn3_company"
                                                                             name="company_el"
                                                                             class="enter2tab ui-f7 ui-f7iframe"
                                                                             ctrlrole="promptBox" data-domcreated="true"
                                                                             tabIndex="107" value=""
                                                                             validate="required:true"
                                                                             errMsg="required:'公司不能为空。'"/><input
                                                type="hidden" id="layoutColumn3_company_el" name="company" value=""/>
                                        </div>
                                        <div class="ui-f7-icon"><span class="ui-f7-trigger"></span></div>
                                    </div>
                                </div><label class="viewStatus" id="layoutColumn3_company_view"
                                             style="display: none;"></label></span><span
                                        id="labellayoutColumn3_company_img" class="help"
                                        style="display: none;">&nbsp;</span></div>
                                <div id="labellayoutColumn2_operationType" class="ui-lablecontainer"
                                     ctrlrole="labelContainer" labelPosition="left" style="display: none;"
                                     data-domcreated="true"><label id="labellayoutColumn2_operationType_label"
                                                                   class="label leftPosition rightalign"
                                                                   role="label"><span role="required"
                                                                                      class="requiredspan requiredDisplay"></span><span
                                        role="label" class="inner-label">业务类别</span></label><span
                                        id="labellayoutColumn2_operationType_ctrl" class="userinput"
                                        role="lc-userinput"><div
                                        class="ui-f7-frame ui-wafPromptBox-disabled ui-state-disabled"
                                        aria-disabled="true" style="display: none;">
                                    <div class="ui-f7-layout">
                                        <div class="ui-f7-inputframe"><input type="text"
                                                                             id="layoutColumn2_operationType"
                                                                             name="operationType_el"
                                                                             class="enter2tab ui-f7 ui-f7quick"
                                                                             ctrlrole="promptBox" data-domcreated="true"
                                                                             disabled="disabled" tabIndex="109"
                                                                             value=""/><input type="hidden"
                                                                                              id="layoutColumn2_operationType_el"
                                                                                              name="operationType"
                                                                                              value=""/></div>
                                        <div class="ui-f7-icon"><span class="ui-f7-trigger"></span></div>
                                    </div>
                                </div><label class="viewStatus" id="layoutColumn2_operationType_view"
                                             style="display: none;"></label></span><span
                                        id="labellayoutColumn2_operationType_img" class="help" style="display: none;">&nbsp;</span>
                                </div>
                                <a id="button30" ctrlrole="linkButton" class="ui-linkbutton enter2tab btn"
                                   data-domcreated="true" style="min-width: 42px; display: ;"
                                   href="javascript:void(null)"><span class="ui-lb-text"
                                                                      style="display: ;">收起</span></a></div>
                            <div id="layoutColumn33" ctrlrole="column" class="ui-column border-sizing span6 right"
                                 data-domcreated="true" style="display:none"><a id="button12" ctrlrole="linkButton"
                                                                                class="ui-linkbutton enter2tab btn"
                                                                                data-domcreated="true"
                                                                                style="display: ;"
                                                                                href="javascript:void(null)"><span
                                    class="ui-lb-text" style="display: ;">保存修改</span></a></div>
                            <div id="layoutColumn34" ctrlrole="column" class="ui-column border-sizing span6 left"
                                 data-domcreated="true" style="display:none"><a id="button21" ctrlrole="linkButton"
                                                                                class="ui-linkbutton enter2tab btn"
                                                                                data-domcreated="true"
                                                                                style="display: ;"
                                                                                href="javascript:void(null)"><span
                                    class="ui-lb-text" style="display: ;">取消</span></a></div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="ui-section" id="section1" ctrlrole="section" data-domcreated="true" aria-disabled="false"
         style="display: ;">
        <div class="sheader"><span class="title ui-section-minus">收款信息</span></div>
        <div class="content" id="section1_content" style="display: ;">
            <table id="section1_gridLayoutPanel" border="0" width="100%" class="commontable">
                <tr>
                    <td id="section1_gridLayoutPanel_0" style="padding:0" rowspan="1" colspan="1" width="100%">
                        <div ctrlrole="panel" class="ui-panel ui-columnLayout border-sizing"
                             id="columnLayout_payInfoSummary" data-domcreated="true" aria-disabled="false"
                             style="background-color:#F5F5F5;;padding-top: 9px; padding-bottom: 9px; padding-right: 9px;">
                            <div id="layoutColumn4" ctrlrole="column" class="ui-column border-sizing span11"
                                 data-domcreated="true"><input type="text" name="payInfo_el" id="webTextField10"
                                                               class="enter2tab ui-text ui-wafText-disabled ui-state-disabled ui-state-readonly"
                                                               ctrlrole="text" data-domcreated="true"
                                                               disabled="disabled" aria-disabled="true"
                                                               readonly="readonly"
                                                               style="background: transparent; border: none; width: 100%; color: #363636; display: ; display: ;"
                                                               tabIndex="0"/><input type="hidden" class="text-hidden"
                                                                                    name="payInfo"
                                                                                    id="webTextField10_el"/><label
                                    class="viewStatus" id="webTextField10_view" style="display: none;"></label></div>
                            <div id="layoutColumn5" ctrlrole="column" class="ui-column border-sizing span1"
                                 data-domcreated="true" style="text-align:right"><a id="buttonPayInfoEdit"
                                                                                    ctrlrole="linkButton"
                                                                                    class="ui-linkbutton enter2tab btn"
                                                                                    data-domcreated="true"
                                                                                    style="min-width: 42px; display: ;"
                                                                                    href="javascript:void(null)"><span
                                    class="ui-lb-text" style="display: ;">展开</span></a></div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td id="section1_gridLayoutPanel_1" style="padding:0" rowspan="1" colspan="1" width="100%">
                        <div ctrlrole="panel" class="ui-panel ui-columnLayout border-sizing two"
                             id="columnLayout_payInfo" data-domcreated="true" aria-disabled="false">
                            <div id="layoutColumn54" ctrlrole="column" class="ui-column border-sizing span12"
                                 data-domcreated="true">
                                <div id="labellayoutColumn6_payMode" class="ui-lablecontainer" ctrlrole="labelContainer"
                                     labelPosition="left" style="display: ;" data-domcreated="true"><label
                                        id="labellayoutColumn6_payMode_label" class="label leftPosition rightalign"
                                        role="label"><span role="required"
                                                           class="requiredspan requiredDisplay"></span><span
                                        role="label" class="inner-label">支付方式</span></label><span
                                        id="labellayoutColumn6_payMode_ctrl" class="userinput" role="lc-userinput"
                                        labelPosition="left" style="display: ;" data-domcreated="true"><div
                                        class="ui-f7-frame" aria-disabled="false"
                                        style="display: ; display: ; display: ;">
                                    <div class="ui-f7-layout">
                                        <div class="ui-f7-inputframe"><input type="text" id="layoutColumn6_payMode"
                                                                             name="payMode_el"
                                                                             class="enter2tab ui-f7 ui-f7quick"
                                                                             ctrlrole="promptBox" data-domcreated="true"
                                                                             tabIndex="200" value=""
                                                                             validate="required:true"
                                                                             errMsg="required:'支付方式不能为空。'"/><input
                                                type="hidden" id="layoutColumn6_payMode_el" name="payMode" value=""/>
                                        </div>
                                        <div class="ui-f7-icon"><span class="ui-f7-trigger"></span></div>
                                    </div>
                                </div><label class="viewStatus" id="layoutColumn6_payMode_view"
                                             style="display: none;"></label></span><span
                                        id="labellayoutColumn6_payMode_img" class="help"
                                        style="display: none;">&nbsp;</span></div>
                            </div>
                            <div id="layoutColumn6" ctrlrole="column" class="ui-column border-sizing span6"
                                 data-domcreated="true">
                                <div ctrlrole="panel" class="ui-panel ui-columnLayout border-sizing" id="columnLayout10"
                                     data-domcreated="true" aria-disabled="false">
                                    <div id="layoutColumn52" ctrlrole="column"
                                         class="ui-column border-sizing span12 layoutColumnApplier"
                                         data-domcreated="true"><a id="buttonSelectApplier" ctrlrole="linkButton"
                                                                   class="ui-linkbutton enter2tab g-icon-search"
                                                                   data-domcreated="true"
                                                                   style="position: absolute; z-Index: 2000; display: inline-block; height: 24px; width: 20px; margin-left: 335px;"
                                                                   href="javascript:void(null)"><span class="ui-lb-text"
                                                                                                      style="display: ;"></span></a>

                                        <div id="labellayoutColumn7_payerName"
                                             class="ui-lablecontainer applierContainer" ctrlrole="labelContainer"
                                             labelPosition="left" style="display: ;" data-domcreated="true"><label
                                                id="labellayoutColumn7_payerName_label"
                                                class="label leftPosition rightalign" role="label"
                                                style="width: 100px;"><span role="required"
                                                                            class="requiredspan requiredDisplay"
                                                                            style=""></span><span role="label"
                                                                                                  class="inner-label">收款人</span></label><span
                                                id="labellayoutColumn7_payerName_ctrl" class="userinput"
                                                role="lc-userinput" labelPosition="left" style="display: ;"
                                                data-domcreated="true"><input type="text" name="payerName_el"
                                                                              id="layoutColumn7_payerName"
                                                                              class="enter2tab ui-text ui-state-readonly"
                                                                              ctrlrole="text" data-domcreated="true"
                                                                              aria-disabled="false" readonly="readonly"
                                                                              tabIndex="201"
                                                                              style="display: ; display: ;"
                                                                              validate="required:true"
                                                                              errMsg="required:'收款人姓名不能为空。'"/><input
                                                type="hidden" class="text-hidden" name="payerName"
                                                id="layoutColumn7_payerName_el"/><label class="viewStatus"
                                                                                        id="layoutColumn7_payerName_view"
                                                                                        style="display: none;"></label></span><span
                                                id="labellayoutColumn7_payerName_img" class="help"
                                                style="display: none;">&nbsp;</span></div>
                                    </div>
                                </div>
                            </div>
                            <div id="layoutColumnBank" ctrlrole="column" class="ui-column border-sizing span6"
                                 data-domcreated="true">
                                <div id="labellayoutColumnBank_payerBank" class="ui-lablecontainer"
                                     ctrlrole="labelContainer" labelPosition="left" style="display: ;"
                                     data-domcreated="true"><label id="labellayoutColumnBank_payerBank_label"
                                                                   class="label leftPosition leftalign"
                                                                   role="label"><span role="required"
                                                                                      class="requiredspan requiredDisplay"></span><span
                                        role="label" class="inner-label">收款人银行</span></label><span
                                        id="labellayoutColumnBank_payerBank_ctrl" class="userinput" role="lc-userinput"><div
                                        class="ui-f7-frame" aria-disabled="false"
                                        style="display: ; display: ; display: ;">
                                    <div class="ui-f7-layout">
                                        <div class="ui-f7-inputframe"><input type="text" id="layoutColumnBank_payerBank"
                                                                             name="payerBank_el"
                                                                             class="enter2tab ui-f7 ui-f7quick"
                                                                             ctrlrole="promptBox" data-domcreated="true"
                                                                             readonly="readonly" tabIndex="0" value=""/><input
                                                type="hidden" id="layoutColumnBank_payerBank_el" name="payerBank"
                                                value=""/></div>
                                        <div class="ui-f7-icon"><span class="ui-f7-trigger"></span></div>
                                    </div>
                                </div><label class="viewStatus" id="layoutColumnBank_payerBank_view"
                                             style="display: none;"></label></span><span
                                        id="labellayoutColumnBank_payerBank_img" class="help" style="display: none;">&nbsp;</span>
                                </div>
                            </div>
                            <div id="layoutColumn55" ctrlrole="column" class="ui-column border-sizing span6"
                                 data-domcreated="true">
                                <div id="labellayoutColumn7_payerAccount" class="ui-lablecontainer"
                                     ctrlrole="labelContainer" labelPosition="left" style="display: ;"
                                     data-domcreated="true"><label id="labellayoutColumn7_payerAccount_label"
                                                                   class="label leftPosition rightalign"
                                                                   role="label"><span role="required"
                                                                                      class="requiredspan requiredDisplay"></span><span
                                        role="label" class="inner-label">银行账号</span></label><span
                                        id="labellayoutColumn7_payerAccount_ctrl" class="userinput" role="lc-userinput"
                                        labelPosition="left" style="display: ;" data-domcreated="true"><input
                                        type="text" name="payerAccount_el" id="layoutColumn7_payerAccount"
                                        class="enter2tab ui-text ui-state-readonly" ctrlrole="text"
                                        data-domcreated="true" aria-disabled="false" readonly="readonly" tabIndex="203"
                                        style="display: ; display: ;" validate="required:true"
                                        errMsg="required:'收款人账号不能为空。'"/><input type="hidden" class="text-hidden"
                                                                               name="payerAccount"
                                                                               id="layoutColumn7_payerAccount_el"/><label
                                        class="viewStatus" id="layoutColumn7_payerAccount_view"
                                        style="display: none;"></label></span><span
                                        id="labellayoutColumn7_payerAccount_img" class="help" style="display: none;">&nbsp;</span>
                                </div>
                            </div>
                            <div id="layoutColumn56" ctrlrole="column" class="ui-column border-sizing span6"
                                 data-domcreated="true">
                                <div id="labellayoutColumnBank_openArea" class="ui-lablecontainer"
                                     ctrlrole="labelContainer" labelPosition="left" style="display: ;"
                                     data-domcreated="true"><label id="labellayoutColumnBank_openArea_label"
                                                                   class="label leftPosition leftalign"
                                                                   role="label"><span role="required"
                                                                                      class="requiredspan requiredDisplay"></span><span
                                        role="label" class="inner-label">开户地</span></label><span
                                        id="labellayoutColumnBank_openArea_ctrl" class="userinput" role="lc-userinput"><div
                                        class="ui-f7-frame" aria-disabled="false"
                                        style="display: ; display: ; display: ;">
                                    <div class="ui-f7-layout">
                                        <div class="ui-f7-inputframe"><input type="text" id="layoutColumnBank_openArea"
                                                                             name="openArea_el"
                                                                             class="enter2tab ui-f7 ui-f7quick"
                                                                             ctrlrole="promptBox" data-domcreated="true"
                                                                             readonly="readonly" tabIndex="0" value=""/><input
                                                type="hidden" id="layoutColumnBank_openArea_el" name="openArea"
                                                value=""/></div>
                                        <div class="ui-f7-icon"><span class="ui-f7-trigger"></span></div>
                                    </div>
                                </div><label class="viewStatus" id="layoutColumnBank_openArea_view"
                                             style="display: none;"></label></span><span
                                        id="labellayoutColumnBank_openArea_img" class="help" style="display: none;">&nbsp;</span>
                                </div>
                            </div>
                            <div id="layoutColumn36" ctrlrole="column" class="ui-column border-sizing span12 right"
                                 data-domcreated="true"><a id="button22" ctrlrole="linkButton"
                                                           class="ui-linkbutton enter2tab btn" data-domcreated="true"
                                                           style="min-width: 42px; display: ;"
                                                           href="javascript:void(null)"><span class="ui-lb-text"
                                                                                              style="display: ;">收起</span></a>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="ui-section colspan" id="section_cause" ctrlrole="section" data-domcreated="true" aria-disabled="false"
         style="display: ;">
        <div class="sheader"><span class="title ui-section-minus">事由</span></div>
        <div class="content" id="section_cause_content" style="display: ;">
            <table id="section_cause_gridLayoutPanel" border="0" width="100%" class="commontable">
                <tr>
                    <td id="section_cause_gridLayoutPanel_0" style="padding: 0; display: ;" rowspan="1" colspan="1"
                        width="100%" labelPosition="left" data-domcreated="true"><textarea name="cause_el"
                                                                                           id="section2_cause"
                                                                                           class="enter2tab ui-textarea"
                                                                                           ctrlrole="textarea"
                                                                                           data-domcreated="true"
                                                                                           aria-disabled="false"
                                                                                           tabIndex="0"
                                                                                           style="height: 58px; display: ; display: ;"
                                                                                           validate="required:true"
                                                                                           errMsg="required:'事由不能为空。'"></textarea><input
                            type="hidden" name="cause" id="section2_cause_el"/><label class="viewStatus"
                                                                                      id="section2_cause_view"
                                                                                      style="display: none;"></label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="ui-section" id="section3" ctrlrole="section" data-domcreated="true" aria-disabled="false"
         style="display: ;">
        <div class="sheader"><span class="title ui-section-minus">借款明细</span></div>
        <div class="content" id="section3_content" style="display: ;">
            <table id="section3_gridLayoutPanel" border="0" width="100%" class="commontable" style="">
                <tr>
                    <td id="section3_gridLayoutPanel_0" style="padding:0" rowspan="1" colspan="1" width="100%">
                        <div ctrlrole="panel" class="ui-panel ui-columnLayout border-sizing" id="columnLayout4"
                             data-domcreated="true" aria-disabled="false">
                            <div id="layoutColumn8" ctrlrole="column" class="ui-column border-sizing span12"
                                 data-domcreated="true"><input type="hidden" name="undefined" id="cbMultiCurrency_el"
                                                               value=""/><input type="checkbox" name="undefined_el"
                                                                                id="cbMultiCurrency" value="1"
                                                                                ctrlrole="checkbox"
                                                                                class="ui-wafcheckbox removeFocusTab enter2tab"
                                                                                data-domcreated="true"
                                                                                aria-disabled="false" style="display: ;"
                                                                                tabIndex="0"/><label
                                    for="cbMultiCurrency" style="display: ;">多币别</label></div>
                            <div id="layoutColumn79" ctrlrole="column" class="ui-column border-sizing span12"
                                 data-domcreated="true"><input type="text" name="loanAccount_el" id="webTextField45"
                                                               class="enter2tab ui-text ui-state-readonly removeFocusTab"
                                                               ctrlrole="text" data-domcreated="true"
                                                               aria-disabled="false" readonly="readonly"
                                                               style="background: transparent; border: none; color: #08C; width: 100%; display: none;"
                                                               tabIndex="0"/><input type="hidden" class="text-hidden"
                                                                                    name="loanAccount"
                                                                                    id="webTextField45_el"/><label
                                    class="viewStatus" id="webTextField45_view" style="display: none;"></label></div>
                        </div>
                    </td>
                </tr>
                <tr style="">
                    <td id="section3_gridLayoutPanel_1" style="padding: 0;" rowspan="1" colspan="1" width="100%">
                        <div id="entrySection" class="ui-infoBlock" ctrlrole="infoBlock" data-domcreated="true"
                             style="display: ;">
                            <div class="header cf"><span class="title" style="display: none;"></span></div>
                            <div class="rows"></div>
                            <div class="footer buttonPanel cf" id="buttonPanel_entrySection"></div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td id="section3_gridLayoutPanel_2" style="padding:0" rowspan="1" colspan="1" width="100%">
                        <div ctrlrole="panel" class="ui-panel ui-columnLayout border-sizing" id="columnLayout14"
                             data-domcreated="true" aria-disabled="false">
                            <div id="layoutColumn73" ctrlrole="column" class="ui-column border-sizing span12"
                                 data-domcreated="true" style="text-align:right;">
                                <div id="labelsection3_amount" class="ui-lablecontainer amountContainer"
                                     ctrlrole="labelContainer" labelPosition="left" style="display: none;"
                                     data-domcreated="true"><label id="labelsection3_amount_label"
                                                                   class="label leftPosition leftalign"
                                                                   role="label"><span role="required"
                                                                                      class="requiredspan requiredDisplay"></span><span
                                        role="label" class="inner-label">合计金额：</span></label><span
                                        id="labelsection3_amount_ctrl" class="userinput" role="lc-userinput"><input
                                        type="text" id="section3_amount" name="amount_el"
                                        class="enter2tab ui-numberfield ui-widget ui-wafNumberField-disabled ui-state-disabled"
                                        ctrlrole="numberField" data-domcreated="true" aria-disabled="true"
                                        disabled="disabled" readonly="readonly"
                                        style="background: transparent; border: none; width: 130px; font-weight: bold; color: #ff9600; text-align: left; display: none;"
                                        tabIndex="0" value=""/><input type="hidden" id="section3_amount_el"
                                                                      name="amount" value=""/><label class="viewStatus"
                                                                                                     id="section3_amount_view"
                                                                                                     style="display: none;"></label></span><span
                                        id="labelsection3_amount_img" class="help" style="display: none;">&nbsp;</span>
                                </div>
                                <input type="text" name="undefined_el" id="amountText"
                                       class="enter2tab ui-text removeFocusTab" ctrlrole="text" data-domcreated="true"
                                       aria-disabled="false"
                                       style="background: transparent; border: none; width: 100%; font-weight: bold; color: #ff9600; text-align: right; padding-right: 3px; display: ; display: ;"
                                       tabIndex="0"/><input type="hidden" class="text-hidden" name="undefined"
                                                            id="amountText_el"/><label class="viewStatus"
                                                                                       id="amountText_view"
                                                                                       style="display: none;"></label><a
                                    id="entrySection_appendRow" ctrlrole="linkButton"
                                    class="ui-linkbutton enter2tab btn" data-domcreated="true"
                                    style="z-index: 10; display: ;" href="javascript:void(null)"><span
                                    class="ui-lb-icon f-icon-plus"></span><span class="ui-lb-text" style="display: ;">新增借款明细</span></a>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="ui-section" id="section4" ctrlrole="section" data-domcreated="true" aria-disabled="false"
         style="display: ;">
        <div class="sheader"><span class="title ui-section-minus">关联申请</span></div>
        <div class="content" id="section4_content" style="display: ;">
            <table id="section4_gridLayoutPanel" border="0" width="100%" class="commontable" style="">
                <tr style="">
                    <td id="section4_gridLayoutPanel_0" style="padding: 0;" rowspan="1" colspan="1" width="100%">
                        <div id="entrySection1" class="ui-infoBlock" ctrlrole="infoBlock" data-domcreated="true"
                             style="display: ;">
                            <div class="header cf"><span class="title" style="display: none;"></span></div>
                            <div class="rows"></div>
                            <div class="footer buttonPanel cf" id="buttonPanel_entrySection1"></div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td id="section4_gridLayoutPanel_1" style="padding:0" rowspan="1" colspan="1" width="100%">
                        <div ctrlrole="panel" class="ui-panel ui-columnLayout border-sizing" id="columnLayout15"
                             data-domcreated="true" aria-disabled="false">
                            <div id="layoutColumn75" ctrlrole="column" class="ui-column border-sizing span12"
                                 data-domcreated="true" style="text-align:right;">
                                <div id="labelwebNumberField40" class="ui-lablecontainer amountContainer"
                                     ctrlrole="labelContainer" labelPosition="left" style="display: none;"
                                     data-domcreated="true"><label id="labelwebNumberField40_label"
                                                                   class="label leftPosition leftalign" role="label"
                                                                   style="width: 120px;"><span role="required"
                                                                                               class="requiredspan requiredDisplay"
                                                                                               style=""></span><span
                                        role="label" class="inner-label"
                                        style="width: 120px;">冲账金额合计：</span></label><span
                                        id="labelwebNumberField40_ctrl" class="userinput" role="lc-userinput"><input
                                        type="text" id="webNumberField40" name="reqAmount_el"
                                        class="enter2tab ui-numberfield ui-widget ui-wafNumberField-disabled ui-state-disabled"
                                        ctrlrole="numberField" data-domcreated="true" aria-disabled="true"
                                        disabled="disabled" readonly="readonly"
                                        style="background: transparent; border: none; width: 130px; font-weight: bold; color: #ff9600; text-align: left; display: none;"
                                        tabIndex="0" value=""/><input type="hidden" id="webNumberField40_el"
                                                                      name="reqAmount" value=""/><label
                                        class="viewStatus" id="webNumberField40_view"
                                        style="display: none;"></label></span><span id="labelwebNumberField40_img"
                                                                                    class="help" style="display: none;">&nbsp;</span>
                                </div>
                                <input type="text" name="undefined_el" id="reqAmountText"
                                       class="enter2tab ui-text removeFocusTab" ctrlrole="text" data-domcreated="true"
                                       aria-disabled="false"
                                       style="background: transparent; border: none; width: 100%; font-weight: bold; color: #ff9600; text-align: right; padding-right: 3px; display: ; display: ;"
                                       tabIndex="0"/><input type="hidden" class="text-hidden" name="undefined"
                                                            id="reqAmountText_el"/><label class="viewStatus"
                                                                                          id="reqAmountText_view"
                                                                                          style="display: none;"></label><a
                                    id="entrySection1_appendRow" ctrlrole="linkButton"
                                    class="ui-linkbutton enter2tab btn" data-domcreated="true"
                                    style="z-index: 10; display: ;" href="javascript:void(null)"><span
                                    class="ui-lb-icon f-icon-plus"></span><span class="ui-lb-text" style="display: ;">关联费用申请</span></a>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="_index_" class="row create EDIT" seq="_index_" index="_index_"><span class="title"></span>

        <div class="rowButtonPanel cf" id="entrySection_rb__index_"><a id="entrySection_entrySection_deleteRow__index_"
                                                                       ctrlrole="linkButton"
                                                                       class="ui-linkbutton enter2tab ui-icon-rowRemove ibrb"
                                                                       data-domcreated="true" style="display: ;"
                                                                       href="javascript:void(null)"><span
                class="ui-lb-text" style="display: ;"></span></a></div>
        <div class="rowContent" id="entrySection_rt__index_"><span class="seq"><span class="rowNum">_seq_</span><span
                class="move" style="display: ;"><span class="up"></span><span class="down"></span></span></span>

            <div class="rowCtrls seqLine" id="entrySection_rcs_entrySection_rt__index_">
                <table id="entrySection_entrySection_gridLayoutPanel__index_" border="0" width="100%"
                       class="commontable">
                    <tr>
                        <td id="entrySection_entrySection_gridLayoutPanel_0__index_" style="padding:0" rowspan="1"
                            colspan="1" width="100%">
                            <div ctrlrole="panel" class="ui-panel ui-columnLayout border-sizing three entry"
                                 id="entrySection_columnLayout8__index_" data-domcreated="true" aria-disabled="false">
                                <div id="entrySection_layoutColumn18__index_" ctrlrole="column"
                                     class="ui-column border-sizing span4 nocurrency" data-domcreated="true">
                                    <div id="entrySection_labellayoutColumn18_expenseType__index_"
                                         class="ui-lablecontainer expenseType" ctrlrole="labelContainer"
                                         labelPosition="left" style="display: ;" data-domcreated="true"><label
                                            id="entrySection_labellayoutColumn18_expenseType__index__label"
                                            class="label leftPosition rightalign" role="label"
                                            style="width: 70px;"><span role="required"
                                                                       class="requiredspan requiredDisplay"
                                                                       style=""></span><span role="label"
                                                                                             class="inner-label">费用类型</span></label><span
                                            id="entrySection_labellayoutColumn18_expenseType__index__ctrl"
                                            class="userinput" role="lc-userinput" labelPosition="left"
                                            style="display: ;" data-domcreated="true"><div class="ui-f7-frame ibrf"
                                                                                           aria-disabled="false"
                                                                                           style="display: ; display: ; display: ;">
                                        <div class="ui-f7-layout">
                                            <div class="ui-f7-inputframe"><input type="text"
                                                                                 id="entrySection_expenseType__index_"
                                                                                 name="entrySection_expenseType__index__el"
                                                                                 class="enter2tab ui-f7 ui-f7iframe"
                                                                                 ctrlrole="promptBox"
                                                                                 data-domcreated="true" tabIndex="0"
                                                                                 value="" validate="required:true"
                                                                                 errMsg="required:'费用类型不能为空。'"/><input
                                                    type="hidden" id="entrySection_expenseType__index__el"
                                                    name="entrySection_expenseType__index_" value=""/></div>
                                            <div class="ui-f7-icon"><span class="ui-f7-trigger"></span></div>
                                        </div>
                                    </div><label class="viewStatus" id="entrySection_expenseType__index__view"
                                                 style="display: none;"></label></span><span
                                            id="entrySection_labellayoutColumn18_expenseType__index__img" class="help"
                                            style="display: none;">&nbsp;</span></div>
                                </div>
                                <div id="entrySection_layoutColumn19__index_" ctrlrole="column"
                                     class="ui-column border-sizing span4 currency center" data-domcreated="true">
                                    <div id="entrySection_labellayoutColumn19_currencyType__index_"
                                         class="ui-lablecontainer currency" ctrlrole="labelContainer"
                                         labelPosition="left" style="display: ;" data-domcreated="true"><label
                                            id="entrySection_labellayoutColumn19_currencyType__index__label"
                                            class="label leftPosition rightalign" role="label"
                                            style="width: 75px;"><span role="required"
                                                                       class="requiredspan requiredDisplay"
                                                                       style=""></span><span role="label"
                                                                                             class="inner-label">币别</span></label><span
                                            id="entrySection_labellayoutColumn19_currencyType__index__ctrl"
                                            class="userinput" role="lc-userinput" labelPosition="left"
                                            style="display: ;" data-domcreated="true"><div class="ui-f7-frame ibrf"
                                                                                           aria-disabled="false"
                                                                                           style="display: ; display: ; display: ;">
                                        <div class="ui-f7-layout">
                                            <div class="ui-f7-inputframe"><input type="text"
                                                                                 id="entrySection_currencyType__index_"
                                                                                 name="entrySection_currencyType__index__el"
                                                                                 class="enter2tab ui-f7 ui-f7quick"
                                                                                 ctrlrole="promptBox"
                                                                                 data-domcreated="true" tabIndex="0"
                                                                                 value="" validate="required:true"
                                                                                 errMsg="required:'币别不能为空。'"/><input
                                                    type="hidden" id="entrySection_currencyType__index__el"
                                                    name="entrySection_currencyType__index_" value=""/></div>
                                            <div class="ui-f7-icon"><span class="ui-f7-trigger"></span></div>
                                        </div>
                                    </div><label class="viewStatus" id="entrySection_currencyType__index__view"
                                                 style="display: none;"></label></span><span
                                            id="entrySection_labellayoutColumn19_currencyType__index__img" class="help"
                                            style="display: none;">&nbsp;</span></div>
                                </div>
                                <div id="entrySection_layoutColumn20__index_" ctrlrole="column"
                                     class="ui-column border-sizing span4 currency right" data-domcreated="true">
                                    <div id="entrySection_labellayoutColumn20_exchangeRate__index_"
                                         class="ui-lablecontainer currency" ctrlrole="labelContainer"
                                         labelPosition="left" style="display: ;" data-domcreated="true"><label
                                            id="entrySection_labellayoutColumn20_exchangeRate__index__label"
                                            class="label leftPosition rightalign" role="label"
                                            style="width: 75px;"><span role="required"
                                                                       class="requiredspan requiredDisplay"
                                                                       style=""></span><span role="label"
                                                                                             class="inner-label">汇率</span></label><span
                                            id="entrySection_labellayoutColumn20_exchangeRate__index__ctrl"
                                            class="userinput" role="lc-userinput" labelPosition="left"
                                            style="display: ;" data-domcreated="true"><input type="text"
                                                                                             id="entrySection_exchangeRate__index_"
                                                                                             name="entrySection_exchangeRate__index__el"
                                                                                             class="enter2tab ui-numberfield ui-widget ibrf"
                                                                                             ctrlrole="numberField"
                                                                                             data-domcreated="true"
                                                                                             aria-disabled="false"
                                                                                             tabIndex="0"
                                                                                             style="display: ; display: ;"
                                                                                             value=""
                                                                                             validate="required:true"
                                                                                             errMsg="required:'汇率不能为空。'"/><input
                                            type="hidden" id="entrySection_exchangeRate__index__el"
                                            name="entrySection_exchangeRate__index_" value=""/><label class="viewStatus"
                                                                                                      id="entrySection_exchangeRate__index__view"
                                                                                                      style="display: none;"></label></span><span
                                            id="entrySection_labellayoutColumn20_exchangeRate__index__img" class="help"
                                            style="display: none;">&nbsp;</span></div>
                                </div>
                                <div id="entrySection_layoutColumn26__index_" ctrlrole="column"
                                     class="ui-column border-sizing span4 nocurrency" data-domcreated="true">
                                    <div id="entrySection_labellayoutColumn18_amountOri__index_"
                                         class="ui-lablecontainer amount" ctrlrole="labelContainer" labelPosition="left"
                                         style="display: ;" data-domcreated="true"><label
                                            id="entrySection_labellayoutColumn18_amountOri__index__label"
                                            class="label leftPosition rightalign" role="label"
                                            style="width: 70px;"><span role="required"
                                                                       class="requiredspan requiredDisplay"
                                                                       style=""></span><span role="label"
                                                                                             class="inner-label">借款金额</span></label><span
                                            id="entrySection_labellayoutColumn18_amountOri__index__ctrl"
                                            class="userinput" role="lc-userinput" labelPosition="left"
                                            style="display: ;" data-domcreated="true"><input type="text"
                                                                                             id="entrySection_amountOri__index_"
                                                                                             name="entrySection_amountOri__index__el"
                                                                                             class="enter2tab ui-numberfield ui-widget ibrf"
                                                                                             ctrlrole="numberField"
                                                                                             data-domcreated="true"
                                                                                             aria-disabled="false"
                                                                                             tabIndex="0"
                                                                                             style="display: ; display: ;"
                                                                                             value=""
                                                                                             validate="required:true"
                                                                                             errMsg="required:'金额原币不能为空。'"
                                                                                             validatetrigger="focus"
                                                                                             customvalidate="_self.validateAmount"
                                                                                             errorLabelPosition="bottom"
                                                                                             errorShowMode="embeded"/><input
                                            type="hidden" id="entrySection_amountOri__index__el"
                                            name="entrySection_amountOri__index_" value=""/><label class="viewStatus"
                                                                                                   id="entrySection_amountOri__index__view"
                                                                                                   style="display: none;"></label></span><span
                                            id="entrySection_labellayoutColumn18_amountOri__index__img" class="help"
                                            style="display: none;">&nbsp;</span></div>
                                </div>
                                <div id="entrySection_layoutColumn27__index_" ctrlrole="column"
                                     class="ui-column border-sizing span4 currency center amount"
                                     data-domcreated="true">
                                    <div id="entrySection_labellayoutColumn19_amount__index_"
                                         class="ui-lablecontainer currency" ctrlrole="labelContainer"
                                         labelPosition="left" style="display: ;" data-domcreated="true"><label
                                            id="entrySection_labellayoutColumn19_amount__index__label"
                                            class="label leftPosition rightalign" role="label"
                                            style="width: 75px;"><span role="required"
                                                                       class="requiredspan requiredDisplay"
                                                                       style=""></span><span role="label"
                                                                                             class="inner-label">本位币金额</span></label><span
                                            id="entrySection_labellayoutColumn19_amount__index__ctrl" class="userinput"
                                            role="lc-userinput" labelPosition="left" style="display: ;"
                                            data-domcreated="true"><input type="text" id="entrySection_amount__index_"
                                                                          name="entrySection_amount__index__el"
                                                                          class="enter2tab ui-numberfield ui-widget ibrf"
                                                                          ctrlrole="numberField" data-domcreated="true"
                                                                          aria-disabled="false" readonly="readonly"
                                                                          tabIndex="0" style="display: ; display: ;"
                                                                          value="" validate="required:true"
                                                                          errMsg="required:'金额不能为空。'"/><input
                                            type="hidden" id="entrySection_amount__index__el"
                                            name="entrySection_amount__index_" value=""/><label class="viewStatus"
                                                                                                id="entrySection_amount__index__view"
                                                                                                style="display: none;"></label></span><span
                                            id="entrySection_labellayoutColumn19_amount__index__img" class="help"
                                            style="display: none;">&nbsp;</span></div>
                                </div>
                                <div id="entrySection_layoutColumn21__index_" ctrlrole="column"
                                     class="ui-column border-sizing span12" data-domcreated="true">
                                    <div id="entrySection_labellayoutColumn21_purpose__index_"
                                         class="ui-lablecontainer colspan" ctrlrole="labelContainer"
                                         labelPosition="left" style="display: ;" data-domcreated="true"><label
                                            id="entrySection_labellayoutColumn21_purpose__index__label"
                                            class="label leftPosition rightalign" role="label"
                                            style="width: 70px;"><span role="required"
                                                                       class="requiredspan requiredDisplay"
                                                                       style=""></span><span role="label"
                                                                                             class="inner-label">借款用途</span></label><span
                                            id="entrySection_labellayoutColumn21_purpose__index__ctrl" class="userinput"
                                            role="lc-userinput" labelPosition="left" style="display: ;"
                                            data-domcreated="true"><input type="text"
                                                                          name="entrySection_purpose__index__el"
                                                                          id="entrySection_purpose__index_"
                                                                          class="enter2tab ui-text ibrf" ctrlrole="text"
                                                                          data-domcreated="true" aria-disabled="false"
                                                                          tabIndex="0" style="display: ; display: ;"
                                                                          validate="required:true"
                                                                          errMsg="required:'用途不能为空。'"/><input
                                            type="hidden" class="text-hidden" name="entrySection_purpose__index_"
                                            id="entrySection_purpose__index__el"/><label class="viewStatus"
                                                                                         id="entrySection_purpose__index__view"
                                                                                         style="display: none;"></label></span><span
                                            id="entrySection_labellayoutColumn21_purpose__index__img" class="help"
                                            style="display: none;">&nbsp;</span></div>
                                    <input type="text" name="entrySection_bgData__index__el"
                                           id="entrySection_bgData__index_"
                                           class="enter2tab ui-text ui-state-readonly removeFocusTab ibrf"
                                           ctrlrole="text" data-domcreated="true" aria-disabled="false"
                                           readonly="readonly"
                                           style="background: transparent; border: none; color: #08C; width: 100%; display: none;"
                                           tabIndex="0"/><input type="hidden" class="text-hidden"
                                                                name="entrySection_bgData__index_"
                                                                id="entrySection_bgData__index__el"/><label
                                        class="viewStatus" id="entrySection_bgData__index__view"
                                        style="display: none;"></label></div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div id="_index_" class="row create EDIT" seq="_index_" index="_index_"><span class="title"></span>

        <div class="rowButtonPanel cf" id="entrySection1_rb__index_"><a
                id="entrySection1_entrySection1_deleteRow__index_" ctrlrole="linkButton"
                class="ui-linkbutton enter2tab ui-icon-rowRemove ibrb" data-domcreated="true" style="display: ;"
                href="javascript:void(null)"><span class="ui-lb-text" style="display: ;"></span></a></div>
        <div class="rowContent" id="entrySection1_rt__index_"><span class="seq"><span class="rowNum">_seq_</span><span
                class="move" style="display: ;"><span class="up"></span><span class="down"></span></span></span>

            <div class="rowCtrls seqLine" id="entrySection1_rcs_entrySection1_rt__index_">
                <table id="entrySection1_entrySection1_gridLayoutPanel__index_" border="0" width="100%"
                       class="commontable">
                    <tr>
                        <td id="entrySection1_entrySection1_gridLayoutPanel_0__index_" style="padding:0" rowspan="1"
                            colspan="1" width="100%">
                            <div ctrlrole="panel" class="ui-panel ui-columnLayout border-sizing three"
                                 id="entrySection1_columnLayout9__index_" data-domcreated="true" aria-disabled="false">
                                <div id="entrySection1_layoutColumn22__index_" ctrlrole="column"
                                     class="ui-column border-sizing span4" data-domcreated="true">
                                    <div id="entrySection1_labellayoutColumn22_sourceBillNumber__index_"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelPosition="left"
                                         style="display: ;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn22_sourceBillNumber__index__label"
                                            class="label leftPosition rightalign" role="label"
                                            style="width: 70px;"><span role="required"
                                                                       class="requiredspan requiredDisplay"
                                                                       style=""></span><span role="label"
                                                                                             class="inner-label">单据编码</span></label><span
                                            id="entrySection1_labellayoutColumn22_sourceBillNumber__index__ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         name="entrySection1_sourceBillNumber__index__el"
                                                                                         id="entrySection1_sourceBillNumber__index_"
                                                                                         class="enter2tab ui-text ui-wafText-disabled ui-state-disabled ui-state-readonly ibrf"
                                                                                         ctrlrole="text"
                                                                                         data-domcreated="true"
                                                                                         disabled="disabled"
                                                                                         aria-disabled="true"
                                                                                         readonly="readonly"
                                                                                         tabIndex="0"
                                                                                         style="display: ; display: ;"/><input
                                            type="hidden" class="text-hidden"
                                            name="entrySection1_sourceBillNumber__index_"
                                            id="entrySection1_sourceBillNumber__index__el"/><label class="viewStatus"
                                                                                                   id="entrySection1_sourceBillNumber__index__view"
                                                                                                   style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn22_sourceBillNumber__index__img"
                                            class="help" style="display: none;">&nbsp;</span></div>
                                    <div id="entrySection1_labellayoutColumn22_sourceBillOperationType__index_"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelPosition="left"
                                         style="display: none;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn22_sourceBillOperationType__index__label"
                                            class="label leftPosition leftalign" role="label"><span role="required"
                                                                                                    class="requiredspan requiredDisplay"></span><span
                                            role="label" class="inner-label">源单业务类别</span></label><span
                                            id="entrySection1_labellayoutColumn22_sourceBillOperationType__index__ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         name="entrySection1_sourceBillOperationType__index__el"
                                                                                         id="entrySection1_sourceBillOperationType__index_"
                                                                                         class="enter2tab ui-text ui-wafText-disabled ui-state-disabled ibrf"
                                                                                         ctrlrole="text"
                                                                                         data-domcreated="true"
                                                                                         disabled="disabled"
                                                                                         aria-disabled="true"
                                                                                         tabIndex="0"
                                                                                         style="display: none;"/><input
                                            type="hidden" class="text-hidden"
                                            name="entrySection1_sourceBillOperationType__index_"
                                            id="entrySection1_sourceBillOperationType__index__el"/><label
                                            class="viewStatus" id="entrySection1_sourceBillOperationType__index__view"
                                            style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn22_sourceBillOperationType__index__img"
                                            class="help" style="display: none;">&nbsp;</span></div>
                                    <div id="entrySection1_labellayoutColumn22_sourceBillID__index_"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelPosition="left"
                                         style="display: none;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn22_sourceBillID__index__label"
                                            class="label leftPosition leftalign" role="label"><span role="required"
                                                                                                    class="requiredspan requiredDisplay"></span><span
                                            role="label" class="inner-label">源单据id</span></label><span
                                            id="entrySection1_labellayoutColumn22_sourceBillID__index__ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         name="entrySection1_sourceBillID__index__el"
                                                                                         id="entrySection1_sourceBillID__index_"
                                                                                         class="enter2tab ui-text ui-wafText-disabled ui-state-disabled ibrf"
                                                                                         ctrlrole="text"
                                                                                         data-domcreated="true"
                                                                                         disabled="disabled"
                                                                                         aria-disabled="true"
                                                                                         tabIndex="0"
                                                                                         style="display: none;"/><input
                                            type="hidden" class="text-hidden" name="entrySection1_sourceBillID__index_"
                                            id="entrySection1_sourceBillID__index__el"/><label class="viewStatus"
                                                                                               id="entrySection1_sourceBillID__index__view"
                                                                                               style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn22_sourceBillID__index__img" class="help"
                                            style="display: none;">&nbsp;</span></div>
                                    <div id="entrySection1_labellayoutColumn22_sourceBillAmountUsed__index_"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelPosition="left"
                                         style="display: none;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn22_sourceBillAmountUsed__index__label"
                                            class="label leftPosition leftalign" role="label"><span role="required"
                                                                                                    class="requiredspan requiredDisplay"></span><span
                                            role="label" class="inner-label">源单据分录已用金额</span></label><span
                                            id="entrySection1_labellayoutColumn22_sourceBillAmountUsed__index__ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         id="entrySection1_sourceBillAmountUsed__index_"
                                                                                         name="entrySection1_sourceBillAmountUsed__index__el"
                                                                                         class="enter2tab ui-numberfield ui-widget ui-wafNumberField-disabled ui-state-disabled ibrf"
                                                                                         ctrlrole="numberField"
                                                                                         data-domcreated="true"
                                                                                         aria-disabled="true"
                                                                                         disabled="disabled"
                                                                                         tabIndex="0"
                                                                                         style="display: none;"
                                                                                         value=""/><input type="hidden"
                                                                                                          id="entrySection1_sourceBillAmountUsed__index__el"
                                                                                                          name="entrySection1_sourceBillAmountUsed__index_"
                                                                                                          value=""/><label
                                            class="viewStatus" id="entrySection1_sourceBillAmountUsed__index__view"
                                            style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn22_sourceBillAmountUsed__index__img"
                                            class="help" style="display: none;">&nbsp;</span></div>
                                </div>
                                <div id="entrySection1_layoutColumn23__index_" ctrlrole="column"
                                     class="ui-column border-sizing span4 center" data-domcreated="true">
                                    <div id="entrySection1_labellayoutColumn23_sourceBillExpenseType__index_"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelPosition="left"
                                         style="display: ;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn23_sourceBillExpenseType__index__label"
                                            class="label leftPosition rightalign" role="label"
                                            style="width: 70px;"><span role="required"
                                                                       class="requiredspan requiredDisplay"
                                                                       style=""></span><span role="label"
                                                                                             class="inner-label">费用类型</span></label><span
                                            id="entrySection1_labellayoutColumn23_sourceBillExpenseType__index__ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         name="entrySection1_sourceBillExpenseType__index__el"
                                                                                         id="entrySection1_sourceBillExpenseType__index_"
                                                                                         class="enter2tab ui-text ui-wafText-disabled ui-state-disabled ui-state-readonly ibrf"
                                                                                         ctrlrole="text"
                                                                                         data-domcreated="true"
                                                                                         disabled="disabled"
                                                                                         aria-disabled="true"
                                                                                         readonly="readonly"
                                                                                         tabIndex="0"
                                                                                         style="display: ; display: ;"/><input
                                            type="hidden" class="text-hidden"
                                            name="entrySection1_sourceBillExpenseType__index_"
                                            id="entrySection1_sourceBillExpenseType__index__el"/><label
                                            class="viewStatus" id="entrySection1_sourceBillExpenseType__index__view"
                                            style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn23_sourceBillExpenseType__index__img"
                                            class="help" style="display: none;">&nbsp;</span></div>
                                    <div id="entrySection1_labellayoutColumn23_sourceBillCause__index_"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelPosition="left"
                                         style="display: none;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn23_sourceBillCause__index__label"
                                            class="label leftPosition leftalign" role="label"><span role="required"
                                                                                                    class="requiredspan requiredDisplay"></span><span
                                            role="label" class="inner-label">源单据事由</span></label><span
                                            id="entrySection1_labellayoutColumn23_sourceBillCause__index__ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         name="entrySection1_sourceBillCause__index__el"
                                                                                         id="entrySection1_sourceBillCause__index_"
                                                                                         class="enter2tab ui-text ui-wafText-disabled ui-state-disabled ibrf"
                                                                                         ctrlrole="text"
                                                                                         data-domcreated="true"
                                                                                         disabled="disabled"
                                                                                         aria-disabled="true"
                                                                                         tabIndex="0"
                                                                                         style="display: none;"/><input
                                            type="hidden" class="text-hidden"
                                            name="entrySection1_sourceBillCause__index_"
                                            id="entrySection1_sourceBillCause__index__el"/><label class="viewStatus"
                                                                                                  id="entrySection1_sourceBillCause__index__view"
                                                                                                  style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn23_sourceBillCause__index__img"
                                            class="help" style="display: none;">&nbsp;</span></div>
                                    <div id="entrySection1_labellayoutColumn23_sourceBillAmountApproved__index_"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelPosition="left"
                                         style="display: none;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn23_sourceBillAmountApproved__index__label"
                                            class="label leftPosition leftalign" role="label"><span role="required"
                                                                                                    class="requiredspan requiredDisplay"></span><span
                                            role="label" class="inner-label">源单据核定总金额</span></label><span
                                            id="entrySection1_labellayoutColumn23_sourceBillAmountApproved__index__ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         id="entrySection1_sourceBillAmountApproved__index_"
                                                                                         name="entrySection1_sourceBillAmountApproved__index__el"
                                                                                         class="enter2tab ui-numberfield ui-widget ui-wafNumberField-disabled ui-state-disabled ibrf"
                                                                                         ctrlrole="numberField"
                                                                                         data-domcreated="true"
                                                                                         aria-disabled="true"
                                                                                         disabled="disabled"
                                                                                         tabIndex="0"
                                                                                         style="display: none;"
                                                                                         value=""/><input type="hidden"
                                                                                                          id="entrySection1_sourceBillAmountApproved__index__el"
                                                                                                          name="entrySection1_sourceBillAmountApproved__index_"
                                                                                                          value=""/><label
                                            class="viewStatus" id="entrySection1_sourceBillAmountApproved__index__view"
                                            style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn23_sourceBillAmountApproved__index__img"
                                            class="help" style="display: none;">&nbsp;</span></div>
                                    <div id="entrySection1_labellayoutColumn23_sourceBillEntryID__index_"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelPosition="left"
                                         style="display: none;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn23_sourceBillEntryID__index__label"
                                            class="label leftPosition leftalign" role="label"><span role="required"
                                                                                                    class="requiredspan requiredDisplay"></span><span
                                            role="label" class="inner-label">源单据分录id</span></label><span
                                            id="entrySection1_labellayoutColumn23_sourceBillEntryID__index__ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         name="entrySection1_sourceBillEntryID__index__el"
                                                                                         id="entrySection1_sourceBillEntryID__index_"
                                                                                         class="enter2tab ui-text ui-wafText-disabled ui-state-disabled ibrf"
                                                                                         ctrlrole="text"
                                                                                         data-domcreated="true"
                                                                                         disabled="disabled"
                                                                                         aria-disabled="true"
                                                                                         tabIndex="0"
                                                                                         style="display: none;"/><input
                                            type="hidden" class="text-hidden"
                                            name="entrySection1_sourceBillEntryID__index_"
                                            id="entrySection1_sourceBillEntryID__index__el"/><label class="viewStatus"
                                                                                                    id="entrySection1_sourceBillEntryID__index__view"
                                                                                                    style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn23_sourceBillEntryID__index__img"
                                            class="help" style="display: none;">&nbsp;</span></div>
                                </div>
                                <div id="entrySection1_layoutColumn24__index_" ctrlrole="column"
                                     class="ui-column border-sizing span4 right" data-domcreated="true">
                                    <div id="entrySection1_labellayoutColumn24_checkAmount__index_"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelPosition="left"
                                         style="display: ;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn24_checkAmount__index__label"
                                            class="label leftPosition rightalign" role="label"
                                            style="width: 70px;"><span role="required"
                                                                       class="requiredspan requiredDisplay"
                                                                       style=""></span><span role="label"
                                                                                             class="inner-label">核销金额</span></label><span
                                            id="entrySection1_labellayoutColumn24_checkAmount__index__ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         id="entrySection1_checkAmount__index_"
                                                                                         name="entrySection1_checkAmount__index__el"
                                                                                         class="enter2tab ui-numberfield ui-widget ibrf"
                                                                                         ctrlrole="numberField"
                                                                                         data-domcreated="true"
                                                                                         aria-disabled="false"
                                                                                         tabIndex="0"
                                                                                         style="display: ; display: ;"
                                                                                         value=""/><input type="hidden"
                                                                                                          id="entrySection1_checkAmount__index__el"
                                                                                                          name="entrySection1_checkAmount__index_"
                                                                                                          value=""/><label
                                            class="viewStatus" id="entrySection1_checkAmount__index__view"
                                            style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn24_checkAmount__index__img" class="help"
                                            style="display: none;">&nbsp;</span></div>
                                    <div id="entrySection1_labellayoutColumn24_sourceBillDate__index_"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelPosition="left"
                                         style="display: none;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn24_sourceBillDate__index__label"
                                            class="label leftPosition leftalign" role="label"><span role="required"
                                                                                                    class="requiredspan requiredDisplay"></span><span
                                            role="label" class="inner-label">源单据业务日期</span></label><span
                                            id="entrySection1_labellayoutColumn24_sourceBillDate__index__ctrl"
                                            class="userinput" role="lc-userinput"><div
                                            class="ui-datepicker-frame ibrf ui-state-disabled"
                                            style="width: nullpx; height: nullpx; display: none;">
                                        <div class="ui-datepicker-layout">
                                            <div class="ui-datepicker-inputframe"><input type="text"
                                                                                         id="entrySection1_sourceBillDate__index_"
                                                                                         name="entrySection1_sourceBillDate__index__el"
                                                                                         class="hasDatepicker enter2tab ui-datepicker-input ui-state-disabled"
                                                                                         data-domcreated="true"
                                                                                         tabIndex="0"
                                                                                         ctrlrole="datePicker"
                                                                                         disabled="true"/><input
                                                    type="hidden" id="entrySection1_sourceBillDate__index__el"
                                                    name="entrySection1_sourceBillDate__index_"/></div>
                                            <div class="ui-datepicker-icon"><span
                                                    class="ui-datepicker-iconTrigger"></span></div>
                                        </div>
                                    </div><label class="viewStatus" id="entrySection1_sourceBillDate__index__view"
                                                 style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn24_sourceBillDate__index__img"
                                            class="help" style="display: none;">&nbsp;</span></div>
                                    <div id="entrySection1_labellayoutColumn24_sourceBillAmountBalance__index_"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelPosition="left"
                                         style="display: none;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn24_sourceBillAmountBalance__index__label"
                                            class="label leftPosition leftalign" role="label"><span role="required"
                                                                                                    class="requiredspan requiredDisplay"></span><span
                                            role="label" class="inner-label">源单据分录可用余额</span></label><span
                                            id="entrySection1_labellayoutColumn24_sourceBillAmountBalance__index__ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         id="entrySection1_sourceBillAmountBalance__index_"
                                                                                         name="entrySection1_sourceBillAmountBalance__index__el"
                                                                                         class="enter2tab ui-numberfield ui-widget ui-wafNumberField-disabled ui-state-disabled ibrf"
                                                                                         ctrlrole="numberField"
                                                                                         data-domcreated="true"
                                                                                         aria-disabled="true"
                                                                                         disabled="disabled"
                                                                                         tabIndex="0"
                                                                                         style="display: none;"
                                                                                         value=""/><input type="hidden"
                                                                                                          id="entrySection1_sourceBillAmountBalance__index__el"
                                                                                                          name="entrySection1_sourceBillAmountBalance__index_"
                                                                                                          value=""/><label
                                            class="viewStatus" id="entrySection1_sourceBillAmountBalance__index__view"
                                            style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn24_sourceBillAmountBalance__index__img"
                                            class="help" style="display: none;">&nbsp;</span></div>
                                    <div id="entrySection1_labellayoutColumn24_hasSourceBill__index_"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelPosition="left"
                                         style="display: none;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn24_hasSourceBill__index__label"
                                            class="label leftPosition leftalign" role="label"><span role="required"
                                                                                                    class="requiredspan requiredDisplay"></span><span
                                            role="label" class="inner-label">是否有源单</span></label><span
                                            id="entrySection1_labellayoutColumn24_hasSourceBill__index__ctrl"
                                            class="userinput" role="lc-userinput"><input type="hidden"
                                                                                         name="entrySection1_hasSourceBill__index_"
                                                                                         id="entrySection1_hasSourceBill__index__el"
                                                                                         value=""/><input
                                            type="checkbox" name="entrySection1_hasSourceBill__index__el"
                                            id="entrySection1_hasSourceBill__index_" value="1" ctrlrole="checkbox"
                                            class="ui-wafcheckbox ui-wafCheckbox-disabled ui-state-disabled ibrf enter2tab"
                                            data-domcreated="true" disabled="true" aria-disabled="true"
                                            style="display: none;" tabIndex="0"/><label
                                            for="entrySection1_hasSourceBill__index_"
                                            style="display: none;">undefined</label></span><span
                                            id="entrySection1_labellayoutColumn24_hasSourceBill__index__img"
                                            class="help" style="display: none;">&nbsp;</span></div>
                                </div>
                                <div id="entrySection1_layoutColumn25__index_" ctrlrole="column"
                                     class="ui-column border-sizing span12" data-domcreated="true"><input type="text"
                                                                                                          name="entrySection1_sourceBillData__index__el"
                                                                                                          id="entrySection1_sourceBillData__index_"
                                                                                                          class="enter2tab ui-text ui-state-readonly removeFocusTab ibrf"
                                                                                                          ctrlrole="text"
                                                                                                          data-domcreated="true"
                                                                                                          aria-disabled="false"
                                                                                                          readonly="readonly"
                                                                                                          style="background: transparent; border: none; color: #08C; width: 100%; display: ; display: ;"
                                                                                                          tabIndex="0"/><input
                                        type="hidden" class="text-hidden" name="entrySection1_sourceBillData__index_"
                                        id="entrySection1_sourceBillData__index__el"/><label class="viewStatus"
                                                                                             id="entrySection1_sourceBillData__index__view"
                                                                                             style="display: none;"></label>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</form>
<span id="botp" ctrlrole="waf.botp" data-domcreated="true"></span>

<div id="report" ctrlrole="waf.report" data-domcreated="true"></div>
<script id="all_dataBinders" type="text/html">window._dataBinders_ =
    [{"field":"baseInfo","componentID":"webTextField","componentType":"wafText","property":"value","dataType":"object"},{"field":"applier","componentID":"layoutColumn2_applier","componentType":"wafPromptBox","property":"value","dataType":"object"},{"field":"position","componentID":"layoutColumn2_position","componentType":"wafPromptBox","property":"value","dataType":"object"},{"field":"applierCompany","componentID":"layoutColumn2_applierCompany","componentType":"wafPromptBox","property":"value","dataType":"object"},{"field":"costedDept","componentID":"layoutColumn2_costedDept","componentType":"wafPromptBox","property":"value","dataType":"object"},{"field":"foreseeDate","componentID":"layoutColumn3_foreseeDate","componentType":"wafDatePicker","property":"value","dataType":"object"},{"field":"currencyType","componentID":"layoutColumn2_currencyType","componentType":"wafPromptBox","property":"value","dataType":"object"},{"field":"bizReqDate","componentID":"layoutColumn3_bizReqDate","componentType":"wafDatePicker","property":"value","dataType":"object"},{"field":"orgUnit","componentID":"layoutColumn3_orgUnit","componentType":"wafPromptBox","property":"value","dataType":"object"},{"field":"tel","componentID":"layoutColumn3_tel","componentType":"wafText","property":"value","dataType":"object"},{"field":"company","componentID":"layoutColumn3_company","componentType":"wafPromptBox","property":"value","dataType":"object"},{"field":"operationType","componentID":"layoutColumn2_operationType","componentType":"wafPromptBox","property":"value","dataType":"object"},{"field":"payInfo","componentID":"webTextField10","componentType":"wafText","property":"value","dataType":"object"},{"field":"payMode","componentID":"layoutColumn6_payMode","componentType":"wafPromptBox","property":"value","dataType":"object"},{"field":"payerName","componentID":"layoutColumn7_payerName","componentType":"wafText","property":"value","dataType":"object"},{"field":"payerBank","componentID":"layoutColumnBank_payerBank","componentType":"wafPromptBox","property":"value","dataType":"object"},{"field":"payerAccount","componentID":"layoutColumn7_payerAccount","componentType":"wafText","property":"value","dataType":"object"},{"field":"openArea","componentID":"layoutColumnBank_openArea","componentType":"wafPromptBox","property":"value","dataType":"object"},{"field":"cause","componentID":"section2_cause","componentType":"wafTextarea","property":"value","dataType":"object"},{"field":"loanAccount","componentID":"webTextField45","componentType":"wafText","property":"value","dataType":"object"},{"field":"entries","componentID":"entrySection","componentType":"wafInfoBlock","property":"data","dataType":"object"},{"field":"amount","componentID":"section3_amount","componentType":"wafNumberField","property":"value","dataType":"object"},{"field":"reqCheckEntries","componentID":"entrySection1","componentType":"wafInfoBlock","property":"data","dataType":"object"},{"field":"reqAmount","componentID":"webNumberField40","componentType":"wafNumberField","property":"value","dataType":"object"}]
</script>
<script id="entrySection_template" type="text/html">
    <div id="{{index}}" class="row create EDIT" seq="{{index}}" index="{{index}}"><span class="title"></span>

        <div class="rowButtonPanel cf" id="entrySection_rb_{{index}}"><a
                id="entrySection_entrySection_deleteRow_{{index}}" ctrlrole="linkButton"
                class="ui-linkbutton enter2tab ui-icon-rowRemove ibrb" data-domcreated="true" style="display: ;"
                href="javascript:void(null)"><span class="ui-lb-text" style="display: ;"></span></a></div>
        <div class="rowContent" id="entrySection_rt_{{index}}"><span class="seq"><span
                class="rowNum">{{seq}}</span><span class="move" style="display: ;"><span class="up"></span><span
                class="down"></span></span></span>

            <div class="rowCtrls seqLine" id="entrySection_rcs_entrySection_rt_{{index}}">
                <table id="entrySection_entrySection_gridLayoutPanel_{{index}}" border="0" width="100%"
                       class="commontable">
                    <tr>
                        <td id="entrySection_entrySection_gridLayoutPanel_0_{{index}}" style="padding:0" rowspan="1"
                            colspan="1" width="100%">
                            <div ctrlrole="panel" class="ui-panel ui-columnLayout border-sizing three entry"
                                 id="entrySection_columnLayout8_{{index}}" data-domcreated="true" aria-disabled="false">
                                <div id="entrySection_layoutColumn18_{{index}}" ctrlrole="column"
                                     class="ui-column border-sizing span4 nocurrency" data-domcreated="true">
                                    <div id="entrySection_labellayoutColumn18_expenseType_{{index}}"
                                         class="ui-lablecontainer expenseType" ctrlrole="labelContainer"
                                         labelposition="left" style="display: ;" data-domcreated="true"><label
                                            id="entrySection_labellayoutColumn18_expenseType_{{index}}_label"
                                            class="label leftPosition rightalign" role="label"
                                            style="width: 70px;"><span role="required"
                                                                       class="requiredspan requiredDisplay"
                                                                       style=""></span><span role="label"
                                                                                             class="inner-label">费用类型</span></label><span
                                            id="entrySection_labellayoutColumn18_expenseType_{{index}}_ctrl"
                                            class="userinput" role="lc-userinput" labelposition="left"
                                            style="display: ;" data-domcreated="true"><div class="ui-f7-frame ibrf"
                                                                                           aria-disabled="false"
                                                                                           style="display: ; display: ; display: ;">
                                        <div class="ui-f7-layout">
                                            <div class="ui-f7-inputframe"><input type="text"
                                                                                 id="entrySection_expenseType_{{index}}"
                                                                                 name="entrySection_expenseType_{{index}}_el"
                                                                                 class="enter2tab ui-f7 ui-f7iframe"
                                                                                 ctrlrole="promptBox"
                                                                                 data-domcreated="true" tabindex="0"
                                                                                 value="" validate="required:true"
                                                                                 errmsg="required:'费用类型不能为空。'"/><input
                                                    type="hidden" id="entrySection_expenseType_{{index}}_el"
                                                    name="entrySection_expenseType_{{index}}" value=""/></div>
                                            <div class="ui-f7-icon"><span class="ui-f7-trigger"></span></div>
                                        </div>
                                    </div><label class="viewStatus" id="entrySection_expenseType_{{index}}_view"
                                                 style="display: none;"></label></span><span
                                            id="entrySection_labellayoutColumn18_expenseType_{{index}}_img" class="help"
                                            style="display: none;"> </span></div>
                                </div>
                                <div id="entrySection_layoutColumn19_{{index}}" ctrlrole="column"
                                     class="ui-column border-sizing span4 currency center" data-domcreated="true">
                                    <div id="entrySection_labellayoutColumn19_currencyType_{{index}}"
                                         class="ui-lablecontainer currency" ctrlrole="labelContainer"
                                         labelposition="left" style="display: ;" data-domcreated="true"><label
                                            id="entrySection_labellayoutColumn19_currencyType_{{index}}_label"
                                            class="label leftPosition rightalign" role="label"
                                            style="width: 75px;"><span role="required"
                                                                       class="requiredspan requiredDisplay"
                                                                       style=""></span><span role="label"
                                                                                             class="inner-label">币别</span></label><span
                                            id="entrySection_labellayoutColumn19_currencyType_{{index}}_ctrl"
                                            class="userinput" role="lc-userinput" labelposition="left"
                                            style="display: ;" data-domcreated="true"><div class="ui-f7-frame ibrf"
                                                                                           aria-disabled="false"
                                                                                           style="display: ; display: ; display: ;">
                                        <div class="ui-f7-layout">
                                            <div class="ui-f7-inputframe"><input type="text"
                                                                                 id="entrySection_currencyType_{{index}}"
                                                                                 name="entrySection_currencyType_{{index}}_el"
                                                                                 class="enter2tab ui-f7 ui-f7quick"
                                                                                 ctrlrole="promptBox"
                                                                                 data-domcreated="true" tabindex="0"
                                                                                 value="" validate="required:true"
                                                                                 errmsg="required:'币别不能为空。'"/><input
                                                    type="hidden" id="entrySection_currencyType_{{index}}_el"
                                                    name="entrySection_currencyType_{{index}}" value=""/></div>
                                            <div class="ui-f7-icon"><span class="ui-f7-trigger"></span></div>
                                        </div>
                                    </div><label class="viewStatus" id="entrySection_currencyType_{{index}}_view"
                                                 style="display: none;"></label></span><span
                                            id="entrySection_labellayoutColumn19_currencyType_{{index}}_img"
                                            class="help" style="display: none;"> </span></div>
                                </div>
                                <div id="entrySection_layoutColumn20_{{index}}" ctrlrole="column"
                                     class="ui-column border-sizing span4 currency right" data-domcreated="true">
                                    <div id="entrySection_labellayoutColumn20_exchangeRate_{{index}}"
                                         class="ui-lablecontainer currency" ctrlrole="labelContainer"
                                         labelposition="left" style="display: ;" data-domcreated="true"><label
                                            id="entrySection_labellayoutColumn20_exchangeRate_{{index}}_label"
                                            class="label leftPosition rightalign" role="label"
                                            style="width: 75px;"><span role="required"
                                                                       class="requiredspan requiredDisplay"
                                                                       style=""></span><span role="label"
                                                                                             class="inner-label">汇率</span></label><span
                                            id="entrySection_labellayoutColumn20_exchangeRate_{{index}}_ctrl"
                                            class="userinput" role="lc-userinput" labelposition="left"
                                            style="display: ;" data-domcreated="true"><input type="text"
                                                                                             id="entrySection_exchangeRate_{{index}}"
                                                                                             name="entrySection_exchangeRate_{{index}}_el"
                                                                                             class="enter2tab ui-numberfield ui-widget ibrf"
                                                                                             ctrlrole="numberField"
                                                                                             data-domcreated="true"
                                                                                             aria-disabled="false"
                                                                                             tabindex="0"
                                                                                             style="display: ; display: ;"
                                                                                             value=""
                                                                                             validate="required:true"
                                                                                             errmsg="required:'汇率不能为空。'"/><input
                                            type="hidden" id="entrySection_exchangeRate_{{index}}_el"
                                            name="entrySection_exchangeRate_{{index}}" value=""/><label
                                            class="viewStatus" id="entrySection_exchangeRate_{{index}}_view"
                                            style="display: none;"></label></span><span
                                            id="entrySection_labellayoutColumn20_exchangeRate_{{index}}_img"
                                            class="help" style="display: none;"> </span></div>
                                </div>
                                <div id="entrySection_layoutColumn26_{{index}}" ctrlrole="column"
                                     class="ui-column border-sizing span4 nocurrency" data-domcreated="true">
                                    <div id="entrySection_labellayoutColumn18_amountOri_{{index}}"
                                         class="ui-lablecontainer amount" ctrlrole="labelContainer" labelposition="left"
                                         style="display: ;" data-domcreated="true"><label
                                            id="entrySection_labellayoutColumn18_amountOri_{{index}}_label"
                                            class="label leftPosition rightalign" role="label"
                                            style="width: 70px;"><span role="required"
                                                                       class="requiredspan requiredDisplay"
                                                                       style=""></span><span role="label"
                                                                                             class="inner-label">借款金额</span></label><span
                                            id="entrySection_labellayoutColumn18_amountOri_{{index}}_ctrl"
                                            class="userinput" role="lc-userinput" labelposition="left"
                                            style="display: ;" data-domcreated="true"><input type="text"
                                                                                             id="entrySection_amountOri_{{index}}"
                                                                                             name="entrySection_amountOri_{{index}}_el"
                                                                                             class="enter2tab ui-numberfield ui-widget ibrf"
                                                                                             ctrlrole="numberField"
                                                                                             data-domcreated="true"
                                                                                             aria-disabled="false"
                                                                                             tabindex="0"
                                                                                             style="display: ; display: ;"
                                                                                             value=""
                                                                                             validate="required:true"
                                                                                             errmsg="required:'金额原币不能为空。'"
                                                                                             validatetrigger="focus"
                                                                                             customvalidate="_self.validateAmount"
                                                                                             errorlabelposition="bottom"
                                                                                             errorshowmode="embeded"/><input
                                            type="hidden" id="entrySection_amountOri_{{index}}_el"
                                            name="entrySection_amountOri_{{index}}" value=""/><label class="viewStatus"
                                                                                                     id="entrySection_amountOri_{{index}}_view"
                                                                                                     style="display: none;"></label></span><span
                                            id="entrySection_labellayoutColumn18_amountOri_{{index}}_img" class="help"
                                            style="display: none;"> </span></div>
                                </div>
                                <div id="entrySection_layoutColumn27_{{index}}" ctrlrole="column"
                                     class="ui-column border-sizing span4 currency center amount"
                                     data-domcreated="true">
                                    <div id="entrySection_labellayoutColumn19_amount_{{index}}"
                                         class="ui-lablecontainer currency" ctrlrole="labelContainer"
                                         labelposition="left" style="display: ;" data-domcreated="true"><label
                                            id="entrySection_labellayoutColumn19_amount_{{index}}_label"
                                            class="label leftPosition rightalign" role="label"
                                            style="width: 75px;"><span role="required"
                                                                       class="requiredspan requiredDisplay"
                                                                       style=""></span><span role="label"
                                                                                             class="inner-label">本位币金额</span></label><span
                                            id="entrySection_labellayoutColumn19_amount_{{index}}_ctrl"
                                            class="userinput" role="lc-userinput" labelposition="left"
                                            style="display: ;" data-domcreated="true"><input type="text"
                                                                                             id="entrySection_amount_{{index}}"
                                                                                             name="entrySection_amount_{{index}}_el"
                                                                                             class="enter2tab ui-numberfield ui-widget ibrf"
                                                                                             ctrlrole="numberField"
                                                                                             data-domcreated="true"
                                                                                             aria-disabled="false"
                                                                                             readonly="readonly"
                                                                                             tabindex="0"
                                                                                             style="display: ; display: ;"
                                                                                             value=""
                                                                                             validate="required:true"
                                                                                             errmsg="required:'金额不能为空。'"/><input
                                            type="hidden" id="entrySection_amount_{{index}}_el"
                                            name="entrySection_amount_{{index}}" value=""/><label class="viewStatus"
                                                                                                  id="entrySection_amount_{{index}}_view"
                                                                                                  style="display: none;"></label></span><span
                                            id="entrySection_labellayoutColumn19_amount_{{index}}_img" class="help"
                                            style="display: none;"> </span></div>
                                </div>
                                <div id="entrySection_layoutColumn21_{{index}}" ctrlrole="column"
                                     class="ui-column border-sizing span12" data-domcreated="true">
                                    <div id="entrySection_labellayoutColumn21_purpose_{{index}}"
                                         class="ui-lablecontainer colspan" ctrlrole="labelContainer"
                                         labelposition="left" style="display: ;" data-domcreated="true"><label
                                            id="entrySection_labellayoutColumn21_purpose_{{index}}_label"
                                            class="label leftPosition rightalign" role="label"
                                            style="width: 70px;"><span role="required"
                                                                       class="requiredspan requiredDisplay"
                                                                       style=""></span><span role="label"
                                                                                             class="inner-label">借款用途</span></label><span
                                            id="entrySection_labellayoutColumn21_purpose_{{index}}_ctrl"
                                            class="userinput" role="lc-userinput" labelposition="left"
                                            style="display: ;" data-domcreated="true"><input type="text"
                                                                                             name="entrySection_purpose_{{index}}_el"
                                                                                             id="entrySection_purpose_{{index}}"
                                                                                             class="enter2tab ui-text ibrf"
                                                                                             ctrlrole="text"
                                                                                             data-domcreated="true"
                                                                                             aria-disabled="false"
                                                                                             tabindex="0"
                                                                                             style="display: ; display: ;"
                                                                                             validate="required:true"
                                                                                             errmsg="required:'用途不能为空。'"/><input
                                            type="hidden" class="text-hidden" name="entrySection_purpose_{{index}}"
                                            id="entrySection_purpose_{{index}}_el"/><label class="viewStatus"
                                                                                           id="entrySection_purpose_{{index}}_view"
                                                                                           style="display: none;"></label></span><span
                                            id="entrySection_labellayoutColumn21_purpose_{{index}}_img" class="help"
                                            style="display: none;"> </span></div>
                                    <input type="text" name="entrySection_bgData_{{index}}_el"
                                           id="entrySection_bgData_{{index}}"
                                           class="enter2tab ui-text ui-state-readonly removeFocusTab ibrf"
                                           ctrlrole="text" data-domcreated="true" aria-disabled="false"
                                           readonly="readonly"
                                           style="background: transparent; border: none; color: #08C; width: 100%; display: none;"
                                           tabindex="0"/><input type="hidden" class="text-hidden"
                                                                name="entrySection_bgData_{{index}}"
                                                                id="entrySection_bgData_{{index}}_el"/><label
                                        class="viewStatus" id="entrySection_bgData_{{index}}_view"
                                        style="display: none;"></label></div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</script>
<script id="entrySection1_template" type="text/html">
    <div id="{{index}}" class="row create EDIT" seq="{{index}}" index="{{index}}"><span class="title"></span>

        <div class="rowButtonPanel cf" id="entrySection1_rb_{{index}}"><a
                id="entrySection1_entrySection1_deleteRow_{{index}}" ctrlrole="linkButton"
                class="ui-linkbutton enter2tab ui-icon-rowRemove ibrb" data-domcreated="true" style="display: ;"
                href="javascript:void(null)"><span class="ui-lb-text" style="display: ;"></span></a></div>
        <div class="rowContent" id="entrySection1_rt_{{index}}"><span class="seq"><span
                class="rowNum">{{seq}}</span><span class="move" style="display: ;"><span class="up"></span><span
                class="down"></span></span></span>

            <div class="rowCtrls seqLine" id="entrySection1_rcs_entrySection1_rt_{{index}}">
                <table id="entrySection1_entrySection1_gridLayoutPanel_{{index}}" border="0" width="100%"
                       class="commontable">
                    <tr>
                        <td id="entrySection1_entrySection1_gridLayoutPanel_0_{{index}}" style="padding:0" rowspan="1"
                            colspan="1" width="100%">
                            <div ctrlrole="panel" class="ui-panel ui-columnLayout border-sizing three"
                                 id="entrySection1_columnLayout9_{{index}}" data-domcreated="true"
                                 aria-disabled="false">
                                <div id="entrySection1_layoutColumn22_{{index}}" ctrlrole="column"
                                     class="ui-column border-sizing span4" data-domcreated="true">
                                    <div id="entrySection1_labellayoutColumn22_sourceBillNumber_{{index}}"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelposition="left"
                                         style="display: ;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn22_sourceBillNumber_{{index}}_label"
                                            class="label leftPosition rightalign" role="label"
                                            style="width: 70px;"><span role="required"
                                                                       class="requiredspan requiredDisplay"
                                                                       style=""></span><span role="label"
                                                                                             class="inner-label">单据编码</span></label><span
                                            id="entrySection1_labellayoutColumn22_sourceBillNumber_{{index}}_ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         name="entrySection1_sourceBillNumber_{{index}}_el"
                                                                                         id="entrySection1_sourceBillNumber_{{index}}"
                                                                                         class="enter2tab ui-text ui-wafText-disabled ui-state-disabled ui-state-readonly ibrf"
                                                                                         ctrlrole="text"
                                                                                         data-domcreated="true"
                                                                                         disabled="disabled"
                                                                                         aria-disabled="true"
                                                                                         readonly="readonly"
                                                                                         tabindex="0"
                                                                                         style="display: ; display: ;"/><input
                                            type="hidden" class="text-hidden"
                                            name="entrySection1_sourceBillNumber_{{index}}"
                                            id="entrySection1_sourceBillNumber_{{index}}_el"/><label class="viewStatus"
                                                                                                     id="entrySection1_sourceBillNumber_{{index}}_view"
                                                                                                     style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn22_sourceBillNumber_{{index}}_img"
                                            class="help" style="display: none;"> </span></div>
                                    <div id="entrySection1_labellayoutColumn22_sourceBillOperationType_{{index}}"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelposition="left"
                                         style="display: none;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn22_sourceBillOperationType_{{index}}_label"
                                            class="label leftPosition leftalign" role="label"><span role="required"
                                                                                                    class="requiredspan requiredDisplay"></span><span
                                            role="label" class="inner-label">源单业务类别</span></label><span
                                            id="entrySection1_labellayoutColumn22_sourceBillOperationType_{{index}}_ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         name="entrySection1_sourceBillOperationType_{{index}}_el"
                                                                                         id="entrySection1_sourceBillOperationType_{{index}}"
                                                                                         class="enter2tab ui-text ui-wafText-disabled ui-state-disabled ibrf"
                                                                                         ctrlrole="text"
                                                                                         data-domcreated="true"
                                                                                         disabled="disabled"
                                                                                         aria-disabled="true"
                                                                                         tabindex="0"
                                                                                         style="display: none;"/><input
                                            type="hidden" class="text-hidden"
                                            name="entrySection1_sourceBillOperationType_{{index}}"
                                            id="entrySection1_sourceBillOperationType_{{index}}_el"/><label
                                            class="viewStatus" id="entrySection1_sourceBillOperationType_{{index}}_view"
                                            style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn22_sourceBillOperationType_{{index}}_img"
                                            class="help" style="display: none;"> </span></div>
                                    <div id="entrySection1_labellayoutColumn22_sourceBillID_{{index}}"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelposition="left"
                                         style="display: none;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn22_sourceBillID_{{index}}_label"
                                            class="label leftPosition leftalign" role="label"><span role="required"
                                                                                                    class="requiredspan requiredDisplay"></span><span
                                            role="label" class="inner-label">源单据id</span></label><span
                                            id="entrySection1_labellayoutColumn22_sourceBillID_{{index}}_ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         name="entrySection1_sourceBillID_{{index}}_el"
                                                                                         id="entrySection1_sourceBillID_{{index}}"
                                                                                         class="enter2tab ui-text ui-wafText-disabled ui-state-disabled ibrf"
                                                                                         ctrlrole="text"
                                                                                         data-domcreated="true"
                                                                                         disabled="disabled"
                                                                                         aria-disabled="true"
                                                                                         tabindex="0"
                                                                                         style="display: none;"/><input
                                            type="hidden" class="text-hidden"
                                            name="entrySection1_sourceBillID_{{index}}"
                                            id="entrySection1_sourceBillID_{{index}}_el"/><label class="viewStatus"
                                                                                                 id="entrySection1_sourceBillID_{{index}}_view"
                                                                                                 style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn22_sourceBillID_{{index}}_img"
                                            class="help" style="display: none;"> </span></div>
                                    <div id="entrySection1_labellayoutColumn22_sourceBillAmountUsed_{{index}}"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelposition="left"
                                         style="display: none;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn22_sourceBillAmountUsed_{{index}}_label"
                                            class="label leftPosition leftalign" role="label"><span role="required"
                                                                                                    class="requiredspan requiredDisplay"></span><span
                                            role="label" class="inner-label">源单据分录已用金额</span></label><span
                                            id="entrySection1_labellayoutColumn22_sourceBillAmountUsed_{{index}}_ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         id="entrySection1_sourceBillAmountUsed_{{index}}"
                                                                                         name="entrySection1_sourceBillAmountUsed_{{index}}_el"
                                                                                         class="enter2tab ui-numberfield ui-widget ui-wafNumberField-disabled ui-state-disabled ibrf"
                                                                                         ctrlrole="numberField"
                                                                                         data-domcreated="true"
                                                                                         aria-disabled="true"
                                                                                         disabled="disabled"
                                                                                         tabindex="0"
                                                                                         style="display: none;"
                                                                                         value=""/><input type="hidden"
                                                                                                          id="entrySection1_sourceBillAmountUsed_{{index}}_el"
                                                                                                          name="entrySection1_sourceBillAmountUsed_{{index}}"
                                                                                                          value=""/><label
                                            class="viewStatus" id="entrySection1_sourceBillAmountUsed_{{index}}_view"
                                            style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn22_sourceBillAmountUsed_{{index}}_img"
                                            class="help" style="display: none;"> </span></div>
                                </div>
                                <div id="entrySection1_layoutColumn23_{{index}}" ctrlrole="column"
                                     class="ui-column border-sizing span4 center" data-domcreated="true">
                                    <div id="entrySection1_labellayoutColumn23_sourceBillExpenseType_{{index}}"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelposition="left"
                                         style="display: ;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn23_sourceBillExpenseType_{{index}}_label"
                                            class="label leftPosition rightalign" role="label"
                                            style="width: 70px;"><span role="required"
                                                                       class="requiredspan requiredDisplay"
                                                                       style=""></span><span role="label"
                                                                                             class="inner-label">费用类型</span></label><span
                                            id="entrySection1_labellayoutColumn23_sourceBillExpenseType_{{index}}_ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         name="entrySection1_sourceBillExpenseType_{{index}}_el"
                                                                                         id="entrySection1_sourceBillExpenseType_{{index}}"
                                                                                         class="enter2tab ui-text ui-wafText-disabled ui-state-disabled ui-state-readonly ibrf"
                                                                                         ctrlrole="text"
                                                                                         data-domcreated="true"
                                                                                         disabled="disabled"
                                                                                         aria-disabled="true"
                                                                                         readonly="readonly"
                                                                                         tabindex="0"
                                                                                         style="display: ; display: ;"/><input
                                            type="hidden" class="text-hidden"
                                            name="entrySection1_sourceBillExpenseType_{{index}}"
                                            id="entrySection1_sourceBillExpenseType_{{index}}_el"/><label
                                            class="viewStatus" id="entrySection1_sourceBillExpenseType_{{index}}_view"
                                            style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn23_sourceBillExpenseType_{{index}}_img"
                                            class="help" style="display: none;"> </span></div>
                                    <div id="entrySection1_labellayoutColumn23_sourceBillCause_{{index}}"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelposition="left"
                                         style="display: none;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn23_sourceBillCause_{{index}}_label"
                                            class="label leftPosition leftalign" role="label"><span role="required"
                                                                                                    class="requiredspan requiredDisplay"></span><span
                                            role="label" class="inner-label">源单据事由</span></label><span
                                            id="entrySection1_labellayoutColumn23_sourceBillCause_{{index}}_ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         name="entrySection1_sourceBillCause_{{index}}_el"
                                                                                         id="entrySection1_sourceBillCause_{{index}}"
                                                                                         class="enter2tab ui-text ui-wafText-disabled ui-state-disabled ibrf"
                                                                                         ctrlrole="text"
                                                                                         data-domcreated="true"
                                                                                         disabled="disabled"
                                                                                         aria-disabled="true"
                                                                                         tabindex="0"
                                                                                         style="display: none;"/><input
                                            type="hidden" class="text-hidden"
                                            name="entrySection1_sourceBillCause_{{index}}"
                                            id="entrySection1_sourceBillCause_{{index}}_el"/><label class="viewStatus"
                                                                                                    id="entrySection1_sourceBillCause_{{index}}_view"
                                                                                                    style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn23_sourceBillCause_{{index}}_img"
                                            class="help" style="display: none;"> </span></div>
                                    <div id="entrySection1_labellayoutColumn23_sourceBillAmountApproved_{{index}}"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelposition="left"
                                         style="display: none;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn23_sourceBillAmountApproved_{{index}}_label"
                                            class="label leftPosition leftalign" role="label"><span role="required"
                                                                                                    class="requiredspan requiredDisplay"></span><span
                                            role="label" class="inner-label">源单据核定总金额</span></label><span
                                            id="entrySection1_labellayoutColumn23_sourceBillAmountApproved_{{index}}_ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         id="entrySection1_sourceBillAmountApproved_{{index}}"
                                                                                         name="entrySection1_sourceBillAmountApproved_{{index}}_el"
                                                                                         class="enter2tab ui-numberfield ui-widget ui-wafNumberField-disabled ui-state-disabled ibrf"
                                                                                         ctrlrole="numberField"
                                                                                         data-domcreated="true"
                                                                                         aria-disabled="true"
                                                                                         disabled="disabled"
                                                                                         tabindex="0"
                                                                                         style="display: none;"
                                                                                         value=""/><input type="hidden"
                                                                                                          id="entrySection1_sourceBillAmountApproved_{{index}}_el"
                                                                                                          name="entrySection1_sourceBillAmountApproved_{{index}}"
                                                                                                          value=""/><label
                                            class="viewStatus"
                                            id="entrySection1_sourceBillAmountApproved_{{index}}_view"
                                            style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn23_sourceBillAmountApproved_{{index}}_img"
                                            class="help" style="display: none;"> </span></div>
                                    <div id="entrySection1_labellayoutColumn23_sourceBillEntryID_{{index}}"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelposition="left"
                                         style="display: none;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn23_sourceBillEntryID_{{index}}_label"
                                            class="label leftPosition leftalign" role="label"><span role="required"
                                                                                                    class="requiredspan requiredDisplay"></span><span
                                            role="label" class="inner-label">源单据分录id</span></label><span
                                            id="entrySection1_labellayoutColumn23_sourceBillEntryID_{{index}}_ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         name="entrySection1_sourceBillEntryID_{{index}}_el"
                                                                                         id="entrySection1_sourceBillEntryID_{{index}}"
                                                                                         class="enter2tab ui-text ui-wafText-disabled ui-state-disabled ibrf"
                                                                                         ctrlrole="text"
                                                                                         data-domcreated="true"
                                                                                         disabled="disabled"
                                                                                         aria-disabled="true"
                                                                                         tabindex="0"
                                                                                         style="display: none;"/><input
                                            type="hidden" class="text-hidden"
                                            name="entrySection1_sourceBillEntryID_{{index}}"
                                            id="entrySection1_sourceBillEntryID_{{index}}_el"/><label class="viewStatus"
                                                                                                      id="entrySection1_sourceBillEntryID_{{index}}_view"
                                                                                                      style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn23_sourceBillEntryID_{{index}}_img"
                                            class="help" style="display: none;"> </span></div>
                                </div>
                                <div id="entrySection1_layoutColumn24_{{index}}" ctrlrole="column"
                                     class="ui-column border-sizing span4 right" data-domcreated="true">
                                    <div id="entrySection1_labellayoutColumn24_checkAmount_{{index}}"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelposition="left"
                                         style="display: ;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn24_checkAmount_{{index}}_label"
                                            class="label leftPosition rightalign" role="label"
                                            style="width: 70px;"><span role="required"
                                                                       class="requiredspan requiredDisplay"
                                                                       style=""></span><span role="label"
                                                                                             class="inner-label">核销金额</span></label><span
                                            id="entrySection1_labellayoutColumn24_checkAmount_{{index}}_ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         id="entrySection1_checkAmount_{{index}}"
                                                                                         name="entrySection1_checkAmount_{{index}}_el"
                                                                                         class="enter2tab ui-numberfield ui-widget ibrf"
                                                                                         ctrlrole="numberField"
                                                                                         data-domcreated="true"
                                                                                         aria-disabled="false"
                                                                                         tabindex="0"
                                                                                         style="display: ; display: ;"
                                                                                         value=""/><input type="hidden"
                                                                                                          id="entrySection1_checkAmount_{{index}}_el"
                                                                                                          name="entrySection1_checkAmount_{{index}}"
                                                                                                          value=""/><label
                                            class="viewStatus" id="entrySection1_checkAmount_{{index}}_view"
                                            style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn24_checkAmount_{{index}}_img"
                                            class="help" style="display: none;"> </span></div>
                                    <div id="entrySection1_labellayoutColumn24_sourceBillDate_{{index}}"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelposition="left"
                                         style="display: none;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn24_sourceBillDate_{{index}}_label"
                                            class="label leftPosition leftalign" role="label"><span role="required"
                                                                                                    class="requiredspan requiredDisplay"></span><span
                                            role="label" class="inner-label">源单据业务日期</span></label><span
                                            id="entrySection1_labellayoutColumn24_sourceBillDate_{{index}}_ctrl"
                                            class="userinput" role="lc-userinput"><div
                                            class="ui-datepicker-frame ibrf ui-state-disabled"
                                            style="width: nullpx; height: nullpx; display: none;">
                                        <div class="ui-datepicker-layout">
                                            <div class="ui-datepicker-inputframe"><input type="text"
                                                                                         id="entrySection1_sourceBillDate_{{index}}"
                                                                                         name="entrySection1_sourceBillDate_{{index}}_el"
                                                                                         class="hasDatepicker enter2tab ui-datepicker-input ui-state-disabled"
                                                                                         data-domcreated="true"
                                                                                         tabindex="0"
                                                                                         ctrlrole="datePicker"
                                                                                         disabled="true"/><input
                                                    type="hidden" id="entrySection1_sourceBillDate_{{index}}_el"
                                                    name="entrySection1_sourceBillDate_{{index}}"/></div>
                                            <div class="ui-datepicker-icon"><span
                                                    class="ui-datepicker-iconTrigger"></span></div>
                                        </div>
                                    </div><label class="viewStatus" id="entrySection1_sourceBillDate_{{index}}_view"
                                                 style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn24_sourceBillDate_{{index}}_img"
                                            class="help" style="display: none;"> </span></div>
                                    <div id="entrySection1_labellayoutColumn24_sourceBillAmountBalance_{{index}}"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelposition="left"
                                         style="display: none;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn24_sourceBillAmountBalance_{{index}}_label"
                                            class="label leftPosition leftalign" role="label"><span role="required"
                                                                                                    class="requiredspan requiredDisplay"></span><span
                                            role="label" class="inner-label">源单据分录可用余额</span></label><span
                                            id="entrySection1_labellayoutColumn24_sourceBillAmountBalance_{{index}}_ctrl"
                                            class="userinput" role="lc-userinput"><input type="text"
                                                                                         id="entrySection1_sourceBillAmountBalance_{{index}}"
                                                                                         name="entrySection1_sourceBillAmountBalance_{{index}}_el"
                                                                                         class="enter2tab ui-numberfield ui-widget ui-wafNumberField-disabled ui-state-disabled ibrf"
                                                                                         ctrlrole="numberField"
                                                                                         data-domcreated="true"
                                                                                         aria-disabled="true"
                                                                                         disabled="disabled"
                                                                                         tabindex="0"
                                                                                         style="display: none;"
                                                                                         value=""/><input type="hidden"
                                                                                                          id="entrySection1_sourceBillAmountBalance_{{index}}_el"
                                                                                                          name="entrySection1_sourceBillAmountBalance_{{index}}"
                                                                                                          value=""/><label
                                            class="viewStatus" id="entrySection1_sourceBillAmountBalance_{{index}}_view"
                                            style="display: none;"></label></span><span
                                            id="entrySection1_labellayoutColumn24_sourceBillAmountBalance_{{index}}_img"
                                            class="help" style="display: none;"> </span></div>
                                    <div id="entrySection1_labellayoutColumn24_hasSourceBill_{{index}}"
                                         class="ui-lablecontainer" ctrlrole="labelContainer" labelposition="left"
                                         style="display: none;" data-domcreated="true"><label
                                            id="entrySection1_labellayoutColumn24_hasSourceBill_{{index}}_label"
                                            class="label leftPosition leftalign" role="label"><span role="required"
                                                                                                    class="requiredspan requiredDisplay"></span><span
                                            role="label" class="inner-label">是否有源单</span></label><span
                                            id="entrySection1_labellayoutColumn24_hasSourceBill_{{index}}_ctrl"
                                            class="userinput" role="lc-userinput"><input type="hidden"
                                                                                         name="entrySection1_hasSourceBill_{{index}}"
                                                                                         id="entrySection1_hasSourceBill_{{index}}_el"
                                                                                         value=""/><input
                                            type="checkbox" name="entrySection1_hasSourceBill_{{index}}_el"
                                            id="entrySection1_hasSourceBill_{{index}}" value="1" ctrlrole="checkbox"
                                            class="ui-wafcheckbox ui-wafCheckbox-disabled ui-state-disabled ibrf enter2tab"
                                            data-domcreated="true" disabled="true" aria-disabled="true"
                                            style="display: none;" tabindex="0"/><label
                                            for="entrySection1_hasSourceBill_{{index}}"
                                            style="display: none;">undefined</label></span><span
                                            id="entrySection1_labellayoutColumn24_hasSourceBill_{{index}}_img"
                                            class="help" style="display: none;"> </span></div>
                                </div>
                                <div id="entrySection1_layoutColumn25_{{index}}" ctrlrole="column"
                                     class="ui-column border-sizing span12" data-domcreated="true"><input type="text"
                                                                                                          name="entrySection1_sourceBillData_{{index}}_el"
                                                                                                          id="entrySection1_sourceBillData_{{index}}"
                                                                                                          class="enter2tab ui-text ui-state-readonly removeFocusTab ibrf"
                                                                                                          ctrlrole="text"
                                                                                                          data-domcreated="true"
                                                                                                          aria-disabled="false"
                                                                                                          readonly="readonly"
                                                                                                          style="background: transparent; border: none; color: #08C; width: 100%; display: ; display: ;"
                                                                                                          tabindex="0"/><input
                                        type="hidden" class="text-hidden" name="entrySection1_sourceBillData_{{index}}"
                                        id="entrySection1_sourceBillData_{{index}}_el"/><label class="viewStatus"
                                                                                               id="entrySection1_sourceBillData_{{index}}_view"
                                                                                               style="display: none;"></label>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</script>
<script id="all_options" type="text/html">window._serverOptions_ =
    [{"type":"msgArea","option":{"id":"msgArea1"},"id":"msgArea1"},{"type":"toolBar","option":{"id":"toolBar"},"id":"toolBar"},{"type":"linkButton","option":{"id":"toolBar_submit","caption":"提交","tagClass":"btn","actionBinding":"submitAction"},"id":"toolBar_submit"},{"type":"linkButton","option":{"id":"toolBar_save","caption":"保存","tagClass":"btn","actionBinding":"saveAction"},"id":"toolBar_save"},{"type":"linkButton","option":{"id":"toolBar_delete","caption":"删除","tagClass":"btn","actionBinding":"deleteAction"},"id":"toolBar_delete"},{"type":"linkButton","option":{"id":"toolBar_viewProcessDiagram","caption":"流程图","tagClass":"btn","actionBinding":"viewProcessDiagramAction"},"id":"toolBar_viewProcessDiagram"},{"type":"linkButton","option":{"id":"toolBar_viewOpinion","caption":"审批意见","tagClass":"btn","actionBinding":"viewOpinionAction"},"id":"toolBar_viewOpinion"},{"type":"linkButton","option":{"id":"toolBar_viewHis","caption":"查看借还款","tagClass":"btn","actionBinding":"viewLoanPayAction"},"id":"toolBar_viewHis"},{"type":"linkButton","option":{"id":"toolBar_viewBudget","caption":"查看预算","tagClass":"btn","actionBinding":"viewBudgetAction"},"id":"toolBar_viewBudget"},{"type":"linkButton","option":{"id":"toolBar_traceUp","caption":"上查","tagClass":"btn","actionBinding":"traceUpAction"},"id":"toolBar_traceUp"},{"type":"menuButton","option":{"id":"toolBar_more","caption":"更多","tagClass":"btn
    grayer"},"id":"toolBar_more"},{"type":"menuItem","option":{"id":"toolBar_viewBudget1","caption":"查看预算","actionBinding":"viewBudgetAction"},"id":"toolBar_viewBudget1"},{"type":"menuItem","option":{"id":"toolBar_abandon","caption":"废弃","actionBinding":"abandonAction"},"id":"toolBar_abandon"},{"type":"menuItem","option":{"id":"toolBar_traceUp1","caption":"上查","actionBinding":"traceUpAction"},"id":"toolBar_traceUp1"},{"type":"linkButton","option":{"id":"toolBar_report","caption":"打印","tagClass":"btn","actionBinding":"reportAction"},"id":"toolBar_report"},{"type":"linkButton","option":{"id":"toolBar_exit","caption":"返回","tagClass":"btn","actionBinding":"exitAction"},"id":"toolBar_exit"},{"type":"waf.webAttachment","option":{"id":"webAttachment","url":"//component/WebAttachment.do","title":"附件","hidden":false,"autoUpload":true},"id":"webAttachment"},{"type":"section","option":{"id":"webAttachment","url":"//component/WebAttachment.do","title":"附件","hidden":false,"autoUpload":true},"id":"webAttachment"},{"type":"fileUpload","option":{"id":"webAttachment_upload","name":"webAttachment_upload","url":"/component/WebAttachment.do?method=upload","autoUpload":true,"progressUrl":"//fileUpload/progress.do?method=initalize"},"id":"webAttachment_upload"},{"type":"section","option":{"id":"section","title":"基本信息","entryObjectName":"借款单","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBill"},"id":"section"},{"type":"panel","option":{"id":"columnLayout_baseInfoSummary","style":"background-color:#F5F5F5;padding-top:
    9px; padding-bottom: 9px; padding-right:
    9px;","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBill","layout":"column"},"id":"columnLayout_baseInfoSummary"},{"type":"column","option":{"id":"layoutColumn","tagClass":"span11"},"id":"layoutColumn"},{"type":"text","option":{"id":"webTextField","disabled":true,"readonly":true,"dsTl":false,"style":"background:transparent;border:none;width:100%;color:#363636","labelPosition":"left","name":"baseInfo","displayField":"#webTextField_view"},"id":"webTextField"},{"type":"column","option":{"id":"layoutColumn1","style":"text-align:right","tagClass":"span1"},"id":"layoutColumn1"},{"type":"linkButton","option":{"id":"buttonBaseInfoEdit","caption":"展开","style":"min-width:42px;","tagClass":"btn","actionBinding":"baseInfoEditAction"},"id":"buttonBaseInfoEdit"},{"type":"panel","option":{"id":"columnLayout_baseInfo","tagClass":"two","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBill","layout":"column"},"id":"columnLayout_baseInfo"},{"type":"column","option":{"id":"layoutColumn2","tagClass":"span6"},"id":"layoutColumn2"},{"type":"labelContainer","option":{"id":"labellayoutColumn2_applier","caption":"申请人","labelPosition":"left","labelAlign":"right"},"id":"labellayoutColumn2_applier"},{"type":"promptBox","option":{"id":"layoutColumn2_applier","F7Type":"F7Iframe","title":"申请人","req":true,"tabindex":100,"labelPosition":"left","labelAlign":"right","F7Iframe_url":"/cp/bc/dynamic/f7Applier.do?method=initalize","F7Iframe_height":510,"F7Iframe_width":620,"F7Iframe_closeOnEscape":true,"F7Iframe_draggable":true,"F7Iframe_showType":"window","F7Iframe_resizable":true,"validator_rules":"required:true","validator_errMsg":"required:'申请人不能为空。'","name":"applier","submitField":"#layoutColumn2_applier_el","subWidgetName":"wafPromptIframe","inIframe":true,"subWidgetOptions":{"url":"//cp/bc/dynamic/f7Applier.do?method=initalize","height":510,"width":620,"closeOnEscape":true,"draggable":true,"showType":"window","resizable":true,"submitField":"layoutColumn2_applier_el"}},"id":"layoutColumn2_applier"},{"type":"labelContainer","option":{"id":"labellayoutColumn2_position","caption":"职位","labelPosition":"left","labelAlign":"right"},"id":"labellayoutColumn2_position"},{"type":"promptBox","option":{"id":"layoutColumn2_position","F7Type":"F7Table","title":"职位","req":true,"tabindex":102,"labelPosition":"left","labelAlign":"right","F7Table_query":"com.kingdee.eas.cp.bc.app.PersonAllAndPrimaryPositionQuery","F7Table_cu":true,"F7Table_ajaxType":"POST","F7Table_allowAutoComplete":true,"F7Table_shrinkToFit":true,"F7Table_autoCompleteItem":"number,name","F7Table_autoChoose":false,"F7Table_width":500,"F7Table_height":400,"validator_rules":"required:true","validator_errMsg":"required:'职位不能为空。'","name":"position","submitField":"#layoutColumn2_position_el","subWidgetName":"wafPromptTable","inIframe":true,"subWidgetOptions":{"query":"com.kingdee.eas.cp.bc.app.PersonAllAndPrimaryPositionQuery","cu":true,"ajaxType":"POST","allowAutoComplete":true,"shrinkToFit":true,"autoCompleteItem":"number,name","autoChoose":false,"width":500,"height":400,"submitField":"layoutColumn2_position_el","url":"//component/promptTable.do"}},"id":"layoutColumn2_position"},{"type":"labelContainer","option":{"id":"labellayoutColumn2_applierCompany","caption":"公司","labelPosition":"left","labelAlign":"right"},"id":"labellayoutColumn2_applierCompany"},{"type":"promptBox","option":{"id":"layoutColumn2_applierCompany","F7Type":"F7Quick","title":"公司","req":true,"disabled":true,"readonly":true,"tabindex":104,"labelPosition":"left","labelAlign":"right","F7Quick_query":"com.kingdee.eas.basedata.org.app.CompanyOrgUnitQuery4AsstAcct","F7Quick_cu":true,"F7Quick_allowAutoComplete":true,"F7Quick_autoChoose":true,"F7Quick_width":400,"validator_rules":"required:true","validator_errMsg":"required:'申请人公司不能为空。'","name":"applierCompany","submitField":"#layoutColumn2_applierCompany_el","subWidgetName":"wafPromptQuick","inIframe":true,"subWidgetOptions":{"query":"com.kingdee.eas.basedata.org.app.CompanyOrgUnitQuery4AsstAcct","cu":true,"allowAutoComplete":true,"autoChoose":true,"width":400,"dataUrl":"//component/F7Quick.do?method=initalize","submitField":"layoutColumn2_applierCompany_el"}},"id":"layoutColumn2_applierCompany"},{"type":"labelContainer","option":{"id":"labellayoutColumn2_costedDept","caption":"费用承担部门","labelPosition":"left","labelAlign":"right"},"id":"labellayoutColumn2_costedDept"},{"type":"promptBox","option":{"id":"layoutColumn2_costedDept","F7Type":"F7Table","title":"费用承担部门","req":true,"readonly":false,"tabindex":106,"labelPosition":"left","labelAlign":"right","F7Table_query":"com.kingdee.eas.cp.bc.app.CostCenterOrgUnitQuery4AsstAcct","F7Table_cu":false,"F7Table_ajaxType":"POST","F7Table_allowAutoComplete":true,"F7Table_shrinkToFit":true,"F7Table_autoCompleteItem":"number,name","F7Table_autoChoose":false,"F7Table_width":500,"F7Table_height":400,"validator_rules":"required:true","validator_errMsg":"required:'费用支付部门不能为空。'","name":"costedDept","submitField":"#layoutColumn2_costedDept_el","subWidgetName":"wafPromptTable","inIframe":true,"subWidgetOptions":{"query":"com.kingdee.eas.cp.bc.app.CostCenterOrgUnitQuery4AsstAcct","cu":false,"ajaxType":"POST","allowAutoComplete":true,"shrinkToFit":true,"autoCompleteItem":"number,name","autoChoose":false,"width":500,"height":400,"submitField":"layoutColumn2_costedDept_el","url":"//component/promptTable.do"}},"id":"layoutColumn2_costedDept"},{"type":"labelContainer","option":{"id":"labellayoutColumn3_foreseeDate","caption":"预计还款日期","labelPosition":"left","labelAlign":"right"},"id":"labellayoutColumn3_foreseeDate"},{"type":"datePicker","option":{"id":"layoutColumn3_foreseeDate","title":"预计还款日期","req":true,"tabindex":108,"labelPosition":"left","labelAlign":"right","showOtherMonths":"true","selectOtherMonths":"true","validator_rules":"required:true","validator_errMsg":"required:'预计还款日期不能为空。'","name":"foreseeDate","altField":"#layoutColumn3_foreseeDate_el","altFormat":"yy-mm-dd","displayField":"#layoutColumn3_foreseeDate_view"},"id":"layoutColumn3_foreseeDate"},{"type":"labelContainer","option":{"id":"labellayoutColumn2_currencyType","hidden":"true","caption":"币别","labelPosition":"left","labelAlign":"right"},"id":"labellayoutColumn2_currencyType"},{"type":"promptBox","option":{"id":"layoutColumn2_currencyType","F7Type":"F7Quick","title":"币别","hidden":true,"disabled":true,"tabindex":110,"labelPosition":"left","labelAlign":"right","F7Quick_query":"com.kingdee.eas.basedata.assistant.app.CurrencyQuery","F7Quick_cu":true,"F7Quick_allowAutoComplete":true,"F7Quick_autoChoose":true,"F7Quick_width":400,"name":"currencyType","submitField":"#layoutColumn2_currencyType_el","subWidgetName":"wafPromptQuick","inIframe":true,"subWidgetOptions":{"query":"com.kingdee.eas.basedata.assistant.app.CurrencyQuery","cu":true,"allowAutoComplete":true,"autoChoose":true,"width":400,"dataUrl":"//component/F7Quick.do?method=initalize","submitField":"layoutColumn2_currencyType_el"}},"id":"layoutColumn2_currencyType"},{"type":"column","option":{"id":"layoutColumn3","style":"text-align:right;","tagClass":"span6"},"id":"layoutColumn3"},{"type":"labelContainer","option":{"id":"labellayoutColumn3_bizReqDate","caption":"申请日期","labelPosition":"left","labelAlign":"right"},"id":"labellayoutColumn3_bizReqDate"},{"type":"datePicker","option":{"id":"layoutColumn3_bizReqDate","title":"申请日期","req":true,"tabindex":101,"labelPosition":"left","labelAlign":"right","showOtherMonths":"true","selectOtherMonths":"true","validator_rules":"required:true","validator_errMsg":"required:'申请日期不能为空。'","name":"bizReqDate","altField":"#layoutColumn3_bizReqDate_el","altFormat":"yy-mm-dd","displayField":"#layoutColumn3_bizReqDate_view"},"id":"layoutColumn3_bizReqDate"},{"type":"labelContainer","option":{"id":"labellayoutColumn3_orgUnit","caption":"部门","labelPosition":"left","labelAlign":"right"},"id":"labellayoutColumn3_orgUnit"},{"type":"promptBox","option":{"id":"layoutColumn3_orgUnit","F7Type":"F7Table","title":"部门","req":true,"tabindex":103,"labelPosition":"left","labelAlign":"right","F7Table_query":"com.kingdee.eas.basedata.org.app.AdminItemQuery","F7Table_cu":true,"F7Table_ajaxType":"POST","F7Table_allowAutoComplete":true,"F7Table_shrinkToFit":true,"F7Table_autoCompleteItem":"number,name","F7Table_autoChoose":false,"F7Table_width":500,"F7Table_height":400,"validator_rules":"required:true","validator_errMsg":"required:'申请部门不能为空。'","name":"orgUnit","submitField":"#layoutColumn3_orgUnit_el","subWidgetName":"wafPromptTable","inIframe":true,"subWidgetOptions":{"query":"com.kingdee.eas.basedata.org.app.AdminItemQuery","cu":true,"ajaxType":"POST","allowAutoComplete":true,"shrinkToFit":true,"autoCompleteItem":"number,name","autoChoose":false,"width":500,"height":400,"submitField":"layoutColumn3_orgUnit_el","url":"//component/promptTable.do"}},"id":"layoutColumn3_orgUnit"},{"type":"labelContainer","option":{"id":"labellayoutColumn3_tel","caption":"联系电话","labelPosition":"left","labelAlign":"right"},"id":"labellayoutColumn3_tel"},{"type":"text","option":{"id":"layoutColumn3_tel","title":"联系电话","tabindex":105,"labelPosition":"left","labelAlign":"right","name":"tel","displayField":"#layoutColumn3_tel_view"},"id":"layoutColumn3_tel"},{"type":"labelContainer","option":{"id":"labellayoutColumn3_company","caption":"费用承担公司","labelPosition":"left","labelAlign":"right"},"id":"labellayoutColumn3_company"},{"type":"promptBox","option":{"id":"layoutColumn3_company","F7Type":"F7Iframe","title":"费用承担公司","req":true,"tabindex":107,"labelPosition":"left","labelAlign":"right","F7Iframe_url":"/cp/bc/dynamic/newOrgF7UI.do?method=initalize","F7Iframe_height":420,"F7Iframe_width":620,"F7Iframe_closeOnEscape":true,"F7Iframe_draggable":true,"F7Iframe_showType":"window","F7Iframe_resizable":true,"validator_rules":"required:true","validator_errMsg":"required:'公司不能为空。'","name":"company","submitField":"#layoutColumn3_company_el","subWidgetName":"wafPromptIframe","inIframe":true,"subWidgetOptions":{"url":"//cp/bc/dynamic/newOrgF7UI.do?method=initalize","height":420,"width":620,"closeOnEscape":true,"draggable":true,"showType":"window","resizable":true,"submitField":"layoutColumn3_company_el"}},"id":"layoutColumn3_company"},{"type":"labelContainer","option":{"id":"labellayoutColumn2_operationType","hidden":"true","caption":"业务类别","labelPosition":"left","labelAlign":"right"},"id":"labellayoutColumn2_operationType"},{"type":"promptBox","option":{"id":"layoutColumn2_operationType","F7Type":"F7Quick","title":"业务类别","hidden":true,"disabled":true,"tabindex":109,"labelPosition":"left","labelAlign":"right","F7Quick_query":"com.kingdee.eas.cp.bc.app.OperationTypeQuery","F7Quick_cu":true,"F7Quick_allowAutoComplete":true,"F7Quick_autoChoose":true,"F7Quick_width":400,"name":"operationType","submitField":"#layoutColumn2_operationType_el","subWidgetName":"wafPromptQuick","inIframe":true,"subWidgetOptions":{"query":"com.kingdee.eas.cp.bc.app.OperationTypeQuery","cu":true,"allowAutoComplete":true,"autoChoose":true,"width":400,"dataUrl":"//component/F7Quick.do?method=initalize","submitField":"layoutColumn2_operationType_el"}},"id":"layoutColumn2_operationType"},{"type":"linkButton","option":{"id":"button30","caption":"收起","style":"min-width:42px;","tagClass":"btn","actionBinding":"baseInfoOKAction"},"id":"button30"},{"type":"column","option":{"id":"layoutColumn33","style":"display:none","tagClass":"span6
    right"},"id":"layoutColumn33"},{"type":"linkButton","option":{"id":"button12","caption":"保存修改","tagClass":"btn","actionBinding":"baseInfoOKAction"},"id":"button12"},{"type":"column","option":{"id":"layoutColumn34","style":"display:none","tagClass":"span6
    left"},"id":"layoutColumn34"},{"type":"linkButton","option":{"id":"button21","caption":"取消","tagClass":"btn","actionBinding":"cancelBaseInfoAction"},"id":"button21"},{"type":"section","option":{"id":"section1","title":"收款信息","entryObjectName":"借款单","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBill"},"id":"section1"},{"type":"panel","option":{"id":"columnLayout_payInfoSummary","style":"background-color:#F5F5F5;;padding-top:
    9px; padding-bottom: 9px; padding-right:
    9px;","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBill","layout":"column"},"id":"columnLayout_payInfoSummary"},{"type":"column","option":{"id":"layoutColumn4","tagClass":"span11"},"id":"layoutColumn4"},{"type":"text","option":{"id":"webTextField10","disabled":true,"readonly":true,"dsTl":false,"style":"background:transparent;border:none;width:100%;color:#363636","labelPosition":"left","name":"payInfo","displayField":"#webTextField10_view"},"id":"webTextField10"},{"type":"column","option":{"id":"layoutColumn5","style":"text-align:right","tagClass":"span1"},"id":"layoutColumn5"},{"type":"linkButton","option":{"id":"buttonPayInfoEdit","caption":"展开","style":"min-width:42px;","tagClass":"btn","actionBinding":"payInfoEditAction"},"id":"buttonPayInfoEdit"},{"type":"panel","option":{"id":"columnLayout_payInfo","tagClass":"two","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBill","layout":"column"},"id":"columnLayout_payInfo"},{"type":"column","option":{"id":"layoutColumn54","tagClass":"span12"},"id":"layoutColumn54"},{"type":"labelContainer","option":{"id":"labellayoutColumn6_payMode","caption":"支付方式","labelPosition":"left","labelAlign":"right"},"id":"labellayoutColumn6_payMode"},{"type":"promptBox","option":{"id":"layoutColumn6_payMode","F7Type":"F7Quick","title":"支付方式","req":true,"tabindex":200,"labelPosition":"left","labelAlign":"right","F7Quick_query":"com.kingdee.eas.basedata.assistant.app.SettlementTypeQuery","F7Quick_cu":true,"F7Quick_allowAutoComplete":true,"F7Quick_autoChoose":true,"F7Quick_autoCompleteItem":"number,name","F7Quick_width":400,"validator_rules":"required:true","validator_errMsg":"required:'支付方式不能为空。'","name":"payMode","submitField":"#layoutColumn6_payMode_el","subWidgetName":"wafPromptQuick","inIframe":true,"subWidgetOptions":{"query":"com.kingdee.eas.basedata.assistant.app.SettlementTypeQuery","cu":true,"allowAutoComplete":true,"autoChoose":true,"autoCompleteItem":"number,name","width":400,"dataUrl":"//component/F7Quick.do?method=initalize","submitField":"layoutColumn6_payMode_el"}},"id":"layoutColumn6_payMode"},{"type":"column","option":{"id":"layoutColumn6","tagClass":"span6"},"id":"layoutColumn6"},{"type":"panel","option":{"id":"columnLayout10","layout":"column"},"id":"columnLayout10"},{"type":"column","option":{"id":"layoutColumn52","tagClass":"span12
    layoutColumnApplier"},"id":"layoutColumn52"},{"type":"linkButton","option":{"id":"buttonSelectApplier","style":"position:
    absolute; z-Index: 2000; display: inline-block; height: 24px; width:
    20px;margin-left:335px;","tagClass":"g-icon-search","actionBinding":"selectPayerAction"},"id":"buttonSelectApplier"},{"type":"labelContainer","option":{"id":"labellayoutColumn7_payerName","caption":"收款人","labelWidth":100,"labelPosition":"left","tagClass":"applierContainer","labelAlign":"right"},"id":"labellayoutColumn7_payerName"},{"type":"text","option":{"id":"layoutColumn7_payerName","title":"收款人","labelWidth":100,"req":true,"readonly":true,"editable":false,"tabindex":201,"labelPosition":"left","label_tagClass":"applierContainer","labelAlign":"right","validator_rules":"required:true","validator_errMsg":"required:'收款人姓名不能为空。'","name":"payerName","displayField":"#layoutColumn7_payerName_view"},"id":"layoutColumn7_payerName"},{"type":"column","option":{"id":"layoutColumnBank","tagClass":"span6"},"id":"layoutColumnBank"},{"type":"labelContainer","option":{"id":"labellayoutColumnBank_payerBank","caption":"收款人银行","labelPosition":"left"},"id":"labellayoutColumnBank_payerBank"},{"type":"promptBox","option":{"id":"layoutColumnBank_payerBank","F7Type":"F7Quick","title":"收款人银行","readonly":true,"editable":false,"labelPosition":"left","F7Quick_cu":true,"F7Quick_allowAutoComplete":true,"F7Quick_autoChoose":true,"F7Quick_width":400,"name":"payerBank","submitField":"#layoutColumnBank_payerBank_el","subWidgetName":"wafPromptQuick","inIframe":true,"subWidgetOptions":{"cu":true,"allowAutoComplete":true,"autoChoose":true,"width":400,"dataUrl":"//component/F7Quick.do?method=initalize","submitField":"layoutColumnBank_payerBank_el"}},"id":"layoutColumnBank_payerBank"},{"type":"column","option":{"id":"layoutColumn55","tagClass":"span6"},"id":"layoutColumn55"},{"type":"labelContainer","option":{"id":"labellayoutColumn7_payerAccount","caption":"银行账号","labelPosition":"left","labelAlign":"right"},"id":"labellayoutColumn7_payerAccount"},{"type":"text","option":{"id":"layoutColumn7_payerAccount","title":"银行账号","req":true,"readonly":true,"editable":false,"tabindex":203,"labelPosition":"left","labelAlign":"right","validator_rules":"required:true","validator_errMsg":"required:'收款人账号不能为空。'","name":"payerAccount","displayField":"#layoutColumn7_payerAccount_view"},"id":"layoutColumn7_payerAccount"},{"type":"column","option":{"id":"layoutColumn56","tagClass":"span6"},"id":"layoutColumn56"},{"type":"labelContainer","option":{"id":"labellayoutColumnBank_openArea","caption":"开户地","labelPosition":"left"},"id":"labellayoutColumnBank_openArea"},{"type":"promptBox","option":{"id":"layoutColumnBank_openArea","F7Type":"F7Quick","title":"开户地","readonly":true,"editable":false,"labelPosition":"left","F7Quick_query":"com.kingdee.eas.fm.be.OpenAreaQuery","F7Quick_cu":true,"F7Quick_allowAutoComplete":true,"F7Quick_autoChoose":true,"F7Quick_width":400,"name":"openArea","submitField":"#layoutColumnBank_openArea_el","subWidgetName":"wafPromptQuick","inIframe":true,"subWidgetOptions":{"query":"com.kingdee.eas.fm.be.OpenAreaQuery","cu":true,"allowAutoComplete":true,"autoChoose":true,"width":400,"dataUrl":"//component/F7Quick.do?method=initalize","submitField":"layoutColumnBank_openArea_el"}},"id":"layoutColumnBank_openArea"},{"type":"column","option":{"id":"layoutColumn36","tagClass":"span12
    right"},"id":"layoutColumn36"},{"type":"linkButton","option":{"id":"button22","caption":"收起","style":"min-width:42px;","tagClass":"btn","actionBinding":"payInfoOKAction"},"id":"button22"},{"type":"section","option":{"id":"section_cause","title":"事由","rows":1,"cols":1,"tagClass":"colspan","entryObjectName":"借款单","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBill"},"id":"section_cause"},{"type":"textarea","option":{"id":"section2_cause","title":"事由","req":true,"dsTl":false,"height":58,"labelPosition":"left","validator_rules":"required:true","validator_errMsg":"required:'事由不能为空。'","name":"cause","displayField":"#section2_cause_view"},"id":"section2_cause"},{"type":"section","option":{"id":"section3","title":"借款明细","entryObjectName":"借款单","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBill"},"id":"section3"},{"type":"panel","option":{"id":"columnLayout4","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBill","layout":"column"},"id":"columnLayout4"},{"type":"column","option":{"id":"layoutColumn8","tagClass":"span12"},"id":"layoutColumn8"},{"type":"checkbox","option":{"id":"cbMultiCurrency","title":"多币别","dsTl":false,"tagClass":"removeFocusTab","labelPosition":"left","label_tagClass":"currencyCheckboxContainer","labelAlign":"right","label":"多币别"},"id":"cbMultiCurrency"},{"type":"column","option":{"id":"layoutColumn79","tagClass":"span12"},"id":"layoutColumn79"},{"type":"text","option":{"id":"webTextField45","hidden":true,"readonly":true,"dsTl":false,"style":"background:transparent;border:none;color:#08C;width:100%;","tagClass":"removeFocusTab","labelPosition":"left","name":"loanAccount","displayField":"#webTextField45_view"},"id":"webTextField45"},{"type":"infoBlock","option":{"id":"entrySection","entryObjectName":"分录","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBillEntry","dataBind":"entries","entryProp":"entries","rows":1,"cols":1,"rowMeta":{"id":"entrySection","componentType":"com.kingdee.bos.ctrl.web.InfoBlock","parent":"section3_gridLayoutPanel_1","parentEl":"section3_gridLayoutPanel_1","properties":{},"events":{},"childrens":[{"buttonPanel":{"id":"entrySection_btnPanel","componentType":"com.kingdee.bos.ctrl.web.btnPanel","parent":"entrySection","parentEl":"entrySection","properties":{"id":"entrySection_btnPanel"},"events":{},"childrens":[]},"rowButtonPanel":{"id":"entrySection_rowBtnPanel","componentType":"com.kingdee.bos.ctrl.web.rowBtnPanel","parent":"entrySection","parentEl":"entrySection","properties":{"id":"entrySection_rowBtnPanel"},"events":{},"childrens":[{"id":"entrySection_deleteRow","componentType":"com.kingdee.bos.ctrl.web.Button","parent":"entrySection_rowBtnPanel","parentEl":"entrySection_rowBtnPanel","properties":{"id":"entrySection_deleteRow","tagClass":"ui-icon-rowRemove","actionBinding":"deleteRow"},"events":{},"childrens":[]}]},"rowObject":{"id":"rowObject","parent":"entrySection","parentEl":"entrySection","properties":{},"childrens":[{"id":"entrySection_gridLayoutPanel","componentType":"com.kingdee.bos.ctrl.web.GridLayoutPanel","parent":"rowObject","parentEl":"rowObject","properties":{"id":"entrySection_gridLayoutPanel","cols":"1","rows":"1"},"events":{},"childrens":[{"id":"entrySection_gridLayoutPanel_0","componentType":"com.kingdee.bos.ctrl.web.GridLayoutCell","parent":"entrySection_gridLayoutPanel","parentEl":"entrySection_gridLayoutPanel","properties":{"id":"entrySection_gridLayoutPanel_0","startRow":1,"endRow":1,"startCol":1,"endCol":1},"events":{},"childrens":[{"id":"columnLayout8","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutPanel","parent":"entrySection_gridLayoutPanel_0","parentEl":"entrySection_gridLayoutPanel_0","properties":{"id":"columnLayout8","tagClass":"three
    entry","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBillEntry"},"events":{},"childrens":[{"id":"layoutColumn18","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout8","parentEl":"columnLayout8","properties":{"id":"layoutColumn18","tagClass":"span4
    nocurrency"},"events":{},"childrens":[{"id":"labellayoutColumn18_expenseType","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn18","parentEl":"layoutColumn18","properties":{"id":"labellayoutColumn18_expenseType","caption":"费用类型","labelWidth":70,"labelPosition":"left","tagClass":"expenseType","labelAlign":"right"},"events":{},"childrens":[{"id":"layoutColumn18_expenseType","componentType":"com.kingdee.bos.ctrl.web.PromptBox","field":"expenseType","parent":"labellayoutColumn18_expenseType","parentEl":"labellayoutColumn18_expenseType","properties":{"id":"layoutColumn18_expenseType","F7Type":"F7Iframe","title":"费用类型","labelWidth":70,"req":true,"labelPosition":"left","label_tagClass":"expenseType","labelAlign":"right","F7Iframe_url":"/cp/bc/dynamic/expenseTypeTreeListPage.do?method=initalize&billType=DailyLoanBill","F7Iframe_height":485,"F7Iframe_width":650,"F7Iframe_closeOnEscape":true,"F7Iframe_draggable":true,"F7Iframe_showType":"window","F7Iframe_resizable":true,"validator_rules":"required:true","validator_errMsg":"required:'费用类型不能为空。'","name":"expenseType"},"events":{},"childrens":[]}]}]},{"id":"layoutColumn19","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout8","parentEl":"columnLayout8","properties":{"id":"layoutColumn19","tagClass":"span4
    currency
    center"},"events":{},"childrens":[{"id":"labellayoutColumn19_currencyType","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn19","parentEl":"layoutColumn19","properties":{"id":"labellayoutColumn19_currencyType","caption":"币别","labelWidth":75,"labelPosition":"left","tagClass":"currency","labelAlign":"right"},"events":{},"childrens":[{"id":"layoutColumn19_currencyType","componentType":"com.kingdee.bos.ctrl.web.PromptBox","field":"currencyType","parent":"labellayoutColumn19_currencyType","parentEl":"labellayoutColumn19_currencyType","properties":{"id":"layoutColumn19_currencyType","F7Type":"F7Quick","title":"币别","labelWidth":75,"req":true,"labelPosition":"left","label_tagClass":"currency","labelAlign":"right","F7Quick_query":"com.kingdee.eas.basedata.assistant.app.CurrencyQuery","F7Quick_cu":true,"F7Quick_allowAutoComplete":true,"F7Quick_autoChoose":false,"F7Quick_autoCompleteItem":"number,name","F7Quick_width":400,"validator_rules":"required:true","validator_errMsg":"required:'币别不能为空。'","name":"currencyType"},"events":{},"childrens":[]}]}]},{"id":"layoutColumn20","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout8","parentEl":"columnLayout8","properties":{"id":"layoutColumn20","tagClass":"span4
    currency
    right"},"events":{},"childrens":[{"id":"labellayoutColumn20_exchangeRate","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn20","parentEl":"layoutColumn20","properties":{"id":"labellayoutColumn20_exchangeRate","caption":"汇率","labelWidth":75,"labelPosition":"left","tagClass":"currency","labelAlign":"right"},"events":{},"childrens":[{"id":"layoutColumn20_exchangeRate","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"exchangeRate","parent":"labellayoutColumn20_exchangeRate","parentEl":"labellayoutColumn20_exchangeRate","properties":{"id":"layoutColumn20_exchangeRate","title":"汇率","labelWidth":75,"req":true,"labelPosition":"left","label_tagClass":"currency","labelAlign":"right","allowNegative":true,"decimalPrecision":4,"validator_rules":"required:true","validator_errMsg":"required:'汇率不能为空。'","name":"exchangeRate"},"events":{},"childrens":[]}]}]},{"id":"layoutColumn26","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout8","parentEl":"columnLayout8","properties":{"id":"layoutColumn26","tagClass":"span4
    nocurrency"},"events":{},"childrens":[{"id":"labellayoutColumn18_amountOri","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn26","parentEl":"layoutColumn26","properties":{"id":"labellayoutColumn18_amountOri","caption":"借款金额","labelWidth":70,"labelPosition":"left","tagClass":"amount","labelAlign":"right"},"events":{},"childrens":[{"id":"layoutColumn18_amountOri","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"amountOri","parent":"labellayoutColumn18_amountOri","parentEl":"labellayoutColumn18_amountOri","properties":{"id":"layoutColumn18_amountOri","title":"借款金额","labelWidth":70,"req":true,"validator_errorLabelPosition":"bottom","validator_errorShowMode":"embeded","validator_validatetrigger":"focus","validator_customvalidate":"_self.validateAmount","labelPosition":"left","label_tagClass":"amount","labelAlign":"right","allowGroup":true,"allowNegative":false,"decimalPrecision":2,"validator_rules":"required:true","validator_errMsg":"required:'金额原币不能为空。'","name":"amountOri"},"events":{},"childrens":[]}]}]},{"id":"layoutColumn27","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout8","parentEl":"columnLayout8","properties":{"id":"layoutColumn27","tagClass":"span4
    currency center
    amount"},"events":{},"childrens":[{"id":"labellayoutColumn19_amount","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn27","parentEl":"layoutColumn27","properties":{"id":"labellayoutColumn19_amount","caption":"本位币金额","labelWidth":75,"labelPosition":"left","tagClass":"currency","labelAlign":"right"},"events":{},"childrens":[{"id":"layoutColumn19_amount","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"amount","parent":"labellayoutColumn19_amount","parentEl":"labellayoutColumn19_amount","properties":{"id":"layoutColumn19_amount","title":"本位币金额","labelWidth":75,"req":true,"readonly":true,"labelPosition":"left","label_tagClass":"currency","labelAlign":"right","allowGroup":true,"allowNegative":true,"decimalPrecision":2,"validator_rules":"required:true","validator_errMsg":"required:'金额不能为空。'","name":"amount"},"events":{},"childrens":[]}]}]},{"id":"layoutColumn21","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout8","parentEl":"columnLayout8","properties":{"id":"layoutColumn21","tagClass":"span12"},"events":{},"childrens":[{"id":"labellayoutColumn21_purpose","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn21","parentEl":"layoutColumn21","properties":{"id":"labellayoutColumn21_purpose","caption":"借款用途","labelWidth":70,"labelPosition":"left","tagClass":"colspan","labelAlign":"right"},"events":{},"childrens":[{"id":"layoutColumn21_purpose","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"purpose","parent":"labellayoutColumn21_purpose","parentEl":"labellayoutColumn21_purpose","properties":{"id":"layoutColumn21_purpose","title":"借款用途","labelWidth":70,"req":true,"labelPosition":"left","label_tagClass":"colspan","labelAlign":"right","validator_rules":"required:true","validator_errMsg":"required:'用途不能为空。'","name":"purpose"},"events":{},"childrens":[]}]},{"id":"webTextField11","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"bgData","parent":"layoutColumn21","parentEl":"layoutColumn21","properties":{"id":"webTextField11","hidden":true,"readonly":true,"dsTl":false,"style":"background:transparent;border:none;color:#08C;width:100%;","tagClass":"removeFocusTab","labelPosition":"left","name":"bgData"},"events":{},"childrens":[]}]}]}]}]}]}}]},"seq":true,"colModel":[{"meta":{"id":"layoutColumn18_expenseType","componentType":"com.kingdee.bos.ctrl.web.PromptBox","field":"expenseType","parent":"labellayoutColumn18_expenseType","parentEl":"labellayoutColumn18_expenseType","properties":{"id":"layoutColumn18_expenseType","F7Type":"F7Iframe","title":"费用类型","labelWidth":70,"req":true,"labelPosition":"left","label_tagClass":"expenseType","labelAlign":"right","F7Iframe_url":"/cp/bc/dynamic/expenseTypeTreeListPage.do?method=initalize&billType=DailyLoanBill","F7Iframe_height":485,"F7Iframe_width":650,"F7Iframe_closeOnEscape":true,"F7Iframe_draggable":true,"F7Iframe_showType":"window","F7Iframe_resizable":true,"validator_rules":"required:true","validator_errMsg":"required:'费用类型不能为空。'","name":"expenseType"},"events":{},"childrens":[]},"build":{"componentType":"promptBox"}},{"meta":{"id":"layoutColumn19_currencyType","componentType":"com.kingdee.bos.ctrl.web.PromptBox","field":"currencyType","parent":"labellayoutColumn19_currencyType","parentEl":"labellayoutColumn19_currencyType","properties":{"id":"layoutColumn19_currencyType","F7Type":"F7Quick","title":"币别","labelWidth":75,"req":true,"labelPosition":"left","label_tagClass":"currency","labelAlign":"right","F7Quick_query":"com.kingdee.eas.basedata.assistant.app.CurrencyQuery","F7Quick_cu":true,"F7Quick_allowAutoComplete":true,"F7Quick_autoChoose":false,"F7Quick_autoCompleteItem":"number,name","F7Quick_width":400,"validator_rules":"required:true","validator_errMsg":"required:'币别不能为空。'","name":"currencyType"},"events":{},"childrens":[]},"build":{"componentType":"promptBox"}},{"meta":{"id":"layoutColumn20_exchangeRate","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"exchangeRate","parent":"labellayoutColumn20_exchangeRate","parentEl":"labellayoutColumn20_exchangeRate","properties":{"id":"layoutColumn20_exchangeRate","title":"汇率","labelWidth":75,"req":true,"labelPosition":"left","label_tagClass":"currency","labelAlign":"right","allowNegative":true,"decimalPrecision":4,"validator_rules":"required:true","validator_errMsg":"required:'汇率不能为空。'","name":"exchangeRate"},"events":{},"childrens":[]},"build":{"componentType":"numberField"}},{"meta":{"id":"layoutColumn18_amountOri","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"amountOri","parent":"labellayoutColumn18_amountOri","parentEl":"labellayoutColumn18_amountOri","properties":{"id":"layoutColumn18_amountOri","title":"借款金额","labelWidth":70,"req":true,"validator_errorLabelPosition":"bottom","validator_errorShowMode":"embeded","validator_validatetrigger":"focus","validator_customvalidate":"_self.validateAmount","labelPosition":"left","label_tagClass":"amount","labelAlign":"right","allowGroup":true,"allowNegative":false,"decimalPrecision":2,"validator_rules":"required:true","validator_errMsg":"required:'金额原币不能为空。'","name":"amountOri"},"events":{},"childrens":[]},"build":{"componentType":"numberField"}},{"meta":{"id":"layoutColumn19_amount","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"amount","parent":"labellayoutColumn19_amount","parentEl":"labellayoutColumn19_amount","properties":{"id":"layoutColumn19_amount","title":"本位币金额","labelWidth":75,"req":true,"readonly":true,"labelPosition":"left","label_tagClass":"currency","labelAlign":"right","allowGroup":true,"allowNegative":true,"decimalPrecision":2,"validator_rules":"required:true","validator_errMsg":"required:'金额不能为空。'","name":"amount"},"events":{},"childrens":[]},"build":{"componentType":"numberField"}},{"meta":{"id":"layoutColumn21_purpose","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"purpose","parent":"labellayoutColumn21_purpose","parentEl":"labellayoutColumn21_purpose","properties":{"id":"layoutColumn21_purpose","title":"借款用途","labelWidth":70,"req":true,"labelPosition":"left","label_tagClass":"colspan","labelAlign":"right","validator_rules":"required:true","validator_errMsg":"required:'用途不能为空。'","name":"purpose"},"events":{},"childrens":[]},"build":{"componentType":"text"}},{"meta":{"id":"webTextField11","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"bgData","parent":"layoutColumn21","parentEl":"layoutColumn21","properties":{"id":"webTextField11","hidden":true,"readonly":true,"dsTl":false,"style":"background:transparent;border:none;color:#08C;width:100%;","tagClass":"removeFocusTab","labelPosition":"left","name":"bgData"},"events":{},"childrens":[]},"build":{"componentType":"text"}}],"rowButtonIds":[],"metadata":{"buttonPanelMeta":{"id":"entrySection_btnPanel","componentType":"com.kingdee.bos.ctrl.web.btnPanel","parent":"entrySection","parentEl":"entrySection","properties":{"id":"entrySection_btnPanel"},"events":{},"childrens":[]},"rowButtonPanelMeta":{"id":"entrySection_rowBtnPanel","componentType":"com.kingdee.bos.ctrl.web.rowBtnPanel","parent":"entrySection","parentEl":"entrySection","properties":{"id":"entrySection_rowBtnPanel"},"events":{},"childrens":[{"id":"entrySection_deleteRow","componentType":"com.kingdee.bos.ctrl.web.Button","parent":"entrySection_rowBtnPanel","parentEl":"entrySection_rowBtnPanel","properties":{"id":"entrySection_deleteRow","tagClass":"ui-icon-rowRemove","actionBinding":"deleteRow"},"events":{},"childrens":[]}]},"rowObjectMeta":{"id":"rowObject","parent":"entrySection","parentEl":"entrySection","properties":{},"childrens":[{"id":"entrySection_gridLayoutPanel","componentType":"com.kingdee.bos.ctrl.web.GridLayoutPanel","parent":"rowObject","parentEl":"rowObject","properties":{"id":"entrySection_gridLayoutPanel","cols":"1","rows":"1"},"events":{},"childrens":[{"id":"entrySection_gridLayoutPanel_0","componentType":"com.kingdee.bos.ctrl.web.GridLayoutCell","parent":"entrySection_gridLayoutPanel","parentEl":"entrySection_gridLayoutPanel","properties":{"id":"entrySection_gridLayoutPanel_0","startRow":1,"endRow":1,"startCol":1,"endCol":1},"events":{},"childrens":[{"id":"columnLayout8","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutPanel","parent":"entrySection_gridLayoutPanel_0","parentEl":"entrySection_gridLayoutPanel_0","properties":{"id":"columnLayout8","tagClass":"three
    entry","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBillEntry"},"events":{},"childrens":[{"id":"layoutColumn18","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout8","parentEl":"columnLayout8","properties":{"id":"layoutColumn18","tagClass":"span4
    nocurrency"},"events":{},"childrens":[{"id":"labellayoutColumn18_expenseType","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn18","parentEl":"layoutColumn18","properties":{"id":"labellayoutColumn18_expenseType","caption":"费用类型","labelWidth":70,"labelPosition":"left","tagClass":"expenseType","labelAlign":"right"},"events":{},"childrens":[{"id":"layoutColumn18_expenseType","componentType":"com.kingdee.bos.ctrl.web.PromptBox","field":"expenseType","parent":"labellayoutColumn18_expenseType","parentEl":"labellayoutColumn18_expenseType","properties":{"id":"layoutColumn18_expenseType","F7Type":"F7Iframe","title":"费用类型","labelWidth":70,"req":true,"labelPosition":"left","label_tagClass":"expenseType","labelAlign":"right","F7Iframe_url":"/cp/bc/dynamic/expenseTypeTreeListPage.do?method=initalize&billType=DailyLoanBill","F7Iframe_height":485,"F7Iframe_width":650,"F7Iframe_closeOnEscape":true,"F7Iframe_draggable":true,"F7Iframe_showType":"window","F7Iframe_resizable":true,"validator_rules":"required:true","validator_errMsg":"required:'费用类型不能为空。'","name":"expenseType"},"events":{},"childrens":[]}]}]},{"id":"layoutColumn19","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout8","parentEl":"columnLayout8","properties":{"id":"layoutColumn19","tagClass":"span4
    currency
    center"},"events":{},"childrens":[{"id":"labellayoutColumn19_currencyType","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn19","parentEl":"layoutColumn19","properties":{"id":"labellayoutColumn19_currencyType","caption":"币别","labelWidth":75,"labelPosition":"left","tagClass":"currency","labelAlign":"right"},"events":{},"childrens":[{"id":"layoutColumn19_currencyType","componentType":"com.kingdee.bos.ctrl.web.PromptBox","field":"currencyType","parent":"labellayoutColumn19_currencyType","parentEl":"labellayoutColumn19_currencyType","properties":{"id":"layoutColumn19_currencyType","F7Type":"F7Quick","title":"币别","labelWidth":75,"req":true,"labelPosition":"left","label_tagClass":"currency","labelAlign":"right","F7Quick_query":"com.kingdee.eas.basedata.assistant.app.CurrencyQuery","F7Quick_cu":true,"F7Quick_allowAutoComplete":true,"F7Quick_autoChoose":false,"F7Quick_autoCompleteItem":"number,name","F7Quick_width":400,"validator_rules":"required:true","validator_errMsg":"required:'币别不能为空。'","name":"currencyType"},"events":{},"childrens":[]}]}]},{"id":"layoutColumn20","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout8","parentEl":"columnLayout8","properties":{"id":"layoutColumn20","tagClass":"span4
    currency
    right"},"events":{},"childrens":[{"id":"labellayoutColumn20_exchangeRate","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn20","parentEl":"layoutColumn20","properties":{"id":"labellayoutColumn20_exchangeRate","caption":"汇率","labelWidth":75,"labelPosition":"left","tagClass":"currency","labelAlign":"right"},"events":{},"childrens":[{"id":"layoutColumn20_exchangeRate","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"exchangeRate","parent":"labellayoutColumn20_exchangeRate","parentEl":"labellayoutColumn20_exchangeRate","properties":{"id":"layoutColumn20_exchangeRate","title":"汇率","labelWidth":75,"req":true,"labelPosition":"left","label_tagClass":"currency","labelAlign":"right","allowNegative":true,"decimalPrecision":4,"validator_rules":"required:true","validator_errMsg":"required:'汇率不能为空。'","name":"exchangeRate"},"events":{},"childrens":[]}]}]},{"id":"layoutColumn26","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout8","parentEl":"columnLayout8","properties":{"id":"layoutColumn26","tagClass":"span4
    nocurrency"},"events":{},"childrens":[{"id":"labellayoutColumn18_amountOri","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn26","parentEl":"layoutColumn26","properties":{"id":"labellayoutColumn18_amountOri","caption":"借款金额","labelWidth":70,"labelPosition":"left","tagClass":"amount","labelAlign":"right"},"events":{},"childrens":[{"id":"layoutColumn18_amountOri","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"amountOri","parent":"labellayoutColumn18_amountOri","parentEl":"labellayoutColumn18_amountOri","properties":{"id":"layoutColumn18_amountOri","title":"借款金额","labelWidth":70,"req":true,"validator_errorLabelPosition":"bottom","validator_errorShowMode":"embeded","validator_validatetrigger":"focus","validator_customvalidate":"_self.validateAmount","labelPosition":"left","label_tagClass":"amount","labelAlign":"right","allowGroup":true,"allowNegative":false,"decimalPrecision":2,"validator_rules":"required:true","validator_errMsg":"required:'金额原币不能为空。'","name":"amountOri"},"events":{},"childrens":[]}]}]},{"id":"layoutColumn27","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout8","parentEl":"columnLayout8","properties":{"id":"layoutColumn27","tagClass":"span4
    currency center
    amount"},"events":{},"childrens":[{"id":"labellayoutColumn19_amount","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn27","parentEl":"layoutColumn27","properties":{"id":"labellayoutColumn19_amount","caption":"本位币金额","labelWidth":75,"labelPosition":"left","tagClass":"currency","labelAlign":"right"},"events":{},"childrens":[{"id":"layoutColumn19_amount","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"amount","parent":"labellayoutColumn19_amount","parentEl":"labellayoutColumn19_amount","properties":{"id":"layoutColumn19_amount","title":"本位币金额","labelWidth":75,"req":true,"readonly":true,"labelPosition":"left","label_tagClass":"currency","labelAlign":"right","allowGroup":true,"allowNegative":true,"decimalPrecision":2,"validator_rules":"required:true","validator_errMsg":"required:'金额不能为空。'","name":"amount"},"events":{},"childrens":[]}]}]},{"id":"layoutColumn21","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout8","parentEl":"columnLayout8","properties":{"id":"layoutColumn21","tagClass":"span12"},"events":{},"childrens":[{"id":"labellayoutColumn21_purpose","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn21","parentEl":"layoutColumn21","properties":{"id":"labellayoutColumn21_purpose","caption":"借款用途","labelWidth":70,"labelPosition":"left","tagClass":"colspan","labelAlign":"right"},"events":{},"childrens":[{"id":"layoutColumn21_purpose","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"purpose","parent":"labellayoutColumn21_purpose","parentEl":"labellayoutColumn21_purpose","properties":{"id":"layoutColumn21_purpose","title":"借款用途","labelWidth":70,"req":true,"labelPosition":"left","label_tagClass":"colspan","labelAlign":"right","validator_rules":"required:true","validator_errMsg":"required:'用途不能为空。'","name":"purpose"},"events":{},"childrens":[]}]},{"id":"webTextField11","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"bgData","parent":"layoutColumn21","parentEl":"layoutColumn21","properties":{"id":"webTextField11","hidden":true,"readonly":true,"dsTl":false,"style":"background:transparent;border:none;color:#08C;width:100%;","tagClass":"removeFocusTab","labelPosition":"left","name":"bgData"},"events":{},"childrens":[]}]}]}]}]}]}},"hasParsed":true,"rowTemplate":"#entrySection_template"},"id":"entrySection"},{"type":"panel","option":{"id":"columnLayout14","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBill","layout":"column"},"id":"columnLayout14"},{"type":"column","option":{"id":"layoutColumn73","style":"text-align:right;"},"id":"layoutColumn73"},{"type":"labelContainer","option":{"id":"labelsection3_amount","hidden":"true","caption":"合计金额：","labelPosition":"left","tagClass":"amountContainer"},"id":"labelsection3_amount"},{"type":"numberField","option":{"id":"section3_amount","title":"合计金额：","hidden":true,"disabled":true,"readonly":true,"style":"background:transparent;border:none;width:130px;font-weight:
    bold;color:
    #ff9600;text-align:left;","labelPosition":"left","label_tagClass":"amountContainer","allowGroup":true,"allowNegative":true,"decimalPrecision":2,"name":"amount"},"id":"section3_amount"},{"type":"text","option":{"id":"amountText","dsTl":false,"style":"background:transparent;border:none;width:130px;font-weight:
    bold;color:
    #ff9600;text-align:right;width:100%;padding-right:3px;","tagClass":"removeFocusTab","labelPosition":"left","displayField":"#amountText_view"},"id":"amountText"},{"type":"linkButton","option":{"id":"entrySection_appendRow","caption":"新增借款明细","style":"z-index:10;","tagClass":"btn","iconCls":"f-icon-plus","actionBinding":"appendRowAction"},"id":"entrySection_appendRow"},{"type":"section","option":{"id":"section4","title":"关联申请","rows":1,"cols":1,"entryObjectName":"借款单","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBill"},"id":"section4"},{"type":"infoBlock","option":{"id":"entrySection1","entryObjectName":"申请核销表","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBillReqCheckEntry","dataBind":"ReqCheckEntries","entryProp":"ReqCheckEntries","rows":1,"cols":1,"rowMeta":{"id":"entrySection1","componentType":"com.kingdee.bos.ctrl.web.InfoBlock","parent":"section4_gridLayoutPanel_0","parentEl":"section4_gridLayoutPanel_0","properties":{},"events":{},"childrens":[{"buttonPanel":{"id":"entrySection1_btnPanel","componentType":"com.kingdee.bos.ctrl.web.btnPanel","parent":"entrySection1","parentEl":"entrySection1","properties":{"id":"entrySection1_btnPanel"},"events":{},"childrens":[]},"rowButtonPanel":{"id":"entrySection1_rowBtnPanel","componentType":"com.kingdee.bos.ctrl.web.rowBtnPanel","parent":"entrySection1","parentEl":"entrySection1","properties":{"id":"entrySection1_rowBtnPanel"},"events":{},"childrens":[{"id":"entrySection1_deleteRow","componentType":"com.kingdee.bos.ctrl.web.Button","parent":"entrySection1_rowBtnPanel","parentEl":"entrySection1_rowBtnPanel","properties":{"id":"entrySection1_deleteRow","tagClass":"ui-icon-rowRemove","actionBinding":"deleteReqRow"},"events":{},"childrens":[]}]},"rowObject":{"id":"rowObject","parent":"entrySection1","parentEl":"entrySection1","properties":{},"childrens":[{"id":"entrySection1_gridLayoutPanel","componentType":"com.kingdee.bos.ctrl.web.GridLayoutPanel","parent":"rowObject","parentEl":"rowObject","properties":{"id":"entrySection1_gridLayoutPanel","cols":"1","rows":"1"},"events":{},"childrens":[{"id":"entrySection1_gridLayoutPanel_0","componentType":"com.kingdee.bos.ctrl.web.GridLayoutCell","parent":"entrySection1_gridLayoutPanel","parentEl":"entrySection1_gridLayoutPanel","properties":{"id":"entrySection1_gridLayoutPanel_0","startRow":1,"endRow":1,"startCol":1,"endCol":1},"events":{},"childrens":[{"id":"columnLayout9","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutPanel","parent":"entrySection1_gridLayoutPanel_0","parentEl":"entrySection1_gridLayoutPanel_0","properties":{"id":"columnLayout9","tagClass":"three","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBillReqCheckEntry"},"events":{},"childrens":[{"id":"layoutColumn22","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout9","parentEl":"columnLayout9","properties":{"id":"layoutColumn22","tagClass":"span4"},"events":{},"childrens":[{"id":"labellayoutColumn22_sourceBillNumber","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn22","parentEl":"layoutColumn22","properties":{"id":"labellayoutColumn22_sourceBillNumber","caption":"单据编码","labelWidth":70,"labelPosition":"left","labelAlign":"right"},"events":{},"childrens":[{"id":"layoutColumn22_sourceBillNumber","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillNumber","parent":"labellayoutColumn22_sourceBillNumber","parentEl":"labellayoutColumn22_sourceBillNumber","properties":{"id":"layoutColumn22_sourceBillNumber","title":"单据编码","labelWidth":70,"disabled":true,"readonly":true,"labelPosition":"left","labelAlign":"right","name":"sourceBillNumber"},"events":{},"childrens":[]}]},{"id":"labellayoutColumn22_sourceBillOperationType","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn22","parentEl":"layoutColumn22","properties":{"id":"labellayoutColumn22_sourceBillOperationType","hidden":"true","caption":"源单业务类别","labelPosition":"left"},"events":{},"childrens":[{"id":"layoutColumn22_sourceBillOperationType","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillOperationType","parent":"labellayoutColumn22_sourceBillOperationType","parentEl":"labellayoutColumn22_sourceBillOperationType","properties":{"id":"layoutColumn22_sourceBillOperationType","title":"源单业务类别","hidden":true,"disabled":true,"labelPosition":"left","name":"sourceBillOperationType"},"events":{},"childrens":[]}]},{"id":"labellayoutColumn22_sourceBillID","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn22","parentEl":"layoutColumn22","properties":{"id":"labellayoutColumn22_sourceBillID","hidden":"true","caption":"源单据id","labelPosition":"left"},"events":{},"childrens":[{"id":"layoutColumn22_sourceBillID","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillID","parent":"labellayoutColumn22_sourceBillID","parentEl":"labellayoutColumn22_sourceBillID","properties":{"id":"layoutColumn22_sourceBillID","title":"源单据id","hidden":true,"disabled":true,"labelPosition":"left","name":"sourceBillID"},"events":{},"childrens":[]}]},{"id":"labellayoutColumn22_sourceBillAmountUsed","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn22","parentEl":"layoutColumn22","properties":{"id":"labellayoutColumn22_sourceBillAmountUsed","hidden":"true","caption":"源单据分录已用金额","labelPosition":"left"},"events":{},"childrens":[{"id":"layoutColumn22_sourceBillAmountUsed","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"sourceBillAmountUsed","parent":"labellayoutColumn22_sourceBillAmountUsed","parentEl":"labellayoutColumn22_sourceBillAmountUsed","properties":{"id":"layoutColumn22_sourceBillAmountUsed","title":"源单据分录已用金额","hidden":true,"disabled":true,"labelPosition":"left","allowNegative":true,"decimalPrecision":2,"name":"sourceBillAmountUsed"},"events":{},"childrens":[]}]}]},{"id":"layoutColumn23","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout9","parentEl":"columnLayout9","properties":{"id":"layoutColumn23","tagClass":"span4
    center"},"events":{},"childrens":[{"id":"labellayoutColumn23_sourceBillExpenseType","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn23","parentEl":"layoutColumn23","properties":{"id":"labellayoutColumn23_sourceBillExpenseType","caption":"费用类型","labelWidth":70,"labelPosition":"left","labelAlign":"right"},"events":{},"childrens":[{"id":"layoutColumn23_sourceBillExpenseType","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillExpenseType","parent":"labellayoutColumn23_sourceBillExpenseType","parentEl":"labellayoutColumn23_sourceBillExpenseType","properties":{"id":"layoutColumn23_sourceBillExpenseType","title":"费用类型","labelWidth":70,"disabled":true,"readonly":true,"labelPosition":"left","labelAlign":"right","name":"sourceBillExpenseType"},"events":{},"childrens":[]}]},{"id":"labellayoutColumn23_sourceBillCause","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn23","parentEl":"layoutColumn23","properties":{"id":"labellayoutColumn23_sourceBillCause","hidden":"true","caption":"源单据事由","labelPosition":"left"},"events":{},"childrens":[{"id":"layoutColumn23_sourceBillCause","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillCause","parent":"labellayoutColumn23_sourceBillCause","parentEl":"labellayoutColumn23_sourceBillCause","properties":{"id":"layoutColumn23_sourceBillCause","title":"源单据事由","hidden":true,"disabled":true,"labelPosition":"left","name":"sourceBillCause"},"events":{},"childrens":[]}]},{"id":"labellayoutColumn23_sourceBillAmountApproved","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn23","parentEl":"layoutColumn23","properties":{"id":"labellayoutColumn23_sourceBillAmountApproved","hidden":"true","caption":"源单据核定总金额","labelPosition":"left"},"events":{},"childrens":[{"id":"layoutColumn23_sourceBillAmountApproved","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"sourceBillAmountApproved","parent":"labellayoutColumn23_sourceBillAmountApproved","parentEl":"labellayoutColumn23_sourceBillAmountApproved","properties":{"id":"layoutColumn23_sourceBillAmountApproved","title":"源单据核定总金额","hidden":true,"disabled":true,"labelPosition":"left","allowNegative":true,"decimalPrecision":2,"name":"sourceBillAmountApproved"},"events":{},"childrens":[]}]},{"id":"labellayoutColumn23_sourceBillEntryID","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn23","parentEl":"layoutColumn23","properties":{"id":"labellayoutColumn23_sourceBillEntryID","hidden":"true","caption":"源单据分录id","labelPosition":"left"},"events":{},"childrens":[{"id":"layoutColumn23_sourceBillEntryID","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillEntryID","parent":"labellayoutColumn23_sourceBillEntryID","parentEl":"labellayoutColumn23_sourceBillEntryID","properties":{"id":"layoutColumn23_sourceBillEntryID","title":"源单据分录id","hidden":true,"disabled":true,"labelPosition":"left","name":"sourceBillEntryID"},"events":{},"childrens":[]}]}]},{"id":"layoutColumn24","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout9","parentEl":"columnLayout9","properties":{"id":"layoutColumn24","tagClass":"span4
    right"},"events":{},"childrens":[{"id":"labellayoutColumn24_checkAmount","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn24","parentEl":"layoutColumn24","properties":{"id":"labellayoutColumn24_checkAmount","caption":"核销金额","labelWidth":70,"labelPosition":"left","labelAlign":"right"},"events":{},"childrens":[{"id":"layoutColumn24_checkAmount","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"checkAmount","parent":"labellayoutColumn24_checkAmount","parentEl":"labellayoutColumn24_checkAmount","properties":{"id":"layoutColumn24_checkAmount","title":"核销金额","labelWidth":70,"labelPosition":"left","labelAlign":"right","allowGroup":true,"allowNegative":false,"decimalPrecision":2,"name":"checkAmount"},"events":{},"childrens":[]}]},{"id":"labellayoutColumn24_sourceBillDate","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn24","parentEl":"layoutColumn24","properties":{"id":"labellayoutColumn24_sourceBillDate","hidden":"true","caption":"源单据业务日期","labelPosition":"left"},"events":{},"childrens":[{"id":"layoutColumn24_sourceBillDate","componentType":"com.kingdee.bos.ctrl.web.DateField","field":"sourceBillDate","parent":"labellayoutColumn24_sourceBillDate","parentEl":"labellayoutColumn24_sourceBillDate","properties":{"id":"layoutColumn24_sourceBillDate","title":"源单据业务日期","hidden":true,"disabled":true,"labelPosition":"left","name":"sourceBillDate"},"events":{},"childrens":[]}]},{"id":"labellayoutColumn24_sourceBillAmountBalance","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn24","parentEl":"layoutColumn24","properties":{"id":"labellayoutColumn24_sourceBillAmountBalance","hidden":"true","caption":"源单据分录可用余额","labelPosition":"left"},"events":{},"childrens":[{"id":"layoutColumn24_sourceBillAmountBalance","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"sourceBillAmountBalance","parent":"labellayoutColumn24_sourceBillAmountBalance","parentEl":"labellayoutColumn24_sourceBillAmountBalance","properties":{"id":"layoutColumn24_sourceBillAmountBalance","title":"源单据分录可用余额","hidden":true,"disabled":true,"labelPosition":"left","allowNegative":true,"decimalPrecision":2,"name":"sourceBillAmountBalance"},"events":{},"childrens":[]}]},{"id":"labellayoutColumn24_hasSourceBill","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn24","parentEl":"layoutColumn24","properties":{"id":"labellayoutColumn24_hasSourceBill","hidden":"true","caption":"是否有源单","labelPosition":"left"},"events":{},"childrens":[{"id":"layoutColumn24_hasSourceBill","componentType":"com.kingdee.bos.ctrl.web.CheckBox","field":"hasSourceBill","parent":"labellayoutColumn24_hasSourceBill","parentEl":"labellayoutColumn24_hasSourceBill","properties":{"id":"layoutColumn24_hasSourceBill","title":"是否有源单","hidden":true,"disabled":true,"labelPosition":"left","name":"hasSourceBill"},"events":{},"childrens":[]}]}]},{"id":"layoutColumn25","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout9","parentEl":"columnLayout9","properties":{"id":"layoutColumn25"},"events":{},"childrens":[{"id":"webTextField37","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillData","parent":"layoutColumn25","parentEl":"layoutColumn25","properties":{"id":"webTextField37","readonly":true,"dsTl":false,"style":"background:transparent;border:none;color:#08C;width:100%;","tagClass":"removeFocusTab","labelPosition":"left","label_tagClass":"colspan","name":"sourceBillData"},"events":{},"childrens":[]}]}]}]}]}]}}]},"seq":true,"colModel":[{"meta":{"id":"layoutColumn22_sourceBillNumber","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillNumber","parent":"labellayoutColumn22_sourceBillNumber","parentEl":"labellayoutColumn22_sourceBillNumber","properties":{"id":"layoutColumn22_sourceBillNumber","title":"单据编码","labelWidth":70,"disabled":true,"readonly":true,"labelPosition":"left","labelAlign":"right","name":"sourceBillNumber"},"events":{},"childrens":[]},"build":{"componentType":"text"}},{"meta":{"id":"layoutColumn22_sourceBillOperationType","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillOperationType","parent":"labellayoutColumn22_sourceBillOperationType","parentEl":"labellayoutColumn22_sourceBillOperationType","properties":{"id":"layoutColumn22_sourceBillOperationType","title":"源单业务类别","hidden":true,"disabled":true,"labelPosition":"left","name":"sourceBillOperationType"},"events":{},"childrens":[]},"build":{"componentType":"text"}},{"meta":{"id":"layoutColumn22_sourceBillID","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillID","parent":"labellayoutColumn22_sourceBillID","parentEl":"labellayoutColumn22_sourceBillID","properties":{"id":"layoutColumn22_sourceBillID","title":"源单据id","hidden":true,"disabled":true,"labelPosition":"left","name":"sourceBillID"},"events":{},"childrens":[]},"build":{"componentType":"text"}},{"meta":{"id":"layoutColumn22_sourceBillAmountUsed","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"sourceBillAmountUsed","parent":"labellayoutColumn22_sourceBillAmountUsed","parentEl":"labellayoutColumn22_sourceBillAmountUsed","properties":{"id":"layoutColumn22_sourceBillAmountUsed","title":"源单据分录已用金额","hidden":true,"disabled":true,"labelPosition":"left","allowNegative":true,"decimalPrecision":2,"name":"sourceBillAmountUsed"},"events":{},"childrens":[]},"build":{"componentType":"numberField"}},{"meta":{"id":"layoutColumn23_sourceBillExpenseType","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillExpenseType","parent":"labellayoutColumn23_sourceBillExpenseType","parentEl":"labellayoutColumn23_sourceBillExpenseType","properties":{"id":"layoutColumn23_sourceBillExpenseType","title":"费用类型","labelWidth":70,"disabled":true,"readonly":true,"labelPosition":"left","labelAlign":"right","name":"sourceBillExpenseType"},"events":{},"childrens":[]},"build":{"componentType":"text"}},{"meta":{"id":"layoutColumn23_sourceBillCause","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillCause","parent":"labellayoutColumn23_sourceBillCause","parentEl":"labellayoutColumn23_sourceBillCause","properties":{"id":"layoutColumn23_sourceBillCause","title":"源单据事由","hidden":true,"disabled":true,"labelPosition":"left","name":"sourceBillCause"},"events":{},"childrens":[]},"build":{"componentType":"text"}},{"meta":{"id":"layoutColumn23_sourceBillAmountApproved","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"sourceBillAmountApproved","parent":"labellayoutColumn23_sourceBillAmountApproved","parentEl":"labellayoutColumn23_sourceBillAmountApproved","properties":{"id":"layoutColumn23_sourceBillAmountApproved","title":"源单据核定总金额","hidden":true,"disabled":true,"labelPosition":"left","allowNegative":true,"decimalPrecision":2,"name":"sourceBillAmountApproved"},"events":{},"childrens":[]},"build":{"componentType":"numberField"}},{"meta":{"id":"layoutColumn23_sourceBillEntryID","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillEntryID","parent":"labellayoutColumn23_sourceBillEntryID","parentEl":"labellayoutColumn23_sourceBillEntryID","properties":{"id":"layoutColumn23_sourceBillEntryID","title":"源单据分录id","hidden":true,"disabled":true,"labelPosition":"left","name":"sourceBillEntryID"},"events":{},"childrens":[]},"build":{"componentType":"text"}},{"meta":{"id":"layoutColumn24_checkAmount","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"checkAmount","parent":"labellayoutColumn24_checkAmount","parentEl":"labellayoutColumn24_checkAmount","properties":{"id":"layoutColumn24_checkAmount","title":"核销金额","labelWidth":70,"labelPosition":"left","labelAlign":"right","allowGroup":true,"allowNegative":false,"decimalPrecision":2,"name":"checkAmount"},"events":{},"childrens":[]},"build":{"componentType":"numberField"}},{"meta":{"id":"layoutColumn24_sourceBillDate","componentType":"com.kingdee.bos.ctrl.web.DateField","field":"sourceBillDate","parent":"labellayoutColumn24_sourceBillDate","parentEl":"labellayoutColumn24_sourceBillDate","properties":{"id":"layoutColumn24_sourceBillDate","title":"源单据业务日期","hidden":true,"disabled":true,"labelPosition":"left","name":"sourceBillDate"},"events":{},"childrens":[]},"build":{"componentType":"datePicker"}},{"meta":{"id":"layoutColumn24_sourceBillAmountBalance","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"sourceBillAmountBalance","parent":"labellayoutColumn24_sourceBillAmountBalance","parentEl":"labellayoutColumn24_sourceBillAmountBalance","properties":{"id":"layoutColumn24_sourceBillAmountBalance","title":"源单据分录可用余额","hidden":true,"disabled":true,"labelPosition":"left","allowNegative":true,"decimalPrecision":2,"name":"sourceBillAmountBalance"},"events":{},"childrens":[]},"build":{"componentType":"numberField"}},{"meta":{"id":"layoutColumn24_hasSourceBill","componentType":"com.kingdee.bos.ctrl.web.CheckBox","field":"hasSourceBill","parent":"labellayoutColumn24_hasSourceBill","parentEl":"labellayoutColumn24_hasSourceBill","properties":{"id":"layoutColumn24_hasSourceBill","title":"是否有源单","hidden":true,"disabled":true,"labelPosition":"left","name":"hasSourceBill"},"events":{},"childrens":[]},"build":{"componentType":"checkbox"}},{"meta":{"id":"webTextField37","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillData","parent":"layoutColumn25","parentEl":"layoutColumn25","properties":{"id":"webTextField37","readonly":true,"dsTl":false,"style":"background:transparent;border:none;color:#08C;width:100%;","tagClass":"removeFocusTab","labelPosition":"left","label_tagClass":"colspan","name":"sourceBillData"},"events":{},"childrens":[]},"build":{"componentType":"text"}}],"rowButtonIds":[],"metadata":{"buttonPanelMeta":{"id":"entrySection1_btnPanel","componentType":"com.kingdee.bos.ctrl.web.btnPanel","parent":"entrySection1","parentEl":"entrySection1","properties":{"id":"entrySection1_btnPanel"},"events":{},"childrens":[]},"rowButtonPanelMeta":{"id":"entrySection1_rowBtnPanel","componentType":"com.kingdee.bos.ctrl.web.rowBtnPanel","parent":"entrySection1","parentEl":"entrySection1","properties":{"id":"entrySection1_rowBtnPanel"},"events":{},"childrens":[{"id":"entrySection1_deleteRow","componentType":"com.kingdee.bos.ctrl.web.Button","parent":"entrySection1_rowBtnPanel","parentEl":"entrySection1_rowBtnPanel","properties":{"id":"entrySection1_deleteRow","tagClass":"ui-icon-rowRemove","actionBinding":"deleteReqRow"},"events":{},"childrens":[]}]},"rowObjectMeta":{"id":"rowObject","parent":"entrySection1","parentEl":"entrySection1","properties":{},"childrens":[{"id":"entrySection1_gridLayoutPanel","componentType":"com.kingdee.bos.ctrl.web.GridLayoutPanel","parent":"rowObject","parentEl":"rowObject","properties":{"id":"entrySection1_gridLayoutPanel","cols":"1","rows":"1"},"events":{},"childrens":[{"id":"entrySection1_gridLayoutPanel_0","componentType":"com.kingdee.bos.ctrl.web.GridLayoutCell","parent":"entrySection1_gridLayoutPanel","parentEl":"entrySection1_gridLayoutPanel","properties":{"id":"entrySection1_gridLayoutPanel_0","startRow":1,"endRow":1,"startCol":1,"endCol":1},"events":{},"childrens":[{"id":"columnLayout9","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutPanel","parent":"entrySection1_gridLayoutPanel_0","parentEl":"entrySection1_gridLayoutPanel_0","properties":{"id":"columnLayout9","tagClass":"three","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBillReqCheckEntry"},"events":{},"childrens":[{"id":"layoutColumn22","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout9","parentEl":"columnLayout9","properties":{"id":"layoutColumn22","tagClass":"span4"},"events":{},"childrens":[{"id":"labellayoutColumn22_sourceBillNumber","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn22","parentEl":"layoutColumn22","properties":{"id":"labellayoutColumn22_sourceBillNumber","caption":"单据编码","labelWidth":70,"labelPosition":"left","labelAlign":"right"},"events":{},"childrens":[{"id":"layoutColumn22_sourceBillNumber","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillNumber","parent":"labellayoutColumn22_sourceBillNumber","parentEl":"labellayoutColumn22_sourceBillNumber","properties":{"id":"layoutColumn22_sourceBillNumber","title":"单据编码","labelWidth":70,"disabled":true,"readonly":true,"labelPosition":"left","labelAlign":"right","name":"sourceBillNumber"},"events":{},"childrens":[]}]},{"id":"labellayoutColumn22_sourceBillOperationType","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn22","parentEl":"layoutColumn22","properties":{"id":"labellayoutColumn22_sourceBillOperationType","hidden":"true","caption":"源单业务类别","labelPosition":"left"},"events":{},"childrens":[{"id":"layoutColumn22_sourceBillOperationType","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillOperationType","parent":"labellayoutColumn22_sourceBillOperationType","parentEl":"labellayoutColumn22_sourceBillOperationType","properties":{"id":"layoutColumn22_sourceBillOperationType","title":"源单业务类别","hidden":true,"disabled":true,"labelPosition":"left","name":"sourceBillOperationType"},"events":{},"childrens":[]}]},{"id":"labellayoutColumn22_sourceBillID","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn22","parentEl":"layoutColumn22","properties":{"id":"labellayoutColumn22_sourceBillID","hidden":"true","caption":"源单据id","labelPosition":"left"},"events":{},"childrens":[{"id":"layoutColumn22_sourceBillID","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillID","parent":"labellayoutColumn22_sourceBillID","parentEl":"labellayoutColumn22_sourceBillID","properties":{"id":"layoutColumn22_sourceBillID","title":"源单据id","hidden":true,"disabled":true,"labelPosition":"left","name":"sourceBillID"},"events":{},"childrens":[]}]},{"id":"labellayoutColumn22_sourceBillAmountUsed","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn22","parentEl":"layoutColumn22","properties":{"id":"labellayoutColumn22_sourceBillAmountUsed","hidden":"true","caption":"源单据分录已用金额","labelPosition":"left"},"events":{},"childrens":[{"id":"layoutColumn22_sourceBillAmountUsed","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"sourceBillAmountUsed","parent":"labellayoutColumn22_sourceBillAmountUsed","parentEl":"labellayoutColumn22_sourceBillAmountUsed","properties":{"id":"layoutColumn22_sourceBillAmountUsed","title":"源单据分录已用金额","hidden":true,"disabled":true,"labelPosition":"left","allowNegative":true,"decimalPrecision":2,"name":"sourceBillAmountUsed"},"events":{},"childrens":[]}]}]},{"id":"layoutColumn23","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout9","parentEl":"columnLayout9","properties":{"id":"layoutColumn23","tagClass":"span4
    center"},"events":{},"childrens":[{"id":"labellayoutColumn23_sourceBillExpenseType","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn23","parentEl":"layoutColumn23","properties":{"id":"labellayoutColumn23_sourceBillExpenseType","caption":"费用类型","labelWidth":70,"labelPosition":"left","labelAlign":"right"},"events":{},"childrens":[{"id":"layoutColumn23_sourceBillExpenseType","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillExpenseType","parent":"labellayoutColumn23_sourceBillExpenseType","parentEl":"labellayoutColumn23_sourceBillExpenseType","properties":{"id":"layoutColumn23_sourceBillExpenseType","title":"费用类型","labelWidth":70,"disabled":true,"readonly":true,"labelPosition":"left","labelAlign":"right","name":"sourceBillExpenseType"},"events":{},"childrens":[]}]},{"id":"labellayoutColumn23_sourceBillCause","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn23","parentEl":"layoutColumn23","properties":{"id":"labellayoutColumn23_sourceBillCause","hidden":"true","caption":"源单据事由","labelPosition":"left"},"events":{},"childrens":[{"id":"layoutColumn23_sourceBillCause","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillCause","parent":"labellayoutColumn23_sourceBillCause","parentEl":"labellayoutColumn23_sourceBillCause","properties":{"id":"layoutColumn23_sourceBillCause","title":"源单据事由","hidden":true,"disabled":true,"labelPosition":"left","name":"sourceBillCause"},"events":{},"childrens":[]}]},{"id":"labellayoutColumn23_sourceBillAmountApproved","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn23","parentEl":"layoutColumn23","properties":{"id":"labellayoutColumn23_sourceBillAmountApproved","hidden":"true","caption":"源单据核定总金额","labelPosition":"left"},"events":{},"childrens":[{"id":"layoutColumn23_sourceBillAmountApproved","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"sourceBillAmountApproved","parent":"labellayoutColumn23_sourceBillAmountApproved","parentEl":"labellayoutColumn23_sourceBillAmountApproved","properties":{"id":"layoutColumn23_sourceBillAmountApproved","title":"源单据核定总金额","hidden":true,"disabled":true,"labelPosition":"left","allowNegative":true,"decimalPrecision":2,"name":"sourceBillAmountApproved"},"events":{},"childrens":[]}]},{"id":"labellayoutColumn23_sourceBillEntryID","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn23","parentEl":"layoutColumn23","properties":{"id":"labellayoutColumn23_sourceBillEntryID","hidden":"true","caption":"源单据分录id","labelPosition":"left"},"events":{},"childrens":[{"id":"layoutColumn23_sourceBillEntryID","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillEntryID","parent":"labellayoutColumn23_sourceBillEntryID","parentEl":"labellayoutColumn23_sourceBillEntryID","properties":{"id":"layoutColumn23_sourceBillEntryID","title":"源单据分录id","hidden":true,"disabled":true,"labelPosition":"left","name":"sourceBillEntryID"},"events":{},"childrens":[]}]}]},{"id":"layoutColumn24","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout9","parentEl":"columnLayout9","properties":{"id":"layoutColumn24","tagClass":"span4
    right"},"events":{},"childrens":[{"id":"labellayoutColumn24_checkAmount","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn24","parentEl":"layoutColumn24","properties":{"id":"labellayoutColumn24_checkAmount","caption":"核销金额","labelWidth":70,"labelPosition":"left","labelAlign":"right"},"events":{},"childrens":[{"id":"layoutColumn24_checkAmount","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"checkAmount","parent":"labellayoutColumn24_checkAmount","parentEl":"labellayoutColumn24_checkAmount","properties":{"id":"layoutColumn24_checkAmount","title":"核销金额","labelWidth":70,"labelPosition":"left","labelAlign":"right","allowGroup":true,"allowNegative":false,"decimalPrecision":2,"name":"checkAmount"},"events":{},"childrens":[]}]},{"id":"labellayoutColumn24_sourceBillDate","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn24","parentEl":"layoutColumn24","properties":{"id":"labellayoutColumn24_sourceBillDate","hidden":"true","caption":"源单据业务日期","labelPosition":"left"},"events":{},"childrens":[{"id":"layoutColumn24_sourceBillDate","componentType":"com.kingdee.bos.ctrl.web.DateField","field":"sourceBillDate","parent":"labellayoutColumn24_sourceBillDate","parentEl":"labellayoutColumn24_sourceBillDate","properties":{"id":"layoutColumn24_sourceBillDate","title":"源单据业务日期","hidden":true,"disabled":true,"labelPosition":"left","name":"sourceBillDate"},"events":{},"childrens":[]}]},{"id":"labellayoutColumn24_sourceBillAmountBalance","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn24","parentEl":"layoutColumn24","properties":{"id":"labellayoutColumn24_sourceBillAmountBalance","hidden":"true","caption":"源单据分录可用余额","labelPosition":"left"},"events":{},"childrens":[{"id":"layoutColumn24_sourceBillAmountBalance","componentType":"com.kingdee.bos.ctrl.web.NumberField","field":"sourceBillAmountBalance","parent":"labellayoutColumn24_sourceBillAmountBalance","parentEl":"labellayoutColumn24_sourceBillAmountBalance","properties":{"id":"layoutColumn24_sourceBillAmountBalance","title":"源单据分录可用余额","hidden":true,"disabled":true,"labelPosition":"left","allowNegative":true,"decimalPrecision":2,"name":"sourceBillAmountBalance"},"events":{},"childrens":[]}]},{"id":"labellayoutColumn24_hasSourceBill","componentType":"com.kingdee.bos.ctrl.web.LabelContainer","parent":"layoutColumn24","parentEl":"layoutColumn24","properties":{"id":"labellayoutColumn24_hasSourceBill","hidden":"true","caption":"是否有源单","labelPosition":"left"},"events":{},"childrens":[{"id":"layoutColumn24_hasSourceBill","componentType":"com.kingdee.bos.ctrl.web.CheckBox","field":"hasSourceBill","parent":"labellayoutColumn24_hasSourceBill","parentEl":"labellayoutColumn24_hasSourceBill","properties":{"id":"layoutColumn24_hasSourceBill","title":"是否有源单","hidden":true,"disabled":true,"labelPosition":"left","name":"hasSourceBill"},"events":{},"childrens":[]}]}]},{"id":"layoutColumn25","componentType":"com.kingdee.bos.ctrl.web.ColumnLayoutCell","parent":"columnLayout9","parentEl":"columnLayout9","properties":{"id":"layoutColumn25"},"events":{},"childrens":[{"id":"webTextField37","componentType":"com.kingdee.bos.ctrl.web.TextField","field":"sourceBillData","parent":"layoutColumn25","parentEl":"layoutColumn25","properties":{"id":"webTextField37","readonly":true,"dsTl":false,"style":"background:transparent;border:none;color:#08C;width:100%;","tagClass":"removeFocusTab","labelPosition":"left","label_tagClass":"colspan","name":"sourceBillData"},"events":{},"childrens":[]}]}]}]}]}]}},"hasParsed":true,"rowTemplate":"#entrySection1_template"},"id":"entrySection1"},{"type":"panel","option":{"id":"columnLayout15","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBill","layout":"column"},"id":"columnLayout15"},{"type":"column","option":{"id":"layoutColumn75","style":"text-align:right;"},"id":"layoutColumn75"},{"type":"labelContainer","option":{"id":"labelwebNumberField40","hidden":"true","caption":"冲账金额合计：","labelWidth":120,"labelPosition":"left","tagClass":"amountContainer"},"id":"labelwebNumberField40"},{"type":"numberField","option":{"id":"webNumberField40","title":"冲账金额合计：","labelWidth":120,"hidden":true,"disabled":true,"readonly":true,"style":"background:transparent;border:none;width:130px;font-weight:
    bold;color:
    #ff9600;text-align:left;","labelPosition":"left","label_tagClass":"amountContainer","allowGroup":true,"allowNegative":true,"decimalPrecision":2,"name":"reqAmount"},"id":"webNumberField40"},{"type":"text","option":{"id":"reqAmountText","dsTl":false,"style":"background:transparent;border:none;width:130px;font-weight:
    bold;color:
    #ff9600;text-align:right;width:100%;padding-right:3px;","tagClass":"removeFocusTab","labelPosition":"left","displayField":"#reqAmountText_view"},"id":"reqAmountText"},{"type":"linkButton","option":{"id":"entrySection1_appendRow","caption":"关联费用申请","style":"z-index:10;","tagClass":"btn","iconCls":"f-icon-plus","actionBinding":"appendReqRowAction"},"id":"entrySection1_appendRow"},{"type":"waf.botp","option":{"id":"botp"},"id":"botp"},{"type":"waf.report","option":{"id":"report","tdQueryPK":"com.kingdee.eas.cp.bc.app.DailyLoanBillForR1PrintQuery","tdTemplateName":"/FI/CPBC/dailyloan","dataProvider":"com.kingdee.eas.cp.bc.dynamic.utils.DailyLoanBillDataProvider"},"id":"report"},{"type":"linkButton","option":{"id":"entrySection_entrySection_deleteRow__index_","tagClass":"ui-icon-rowRemove
    ibrb","actionBinding":"deleteRowAction"},"id":"entrySection_entrySection_deleteRow__index_"},{"type":"panel","option":{"id":"entrySection_columnLayout8__index_","tagClass":"three
    entry","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBillEntry","operateState":"EDIT","viewDisplayType":"wordonly","layout":"column"},"id":"entrySection_columnLayout8__index_"},{"type":"column","option":{"id":"entrySection_layoutColumn18__index_","tagClass":"span4
    nocurrency","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection_layoutColumn18__index_"},{"type":"labelContainer","option":{"id":"entrySection_labellayoutColumn18_expenseType__index_","caption":"费用类型","labelWidth":70,"labelPosition":"left","tagClass":"expenseType","labelAlign":"right","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection_labellayoutColumn18_expenseType__index_"},{"type":"promptBox","option":{"id":"entrySection_expenseType__index_","F7Type":"F7Iframe","title":"费用类型","labelWidth":70,"req":true,"labelPosition":"left","label_tagClass":"expenseType","labelAlign":"right","F7Iframe_url":"/cp/bc/dynamic/expenseTypeTreeListPage.do?method=initalize&billType=DailyLoanBill","F7Iframe_height":485,"F7Iframe_width":650,"F7Iframe_closeOnEscape":true,"F7Iframe_draggable":true,"F7Iframe_showType":"window","F7Iframe_resizable":true,"validator_rules":"required:true","validator_errMsg":"required:'费用类型不能为空。'","name":"entrySection_expenseType__index_","operateState":"EDIT","viewDisplayType":"wordonly","tagClass":"ibrf","submitField":"#entrySection_expenseType__index__el","subWidgetName":"wafPromptIframe","inIframe":true,"subWidgetOptions":{"url":"//cp/bc/dynamic/expenseTypeTreeListPage.do?method=initalize&billType=DailyLoanBill","height":485,"width":650,"closeOnEscape":true,"draggable":true,"showType":"window","resizable":true,"submitField":"entrySection_expenseType__index__el"}},"id":"entrySection_expenseType__index_"},{"type":"column","option":{"id":"entrySection_layoutColumn19__index_","tagClass":"span4
    currency
    center","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection_layoutColumn19__index_"},{"type":"labelContainer","option":{"id":"entrySection_labellayoutColumn19_currencyType__index_","caption":"币别","labelWidth":75,"labelPosition":"left","tagClass":"currency","labelAlign":"right","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection_labellayoutColumn19_currencyType__index_"},{"type":"promptBox","option":{"id":"entrySection_currencyType__index_","F7Type":"F7Quick","title":"币别","labelWidth":75,"req":true,"labelPosition":"left","label_tagClass":"currency","labelAlign":"right","F7Quick_query":"com.kingdee.eas.basedata.assistant.app.CurrencyQuery","F7Quick_cu":true,"F7Quick_allowAutoComplete":true,"F7Quick_autoChoose":false,"F7Quick_autoCompleteItem":"number,name","F7Quick_width":400,"validator_rules":"required:true","validator_errMsg":"required:'币别不能为空。'","name":"entrySection_currencyType__index_","operateState":"EDIT","viewDisplayType":"wordonly","tagClass":"ibrf","submitField":"#entrySection_currencyType__index__el","subWidgetName":"wafPromptQuick","inIframe":true,"subWidgetOptions":{"query":"com.kingdee.eas.basedata.assistant.app.CurrencyQuery","cu":true,"allowAutoComplete":true,"autoChoose":false,"autoCompleteItem":"number,name","width":400,"dataUrl":"//component/F7Quick.do?method=initalize","submitField":"entrySection_currencyType__index__el"}},"id":"entrySection_currencyType__index_"},{"type":"column","option":{"id":"entrySection_layoutColumn20__index_","tagClass":"span4
    currency
    right","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection_layoutColumn20__index_"},{"type":"labelContainer","option":{"id":"entrySection_labellayoutColumn20_exchangeRate__index_","caption":"汇率","labelWidth":75,"labelPosition":"left","tagClass":"currency","labelAlign":"right","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection_labellayoutColumn20_exchangeRate__index_"},{"type":"numberField","option":{"id":"entrySection_exchangeRate__index_","title":"汇率","labelWidth":75,"req":true,"labelPosition":"left","label_tagClass":"currency","labelAlign":"right","allowNegative":true,"decimalPrecision":4,"validator_rules":"required:true","validator_errMsg":"required:'汇率不能为空。'","name":"entrySection_exchangeRate__index_","operateState":"EDIT","viewDisplayType":"wordonly","tagClass":"ibrf"},"id":"entrySection_exchangeRate__index_"},{"type":"column","option":{"id":"entrySection_layoutColumn26__index_","tagClass":"span4
    nocurrency","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection_layoutColumn26__index_"},{"type":"labelContainer","option":{"id":"entrySection_labellayoutColumn18_amountOri__index_","caption":"借款金额","labelWidth":70,"labelPosition":"left","tagClass":"amount","labelAlign":"right","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection_labellayoutColumn18_amountOri__index_"},{"type":"numberField","option":{"id":"entrySection_amountOri__index_","title":"借款金额","labelWidth":70,"req":true,"validator_errorLabelPosition":"bottom","validator_errorShowMode":"embeded","validator_validatetrigger":"focus","validator_customvalidate":"_self.validateAmount","labelPosition":"left","label_tagClass":"amount","labelAlign":"right","allowGroup":true,"allowNegative":false,"decimalPrecision":2,"validator_rules":"required:true","validator_errMsg":"required:'金额原币不能为空。'","name":"entrySection_amountOri__index_","operateState":"EDIT","viewDisplayType":"wordonly","tagClass":"ibrf"},"id":"entrySection_amountOri__index_"},{"type":"column","option":{"id":"entrySection_layoutColumn27__index_","tagClass":"span4
    currency center
    amount","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection_layoutColumn27__index_"},{"type":"labelContainer","option":{"id":"entrySection_labellayoutColumn19_amount__index_","caption":"本位币金额","labelWidth":75,"labelPosition":"left","tagClass":"currency","labelAlign":"right","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection_labellayoutColumn19_amount__index_"},{"type":"numberField","option":{"id":"entrySection_amount__index_","title":"本位币金额","labelWidth":75,"req":true,"readonly":true,"labelPosition":"left","label_tagClass":"currency","labelAlign":"right","allowGroup":true,"allowNegative":true,"decimalPrecision":2,"validator_rules":"required:true","validator_errMsg":"required:'金额不能为空。'","name":"entrySection_amount__index_","operateState":"EDIT","viewDisplayType":"wordonly","tagClass":"ibrf"},"id":"entrySection_amount__index_"},{"type":"column","option":{"id":"entrySection_layoutColumn21__index_","tagClass":"span12","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection_layoutColumn21__index_"},{"type":"labelContainer","option":{"id":"entrySection_labellayoutColumn21_purpose__index_","caption":"借款用途","labelWidth":70,"labelPosition":"left","tagClass":"colspan","labelAlign":"right","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection_labellayoutColumn21_purpose__index_"},{"type":"text","option":{"id":"entrySection_purpose__index_","title":"借款用途","labelWidth":70,"req":true,"labelPosition":"left","label_tagClass":"colspan","labelAlign":"right","validator_rules":"required:true","validator_errMsg":"required:'用途不能为空。'","name":"entrySection_purpose__index_","operateState":"EDIT","viewDisplayType":"wordonly","tagClass":"ibrf","displayField":"#entrySection_purpose__index__view"},"id":"entrySection_purpose__index_"},{"type":"text","option":{"id":"entrySection_bgData__index_","hidden":true,"readonly":true,"dsTl":false,"style":"background:transparent;border:none;color:#08C;width:100%;","tagClass":"removeFocusTab
    ibrf","labelPosition":"left","name":"entrySection_bgData__index_","operateState":"EDIT","viewDisplayType":"wordonly","displayField":"#entrySection_bgData__index__view"},"id":"entrySection_bgData__index_"},{"type":"linkButton","option":{"id":"entrySection1_entrySection1_deleteRow__index_","tagClass":"ui-icon-rowRemove
    ibrb","actionBinding":"deleteReqRowAction"},"id":"entrySection1_entrySection1_deleteRow__index_"},{"type":"panel","option":{"id":"entrySection1_columnLayout9__index_","tagClass":"three","entryObjectFullName":"com.kingdee.eas.cp.bc.app.DailyLoanBillReqCheckEntry","operateState":"EDIT","viewDisplayType":"wordonly","layout":"column"},"id":"entrySection1_columnLayout9__index_"},{"type":"column","option":{"id":"entrySection1_layoutColumn22__index_","tagClass":"span4","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection1_layoutColumn22__index_"},{"type":"labelContainer","option":{"id":"entrySection1_labellayoutColumn22_sourceBillNumber__index_","caption":"单据编码","labelWidth":70,"labelPosition":"left","labelAlign":"right","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection1_labellayoutColumn22_sourceBillNumber__index_"},{"type":"text","option":{"id":"entrySection1_sourceBillNumber__index_","title":"单据编码","labelWidth":70,"disabled":true,"readonly":true,"labelPosition":"left","labelAlign":"right","name":"entrySection1_sourceBillNumber__index_","operateState":"EDIT","viewDisplayType":"wordonly","tagClass":"ibrf","displayField":"#entrySection1_sourceBillNumber__index__view"},"id":"entrySection1_sourceBillNumber__index_"},{"type":"labelContainer","option":{"id":"entrySection1_labellayoutColumn22_sourceBillOperationType__index_","hidden":"true","caption":"源单业务类别","labelPosition":"left","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection1_labellayoutColumn22_sourceBillOperationType__index_"},{"type":"text","option":{"id":"entrySection1_sourceBillOperationType__index_","title":"源单业务类别","hidden":true,"disabled":true,"labelPosition":"left","name":"entrySection1_sourceBillOperationType__index_","operateState":"EDIT","viewDisplayType":"wordonly","tagClass":"ibrf","displayField":"#entrySection1_sourceBillOperationType__index__view"},"id":"entrySection1_sourceBillOperationType__index_"},{"type":"labelContainer","option":{"id":"entrySection1_labellayoutColumn22_sourceBillID__index_","hidden":"true","caption":"源单据id","labelPosition":"left","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection1_labellayoutColumn22_sourceBillID__index_"},{"type":"text","option":{"id":"entrySection1_sourceBillID__index_","title":"源单据id","hidden":true,"disabled":true,"labelPosition":"left","name":"entrySection1_sourceBillID__index_","operateState":"EDIT","viewDisplayType":"wordonly","tagClass":"ibrf","displayField":"#entrySection1_sourceBillID__index__view"},"id":"entrySection1_sourceBillID__index_"},{"type":"labelContainer","option":{"id":"entrySection1_labellayoutColumn22_sourceBillAmountUsed__index_","hidden":"true","caption":"源单据分录已用金额","labelPosition":"left","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection1_labellayoutColumn22_sourceBillAmountUsed__index_"},{"type":"numberField","option":{"id":"entrySection1_sourceBillAmountUsed__index_","title":"源单据分录已用金额","hidden":true,"disabled":true,"labelPosition":"left","allowNegative":true,"decimalPrecision":2,"name":"entrySection1_sourceBillAmountUsed__index_","operateState":"EDIT","viewDisplayType":"wordonly","tagClass":"ibrf"},"id":"entrySection1_sourceBillAmountUsed__index_"},{"type":"column","option":{"id":"entrySection1_layoutColumn23__index_","tagClass":"span4
    center","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection1_layoutColumn23__index_"},{"type":"labelContainer","option":{"id":"entrySection1_labellayoutColumn23_sourceBillExpenseType__index_","caption":"费用类型","labelWidth":70,"labelPosition":"left","labelAlign":"right","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection1_labellayoutColumn23_sourceBillExpenseType__index_"},{"type":"text","option":{"id":"entrySection1_sourceBillExpenseType__index_","title":"费用类型","labelWidth":70,"disabled":true,"readonly":true,"labelPosition":"left","labelAlign":"right","name":"entrySection1_sourceBillExpenseType__index_","operateState":"EDIT","viewDisplayType":"wordonly","tagClass":"ibrf","displayField":"#entrySection1_sourceBillExpenseType__index__view"},"id":"entrySection1_sourceBillExpenseType__index_"},{"type":"labelContainer","option":{"id":"entrySection1_labellayoutColumn23_sourceBillCause__index_","hidden":"true","caption":"源单据事由","labelPosition":"left","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection1_labellayoutColumn23_sourceBillCause__index_"},{"type":"text","option":{"id":"entrySection1_sourceBillCause__index_","title":"源单据事由","hidden":true,"disabled":true,"labelPosition":"left","name":"entrySection1_sourceBillCause__index_","operateState":"EDIT","viewDisplayType":"wordonly","tagClass":"ibrf","displayField":"#entrySection1_sourceBillCause__index__view"},"id":"entrySection1_sourceBillCause__index_"},{"type":"labelContainer","option":{"id":"entrySection1_labellayoutColumn23_sourceBillAmountApproved__index_","hidden":"true","caption":"源单据核定总金额","labelPosition":"left","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection1_labellayoutColumn23_sourceBillAmountApproved__index_"},{"type":"numberField","option":{"id":"entrySection1_sourceBillAmountApproved__index_","title":"源单据核定总金额","hidden":true,"disabled":true,"labelPosition":"left","allowNegative":true,"decimalPrecision":2,"name":"entrySection1_sourceBillAmountApproved__index_","operateState":"EDIT","viewDisplayType":"wordonly","tagClass":"ibrf"},"id":"entrySection1_sourceBillAmountApproved__index_"},{"type":"labelContainer","option":{"id":"entrySection1_labellayoutColumn23_sourceBillEntryID__index_","hidden":"true","caption":"源单据分录id","labelPosition":"left","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection1_labellayoutColumn23_sourceBillEntryID__index_"},{"type":"text","option":{"id":"entrySection1_sourceBillEntryID__index_","title":"源单据分录id","hidden":true,"disabled":true,"labelPosition":"left","name":"entrySection1_sourceBillEntryID__index_","operateState":"EDIT","viewDisplayType":"wordonly","tagClass":"ibrf","displayField":"#entrySection1_sourceBillEntryID__index__view"},"id":"entrySection1_sourceBillEntryID__index_"},{"type":"column","option":{"id":"entrySection1_layoutColumn24__index_","tagClass":"span4
    right","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection1_layoutColumn24__index_"},{"type":"labelContainer","option":{"id":"entrySection1_labellayoutColumn24_checkAmount__index_","caption":"核销金额","labelWidth":70,"labelPosition":"left","labelAlign":"right","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection1_labellayoutColumn24_checkAmount__index_"},{"type":"numberField","option":{"id":"entrySection1_checkAmount__index_","title":"核销金额","labelWidth":70,"labelPosition":"left","labelAlign":"right","allowGroup":true,"allowNegative":false,"decimalPrecision":2,"name":"entrySection1_checkAmount__index_","operateState":"EDIT","viewDisplayType":"wordonly","tagClass":"ibrf"},"id":"entrySection1_checkAmount__index_"},{"type":"labelContainer","option":{"id":"entrySection1_labellayoutColumn24_sourceBillDate__index_","hidden":"true","caption":"源单据业务日期","labelPosition":"left","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection1_labellayoutColumn24_sourceBillDate__index_"},{"type":"datePicker","option":{"id":"entrySection1_sourceBillDate__index_","title":"源单据业务日期","hidden":true,"disabled":true,"labelPosition":"left","name":"entrySection1_sourceBillDate__index_","operateState":"EDIT","viewDisplayType":"wordonly","tagClass":"ibrf","altField":"#entrySection1_sourceBillDate__index__el","altFormat":"yy-mm-dd","displayField":"#entrySection1_sourceBillDate__index__view"},"id":"entrySection1_sourceBillDate__index_"},{"type":"labelContainer","option":{"id":"entrySection1_labellayoutColumn24_sourceBillAmountBalance__index_","hidden":"true","caption":"源单据分录可用余额","labelPosition":"left","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection1_labellayoutColumn24_sourceBillAmountBalance__index_"},{"type":"numberField","option":{"id":"entrySection1_sourceBillAmountBalance__index_","title":"源单据分录可用余额","hidden":true,"disabled":true,"labelPosition":"left","allowNegative":true,"decimalPrecision":2,"name":"entrySection1_sourceBillAmountBalance__index_","operateState":"EDIT","viewDisplayType":"wordonly","tagClass":"ibrf"},"id":"entrySection1_sourceBillAmountBalance__index_"},{"type":"labelContainer","option":{"id":"entrySection1_labellayoutColumn24_hasSourceBill__index_","hidden":"true","caption":"是否有源单","labelPosition":"left","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection1_labellayoutColumn24_hasSourceBill__index_"},{"type":"checkbox","option":{"id":"entrySection1_hasSourceBill__index_","title":"是否有源单","hidden":true,"disabled":true,"labelPosition":"left","name":"entrySection1_hasSourceBill__index_","operateState":"EDIT","viewDisplayType":"wordonly","tagClass":"ibrf"},"id":"entrySection1_hasSourceBill__index_"},{"type":"column","option":{"id":"entrySection1_layoutColumn25__index_","operateState":"EDIT","viewDisplayType":"wordonly"},"id":"entrySection1_layoutColumn25__index_"},{"type":"text","option":{"id":"entrySection1_sourceBillData__index_","readonly":true,"dsTl":false,"style":"background:transparent;border:none;color:#08C;width:100%;","tagClass":"removeFocusTab
    ibrf","labelPosition":"left","label_tagClass":"colspan","name":"entrySection1_sourceBillData__index_","operateState":"EDIT","viewDisplayType":"wordonly","displayField":"#entrySection1_sourceBillData__index__view"},"id":"entrySection1_sourceBillData__index_"}]
</script>
<script id="all_imm_option" type="text/html">window.immediate_option =
    [{"type":"form","option":{"id":"form","validateOptions":"{errorContainer:waf('#msgArea1')}"},"id":"form"}]
</script>