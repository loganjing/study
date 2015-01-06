var fs = require("fs"),events = require("events");

var tp1 = "D:/work/node/myapp/express-master/examples/node/1.txt";
var tp2 = "D:/work/node/myapp/express-master/examples/node/2.txt";
var tp3 = "D:/work/node/myapp/express-master/examples/node/3.txt";

//偏函数
var after = function(times,callback){
    var count = 0, results = {};
    return function(key,value){
        results[key] = value;
        count++;
        if(count == times){
            callback(results);
        }
    }
};



var done = after(3,function(results){
    for(var p in results){
        console.log("rendering:"+results[p]);
    }
});

var emitter = new events.EventEmitter();
emitter.on("done",done);


fs.readFile(tp1,"utf-8",function(err,template){
    emitter.emit("done","template1",template);
});

fs.readFile(tp2,"utf-8",function(err,template){
    emitter.emit("done","template2",template);
});

fs.readFile(tp3,"utf-8",function(err,template){
    emitter.emit("done","template3",template);
});