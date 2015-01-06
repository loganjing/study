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

//readFile包装了Defered对象，并且触发事件中的defered，同时返回promise,而promise用来注册handler.
var readFile = function(path,encode){
    var deferred = new Deferred();
    fs.readFile(path,encode,function(err,value){
        if(err){
            deferred.reject(err);
        }else{
            deferred.resolve(value);
        }
    });
    return deferred.promise;
};

var tp1 = "D:/work/node/myapp/express-master/examples/node/11.txt";

readFile(tp1,"utf-8").then(function(value){
    console.info("Success read File:"+value);
},function(err){
    console.info("Error read File:"+err);
});

