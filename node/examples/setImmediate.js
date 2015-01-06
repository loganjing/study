process.nextTick(function(){
  console.log("nextTick dealy execute 1.")
});
process.nextTick(function(){
  console.log("nextTick dealy execute 2.")
});
setImmediate(function(){
    console.log("setImmediate dealy execute1");
    process.nextTick(function(){
        console.log("强势插入.")
    });
});
setImmediate(function(){
    console.log("setImmediate dealy execute2");
});