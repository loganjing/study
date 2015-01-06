/**
 * Created with IntelliJ IDEA.
 * User: HSZM1106-0312
 * Date: 14-5-7
 * Time: 下午9:44
 * To change this template use File | Settings | File Templates.
 */
self.addEventListener('message', function(e) {
  self.postMessage(e.data);
}, false);
