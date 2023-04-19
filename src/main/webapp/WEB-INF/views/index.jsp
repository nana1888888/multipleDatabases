<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>

<!DOCTYPE html>

<html>

<head>

    <style>
        table {
            border-collapse: collapse;
            text-align: left;
            line-height: 1px;
            border-top: 1px solid #ccc;
            border-left: 1px solid #ccc;
            /*   margin : 10px 10px;*/
        }
        th {
            padding: 12px;
            position: sticky;
            top:0px;
            font-weight: bold;
            text-align: center;
            vertical-align: top;
            font-weight: bold;
            /*font-weight: normal;*/
            background-color: black;
            color: #FFFFFF;
            font-size: 17px;
            border-right: 1px solid #ccc;
            border-bottom: 1px solid #ccc;

        }
        select::-ms-expand {
            display: none;
        }
        select {
            -o-appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            width: 100px;
            height: 25px;
            background-color: #F3F2F5;
            background-size: 20px;
            font-size: 10px;
            padding: 1px;
            border-radius: 4px;
            border:1px solid #6E6E6E;
            outline: 0 none;
        }
        select option {
            background: #6E6E6E;
            color: #fff;
            padding: 3px 0;
        }
        td {

            padding: 10px;
            vertical-align: top;
            border-right: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
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
            color : #C3C0D7;
            padding : 5px;
            width :200px;
            text-align: left;
            cursor : pointer;
            font-size : 17px;
        }
        .dropdown-content{
            display : none;
            position : absolute;
            z-index : 1; /*다른 요소들보다 앞에 배치*/
            font-weight: 400;
            background-color: #f9f9f9;
            min-width : 200px;

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

        #next1:hover{
            background: black;
        }
        .swal-button
        {
            background-color: #00284c;
            font-size: 12px;
            text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
        }
        .swal-text{
            font-family: nana;
        }

        header
        {
            position: fixed;
            left: 0;
            right: 0;
            top: 0;
            height: 3rem;
            background: #000000;
            line-height: 3rem;
            text-align: center;
            color: #FFFFFF;

        }
        @-webkit-keyframes jaehee {
            100% {
                top:100px;
            }
            0% {
                top:300px;
            }
        }
        @font-face {
            font-family: 'nana';
            src: url("../../font/GowunDodum-Regular.ttf");
        }
        @font-face {
            font-family: 'zeze';
            src: url("../../font/IBMPlexSansKR-Light.ttf");
        }
        @font-face {
            font-family: 'me';
            src: url("../../font/GowunBatang-Bold.ttf");
        }

    </style>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script src="../js/jquery-3.4.1.min.js">
    </script>

</head>
<%--   Z index 순서 2--%>
<header style="z-index: 15858585858585858; font-family: me;">
    장애보고 카톡 발송
</header>

