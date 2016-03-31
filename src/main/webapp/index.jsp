<%--
  Created by IntelliJ IDEA.
  User: gmk
  Date: 2016/3/30
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    .error{
        color: red;
    }
    .hide{
        display: none;
    }
</style>
<body>
<input type="text" id="name"><span class="error hide" id="Test">该账号已被占用</span>
<script>

    (function(){
        function  createxml(){
  var xmlHttp =null;
        if(Window.ActiveXObject){
       var  xmlHttp =new AbstractView("Microsoft.XMLHTTP");
        }else {
            var xmlHttp = new XMLHttpRequest();
        }
        return xmlHttp;
        }
        document.querySelector("#name").onchange=function(){
         //   获取对象
         var xmlHttp=createxml();
            // 指定请求地址和方式
            xmlHttp.open("post","/home.do",true);
            xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
            //设置回调函数
              xmlHttp.onreadystatechange=function(){
                var readyState = xmlHttp.readyState;
                  if (readyState==4){
                      var   servercode = xmlHttp.status;
                      if (servercode==200){
                          //接收服务器端返回的值
                          var  result = xmlHttp.responseText;
                          if(result==0){
                              document.querySelector("#test").style.display="inline";
                          }
                      }else {
                           alert("服务器错误"+ servercode)
                      }
                  }
            }
            var name = document.querySelector("#name").value;
            xmlHttp.send("name="+name);
        }
    })();
</script>
</body>
</html>
