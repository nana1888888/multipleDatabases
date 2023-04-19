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
            border-left: 3px solid #85B0E9;
            margin : 20px 10px;
        }
        th {
            width: 147px;
            padding: 10px;
            font-weight: bold;
            vertical-align: top;
            color: #000000;
            border-right: 1px solid #ccc;
            border-bottom: 1px solid #ccc;

        }
        td {
            width: 349px;
            padding: 10px;
            vertical-align: top;
            border-right: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
        }


        #next:hover{
            background: black;
        }
        header
        {
            position: fixed;
            left: 0;
            right: 0;
            top: 0;
            height: 3rem;
            background: #85B0E9;
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



    </style>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script src="../js/jquery-3.4.1.min.js">
    </script>

</head>
<header style="z-index: 15858585858585858;">
    장애보고 카톡 발송
</header>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/js/jquery-latest.js"></script>
<body id="commonBody">
<div id="wrap">

    <input type="hidden" id ="lisize" name ="lisize" value=${lisize} ;/>
    <input type="hidden" id ="selectValue" name ="selectValue" value = ${groupType} ;/>
    <input type="hidden" id ="sendText" name ="sendText" value = ${text} ;/>
    <input type="hidden" id ="userdata" name ="userdata" />

    <a style="color:#233284; position:absolute; width:10%;  left:3%; top:8%;" href="contact">수신자 등록</a>

    <input type="submit" name="submit1" id="submit1" value="운영보고 전송하기" style="border-style:none; background-color:#85B0E9; color:white; position:fixed; font-size:15px; left:1400px; top:50%"/>


    <div id="sendBox" style="position:fixed; border-radius: 2em; border : solid 1px; left:650px; top:10%; width: 960px; height:250px; padding:10px;">

        <input type="button" id ="moning" name ="moning"  style="border-style:none; background-color:#85B0E9; color:white; font-size:15px; position:absolute; left:85%; top:90%; font-weight: bold; text-align: center;" onclick="location.href='/smsfrom'" value="오전 메세지" />
        <a style="color:#000000; font-size:18px"><br>[IT시스템 운영보고]
            <br>정보시스템 및 스마트공항 시스템 정상 운영중입니다.
            <br>금일 <input type="time" id="time1" name="time1" style="width:110px;"/>시
            <br>현재 김포,김해,제주,대구,청주 여객수속<input type="text" id="time2" name="time2" style="width:60px; text-align:center;" value="이상없음"/>
            <br>- 전일 Last Flight
            김포:<input type="Time" id="gmpTime" name="gmpTime" style="width:110px;" />
            김해:<input type="Time" id="pusTime" name="pusTime" style="width:110px;" />
            제주:<input type="Time" id="cjuTime" name="cjuTime" style="width:110px;"/>
            대구:<input type="Time" id="teaTime" name="teaTime" style="width:110px;"/>
            청주:<input type="Time" id="cjjTime" name="cjjTime" style="width:110px;"/><br><br>
            <br>보고자 : <input type="text" id="sendName" name="sendName" style="width:60px;"/></a>
        <br><br>

        <br><br>
    </div>
    <%--location으로 아무런 처리 없이 바로 url 보냄 -> Controller--%>




    <div id="conWrap">

					<span style="width: 509px; height: 60px; z-index: 100; position: absolute; width: 50%; top:13%;">



		</span>

        <div style="border:0px solid; position: absolute; z-index: 103; top:13%; width: 20%; left:5%;" name="groupA" id="groupA" >
            <a style="color:slategray; font-size:18px; font-weight: bold;">수신자</a><br><br>

            <a style="color:slategray;">전체 체크 ${lisize} 명</a>
            <input type="checkbox" id ="chkAll" name ="chkAll" onclick="chk_All();"/><br><br>
            <select id="groupBox">
                <option value="0">전체</option>
                <option value="1">전산실</option>
                <option value="2">경영정보부</option>
                <option value="3">기타</option>

            </select>
            <div style="height:600px; overflow-y: scroll; width:400px;">
                <table>
                    <c:forEach var="data" items="${list}" varStatus="status">
                        <input type="hidden" id="checkGroup" value="${data.groupname}:${data.number}"/>
                        <tr id="${data.groupname}" style="color: #FFFFFF;">
                            <td><input type="button" id ="next" name ="next"  style="border-style:none; color:slategray; font-weight: bold; text-align: center;" value="${data.name}" /></td>

                            <td><input type="button" id ="next1" name ="next1" onclick="change_Chack(value);" style="border-style:none; color:slategray; font-weight: bold; text-align: center;" value="${data.number}" /></td>
                            <td>

                            </td>

                        </tr>


                    </c:forEach>
                </table>
            </div>
        </div>

    </div>
    </form>
</div>
</div>
</body>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="_csrf" th:content="${_csrf.token}">
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>

<title>Insert title here</title>

<script charset="UTF-8">

    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
        return xhr;

    });

    var i = 0;
    arr1 = new Array()
    var arr = new Array();

    function chk_All() {
        if ($("#chkAll").is(":checked")) {
            for(var i = 0; i < $("#lisize").val(); i++){
                arr[arr.length] = ($("input[type=checkbox]")[i].value);}

            $('input[type=checkbox]').prop("checked",true);
            console.log('연락처 확인'+arr);
        } else {
            arr = undefined;
            $('input[type=checkbox]').prop("checked",false);
        }
        return arr;

    }

    //체크 박스 체크할떄
    $("input[name=box]:checkbox").val()
    function chack(value) {

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


    $('#groupBox').change(function() {
        var result = $('#groupBox option:selected').val();
        if(result == "0"){
            location.href="/sms";
        }else {
            location.href="/select?"+"groupType="+result;
        }

    });


    $(document).ready(function(){
        $('#submitBefore').click(function () {
            const textSms = $("<input type='hidden' value=" + $('#tplTxt').text() + " name='textSms' readonly>");
            $('#submitBefore').value($('#tplTxt').text());
            setRequestHeader("textSms", $('#tplTxt').text());
            var smsText = $('#tplTxt').text();
            var smsText1 = $("input[name=userdata]").value($('#tplTxt').text());
            $("input[name=userdata]").text($('#tplTxt').text());
            $("input[name=userdata]").val($('#tplTxt').text());
            form.append("textSms", $('#tplTxt').text());


            $("#frm").append(textSms);
            $("#frm").createAttribute(textSms)
            $("#frm").setItem("textsms", smsText);
            $("#frm").setAttribute("textsms", smsText);


            $("#frm").mothod = 'POST';
            $("#frm").append("textSms",$('#tplTxt').text());
            $("#frm").attr("smsText",smsText).submit();
            $("#frm").action = '/send';
            $("#frm").submit();


        });
    })

    token = $("meta[name='_csrf']").attr("content");
    header = $("meta[name='_csrf_header']").attr("content");



    function change_Chack(value) {
        var a = value;
        var a1 =a.replace(/[^0-9]/gi, "");
        var groupname = $("#groupBox :selected").text();
        window.open ( "/userupdate"+"/"+ a1+"/groupname"+groupname,'tistory','width=400, height=320, scrollbars=no, resizable=no, toolbars=no, menubar=no')
    }






    function group_Code(value) {
        var division = value;
        $.ajax({
            type: "POST",
            url: "/group",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
            },
            contentType: "application/json; charset=UTF-8",
            dataType: "json",
            cache: false,
            xhrFields: {withCredentials: true},
            data: {division: division},
            beforeSend: function (jqXHR, settings) {

            },
            complete: function () {

            },
            success: function (data) {
                if (data != null) {
                    var data_str = JSON.stringify(data)
                    alert(data_str);
                }
            },
            fail: function () {

            },
            error: function (e) {
            }
        });
    }
    //보내기
    $('#submit').click(function () {
        let form = document.createElement('form');
        form.action = 'https://google.com/search';
        form.method = 'GET';

        form.innerHTML = '<input name="q" value="테스트">';

        document.body.append(form);

        form.submit();

        var	text = $('#tplTxt').val();
        $.ajax({
            type: "GET",
            url: "/send",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
            },
            contentType: "application/json; charset=UTF-8",
            dataType: "json",
            cache: false,
            xhrFields: {withCredentials: true},
            data: {data: "text"},
            beforeSend: function (jqXHR, settings) {

            },
            complete: function () {

            },
            success: function (data) {
                if (data != null) {
                    var data_str = JSON.stringify(data)
                    alert(data_str);
                }
            },
            fail: function () {

            },
            error: function (e) {
            }
        });

    });



    if(window.location.pathname == '/select'){
        $("#groupBox").val("${selectValue}").prop("selected", true);}


</script>
</HTML>