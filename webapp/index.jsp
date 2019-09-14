<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>后台管理系统</title>
		<link rel="stylesheet" href="${ctx}/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${ctx}/css/main.css" media="all" />
		<script type="text/javascript" src="${ctx}/layui/layui.js"></script>
		<script type="text/javascript" src="${ctx}/js/index.js"></script>
		<script>  
        var ctx = "${ctx}";  
   	 	</script>
		<script type="text/javascript">
		   	 function navBar(strData){
		   		var data;
		   		if(typeof(strData) == "string"){
		   			var data = JSON.parse(strData); //部分用户解析出来的是字符串，转换一下
		   		}else{
		   			data = strData;
		   		}	
		   		var ulHtml = '<ul class="layui-nav layui-nav-tree">';
		   		for(var i=0;i<data.length;i++){
		   			if(data[i].spread){
		   				ulHtml += '<li class="layui-nav-item">';
		   			}else{
		   				ulHtml += '<li class="layui-nav-item layui-nav-itemed">';
		   			}
		   			if(data[i].children != undefined && data[i].children.length > 0){
		   				ulHtml += '<a href="javascript:;">';
		   				if(data[i].icon != undefined && data[i].icon != ''){
		   					if(data[i].icon.indexOf("icon-") != -1){
		   						ulHtml += '<i class="iconfont '+data[i].icon+'" data-icon="'+data[i].icon+'"></i>';
		   					}else{
		   						ulHtml += '<i class="layui-icon" data-icon="'+data[i].icon+'">'+data[i].icon+'</i>';
		   					}
		   				}
		   				ulHtml += '<cite>'+data[i].title+'</cite>';
		   				ulHtml += '<span class="layui-nav-more"></span>';
		   				ulHtml += '</a>';
		   				ulHtml += '<dl class="layui-nav-child">';
		   				for(var j=0;j<data[i].children.length;j++){
		   					if(data[i].children[j].target == "_blank"){
		   						ulHtml += '<dd><a href="javascript:;" data-url="'+data[i].children[j].href+'" target="'+data[i].children[j].target+'">';
		   					}else{
		   						ulHtml += '<dd><a href="javascript:;" data-url="'+data[i].children[j].href+'">';
		   					}
		   					if(data[i].children[j].icon != undefined && data[i].children[j].icon != ''){
		   						if(data[i].children[j].icon.indexOf("icon-") != -1){
		   							ulHtml += '<i class="iconfont '+data[i].children[j].icon+'" data-icon="'+data[i].children[j].icon+'"></i>';
		   						}else{
		   							ulHtml += '<i class="layui-icon" data-icon="'+data[i].children[j].icon+'">'+data[i].children[j].icon+'</i>';
		   						}
		   					}
		   					ulHtml += '<cite>'+data[i].children[j].title+'</cite></a></dd>';
		   				}
		   				ulHtml += "</dl>";
		   			}else{
		   				if(data[i].target == "_blank"){
		   					ulHtml += '<a href="javascript:;" data-url="'+data[i].href+'" target="'+data[i].target+'">';
		   				}else{
		   					ulHtml += '<a href="javascript:;" data-url="'+data[i].href+'">';
		   				}
		   				if(data[i].icon != undefined && data[i].icon != ''){
		   					if(data[i].icon.indexOf("icon-") != -1){
		   						ulHtml += '<i class="iconfont '+data[i].icon+'" data-icon="'+data[i].icon+'"></i>';
		   					}else{
		   						ulHtml += '<i class="layui-icon" data-icon="'+data[i].icon+'">'+data[i].icon+'</i>';
		   					}
		   				}
		   				ulHtml += '<cite>'+data[i].title+'</cite></a>';
		   			}
		   			ulHtml += '</li>';
		   		}
		   		ulHtml += '</ul>';
		   		return ulHtml;
		   	}

   	 	</script>
    </head>
    <body>
    	<body class="layui-layout-body">
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header" >
				<div class="layui-main">
					<a href="#" class="logo">后台管理系统</a>
					<!-- 显示/隐藏菜单 -->
					<a href="#" ></a>
					<!-- 顶部右侧菜单 -->
					<ul class="layui-nav layui-layout-right">
						<li class="layui-nav-item" id="showNotice">
							<a href="#">系统公告</a>
						</li>
						<li class="layui-nav-item">
							<a href="#" class="mobileAddTab" data-url="${ctx }/sys/changePwd">修改密码</a>
						</li>
						<li class="layui-nav-item">
							<a href="${ctx }/sys/loginOut" class="signOut">退出</a>
						</li>
						<li class="layui-nav-item">
							<a href="#">
								<i class="layui-icon">&#xe612;</i>
								<shiro:principal property="fullname"/>
							</a>
							<dl class="layui-nav-child">
								<dd><a href="#" data-url="${ctx }/sys/personalData">个人资料</a></dd>
								<dd><a href="#" data-url="${ctx }/sys/changePwd">修改密码</a></dd>
								<dd><a href="${ctx }/sys/loginOut" class="signOut">退出</a></dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
			<!-- 左侧导航 -->
			<div class="layui-side layui-bg-black">
				<div class="navBar"></div>
			</div>
			<!-- 右侧内容 -->
    <div class="layui-body layui-form">
        <div class="layui-tab marg0" lay-filter="bodyTab" id="top_tabs_box">
            <ul class="layui-tab-title top_tab" id="top_tabs">
                <li class="layui-this" lay-id=""><i class="iconfont1 icon-tianchongxing-"></i><cite>&nbsp;后台首页</cite></li>
            </ul>
            <!-- 当前页面操作 -->
            <ul class="layui-nav closeBox">
                <li class="layui-nav-item" pc>
                    <a href="javascript:;"><i class="iconfont1 icon-caozuo"></i> 页面操作</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#x1002;</i> 刷新当前</a></dd>
                        <dd><a href="javascript:;" class="closePageOther"><i class="iconfont1 icon-jujue"></i> 关闭其他</a></dd>
                        <dd><a href="javascript:;" class="closePageAll"><i class="iconfont1 icon-guanbi"></i> 关闭全部</a></dd>
                    </dl>
                </li>
            </ul>
            <div class="layui-tab-content clildFrame">
                <div class="layui-tab-item layui-show">
                    <iframe src="${ctx}/sys/main"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
			<!-- 移动导航 -->
			<div class="site-tree-mobile layui-hide"><i class="layui-icon">&#xe602;</i></div>
			<div class="site-mobile-shade"></div>

			<div class="layui-footer">底部</div>
 	</body>
</html>