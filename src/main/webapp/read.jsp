<%--
  Created by IntelliJ IDEA.
  User: gmk
  Date: 2016/3/31
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <style>
      body{
          background-image:url("/static/img/bg.jpg");
      }
    </style>
</head>
<body>
<div class="container">
    <button id="idea" class="btn btn-primary">READ XML</button>
    <table class="table">
        <thead class="">
        <tr>
            <th>id</th>
            <th>name</th>
            <th>price</th>
            <th>number</th>
        </tr>
        </thead>
        <tbody id="contain">

        </tbody>
    </table>
</div>
<script>
    (function () {
        function createxmldata() {
            var xmlHttp = null;
            if (Window.ActiveXObject) {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            } else {
                xmlHttp = new XMLHttpRequest();
            }
            return xmlHttp;
        }

        document.querySelector("#idea").onclick = function () {
            var xmlHttp = createxmldata();
            xmlHttp.open("get", "/product.xml", true);
            // 回调
            xmlHttp.onreadystatechange = function () {
                var readystate = xmlHttp.readyState;
                if (readystate == 4) {
                    if (xmlHttp.status == 200) {
                        document.querySelector("#contain").innerHTML="";
                        var xmldoc = xmlHttp.responseXML;
                        var products = xmldoc.getElementsByTagName("product");
                        for (var i = 0; i < products.length; i++) {
                            var product = products[i];
                            var id = product.getAttribute("id");
                            var name = product.getElementsByTagName("name")[0].childNodes[0].nodeValue;
                            var price = product.getElementsByTagName("price")[0].childNodes[0].nodeValue;
                            var number = product.getElementsByTagName("num")[0].childNodes[0].nodeValue;
                            add(id, name, price, number);
                        }
                    } else {
                        alert("服务器错误" + xmlHttp.status);

                    }
                }
            }
            xmlHttp.send();
        }
        function add(id, name, price, number) {
            var tr = document.createElement("tr");
            var idTd = document.createElement("td");
            var nameTd = document.createElement("td");
            var priceTd = document.createElement("td");
            var numberTd = document.createElement("td");

            var idTestnode = document.createTextNode(id);
            var nameTestnode =document.createTextNode(name);
            var priceTestnode = document.createTextNode(price);
            var nmuTestnode = document.createTextNode(number);

             idTd.appendChild(idTestnode);
             nameTd.appendChild(nameTestnode);
             priceTd.appendChild(priceTestnode);
             numberTd.appendChild(nmuTestnode);

            tr.appendChild(idTd);
            tr.appendChild(nameTd);
            tr.appendChild(priceTd);
            tr.appendChild(numberTd);

            document.getElementById("contain").appendChild(tr);
        }
    })()
</script>
</body>
</html>
