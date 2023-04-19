<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<style>

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
			left: 0;
			right: 0;
			top: 0;
			height: 2.8rem;
			background: #000000;
			line-height: 2.8rem;
			text-align: center;
			color: #FFFFFF;
		}

		.dropdown{
			position : relative;
			display : inline-block;
		}
		@font-face {
			font-family: 'nana';
			src: url("../../font/GowunDodum-Regular.ttf");
		}
		body{
			font-family: 'nana';
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


		#contents
		{
			position: fixed;
			top: 4rem;
			left: 0;
			right: 0;
			bottom: 0;
			overflow: auto;
		}
		@font-face {
			font-family: 'me';
			src: url("../font/GowunBatang-Bold.ttf");
		}

	</style>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="/js/jquery-latest.js"></script>
	<script>
		//input value를 수정할때마다 실행되는 alert 이벤트
		$(document).ready(function () {

		})

	</script>
</HEAD>
<body>
<header style="font-family: me;">
	수정&삭제 페이지
</header>
<div id="contents">

	<form id="User" name="User" method="POST">
		<c:forEach var="list" items="${list}" varStatus="status">
			<a style = "color:dimgray; font-size:16px; position: absolute; left:6%; top:10%;  ">선택한 사용자 정보</a>
			<input type="hidden" tabindex="-1" id ="number22" name ="number22" value="${list.number}" />
			<input type="hidden" tabindex="-1" id ="other" name ="other" value="${list.othergroup}" />
			<input type="text" name="user" tabindex="-1" style="left:4%; top:20%; font-family:nana; color: #2F38A5;  position: absolute; border-style:none; font-size: 17px;  font-weight: bold; text-align: center;" value="${list.name} : ${list.number}" readonly/>
			<input type="hidden" tabindex="-1" id ="no1" name ="no1" style="border-style:none;left:38%; color:slategray; font-weight: bold; text-align: center;" value="${list.no1}" />
		</c:forEach>

		<a style = "color:dimgray;  font-size:16px; position: absolute; top:45%; left:6%; ">번호 수정 : </a>
		<div style="left:28%; top:45%; position: absolute; ">
			<input type="text" maxlength="3"  id="number1" name="number1" value="010" onfocus="this.placeholder=''" onblur="this.placeholder='010'" style=" color:slategray; font-weight: bold; text-align: center; font-family: 'nana'; width:11%;"/> -
			<input type="text" maxlength="4" id="number2" name="number2"  onblur="this.placeholder='1111'" style=" color:slategray;  font-family: 'nana'; font-weight: bold; text-align: center; width:18%;" value=${number22}> -
			<input type="text" maxlength="4" id="number3" name="number3"   style=" color:slategray;  font-family: 'nana'; font-weight: bold; text-align: center; width:18%;" value=${number33}>
			<%--border-style:none; 실선 없음--%>
		</div>
		<a style = "color:dimgray; font-size:16px; position: absolute; top:35%; left:6%;">이름 수정 : </a>
		<input type="text" id="name" name="name" autofocus tabindex="1" style=" font-family:nana; position: absolute; top:35%; left:28%;color:slategray; font-weight: bold; text-align: center; " value=${name}>
		<a style = "color:dimgray; font-size:16px; position: absolute; top:25%; left:6%;"></a>
		<a style = "color:dimgray; font-size:16px; position: absolute; top:55%; left:6%;">부서 수정 : </a>
		<select id="groupBox" style="top:55.3%; font-family:me; font-size:14px; left:28%; position: absolute;">
			<option value="">전체</option>
			<c:forEach var="group" items="${listgroup}" varStatus="status">
				<option value=${group.groupnm}>${group.groupname}</option>
			</c:forEach>

		</select>
		<a style = "color:dimgray; font-size:16px; position: absolute; top:65%; left:6%;">그룹 수정 : </a>
		<select id="othergroupBox" style="top:65.3%; font-family:me; font-size:14px; left:28%; position: absolute;">
			<option value="">전체</option>
			<c:forEach var="othergroup" items="${listgroupOther}" varStatus="status">
				<option value=${othergroup.othergroup}>${othergroup.othergroup}</option>
			</c:forEach>

		</select>
		<div class="btn" style="margin-top: 75%;  position: absolute;  left:28%;">
			<button id="btnUpdate" class="btnUpdate"style="background-color:black; left:50%; font-family: 'nana'; color: #FFFFFF; position: relative;" >수정</button>
			<button id="btnDelect" class="btndelect" style="background-color:black;  font-family: 'nana'; left:50%; color: #FFFFFF; position: relative;"onclick="" >삭제</button>
		</div>


	</form>
</div>
</div>
</body>

</HTML>
<script charset="UTF-8">

	$('#btnUpdate').click(function(number1,number2,number3,name,no1) {
		var number=$('input[name=number1]').val()+$('input[name=number2]').val()+$('input[name=number3]').val()
		var name= $('input[name=name]').val();
		var no1=$('input[name=no1]').val();
		var groupname = $("#groupBox :selected").text();
		var groupnm = $("#groupBox :selected").val();
		var othergroup = $("#othergroupBox").val();
		var type = "update"
		if(number == "--" && name == "") {
			alert("값을 확인하세요"); return;
		}

		/*alert(number); 들어온 전화번호 확인용*/
		$.ajax({
			type: "GET",
			url: "/updateTm",
			headers: {
				"Accept": "application/json",
				"Content-Type": "application/json"
			},
			contentType: "application/json; charset=UTF-8",
			dataType: "json",
			cache: false,
			xhrFields: { withCredentials: true},
			data: {type:type,number:number,name:name,no1:no1,groupname:groupname,groupnm:groupnm,othergroup:othergroup},
			beforeSend : function(jqXHR, settings) {
				opener.document.location.reload();
				window.open('about:blank','_self').self.close();
			},
			complete : function() {

			},
			success: function(data){
				if(data!=null) {
					alert("성공적으로 데이터가 등록되었습니다.");
					window.open('','_self').close();
					history.go(-1);
				}
			},
			fail: function(){
				alert("실패하였습니다.");
				window.open('','_self').close();
			},
			error:function(e){	}
		});
	});

	$('#btnDelect').click(function(no1) {
		if (confirm("삭제하시겠습니까?") == false) return false;
		var no1=$('input[name=no1]').val()

		/*alert(number); 들어온 전화번호 확인용*/
		$.ajax({
			type: "GET",
			url: "/delete",
			headers: {
				"Accept": "application/json",
				"Content-Type": "application/json"
			},
			contentType: "application/json; charset=UTF-8",
			dataType: "json",
			cache: false,
			xhrFields: { withCredentials: true},
			data: {no1:no1},
			beforeSend : function(jqXHR, settings) {
				opener.document.location.reload();
				window.open('about:blank','_self').self.close();
			},
			complete : function() {
				window.open('about:blank','_self').self.close();
			},
			success: function(data){
				if(data!=null) {
					window.open('about:blank','_self').self.close();

				}
			},
			fail: function(){
				alert("실패하였습니다.");
				window.open('','_self').close();
			},
			error:function(e){	}
		});
	});

	$('#btnIsert').click(function(number1,number2,number3,name,no1) {
		var number=$('input[name=number1]').val()+"-"+$('input[name=number2]').val()+"-"+$('input[name=number3]').val()
		var name=$('input[name=name]').val()

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
			url: "/updateTm",
			headers: {
				"Accept": "application/json",
				"Content-Type": "application/json"
			},
			contentType: "application/json; charset=UTF-8",
			dataType: "json",
			cache: false,
			xhrFields: { withCredentials: true},
			data: {type:type,number:number,name:name,no1:no1,groupname:groupname},
			beforeSend : function(jqXHR, settings) {

			},
			complete : function() {

			},
			success: function(data){
				if(data!=null) {
					alert("성공적으로 데이터가 수정되었습니다.");
					location.href="sms"
				}
				else if(data==null) {
					alert("성공적으로 데이터가 수정되었습니다.");
					location.href="sms"
				}
			},
			fail: function(){
				alert("실패하였습니다.");
				location.href="sms"
			},
			error:function(e){	}
		});
	});

	$('#groupBox').val("${groupnm}").prop("selected", true);
	$('#othergroupBox').val($("#other").val()).prop("selected", true);
	let str = $('input[name=user]').val();

	//var number3 = '1234';
	$('input[name=number2]').attr('value',str.substr(-8,4));
	$('input[name=number3]').attr('value',str.substr(-4));
	//$('input[name=number3]').attr('value',변수명);
	console.log(number2);

</script>
