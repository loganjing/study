/**
* 描述：WAF命名空间构造器
* @author JASON LIU
* @class 用来构建js 对象的命名空间
* @constructor
* @return 返回构造完成的命名空间(JS对象)
*/
var Namespace = {
	/*
	 * 描述:注册命名空间
	 * @param {String} fullNS 命名空间名称
	 * @return 返回造建完成的命名空间
	 */
	register : function(fullNS) {
		var nsArray = fullNS.split('.');
		var sEval = "";
		var sNS = "";
		for (var i = 0; i < nsArray.length; i++) {
			if (i != 0)
				sNS += ".";
			sNS += nsArray[i];
			sEval += "if (typeof(" + sNS + ") == 'undefined') " + sNS
					+ " = new Object();"
		}
		if (sEval != "")
			return eval(sEval);
	}
};

/**
* 描述：获取js function对象的名称
* @author JASON LIU
* @class 用来构建js 对象的命名空间
* @constructor
* @return 返回js function对象的名称
*/
Function.prototype.GetName = function()
{
      var fnName = this.toString(); 
      fnName = fnName.substr(0, fnName.indexOf('(')); 
      fnName = fnName.replace(/^function/, ''); 
      return fnName.replace(/(^\s+)|(\s+$)/g, '');
};

/**
* 描述：jquery ajax提交前，构建查询字符串
* @author JASON LIU
* @class 用来构建js 对象的命名空间
* @constructor
* @return 返回js function对象的名称
*/
function buildParams( prefix, obj, traditional, add ) {
	if ( jQuery.isArray( obj ) ) {
		jQuery.each( obj, function( i, v ) {
			if ( traditional || rbracket.test( prefix ) ) {
				add( prefix, v );
			} else {
				buildParams( prefix + "[" + ( typeof v === "object" || jQuery.isArray(v) ? i : "" ) + "]", v, traditional, add );
			}
		});

	} else if ( !traditional && obj != null && typeof obj === "object" ) {
		for ( var name in obj ) {
			buildParams( prefix + "." + name + "", obj[ name ], traditional, add );
		}

	} else {
		add( prefix, obj );
	}
}

