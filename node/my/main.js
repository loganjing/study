var metaFile,uiPk;

//TODO:可能将来增加的功能：1。整个业务单元或者目录生成  2。多语言的支持

//从参数中解析
if(process.argv&&process.argv.length<2){
    console.info("Error argument! The first argument is metaFile, and the second argument is uiPK.");
    return;
}
metaFile = process.argv[2];
uiPk = process.argv[3];

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


        var allOptions = waf.initOptions;
        console.log("save "+allOptions.length+" components init options.");
        waf("<script id='all_options' type='text/html'></script>").appendTo(mainContent);
        waf("#all_options").append(waf.toJSONString(allOptions));

        console.log("save to file "+uiPk+".html");
        fs.open("my/"+uiPk+".html", "w", 0644, function (e, fd) {
            if (e) throw e;
            fs.write(fd, mainContent.html(), 0, 'utf8', function (e) {
                if (e) throw e;
                fs.closeSync(fd);
            })
            mainContent.html("");
            console.log("Success!");
        });
    });

});