<meta id="_csrf" name="_csrf" th:content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/js/jquery-latest.js"></script>
<script type="text/javascript" src="/js/tablesorter.js"></script>
<script src="/js/alert.js"></script>
<body id="commonBody">
<div id="wrap">

    <%--   Z index 순서 1--%>
    <%--    <input type="button" id ="menu" name ="menu"  style="border-style:none; font-size: 15px; z-index: 158585858585858538; position:fixed; color:slategray; top:15px; right:1%; font-weight: bold; text-align: center;" value="menu" />--%>
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

    <%--   <div id = "menuText" name= "menuText"style="position:fixed;  font-weight: bold; display: none; background-color: black; top:35px;  z-index: 1585858585858585399; right:1%; text-align: left; padding: 10px; width: 120px; height: 55px;">
            <a style="color: #cccccc; font-size: 13px; padding: 3px;" href="/sms">-메인</a><br>
               <a style="color: #cccccc; font-size: 13px; padding: 3px;" href="/contact">-수신자 등록</a><br>
   &lt;%&ndash;            <a style="color: #cccccc; font-size: 13px; padding: 3px;" href="/othergroup" onClick="window.open(this.href, '', 'width=400, height=430'); return false;">-기타그룹 등록</a><br>&ndash;%&gt;
       </div>--%>

    <button type="button" onclick="existingSelectUp(this)" style="top:8%; border-style:none; background-color:#BDBDBD; position:fixed; left:725px; font-size:13px;  height:22px; font-family: nana; font-weight: bold; color:#ffffff;">기존 그룹</button>
    <button type="button" onclick="obstacleSelectUp(this)" style="top:8%; border-style:none; background-color:#BDBDBD; position:fixed; left:655px; font-size:13px; height:22px; font-family: nana; font-weight: bold; color:#ffffff;">장애 보고</button>
    <form id="frm" name="frm" method="POST" action="/send">
        <input type="hidden" id ="type" name ="type" value=${type} ;/>

        <input type="hidden" id ="selectValue" name ="selectValue" value = ${groupType} ;/>
        <input type="hidden" id ="sendText" name ="sendText" value = ${text} ;/>

        <a style="left:435px; color:#000000; font-size:15px; position:fixed; top:8%; font-family: nana;">이름 검색</a>
        <input onkeyup="filter()" type="text" id="value" placeholder="name to Search" style=" position:fixed;  width:97px; top:8%; left:505px;">
        <a style="left:225px; color:#444444; font-size:15px; top:8%; font-family: nana;position:fixed; ">- 부서 선택</a>
        <select id="groupBox1" style=" left:305px; font-family:nana; position:fixed; top:8%; font-size:14px;">
            <option value="">전체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;v</option>
            <c:forEach var="group" items="${listgroup}" varStatus="status">
                <option value=${group.groupnm}>${group.groupname}</option>
            </c:forEach>
        </select>
        <%-- <a style=" position:fixed; top:9%;  left:415px; z-index: 20000; color:#444444; font-size:15px; font-family: nana; ">- 그룹 선택</a>
         <select id="groupBox2" style=" position:fixed;  top:11.5%; left:415px; font-family:nana; z-index: 20000; font-size:14px;">
             <option value="">전체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;v</option>
             <c:forEach var="groupOther" items="${listgroupOther}" varStatus="status">
                 <option value=${groupOther.othergroup}>${groupOther.othergroup}</option>
             </c:forEach>
         </select>--%>

        <%--            <input type="button" tabindex="-1" value="전송하기" style="border-style:none; text-shadow:2px 2px 2px #BDBDBD;  background-color:white; color:#616c79; font-family: nana;  font-size:20px; position:fixed; left:1205px; top: 75.5%;"/>
                    <input type="button" name="" id="" tabindex="-1" value="전송하기" style="border-style:none; text-shadow:2px 2px 2px #BDBDBD;  background-color:white; color:#616c79; font-family: nana;font-size:20px; position:fixed; left:1205px;top: 75.5%;"/>
                    <input type="button" name="" id="" tabindex="-1" value="문자 전송하기" style="border-style:none; text-shadow:2px 2px 2px #BDBDBD;  background-color:white; color:#616c79; font-family: nana; font-size:20px; position:fixed; left:1205px; top: 75.5%;"/>--%>
        <%--    <input type="button" id ="menu" name ="menu"  style="border-style:none; font-size: 15px; z-index: 158585858585858538; position:fixed; color:slategray; top:15px; right:1%; font-weight: bold; text-align: center;" value="menu" />--%>



        <input type="button" name="kakao1" id="kakao1" tabindex="-1" onclick="sendBoxHidden2()" value="운영보고 전송하기(오전)" style="border-style:none; border-width: 1px;   text-align:left; color:#000000; position:fixed; font-family:nana;  font-size:15px; width: 200px;  left: 89%; top: 84.5%;"/>
        <input type="button" name="kakao2" id="kakao2" tabindex="-1" onclick="sendBoxHidden1()" value="운영보고 전송하기(오후)" style="border-style:none; border-width: 1px; width: 200px; color:#000000; font-family: nana; position:fixed; left: 89%; font-size:15px; top: 88.5%; text-align:left;"/>
        <input type="button" name="kakaoTltie" id="kakaoTltie" tabindex="-1" value="카카오톡으로 전송하기 :" style="border-style:none; text-shadow:2px 2px 2px #BDBDBD; background-color:white; color:#000000; position:fixed; font-weight: bold; font-size:16px; font-family: nana; z-index:33; left: 89%; top: 80.5%;"/>
        <input type="button" name="smsTltie" id="smsTltie" tabindex="-1"  value="문자로 전송하기 :" style="border-style:none; text-shadow:2px 2px 2px #BDBDBD; background-color:white; color:#000000; position:fixed; font-weight: bold; font-size:16px; z-index:33; font-family: nana; left: 89%; top:92.5%;"/>
        <input type="button" name="sms1" id="sms1" tabindex="-1" onclick="sendBoxHidden3()" value="운영보고 전송하기" style="border-style:none; color:#000000;  text-align:left; width: 200px; font-family: nana; position:fixed; font-size:15px; left: 89%;top: 96%;"/>

        <div id="sendBox1" style="position:fixed; border : solid 1px; padding: 20px;  left:655px;  top:16%; width: 710px; height: 450px;">

            <input type="button" id ="application_send01" name ="application_send01" tabindex="-1"  style="border-style:none; background-color:#0B3861; color:white; font-size:17px; position:absolute; left:88.5%; top:92%; text-align: center; font-family:nana;" value="전송하기" />

            <a style="color:#000000; font-size:18px; font-family:nana;">
                <b> [IT시스템 운영보고]</b><br>
                <input type="hidden" id="sendBox11" name="sendBox11"/>
                <input type="hidden" id="morning" name="morning"/>
                <br>정보시스템 및 스마트공항 시스템 정상 운영중입니다.<br>
                <br>금일 <input type="time" id="time1" name="time1" style="width:110px;"/> 시
                <br>현재 김포, 김해, 제주,<br> 대구, 청주 <br>여객수속&nbsp;<input type="text" id="result" name="result" style="width:80px; font-size: 16px; text-align:center; background-color: #ececec; font-family: 'nana';" value="이상없음"/><br>
                <br>- 전일 Last Flight<br><br>김포: <input type="Time" id="gmpTime" name="gmpTime" style="width:110px;"/>
                김해: <input type="Time" id="pusTime" name="pusTime" style="width:110px;"/>
                제주: <input type="Time" id="cjuTime" name="cjuTime" style="width:110px;"/><br>대구: <input type="Time" id="teaTime" name="teaTime" style="width:110px;"/>
                청주: <input type="Time" id="cjjTime" name="cjjTime" style="width:110px;"/><br><br>
                <br><b>보고자 : <input type="text" id="sendName" name="sendName" style="width:60px; background-color:#ececec; font-family: 'nana';"/></b></a>
        </div>

        <div id="sendBox2"  style="position: fixed; clear: both; border: 1px solid;  left:655px;  top:16%; width: 710px; height: 450px; padding: 20px; display: block;">
            <input type="button" id ="application_send02" name ="application_send02" tabindex="-1"  style="border-style:none; background-color:#0B3861; color:white; font-size:17px; position:absolute; left:88.5%; top:92%;  text-align: center; font-family:nana;" value="전송하기" />

            <a style="color:#000000; font-size:18px; font-family:nana;"><b>[IT시스템 운영보고]</b><br>
                <input type="hidden" id="sendBox22" name="sendBox22"/>
                <input type="hidden" id="evening" name="evening"/>
                <br>정보시스템 및 스마트공항 시스템 정상 운영중입니다.<br>
                <br>금일 <input type="time" id="time10" name="time10" style="width:110px;"/> 시
                <br>현재<br>김포,<br>김해,<br>제주,<br>대구,<br>청주<br>여객수속&nbsp;<input type="text" id="result2" name="result2" style="width:80px; font-size: 16px;  text-align:center; background-color: #ececec; font-family:nana;" value="이상없음"/><br><br>
                <br><b>보고자 : <input type="text" id="sendName0" name="sendName0" style="width:60px; background-color: #ececec; font-family:nana;"/></b></a>
            <br><br>

            <br><br>
        </div>

        <div id="sendBox3"  style="position: fixed; clear: both; border: 1px solid;  left:655px;  top:16%;  width: 710px; height: 450px; padding: 20px; display: block;">
            <input type="button" id ="application_send03" name ="application_send03" tabindex="-1"  style="border-style:none; background-color:#0B3861; color:white; font-size:17px; position:absolute; left:88.5%; top:92%; text-align: center; font-family:nana;" value="전송하기" />
            <a style="color:#000000; font-size:18px; font-family:nana;"><b>[장애 발생 보고]</b></a><input type="radio" name="report" checked="checked" value="one"/><br>
            <a style="color:#000000; font-size:18px; font-family:nana;"><b>[장애 완료 보고]</b></a><input type="radio" name="report"  value="two"/><br>
            <input type="hidden" id="sendBox23" name="sendBox22"/>
            <input type="hidden" id="evening3" name="evening"/>
            <br>
            <a style="color:#000000; font-size:18px; font-family:nana;">* 장애내용</a> <input type="text" id="result13" name="result13" style="width:684px; font-size: 16px;  text-align:center; background-color: #ececec;  color: #000000; font-family:nana;" value="OO공항 OOO 항공"/>
            <input type="text" id="result14" name="result14" style="width:684px; font-size: 16px;  text-align:center; background-color: #ececec;  color: #000000; font-family:nana;" value="카운터 수속및 키오스크 출력 불가 발생"/><br>
            <br>
            <a style="color:#000000; font-size:18px; font-family:nana;">* 장애일시 : </a> <input type='date' id="date" style="color:#000000; font-size:18px; font-family:nana;"/> <input type="time" id="time33" name="time33" style="width:130px; font-size:18px; font-family:nana;"/>
            <br>  <br>
            <a style="color:#000000; font-size:18px; font-family:nana;">* 장애원인 : </a> <input type="text" id="result23" name="result23" style="width:580px; font-size: 16px;  text-align:center; background-color: #ececec;  color: #000000; font-family:nana;" value="DB 오류로 인한 탑승권 출력 불가"/>
            <br>  <br>
            <a style="color:#000000; font-size:18px; font-family:nana;">* 여객서비스 : </a> <input type="text" id="result43" name="result43" style="width:565px; font-size: 16px;  text-align:center; background-color: #ececec;  color: #000000; font-family:nana;" value="체크인 카운터 및 키오스크 발권및 수속 불가"/>
            <br>  <br>
            <a style="color:#000000; font-size:18px; font-family:nana;">* 조치사항 :</a> <input type="text" id="result31" name="result31" style="width:580px; font-size: 16px;  text-align:center; background-color: #ececec;  color: #000000; font-family:nana;" value="항공사 본사측에서 DB 서버 재부팅시도중, 약 15분후 정상화 예정"/><br>
            <br><br><b><a style="color:#000000; font-size:18px; font-family:nana;">보고자 :</a> <input type="text" id="sendName03" name="sendName0" style="width:60px; background-color: #ececec;  color: #000000; font-family:nana;"/></b></a>
            <br><br>

            <br><br>
        </div>







        <a style="color:#444444; font-family:nana; font-size:20px; top:6%; left:0.5%; position:fixed; font-weight: bold;">수신자</a><br><br>

        <a style="color:slategray; font-family:nana; top:12%; left:2%;  position:fixed;">전체 체크 ${lisize} 명</a>
        <input type="checkbox" tabindex="-1" id ="chkAll"  name ="chkAll" onclick="chk_All();" style="top:12%; position:fixed;"/><br><br>


        <div style="height:800px; overflow-y: scroll;position:fixed; top:16%; width:480px;">
            <table style="font-family:nana;" id="table" class="tablesorter">
                <thead>
                <tr style="height:28px;"><th> </th><th> </th><th>이름</th><th>부서</th><th>그룹</th><th>번호</th></tr>
                </thead>
                <tbody>
                <input type="hidden" tabindex="-1" id="listsort" name="listsort"/>
                <c:forEach var="data" items="${list}" varStatus="status" >
                    <input type="hidden" tabindex="-1" id="checkGroup" value="${data.groupname}:${data.number}"/>
                    <tr id="${data.groupname}${data.othergroup}" name="${data.othergroup}" class="${data.basic}" style="color: #FFFFFF; font-size:17px;">
                        <c:if test="${data.basic eq 'existing'}">
                            <td style="text-align: center;"> <input type="checkbox" name ="chack" class="${data.othergroup}" onclick="box_chang(value)" tabindex="-1" style="border-style:none; font-family:nana; color:slategray; font-weight: bold;  text-align: center;" value="${data.number}" /></td>
                        </c:if>
                        <c:if test="${data.basic eq null}">
                            <td style="text-align: center;"> <input type="checkbox"  name ="chacknot" class="${data.othergroup}" onclick="box_chang(value)" tabindex="-1" style="border-style:none; font-family:nana; color:slategray; font-weight: bold;  text-align: center;" value="${data.number}" /></td>
                        </c:if>
                        <td style="text-align: center;"> <img src="/img/ping.png" title="" width="23px;" height="23px;"/></td>
                        <td id="${data.name}" class="item"><input type="button" tabindex="-1" id ="next" name ="next" class="name" style="border-style:none; font-family:nana; color:slategray; font-weight: bold; text-align: center;" value="${data.name}" /></td>
                        <td><input type="button" tabindex="-1" style="border-style:none; font-family:nana; color:slategray; font-weight: bold; text-align: center;" value="${data.groupname}" /></td>
                        <c:if test="${data.othergroup eq '장애보고'}">
                            <td style=" text-align: center;"><input type="button" class="장애보고" tabindex="-1" style="border-style:none; font-family:nana; color:slategray; font-weight: bold; text-align: center;" value="&nbsp;&nbsp;${data.othergroup}&nbsp;&nbsp;" /></td>
                        </c:if>
                        <c:if test="${data.othergroup ne '장애보고'}">
                            <td style=" text-align: center;"><input type="button" tabindex="-1" style="border-style:none; font-family:nana; color:slategray; font-weight: bold; text-align: center;" value="&nbsp;&nbsp;${data.othergroup}&nbsp;&nbsp;" /></td>
                        </c:if>


                        <td><input type="button" id ="next1" name ="next1" tabindex="-1" onclick="change_Chack(value);" style="border-style:none; color:slategray; font-family:nana; font-weight: bold; text-align: center;" value="${data.number}" /></td>

                    </tr>


                </c:forEach>
                </tbody>
            </table>
        </div>


    </form>