/**
* 描述：创建全局对象WAF,扩展自jquery
* @author JASON LIU
* @class 创建全局对象WAF
*/
var waf = $;
waf.extend({
			/**
			* 描述:当前页面的conversationid
			* @type {String}
			*/
		 	conversationid:null,
		 	context:null,
		 	localeResourceObj:null,
			/**
			 *描述：ajax请求超时时间
			 */
			ajaxTimeout : 600000,
			/**
			 * 描述:注册命名空间,并返回
			 * @param {String} 名称空间路径
			 */
			registerNamespace : function(ns){
				var nsArray = fullNS.split('.');
				var sEval = "";
				var sNS = "";
				for (var i = 0; i < nsArray.length; i++) {
					if (i != 0)
						sNS += ".";
					sNS += nsArray[i];
					sEval += "if (typeof(" + sNS + ") == 'undefined') " + sNS
							+ " = new Object();"
				}
				if (sEval != "")
					return eval(sEval);
			},
			/**
			 * 描述：waf 的js 类继承
			 * @param {subClass} 当前类
			 * @param {superClass} 需要继承的超类
			 */
			inherit : function(subClass, superClass) {
				if(superClass==null) return ;
				var Fun = function(){};//用一个空的函数作为中间缓冲，如果直接用父类的实例作为原型，可能有潜在问题，如计算量超大等
				Fun.prototype = superClass.prototype;
				subClass.prototype = new Fun();
				subClass.prototype.constructor = subClass;
	
				//提供 superClass 属性，这个属性可以弱化父类子类之间的耦合
				//否则，在子类中调用父类的构造函数就需要指明父类，此时只需调用这个属性即可
				subClass.superClass = superClass.prototype;
				if(superClass.prototype.constructor == Object.prototype.constructor){
					superClass.prototype.constructor = superClass;
				}
			},
			/**
			 * 描述：waf 的js 类定义
			 * @param subClassName 当前类
			 * @param superClass   超类
			 * @param prototype 	     当前类体
			 * @return 返回创建好的JS类
			 */
			defineClass:function(subClassName,superClass,prototype){
				var clzPath=subClassName.substr(0,subClassName.lastIndexOf('.'));
				var ns=Namespace.register(clzPath);
				var subClass=eval(subClassName + "=function(){};");
				
				waf.inherit(subClass,superClass);
				
				for(var p in prototype){
					eval(subClassName + ".prototype." + p.toString() + "=prototype." + p.toString());
				}
			},
			/**
			 * 描述: 创建对象
			 * @param {clazz} 创建该类的对象
			 */
			createObject:function(clazz){
				var obj=new clazz();
				if(clazz.superClass!=null){
					obj.superClass=clazz.superClass;
				}
				return obj;
			},
			/**
			 * 描述：获取URL所对应的参数数组
			 * @param {url} url 路径
			 * @return 返回URL后追加的参数数组
			 */
			getUrlParams:function(url){
			  var args=new Object();   
			  var query=location.search.substring(1);//获取查询串   
			  var pairs=query.split("&");//在逗号处断开   
			  for(var i=0;i<pairs.length;i++)   
			  {   
				  var pos=pairs[i].indexOf('=');//查找name=value   
				  if(pos==-1) continue;//如果没有找到就跳过   
				  var argname=pairs[i].substring(0,pos);//提取name   
				  var value=pairs[i].substring(pos+1);//提取value   
				  args[argname]=unescape(value);//存为属性   
			  }
			  return args;
			},
			/**
			 * 描述:获取当前页面的conversationid
			 * @return 获取当前页面的conversationid
			 */
			getConversationID:function(){
				return waf.conversationid;
			},
			/**
			 * 描述：设置当前页面的conversationid
			 * @param value of String conversation id
			 */
			setConversationID:function(value){
				waf.conversationid=value;
			},
			/**
			 * 描述:页面重定向，不建议直接使用document.location.href或document.location.replace等进行页面跳转
			 * @param url 重定向的url地址
			 */
			redirect:function(url,caption) {
				var newUrl=url;

				var conversationID=waf.getConversationID();
				if(conversationID==null){
					//newUrl=newUrl + "&conversationid=" + conversationID;
				}
				
				document.location.replace(newUrl);
			},
			/**
			 * 描述:获取当前语种标识
			 */
			 getContext:function() {
			 	if(waf.context==null){
			 		waf.context={AIS:null,currentCallerID:null,currentUserName:null,contextID:null,locale:null,readAIS:null,solution:null};
			 	}
			 	return waf.context;
			 },
			 /**
			  * 描述:创建上下文对象
			  */
			 createContext:function(contextID,AIS,currentCallID,currentUserName,locale,readAIS,solution) {
			 	waf.getContext().contextID=contextID;
			 	waf.getContext().AIS=AIS;
			 	waf.getContext().currentCallID=currentCallID;
			 	waf.getContext().currentUserName=currentUserName;
			 	waf.getContext().locale=locale;
			 	waf.getContext().readAIS=readAIS;
			 	waf.getContext().solution=solution;
			 },
			/**
			 * 描述:判断当前传递的json对象是否为多语种字段
			 */
			isMultiLangValue:function(json){
                if(!json || json == null) return false;
				if(json.l1!==undefined && json.l2!==undefined && json.l3!==undefined){
					return true;
				}
				if(json.L1!==undefined && json.L2!==undefined && json.L3!==undefined){
					return true;
				}
				return false;
			},
			/**
			 * 描述:判断当前传递的json对象是否为枚举类型
			 */
			isEnumValue:function(json){
                if(!json || json == null) return false;
				if(json.isenum!==undefined && json.alias!==undefined && json.value!==undefined){
					return true;
				}
				return false;
			},
			/**
			 * 描述:动态装载JS类库
			 * @param url js 文件 路径
			 */
			loadJSLibrary : function(url) {
				waf.getScript(url);
			},
			/**
			 * 描述：aop-通知类型-之前
			 * @param target 目标对象
			 * @param method 目标对象的类成员方法
			 * @param advice 切入逻辑
			 */
			acseptBefore:function(target,method, advice){
				waf.aop.before({target:target,method:method.toString()},advice);
			},
			/**
			 * 描述： aop-通知类型-之后
			 * @param target 目标对象
			 * @param method 目标对象的类成员方法
			 * @param advice 切入逻辑
			 */
			acseptAfter:function(pointcut,advice){
				waf.aop.after({target:target,method:method.toString()},advice);
			},
			/**
			 * 描述： aop-通知类型-重写
			 * @param target 目标对象
			 * @param method 目标对象的类成员方法
			 * @param advice 切入逻辑
			 */
			acseptAround:function(pointcut,advice){
				waf.aop.around({target:target,method:method.toString()},advice);
			},
			/**
			 * 描述:JS类方法调用代理
			 * @param method 方法名称
			 * @param clazz  JS类名称
			 * @param obj	 调用对象
			 */
			proxyCall:function(methodName,objectName){
				var fun=null;
				if(objectName==null){
					objectName="jsBinder";
				}
				if( typeof(methodName)=="object") {
					fun=methodName;
				}
				else {
					if(typeof(objectName)=="object"){
						//fun=eval(objectName.GetName() + "." + methodName);
					}
					else {
						fun=eval(objectName + "." + methodName);
					}
				}
				
				var paramArray=[];
				if(arguments.length>2) {
					paramArray=new Array();
					for(var nIndex=2;nIndex<arguments.length;nIndex++) {
						paramArray.push(arguments[nIndex]);
					}
				}
				fun.apply(jsBinder,paramArray);
			},
			/**
			 * 描述： 用于普通ajax提交 post方式
			 * @param option ajax提交的参数option对象
			 */
			doPost : function(option) {
				//拼接请求URL
				if(option.url==null){
					if(option.param!=null) {
						option.url="?method=" + option.action + "&" + option.param;
					}
					else {
						option.url="?method=" + option.action;
					}
				}
				
				//追加conversation id
				//option.url= option.url + "&conversationid=" + waf.getConversationID();

				//默认传输格式为json
				if(option.dataType==null){
					option.dataType="json"
				}
				
				//默认请求超时时间为ajaxTimeout
				if(option.timeout==null) {
					option.timeout=this.ajaxTimeout;
				}

				//默认提交方式为同步方式
				if(option.async==null){
					option.async=false;
				}

				var requestOption={
					url:option.url,
					data:option.data,
					/* 默认ajax数据交互格式为json */
					dataType:option.dataType,
					type:'POST',
					async:option.async,
					timeout:option.timeout,
					success:function(obj,textStatus){
						if(obj==null){
							option.success(null);
							return ;
						}
						if(obj.result=="success") {
							if(option.success!=null) {
								option.success(obj.data);
							}
						}
						else if(obj.result=="error") {
							if(option.error!=null){
								option.error(obj.summary,obj.detailInfo)
							}
							else {
								waf.msgBox.showError({ 		
								        	summaryMsg:obj.summary
								});
							}
						}
					},
					error:function(response, textStatus, errorThrown) {
						//todo:抛出异常处理框alert("出错了，详细如下:");
						var nExMsgStartIdx=response.responseText.indexOf("<title>");
						var nExMsgEndIdx=response.responseText.indexOf("</title>");
						var strErrorSummary=response.responseText.substr(nExMsgStartIdx+7,nExMsgEndIdx-nExMsgStartIdx-7);
						
						if(response.responseText.indexOf("WafBizException")>=0){
							waf.msgBox.showError({
								summaryMsg:strErrorSummary
							});
						}
						else {
							if(response.responseText.indexOf("waf error page flag")<=0 && response.responseText.indexOf("loginForm")>0){
								response.responseText="please login first!";
							}
							
							waf.msgBox.showError({
									   title:waf.localeResourceObj.ERROR_MSGBOX_TITLE,   		
									   summaryMsg:strErrorSummary,				
									   detailMsg:waf.localeResourceObj.ERROR_MSGBOX_DETAILMSG 		
							});
						}
					},
                    complete:function(jqXHR, textStatus){
                        if(option.complete && waf.isFunction(option.complete)){
                            option.complete.call(this, jqXHR, textStatus);
                        }
                    }
				};

				/* 提交 */
				return waf.ajax(requestOption);
			},
			/**
			 * 描述：用于普通ajax get方式提交
			 * @param option ajax提交的参数option对象
			 */
			doGet : function(option) {
				//拼接请求URL
				if(option.url==null){
					if(option.param!=null) {
						option.url="?method=" + option.action + "&" + option.param;
					}
					else {
						option.url="?method=" + option.action;
					}
				}
				
				//追加conversation id
				//option.url= option.url + "&conversationid=" + waf.getConversationID();
				
				//默认传输格式为json
				if(option.dataType==null){
					option.dataType="json"
				}

				//默认请求超时时间为ajaxTimeout
				if(option.timeout==null) {
					option.timeout=this.ajaxTimeout;
				}

				//默认提交方式为同步方式
				if(option.async==null){
					option.async=false;
				}

				var requestOption={
					url:option.url,
                    data:option.data,
					/* 默认ajax数据交互格式为json */
					dataType:option.dataType,
					type:'get',
					timeout:option.timeout,
					async:option.async,
					success:function(obj,textStatus){
						if(obj==null){
							option.success(null);
							return ;
						}
						if(obj.result=="success") {
							if(option.success!=null) {
								option.success(obj.data);
							}
						}
						else if(obj.result=="error") {
							if(option.error!=null){
								option.error(obj.summary,obj.detailInfo)
							}
							else {
								waf.msgBox.showError({ 		
								        	summaryMsg:obj.summary
								});
							}
						}
					},
					error:function(response, textStatus, errorThrown) {
						//todo:抛出异常处理框alert("出错了，详细如下:");
						var nExMsgStartIdx=response.responseText.indexOf("<title>");
						var nExMsgEndIdx=response.responseText.indexOf("</title>");
						var strErrorSummary=response.responseText.substr(nExMsgStartIdx+7,nExMsgEndIdx-nExMsgStartIdx-7);
						
						if(response.responseText.indexOf("WafBizException")>=0){
							waf.msgBox.showError({
								summaryMsg:strErrorSummary
							});
						}
						else {
							if(response.responseText.indexOf("waf error page flag")<=0 && response.responseText.indexOf("loginForm")>0){
								response.responseText="please login first!";
							}
							waf.msgBox.showError({
									   title:waf.localeResourceObj.ERROR_MSGBOX_TITLE,   		
									   summaryMsg:strErrorSummary,				
									   detailMsg:waf.localeResourceObj.ERROR_MSGBOX_DETAILMSG 		
							});
						}
					},
                    complete:function(jqXHR, textStatus){
                        if(option.complete && waf.isFunction(option.complete)){
                            option.complete.call(this, jqXHR, textStatus);
                        }
                    }
				};

				/* 提交 */
				return waf.ajax(requestOption);
			},
			/**
			 * 描述：用于表单提交
			 * @param option ajax提交的参数option对象
			 */
			doSubmit : function(option) {
				//拼接请求URL
				if(option.url==null){
					if(option.param!=null) {
						option.url="?method=" + option.action + "&" + option.param;
					}
					else {
						option.url="?method=" + option.action;
					}
				}

				//追加conversation id
				//option.url= option.url + "&conversationid=" + waf.getConversationID();

				//默认传输格式为json
				if(option.dataType==null){
					option.dataType="json";
				}

				//默认请求超时时间为ajaxTimeout
				if(option.timeout==null) {
					option.timeout=this.ajaxTimeout;
				}

				//默认表单名称为form
				if(option.form==null){
					option.form="form";
				}

				//默认提交方式为同步方式
				if(option.async==null){
					option.async=false;
				}

				var requestOption={
					url:option.url,
					data:option.data,
					/* 默认ajax数据交互格式为json */
					dataType:option.dataType,
					type:'POST',
					async:option.async,
					timeout:option.timeout,
					success:function(obj,textStatus){
						if(obj==null){
							option.success(null);
							return ;
						}
						if(obj.result=="success") {
							if(option.success!=null) {
								option.success(obj.data);
							}
						}
						else if(obj.result=="error") {
							if(obj.summary!=null){
								waf.msgBox.showError({
								        	summaryMsg:obj.summary
								});
							}
							else {
								waf.msgBox.showError({
								        	summaryMsg:"系统发生错误，请联系系统管理员!"
								});
							}
						}
					},
					error:function(response, textStatus, errorThrown) {
						//todo:抛出异常处理框alert("出错了，详细如下:");
						var nExMsgStartIdx=response.responseText.indexOf("<title>");
						var nExMsgEndIdx=response.responseText.indexOf("</title>");
						var strErrorSummary=response.responseText.substr(nExMsgStartIdx+7,nExMsgEndIdx-nExMsgStartIdx-7);
						
						if(response.responseText.indexOf("WafBizException")>=0){
							waf.msgBox.showError({
								summaryMsg:strErrorSummary
							});
						}
						else {
							if(response.responseText.indexOf("waf error page flag")<=0 && response.responseText.indexOf("loginForm")>0){
								response.responseText="please login first!";
							}
							waf.msgBox.showError({
									   title:waf.localeResourceObj.ERROR_MSGBOX_TITLE,   		
									   summaryMsg:strErrorSummary,				
									   detailMsg:waf.localeResourceObj.ERROR_MSGBOX_DETAILMSG 	
							});
						}
					}
				};
				/*报出提交事件 */
                $('#' + option.form).trigger("onSubmit");
				/* 提交 */
				$('#' + option.form).ajaxSubmit(requestOption);
			},
			/**
			 * 描述：对URL进行字符编码
			 * @param url url 路径
			 * @return 返回编码后的url串
			 */
			encodeURI: function(url){
				var f1=url.substring(0,url.indexOf("?"));
				if(f1=="")
					f1="?"
				var f2=url.substring(url.indexOf("?")+1);

				return encodeURI(f1) + encodeURIComponent(f2);
			},
			/**
			 * 描述: 对URL组成部门进行字符编码
			 * @param part url 组件/参数
			 * @return 返回编码后的url 组件串
			 */
			encodeURIComponent: function(part){
				var newPart=part.toString();
				newPart=newPart.replace("\\","\\\\");
				newPart=newPart.replace("\"","\\\"");
				newPart=newPart.replace("\'","\\\\");
				return encodeURIComponent(newPart);
			},
			/**
			 * 描述: 将字符串转换为JSON
			 * @param jsonStr of String 转换的jsonStr字符串
			 */
			toJSONObject : function(jsonStr){
				return waf.secureEvalJSON(jsonStr);
			},
			/**
			 * 描述: 将字符对象转换为字符串
			 * @param object of object 将要转换的js对象
			 * @return 返回转换后的json字符串
			 */
			toJSONString : function(object) {
				return waf.toJSON(object);
			},
			/**
			 * 描述:普通URL查询字符串转换为JSON
			 * @param tourl 待转换的url路径
			 * @return 返回转换后的JSON串 
			 */
			convertQueryStrToJson:function(tourl){
				if(!tourl)return null;
					var paramsArr=tourl.split('?')[1].split('&');    
				    var args={},argsStr=[],param,name,value;
				   	args['url']=encodeURIComponent(tourl.split('?')[0]); //首先载入url,问号"?"前面的部分
				    for(var i=0;i<paramsArr.length;i++){
					   param=paramsArr[i].split('=');
					   name=param[0],value=param[1];
					   if(name=="")name="unkown";
					   if(typeof args[name]=="undefined"){ //参数尚不存在
					    args[name]=value;
					   }else if(typeof args[name]=="string"){ //参数已经存在则保存为数组
					    args[name]=[args[name]];
					    args[name].push(value);
					   }else{ //已经是数组的
					    args[name].push(value);
					   }
				    }
				    var showArg=function(x){   //转换不同数据的显示方式
				        if(typeof(x)=="string"&&!/\d+/.test(x)) return "'"+x+"'";   //字符串
				        if(x instanceof Array) return "["+x+"]"; //数组
				        return x;   //数字
				    }
				    args.toString=function(){//组装成json格式
				        for(var i in args) argsStr.push(i+':'+showArg(args[i]));
				        return '{'+argsStr.join(',')+'}';
				    }
				    
				    return args; //以json格式返回获取的所有参数
			},
			/**
			 * 描述: conversation处理,拦载所有的http请求，追加当前页面的conversation id
			 * @return 无
			 */
			conversationProcess:function(){
					//静态更新
					waf("iframe").each(function(){
						var url=waf(this).attr("src");
						if(url!=null){
							url=waf.appendConversationToURL(url);
							waf(this).attr("src",url);
						}
					});
			},
			/**
			 * 描述:追加conversationid处理
			 * @param dom attribute对象
			 * @return 无
			 */
			appendConversationToAttr:function(attr){
				if(attr.value!=null){
					if(attr.value.indexOf("conversationid")<0){
						if(attr.value.indexOf("?")<0){
							attr.value=attr.value + "?";
						}
						attr.value = attr.value + "&conversationid=" + conversationid;
					}
				}
			},
			/**
			 * 描述:追加conversationid处理
			 * @param url url路径
			 * @return 无
			 */
			appendConversationToURL:function(url){
				if(waf.conversationid==null) 
					return url;
					
				if(url!=null){
					if(url.indexOf("conversationid")<0){
						if(url.indexOf("?")<0){
							url=url + "?";
							url=url + "conversationid=" + waf.getConversationID();
						}
						else {
							url = url + "&conversationid=" + waf.getConversationID();
						}
					}
				}
				return url;
			},
			/**
			 * 描述：获取页面根路径
			 * @return 返回页面根路径 如:http://{domain}:{port}/{当前应用实例名称}
			 */
			getContextPath:function(){
				var href=window.location.href;
				var host=window.location.host;
				var origin=document.location.origin;
				var f1=href.substring(href.indexOf(host))
				var f2=f1.substring(f1.indexOf("/"));
				var root=f2.split("/");
				return "/" + root[1];
			},
			
			/**
			 * 描述:打开模态窗口
			 * @param {} url
			 */
			openModalDialog:function(url,arguments,parameter) {
				return window.showModalDialog(url,arguments,parameter);
			},
			/** 
			 * 描述:打开浏览器窗口
			 * @return 无
			 */
			openNativeWindow:function(url,title,height,width,top,left,menubar,toolbar,scrollbars,resizable,location,status){
				//如果未人工指定上左位置,则默认为居中展现
				var param="";

				//设定默认值
				if(height==null) {
					height=600;
				} 
				param=param + "height=" + height + ",";

				if(width==null)
					width=800;
				param=param + "width=" + width + ",";

				if(top==null)
					top=(window.screen.availHeight-30-height)/2 + ","; 
				param=param + "top=" + top + ",";

				if(left==null)
					left=(window.screen.availWidth-30-width)/2 + ",";
				param=param + "left=" + left + ",";

				if(toolbar==null)
					toolbar="no";
				param=param + "toolbar=" + toolbar + ",";

				if(menubar==null)
					menubar="no";
				param=param + "menubar=" + menubar + ","

				if(scrollbars==null)
					scrollbars="no";
				param=param + "scrollbars=" + scrollbars + ",";

				if(resizable==null)
					resizable="no";
				param=param + "resizable=" + resizable + ",";

				if(location==null)
					location="no";
				param=param + "location=" + location + ",";

				if(status==null)
					status="no";
				param=param + "status=" + status + ",";
				
				//追加conversationid处理
				if(url.indexOf("conversationid")<0) {
					if(url.indexOf("?")<0) {
						url = url + "?";
					}
					url = url + "&conversationid=" + waf.getConversationID();
				}

				window.open (url, title,param);	
			}
});