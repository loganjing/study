/**
 * Created by RD_bjjlg on 2015/1/5.
 */
var util = require("util"),events = require("events"),fs = require("fs");


//使用偏函数来判断类型
var toString = Object.prototype.toString;
var typeFn = function(type){
    return function(object){
        return toString.call(object) == "[object "+type+"]";
    }
};
var isString = typeFn("String");
var isFunction = typeFn("Function");

//新建一个promise类
var Promise = function(){
    events.EventEmitter.call(this);
    this.setMaxListeners(0);
};
util.inherits(Promise,events.EventEmitter);

//给promise增加then方法，用于扩展success,error,progress时的状态。
Promise.prototype.then = function(fulfilledHandler,errorHandler,progressHandler){
    //将这些状态的handler注册到promise上。
    if(isFunction(fulfilledHandler)){
        this.once("success",fulfilledHandler);
    }
    if(isFunction(errorHandler)){
        this.once("error",errorHandler);
    }
    if(isFunction(progressHandler)){
        this.once("progress",progressHandler);
    }
    return this;
};
Promise.prototype.success = function(fn){
    if(isFunction(fn)){
        this.on("success",fn);
    }
    return this;
};
Promise.prototype.fail = function(fn){
    if(isFunction(fn)){
        this.on("error",fn);
    }
    return this;
};


//声明一个新的Defered对象，这个对象主要用于被别的对象包装来触发promise中的handler
//内部必须持有一个promise对象
var Deferred = function(){
    this.state = "unfulfilled";
    this.promise = new Promise();
};

//成功时的处理，此时仅仅是触发success事件
Deferred.prototype.resolve = function(obj){
    this.state = "fulfilled";
    this.promise.emit("success",obj);
};
//失败时的处理，此时仅仅是触发error事件
Deferred.prototype.reject = function(obj){
    this.state = "error";
    this.promise.emit("error",obj);
};

Deferred.prototype.progress = function(obj){
    this.promise.emit("progress",obj);
};

//针对文件读取实现的defered，封装文件读取时的代码处理
var FileDeferred = function(){
    Deferred.call(this);
};
util.inherits(FileDeferred,Deferred);
FileDeferred.prototype.makeResolver = function(){
    var self = this;
    return function(err,value){
        if(err){
            self.reject(err);
            self = null;
        }else{
            self.resolve(value);
            self = null;
        }
    }
};

//readFile包装了Defered对象，并且触发事件中的defered，同时返回promise,而promise用来注册handler.
var readFile = function(path,encode){
    var deferred = new FileDeferred();
    //这里做了延时的处理，给予readFile只是一个触发事件的逻辑，真正的逻辑通过promise来绑定
    fs.readFile(path,encode,deferred.makeResolver());
    return deferred.promise;
};

var tp1 = "D:/work/node/myapp/express-master/examples/node/1.txt";

//这里不使用then，而是直接使用success和fail，并且可以增加多个，因为一个事件可以绑定多个handler.
//readFile(tp1,"utf-8").success(function(obj){
//    console.info("read file success!")
//}).success(function(obj){
//    console.info("content is1:"+obj)
//}).success(function(obj){
//    console.info("content is2:"+obj)
//}).fail(function(err){
//    console.info("read file err!")
//}).fail(function(err){
//    console.info("err is "+err)
//});

//疑问：如果读取文件足够快,而这些success还没有注册完成，如何处理？这里测试了50000都没有出错，说明内部可能做了处理。
var tmp = readFile(tp1,"utf-8");
for(var i=0;i<50000;i++){
    (function(index){
        tmp.success(function(obj){
            console.info("content is"+index+":"+obj)
        });
    })(i)
}