</div>
</div>
</body>


<script charset="UTF-8">

    $('#sendBox2').hide();
    $('#application_send02').hide();
    $('#sendBox1').show();
    $('#application_send03').hide();
    $('#sendBox3').hide();

    window.onload = function () {
        if (!window.localStorage.getItem('load')) {
            window.localStorage.setItem('load', true)
            window.location.reload()
        } else {
            window.localStorage.removeItem('load')
        }
    }


    var i = 0;
    arr1 = new Array()
    var arr = new Array();
    var chacknamearr = new Array();
    /*	$("input[type=checkbox]").parent().siblings(".item").attr('id')*/

    function chk_All() {
        if ($("#chkAll").is(":checked")) {
            arr = [];
            for(var i = 1; i < ${lisize}+1; i++){
                arr[arr.length] = ($("input[type=checkbox]")[i].value);}
            /*          let $tr = $("input[type=checkbox]").parent().siblings(".item").attr('id');

                      $tr.attr('class');*/
            $('input[type=checkbox]').prop("checked",true);
            console.log('연락처 확인'+arr);
        } else {
            arr = [];
            $('input[type=checkbox]').prop("checked",false);
        }
        return arr;

    }

    //체크 박스 체크할떄


    function box_chang(value) {
        $("input[name=box]:checkbox").val()
        //배열에 값이 들어있지 않을때
        if (arr.includes(value)) {
            arr = arr.filter((element) => element !== value);
            console.log(arr);
            return arr;

        }else {
            arr[arr.length] = value;
            console.log(arr);
            return arr;
        }

    }


    // 그룹박스 값 변경시 (그룹 선택)
    $('#groupBox1').change(function() {
        var result = $('#groupBox1 option:selected').val()
        if (result=='1') {
            $('[id*=경영정보부]').css("display", "none")
            $('[id*=케이원]').css("display", "none")
            $('[id*=전산실]').css("display", "")
        }
        else if (result == '2') {
            $('[id*=전산실]').css("display", "none")
            $('[id*=케이원]').css("display", "none")
            $('[id*=경영정보부]').css("display", "")
        }   else if (result == '3') {
            $('[id*=전산실]').css("display", "none")
            $('[id*=경영정보부]').css("display", "none")
            $('[id*=케이원]').css("display", "")
        }
        else if (result =="") {
            $('[id*=경영정보부]').css("display", "")
            $('[id*=케이원]').css("display", "")
            $('[id*=전산실]').css("display", "")
        }

    })
    $('#groupBox2').change(function() {
        var result = $('#groupBox2 option:selected').val()
        if(result == ""){
            location.href="/sms";
        }else {
            location.href="/groupType?"+"type="+result+"&"+"other=2";
        }

    })
    function sendBoxHidden1(){
        $('#sendBox1').hide();
        $('#application_send01').hide();
        $('#sendBox3').hide();
        $('#application_send03').hide();
        $('#application_send02').show();
        $('#sendBox2').show();
    }
    function sendBoxHidden2(){
        $('#sendBox2').hide();
        $('#application_send02').hide();
        $('#sendBox3').hide();
        $('#application_send03').hide();
        $('#application_send01').show();
        $('#sendBox1').show();
    }

    function sendBoxHidden3(){
        $('#sendBox2').hide();
        $('#application_send02').hide();
        $('#sendBox1').hide();
        $('#application_send01').hide();
        $('#application_send03').show();
        $('#sendBox3').show();
    }


    token = $("meta[name='_csrf']").attr("content");
    header = $("meta[name='_csrf_header']").attr("content");



    function change_Chack(value) {
        var a = value;
        var a1 =a.replace(/[^0-9]/gi, "");
        window.open ( "/userupdate"+"/"+ a1,'tistory','width=400, height=420, scrollbars=no, resizable=no, toolbars=no, menubar=no')
    }

    $('#groupSendBox').change(function() {
        var result = $('#groupSendBox option:selected').val()
        var phoneNum = arr;
        $.ajax({
            type: "POST",
            url: "/group_update",
            dataType: "text",
            data: {"phoneNum":arr,"result":result},
            beforeSend : function(xhr,opts) {
                if(phoneNum==""){ alert("그룹업데이트 대상 확인");
                    xhr.abort();}
            },
            success: function(Result){
                location.reload();
                alert("업데이트가 완료되었습니다.");
            },
            fail: function(){

            },


        });

    })




    //보내기
    /*    $('#submit').click(function () {
                form.submit();

        })*/

    //application_sand
    $('#application_send01').click(function () {
        var gmpTime = $('#gmpTime').val();
        var pusTime = $('#pusTime').val();
        var cjuTime = $('#cjuTime').val();
        var teaTime = $('#teaTime').val();
        var cjjTime = $('#cjjTime').val();
        var time1 = $('#time1').val();
        var result = $('#result').val();
        var sendName = $('#sendName').val();
        var phoneNum = arr;

        $.ajax({
            type: "POST",
            url: "/application_send_a",
            dataType: "text",
            data: {"phoneNum":arr,"time1":time1,"gmpTime":gmpTime,"pusTime":pusTime,"cjuTime":cjuTime,"teaTime":teaTime,"cjjTime":cjjTime,"result":result,"sendName":sendName},
            beforeSend : function(xhr,opts) {
                if(phoneNum==""){ alert("보내는 대상을 확인 해주세요");
                    xhr.abort();}
            },
            success: function(kakaoResult){

                swal("전송이 완료되었습니다.");
            },
            fail: function(){
                swal("전송이 실패했습니다.");
            },  error : function(request, status, error) {
                swal("전송이 실패했습니다.");
            }



        });

    })


    $('#application_send02').click(function () {
        var time10 = $('#time10').val();
        var result2 = $('#result2').val();
        var sendName0 = $('#sendName0').val();
        var phoneNum = arr;

        $.ajax({
            type: "POST",
            url: "/application_send_b",
            dataType: "text",
            data: {"phoneNum":arr,"time10":time10,"result2":result2,"sendName0":sendName0},
            beforeSend : function(xhr,opts) {
                if(phoneNum==""){ alert("보내는 대상을 확인 해주세요");
                    xhr.abort();}
            },
            success: function(Result){
                swal("전송이 완료되었습니다.");
            },
            fail: function(){
                swal("전송이 실패했습니다.");
            },  error : function(request, status, error) {
                swal("전송이 실패했습니다.");
            }


        });

    })

    function obstacleSelectUp(el) {

        if ($("input[class=장애보고]").is(":checked")) {
            $('input[class=장애보고]').prop("checked", false);
            for (var i = 0; i < $("input[class=장애보고]").length; i++) {
                arr = arr.filter((element) => element !== $("input[class=장애보고]")[i].value);
                console.log('연락처 확인 빠짐'+arr);
            }
            return arr;
        }



        else {
            var $tr = ($("input[class=장애보고]")).parent().parent();
            $("input[name=listsort]").next().after($tr)

            for (var i = 0; i < $("input[class=장애보고]").length; i++) {
                arr[arr.length] = ($("input[class=장애보고]")[i].value);
                $('input[class=장애보고]').prop("checked",true);
                console.log('연락처 확인'+arr);
            }
            return arr;
        }


    }



    function existingSelectUp(el) {


        if ($("input[name=chack]").is(":checked")) {
            $('input[name=chack]').prop("checked", false);
            for (var i = 0; i < $("input[name=chack]").length; i++) {
                arr = arr.filter((element) => element !== $("input[name=chack]")[i].value);
                console.log('연락처 확인 빠짐'+arr);
            }
            return arr;
        }



        else {
            var $tr = ($("input[name=chack]")).parent().parent();
            $("input[name=listsort]").next().after($tr)

            for (var i = 0; i < $("input[name=chack]").length; i++) {
                arr[arr.length] = ($("input[name=chack]")[i].value);
                $('input[name=chack]').prop("checked",true);
                console.log('연락처 확인'+arr);
            }
            return arr;
        }


    }





    $('#application_send03').click(function () {
        var contents = $('#result13').val()+$('#result14').val();
        var date = $('#date').val()+" "+$('#time33').val();
        var cause =  $('#result23').val();
        var passengerService =  $('#result43').val();
        var resolution = $('#result31').val();
        var sendName =  $('#sendName03').val();
        var phoneNum = arr;
        var report = $('input[name=report]:checked').val();

        $.ajax({
            type: "POST",
            url: "/application_send_c",
            dataType: "text",
            data: {"phoneNum":arr,"contents":contents,"date":date,"resolution":resolution,"passengerService":passengerService,"cause":cause,"sendName":sendName,"report":report},
            beforeSend : function(xhr,opts) {
                if(phoneNum==""){ alert("보내는 대상을 확인 해주세요");
                    xhr.abort();}
            },
            success: function(Result){
                swal("전송이 완료되었습니다.");
            },
            fail: function(){
                swal("전송이 실패했습니다.");
            },  error : function(request, status, error) {
                swal("전송이 실패했습니다.");
            }

        });

    })
    $('#menu').click(function () {
        if($('#menuText').is(":visible")){
            $('#menuText').css("display","none");
        }else{
            $('#menuText').css("display","block");
        }
    })
    function filter(){

        var value, name, item, i;

        value = document.getElementById("value").value.toUpperCase();
        item = document.getElementsByClassName("item");

        for(i=0;i<item.length;i++){
            name = item[i].getElementsByClassName("name");
            if(name[0].value.toUpperCase().indexOf(value) > -1){
                item[i].parentElement.style.display="";
            }else{
                item[i].parentElement.style.display="none";
            }
        }
    }
    $("#groupBox1").val("${type}").prop("selected", true);
    $("#groupBox2").val("${type}").prop("selected", true);

</script>
</HTML>