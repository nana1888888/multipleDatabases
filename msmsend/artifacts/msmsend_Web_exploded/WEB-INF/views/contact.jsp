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
            width: 100%;
            border-top: 1px solid #444444;
            border-collapse: collapse;
        }
        th, td {
            border-bottom: 1px solid #c8dbd9;
            padding: 10px;
            text-align: center;
        }
    </style>
</head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script>

    </script>
<header>
    연락처 관리
</header>
<form id="search" name="search" method="GET" action="/contactname">
            <input type="text" maxlength="3" id="name" name="name" placeholder="검색할 대상" onfocus="this.placeholder=''" onblur="this.placeholder='검색할 대상'" style="top:56px; position: relative; left:4%; color:slategray; font-weight: bold; text-align: center; width:6%; line-height:25px;" value=""/>
            <button id="btnContact" class="btnContact" onclick="change_Chack(name)" style="background-color:black; top:56px; left:4%; color: #FFFFFF; position: relative;" >검색</button>

</form>
<a type="text"> </a>
        <a style=" position: absolute; top:9%; left:16%; font-weight: bold; ">총 건수 : ${size}<a>
            <table style="position: relative; top:80px;">
                <thead>
                  <tr>
                     <th>부서</th><th>이름</th><th>전화번호</th><th>기타</th>
                   </tr>
                </thead>
                <tbody>
                <tr>
                    <c:if test = "${test eq null}" >
                    <td>
                        <select name="groupname" style="font-size:15px; text-align: center; left: 8%; height:28px; position: absolute; top:46px;">
                        <option value="전산실">전산실</option>
                        <option value="경영정보부">경영정보부</option>
                        <option value="기타">기타</option>
                    </select></td >
                    <td>
                         <input type="text" maxlength="6" id="name1" name="name1" placeholder="이 름 입 력" onfocus="this.placeholder=''" onblur="this.placeholder='이 름 입 력'" style="font-size:15px;left: 27%; position: absolute; top:48px; color:slategray; font-weight: bold; text-align: center; width:10%; height:28px;" value=""/></td>
                    <td> <input type="text" oninput="inputNumberOnly(this)" maxlength="12" id="number1" name="number1" placeholder="전 화 번 호" onfocus="this.placeholder=''" onblur="this.placeholder='전 화 번 호'" style="font-size:15px; left: 53%; position: absolute; top:48px; color:slategray; font-weight: bold; text-align: center; width:20%; height:28px;" value=""/></td>
                    <td> <button id="btnIsert" class="btnIsert" style="background-color:black; left:0%; color: #FFFFFF; position: relative;" >등록</button></td>
                </tr>
                </c:if>
                <c:if test = "${snull != null}" >
                    <a style="text-align: center; left:45%; position: absolute; top:20%; color:darkgrey; font-size: 35px;"> 검색 결과 없음 </a>
                </c:if>
                    <c:forEach var="data" items="${list}" varStatus="status">
                        <tr>
                            <td>${data.groupName}</td>
                            <td>${data.name}</td>
                            <td>
                                <input type="button" id ="next" name ="next" onclick="change_Update(value);" style="border-style:none; color:slategray; font-size: 19px; font-weight: bold; text-align: center;" value="${data.number}"/>

                            </td>
                           <td></td>
                        </tr>
                     </c:forEach>
                </tbody>
            </table>
        </a>
</html>
<script charset="UTF-8">
    function change_Update(value) {
        window.open ( "/userupdate"+"/"+value,'tistory','width=400, height=320, scrollbars=no, resizable=no, toolbars=no, menubar=no')


    }
    function inputNumberOnly(el) {
        el.value = el.value.replace(/[^0-9]/g, '');
    }
    function change_Chack(name) {

      alert("검색완료 되었습니다.");

    }


    $('#btnIsert').click(function(number1,number2,number3,name,namee,no1) {
        var number=$('input[name=number1]').val()
        var name=$('input[name=name1]').val()
        var namee=$('input[name=name1]').val()
        var no1=$('input[name=no1]').val()
        var groupname=$('select[name=groupname]').val()
        var type="insert"

        if(number == "--" && namee == "") {
            alert("값을 확인하세요"); return;
        }
        if(number == ""  && number == null) {
            alert("값을 확인하세요"); return;
        }

        /*alert(number); 들어온 전화번호 확인용*/
        $.ajax({
            type: "GET",
            url: "/update",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
            },
            contentType: "application/json; charset=UTF-8",
            dataType: "json",
            cache: false,
            xhrFields: { withCredentials: true},
            data: {type:type,number:number,name:name,namee:namee,no1:no1,groupname:groupname},
            beforeSend : function(jqXHR, settings) {

            },
            complete : function() {

            },
            success: function(data){
                if(data!=null) {
                    alert("성공적으로 데이터가 수정되었습니다.");
                    location.href="contact"
                }
                else if(data==null) {
                    alert("데이터를 확인해주세요");
                    location.href="contact"
                }
            },
            fail: function(){
                alert("실패하였습니다.");
                location.href="contact"
            },
            error:function(e){	      alert("데이터를 확인해주세요");}

        });
    });

</script>