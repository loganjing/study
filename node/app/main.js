var metaFile,uiPk,path;

//TODO:可能将来增加的功能：1。整个业务单元或者目录生成  2。多语言的支持

//从参数中解析
if(process.argv&&process.argv.length<2){
    console.info("Error argument! The first argument is metaFile, and the second argument is uiPK.");
    return;
}
metaFile = process.argv[2];
uiPk = process.argv[3];
path = process.argv[4];

//获取jsdom
var jsdom = require("jsdom");
var window = jsdom.jsdom().parentWindow;
var fs = require("fs");

jsdom.jQueryify(window, "all.js", function () {
    var body = window.$("body");
    var waf = $ = window.jQuery;
    console.log("Prepare context.");
    //设置环境Context
    body.append("<div id='mainContent'></div>");
    //模拟_self
    var _self = {
        uipk: "",
        setUIPk: function (uipk) {
            this.uipk = uipk;
        },
        getUIPk: function () {
            return this.uipk;
        },
        getPageInitData: function () {
            return {};
        }
    };
    window._self = _self;
    //设置context
    waf.createContext("l2","l2","l2","l2","l2","l2","l2","l2","l2");


    $(function () {
        console.log("fetch file meta from "+metaFile);
        var metadata = fs.readFileSync(metaFile,"utf-8");
        if(metadata == null){
            console.info("Cannot get metadata!,Please check it.");
            return;
        }
        metadata = waf.toJSONObject(metadata);
        console.log("start render "+metaFile);
        var mainContent = $("#mainContent");
        _self.setUIPk(uiPk);
        waf.pageBuilder.render(metadata, null, true, true);
        console.log("end render "+metaFile);

        //composite dataBinder
        var dataBinder = waf.dataBinder._dataBinder.values();
        waf("<script id='all_dataBinders' type='text/html'></script>").appendTo(mainContent);
        waf("#all_dataBinders").append("window._dataBinders_ = "+waf.toJSONString(dataBinder));


        var allOptions = waf.lazyOptions;
        //handle infoBlock
        var infoBlocks = window.jlinq.from(allOptions).equals("type","infoBlock").select();
        if(infoBlocks&&infoBlocks.length>0){
            var tmp,op,newRow,obj,calc;
            for (var i = 0; i < infoBlocks.length; i++) {
                tmp = $("#"+infoBlocks[i].id);
                if(tmp && tmp.data() && tmp.data().wafInfoBlock){
                     op = tmp.data().wafInfoBlock;
                     infoBlocks[i].option.colModel = op.colModel;
                     infoBlocks[i].option.rowButtonIds = op.rowButtonIds;
                     infoBlocks[i].option.metadata = op.metadata; 
                     infoBlocks[i].option.hasParsed = true;
                     //generate new Template
                     var newRow = $("<div id='rBtemplate' class='row'></div>");
                     newRow.appendTo(mainContent.find(".wform"));
                     var fun = tmp.data("wafInfoBlock")["buildRowElement"];
                     newRow = fun.call(tmp.data("wafInfoBlock"),newRow,"_index_","_seq_","EDIT");
                     //newRow = tmp.wafInfoBlock("buildRowElement",newRow,"$index$","$seq$","EDIT");
                     calc = $(newRow).outerHTML();
                     calc = $.wafutil.replaceAll(calc,"_index_","{{index}}");
                     calc = $.wafutil.replaceAll(calc,"_seq_","{{seq}}");
                     waf("<script id='"+infoBlocks[i].id+"_template"+"' type='text/html'></script>").appendTo(mainContent);
                     waf("#"+infoBlocks[i].id+"_template").append(calc);
                     infoBlocks[i].option.rowTemplate="#"+infoBlocks[i].id+"_template";                     
                }
            };

        }
		//区分form等常用控件
        console.log("save "+allOptions.length+" lazy components init options. ");
        waf("<script id='all_options' type='text/html'></script>").appendTo(mainContent);
        waf("#all_options").append("window._serverOptions_ = "+waf.toJSONString(allOptions));


        var immeOptions = waf.immeOptions;
        //区分form等常用控件
        console.log("save "+immeOptions.length+" immediate components init options. ");
        waf("<script id='all_imm_option' type='text/html'></script>").appendTo(mainContent);
        waf("#all_imm_option").append("window.immediate_option = "+waf.toJSONString(immeOptions));

        
        
		var content = "<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\" pageEncoding=\"UTF-8\" %>"+mainContent[0].innerHTML;
        var staticFile = path + "/" +uiPk+".jsp";
        console.log("start save to file "+staticFile);
        fs.open(staticFile, "w", 0644, function (e, fd) {
            if (e) throw e;
            fs.write(fd,content, 0, 'utf8', function (e) {
                if (e) throw e;
                fs.closeSync(fd);
            })
            mainContent.html("");
            console.log("Success save to file "+staticFile+"!");
        });       
    });

});