/**
 * Created by RD_bjjlg on 14-5-8.
 */
onmessage = function(event){
    var data = event.data+3;
    postMessage(data);
}
