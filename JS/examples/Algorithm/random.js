/**
 * Created by RD_bjjlg on 14-2-25.
 */
var rnd = {
    today: new Date(),
    seed:today.getTime()
};

function rnd(){
    rnd.seed = (rnd.seed * 9301 + 49297) % 233280;
    return rnd.seed / (233280.0);
}

function rand(number) {
    //向上取整
    return Math.ceil(rnd() * number);
}
