<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<!DOCTYPE html>
<html>
<head>
    <style>
        #next:hover{
            background: black;
        }
        @-webkit-keyframes jaehee {
            100% {
                top:100px;
            }
            0% {
                top:300px;
            }
        }

        @-webkit-keyframes heejae {
            100% {
                right:100px;
            }
            0% {
                right:300px;
            }
        }
        header
        {
            position: fixed;
            z-index: 455555;
            left: 0;
            right: 0;
            top: 0;
            height: 3rem;
            background: #000000;
            line-height: 3rem;
            text-align: center;
            color: #FFFFFF;
        }
        .dropdown{
            position : relative;
            display : inline-block;
        }

        .dropbtn_icon{
            font-family : 'Material Icons';
        }
        .dropbtn{
            border : 1px solid #000000;
            border-radius : 4px;
            background-color: #000000;
            font-weight: 400;
            color : #ececec;
            padding : 5px;
            width :200px;
            text-align: left;
            cursor : pointer;
            font-size : 15px;
        }
        .dropdown-content{
            display : none;
            position : absolute;
            z-index : 1; /*다른 요소들보다 앞에 배치*/
            font-weight: 400;
            background-color: #f9f9f9;
            min-width : 200px;

        }
        @font-face {
            font-family: 'nana';
            src: url("../font/GowunDodum-Regular.ttf");
        }
        @font-face {
            font-family: 'zeze';
            src: url("../font/Sunflower-Light.ttf");
        }
        .dropdown-content a{
            display : block;
            text-decoration : none;
            color : rgb(37, 37, 37);
            font-size: 12px;
            padding : 12px 20px;
        }

        .dropdown-content a:hover{
            background-color : #ececec
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        #next:hover{
            background: black;
        }
        meun
        {
            position: fixed;
            left: 0;
            right: 0;
            top: 500px;
            height: 100px;
            background: #aaaaff;
            line-height: 55px;
            text-align: center;
            color: #FFFFFF;
        }
        #contents
        {
            position: fixed;
            top: 4rem;
            left: 0;
            right: 0;
            bottom: 0;
            overflow: auto;
        }
        table {
            font-family:nana;
            width: 100%;
            border-top: 1px solid #444444;
            border-collapse: collapse;
        }
        th, td {
            font-family:nana;
            border-bottom: 1px solid #c8dbd9;
            padding: 10px;
            text-align: center;
        }


        @font-face {
            font-family: 'me';
            src: url("../../font/GowunBatang-Bold.ttf");
        }

    </style>
</head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/js/jquery-latest.js"></script>
<script>

</script>
<header style="font-family: me;">
    연락처 관리
</header>

<form id="search" name="search" method="GET" action="/contactname">
    <%--            <input type="text" maxlength="3" id="name" name="name" placeholder="검색할 대상" onfocus="this.placeholder=''" onblur="this.placeholder='검색할 대상'" style="top:56px; position: relative; left:4%; color:slategray; font-weight: bold; text-align: center; width:6%; line-height:25px;" value=""/>
                <button id="btnContact" class="btnContact" onclick="change_Chack(name)" style="background-color:black; top:56px; left:4%; color: #FFFFFF; position: relative;" >검색</button>--%>
        <div class="dropdown" style="position:fixed; font-family: me; top:48px;  z-index: 1585858585858585399; right:3px; text-align: left; width: 120px; height: 55px;">
            <button class="dropbtn" tabindex="-1" style="position:fixed;    top:7px; right:10px; width: 60px; height: 35px;">
                <span class="dropbtn_icon " ><a style="font-weight: bold; font-family: me;">MEUN</a></span>
            </button>
            <div class="dropdown-content">
                <a href="/sms" style="font-family: me;">-메인</a>
                <a href="/contact" style="font-family: me;">-수신자 등록</a>
                <a href="/otherGroup" style="font-family: me;">-기존그룹</a>
            </div>
        </div>
</form>
<a type="text"> </a>
<input type="hidden" id='size' value=${size}/>
<a style=" position: absolute; top:5.5%; font-family:nana; left:0.5%; font-weight: bold; ">총 건수 : ${size}<a>
    <table style="position: relative; font-family:nana; top:80px;">
        <thead>
        <tr>
            <th style="width: 20%; font-family:nana;" id="cssTh">부서 등록</th><th id="cssTh1">부서</th><th>이름</th><th>전화번호</th><th>등록</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <c:if test = "${test eq null}" >
            <td id="tdCss">
                <input type="text" oninput="groupname1(this)" maxlength="12" id="groupname1" name="groupname1" placeholder="그 룹" onfocus="this.placeholder=''" onblur="this.placeholder='그 룹'" style="font-size:15px;  font-family:nana;  width:80px; top:48px; color:slategray; font-weight: bold; text-align: center; height:25px;" value=""/>
                <input type="radio" id = "radio" name="group" value="new"/>

            </td >
            <td id="tdCss1">
                <select id="groupBox" style="font-size:17px; font-family:nana; ">
                    <option value="" >전체</option>
                    <c:forEach var="group" items="${listgroup}" varStatus="status">
                        <option value=${group.groupnm}>${group.groupname}</option>
                    </c:forEach>
                </select>
                <input type="radio" name="group" checked="checked" value="old" />
            </td >
            <td>  <input type="text" maxlength="6" id="name1" name="name1" placeholder="이 름" onfocus="this.placeholder=''" onblur="this.placeholder='이 름'" style="font-size:15px;top:48px;  font-family:nana;  width:100px; color:slategray; font-weight: bold; text-align: center; height:28px;" value=""/></td>
            <td> <input type="text" oninput="inputNumberOnly(this)" maxlength="12" id="number1" name="number1" placeholder="전 화 번 호" onfocus="this.placeholder=''" onblur="this.placeholder='전 화 번 호'" style="font-size:15px;  font-family:nana;  width:190px; top:48px; color:slategray; font-weight: bold; text-align: center;  height:28px;" value=""/></td>
            <td> <button id="btnIsert" class="btnIsert" style="background-color:black; left:0%; font-family:nana; color: #FFFFFF; font-size:15px;  position: relative;" >등록</button></td>
        </tr>
        </c:if>
        <c:if test = "${snull != null}" >
            <a style="text-align: center; left:45%; position: absolute; top:20%; color:darkgrey; font-size: 35px;"> 검색 결과 없음 </a>
        </c:if>
        <c:forEach var="data" items="${list}" varStatus="status">
            <tr>
                <td id="tdCssOthder"></td>
                <td id ="tdCssOthder1">${data.groupname}</td>
                <td>${data.name}</td>
                <td>
                    <input type="button" id ="next" name ="next" onclick="change_Update(value);" style="border-style:none;  font-family:zeze; color:slategray; font-size: 19px; font-weight: bold; text-align: center;" value="${data.number}"/>

                </td>
                <td></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</a>
