/**
 * Created by RD_bjjlg on 2015/1/5.
 */
var fs = require("fs"),events = require("events");

var tp1 = "D:/work/node/myapp/express-master/examples/node/1.txt";
var tp2 = "D:/work/node/myapp/express-master/examples/node/2.txt";
var tp3 = "D:/work/node/myapp/express-master/examples/node/3.txt";

//使用偏函数来判断类型
var toString = Object.prototype.toString;
var typeFn = function(type){
    return function(object){
        return toString.call(object) == "[object "+type+"]";
    }
};
var isString = typeFn("String");
var isFunction = typeFn("Function");

//all和any不能同时使用
function EventProxy(){
    var list = [],datas=[];
    this.all = function(){
        if(arguments.length<2) return;
        var arr = Array.prototype.slice.call(arguments,0);
        for(var i=0;i<arr.length;i++){
            if(isString(arr[i])){
                list.push({eventName:arr[i]});
            }else if(isFunction(arr[i])){
                for(var j= 0;j<list.length;j++){
                    list[j]["handler"] = arr[i];
                }
            }
        }
    };
    this.emit = function(eventName,data){
        datas.push(data);
        if("error" === eventName){
            this.errors.fn.apply(this,[data]);
        }else{
            if(list.length>1){
                for(var i=0;i<list.length;i++){
                    if(list[i].eventName == eventName){
                        list.splice(i,1);
                    }
                }
            }else{
                list[0].handler.apply(this,datas);
            }
        }
    };
    this.bind=function(eventName,fn){
        this.errors = {eventName:eventName,fn:fn};
    };
    this.fail = function(fn){
        this.bind("error",function(err){
            fn(err);
        });
    };
    this.done = function(type){
        var self = this;
        return function(err,template){
            if(err){
                return self.emit("error",err);
            }
            self.emit(type,template);
        }
    }
}

exports.getContent = function(callback){
    var proxy = new EventProxy();
    proxy.all("template1","template2","template3",function(template1,template2,template3){
        callback(null,template1,template2,template3);
    });
    //定义总体性的err拦截处理函数
    proxy.fail(callback);
    //这里应用了偏函数,在done返回的函数中，直接处理异常，将使用总体性的异常拦截处理，而这里只传递关注的数据类型。
    fs.readFile(tp1,"utf-8",proxy.done('template1'));
    fs.readFile(tp3,"utf-8",proxy.done("template2"));
    fs.readFile(tp2,"utf-8",proxy.done("template3"));
};


//同时处理err和正常的事件处理逻辑
exports.getContent(function(err,template1,template2,template3){
    if(err){
        console.info("Error:"+err);
    }else{
        console.info(template1);
        console.info(template2);
        console.info(template3);
    }
})