</html>
<script charset="UTF-8">

    const target = document.getElementById('groupname1');
    target.disabled = true;

    function change_Update(value) {
        window.open ( "/userupdate"+"/"+value,'tistory','width=400, height=320, scrollbars=no, resizable=no, toolbars=no, menubar=no')


    }
    function inputNumberOnly(el) {
        el.value = el.value.replace(/[^0-9]/g, '');
    }
    function change_Chack(name) {

        alert("검색완료 되었습니다.");

    }

    $('input[name=group]').click(function() {
        var listVar = $('input[name=group]:checked').val();

        if(listVar=='old'){
            const target = document.getElementById('groupname1');
            target.disabled = true;
            const targetNew = document.getElementById('groupBox');
            targetNew.disabled = false;
            /*            $('#cssTh').css( 'background-color', '#6E6E6E' );
                        $('#cssTh').css( 'color', '#FFFFFF' );
                        $('#tdCss').css( 'background-color', '#6E6E6E' );
                        $("tr>#tdCssOthder").css( 'background-color', '#6E6E6E');
                        $('#cssTh1').css( 'background-color', '#FFFFFF' );
                        $('#tdCss1').css( 'background-color', '#FFFFFF' );
                        $("tr>#tdCssOthder1").css( 'background-color', '#FFFFFF');*/

        }else if(listVar=='new'){
            const target = document.getElementById('groupBox');
            target.disabled = true;
            const targetOld = document.getElementById('groupname1');
            targetOld.disabled = false;

            /*
                        $('#cssTh').css( 'background-color', '#FFFFFF' );
                        $('#cssTh').css( 'color', '#000' );
                        $('#tdCss').css( 'background-color', '#FFFFFF' );
                        $("tr>#tdCssOthder").css( 'background-color', '#FFFFFF');
                        $('#cssTh1').css( 'background-color', '#000' );
                        $('#tdCss1').css( 'background-color', '#000' );
                        $("tr>#tdCssOthder1").css( 'background-color', '#000');
            */

        }

    })

    $('#btnIsert').click(function(number1,number2,number3,name,namee,no1) {
        var listVar = $('input[name=group]:checked').val();
        var groupnm = $('#groupBox option:selected').val();
        var groupnameNew = $('#groupname1').val();
        var number = $('#number1').val();
        var name = $('#name1').val();
        var groupname = $("#groupBox :selected").text();

        if(listVar=='old'){

            $.ajax({
                type: "POST",
                url: "/updateOld",
                dataType: "text",
                data: {"groupnm":groupnm,"number":number,"name":name,"groupname":groupname},
                beforeSend : function(xhr,opts) {
                    if(groupnm==""){ alert("그룹을 확인해주세요");
                        xhr.abort();}
                    //STOP
                },
                success: function(result){
                    if(result!=null) {
                        alert("성공적으로 데이터가 수정되었습니다.");
                        location.href="contact"
                    }
                    else if(result==null) {
                        alert("데이터를 확인해주세요");
                        location.href="contact"
                    }
                },
                fail: function(){
                    alert("실패하였습니다.");
                    location.href="contact"
                },
                error:function(e){
                    alert("데이터를 확인해주세요");}

            });
        }else if(listVar=='new'){
            $.ajax({
                type: "POST",
                url: "/updateNew",
                dataType: "text",
                data: {"number":number,"name":name,"groupnameNew":groupnameNew},
                beforeSend : function(xhr,opts) {
                    if(groupnameNew==""){ alert("그룹을 확인해주세요");
                        xhr.abort();}
                    //STOP
                },
                success: function(result){
                    if(result!=null) {
                        alert("성공적으로 데이터가 수정되었습니다.");
                        location.href="contact"
                    }
                    else if(result==null) {
                        alert("데이터를 확인해주세요");
                        location.href="contact"
                    }
                },
                fail: function(){
                    alert("실패하였습니다.");
                    location.href="contact"
                },
                error:function(e){
                    alert("데이터를 확인해주세요");}

            });

        }

    });

</script>