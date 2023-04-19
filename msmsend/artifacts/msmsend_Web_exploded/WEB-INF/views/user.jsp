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
	</style>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="/js/jquery-latest.js"></script>
	<script>
		//input value를 수정할때마다 실행되는 alert 이벤트
	$(document).ready(function () {
		function update(){
			alert($('input[name=update]').val());
		}
	})

	</script>
</HEAD>
<body>
	<header>
	수정&삭제 페이지
	</header>
	<div id="contents">
		<form id="User" name="User" method="POST">
		<c:forEach var="list" items="${list}" varStatus="status">
			<a style = "color:dimgray; font-size:16px; position: absolute; left:6%; top:10%;  ">선택한 사용자 정보</a>
				<input type="text" name="user" style="left:0%; top:20%; color: #2F38A5;  position: absolute; border-style:none; font-size: 17px;  font-weight: bold; text-align: center;" value="${list.name} : ${list.number}" readonly/>
				<input type="hidden" id ="no1" name ="no1" style="border-style:none;left:38%; color:slategray; font-weight: bold; text-align: center;" value="${list.no1}" />
			</c:forEach>

			<a style = "color:dimgray; font-size:16px; position: absolute; top:45%; left:6%; ">번호 수정 : </a>
			<div style="left:28%; top:45%; position: absolute; ">
			<input type="text" maxlength="3"  id="number1" name="number1" placeholder="010" onfocus="this.placeholder=''" onblur="this.placeholder='010'" style=" color:slategray; font-weight: bold; text-align: center; width:11%;" value=""/> -
			<input type="text" maxlength="4" id="number2" name="number2" placeholder="1111" onfocus="this.placeholder=''" onblur="this.placeholder='1111'" style=" color:slategray; font-weight: bold; text-align: center; width:18%;" value=""/> -
			<input type="text" maxlength="4" id="number3" name="number3" placeholder="1111" onfocus="this.placeholder=''" onblur="this.placeholder='1111'" style=" color:slategray; font-weight: bold; text-align: center; width:18%;" value=""/>
			<%--border-style:none; 실선 없음--%>
			</div>
			<a style = "color:dimgray; font-size:16px; position: absolute; top:35%; left:6%;">이름 수정 : </a>
			<input type="text" name="namee" style="  position: absolute; top:35%; left:28%;color:slategray; font-weight: bold; text-align: center;" value=""/>

			<div class="btn" style="margin-top: 48%;  position: absolute;  left:28%;">
				<button id="btnUpdate" class="btnUpdate"style="background-color:black; left:50%; color: #FFFFFF; position: relative;" >수정</button>
				<button id="btnDelect" class="btndelect" style="background-color:black; left:50%; color: #FFFFFF; position: relative;"onclick="" >삭제</button>
			</div>

				<button id="btnIsert" class="btnIsert"style="background-color:black; left:50%; color: #FFFFFF; position: relative;" >등록</button>
				<select name="groupname">
					<option value="전산실">전산실</option>
					<option value="경영정보부">경영정보부</option>
					<option value="기타">기타</option>
				</select>


			<input type="text" name="name" style=" border-style:none;  color:slategray; font-weight: bold; text-align: center;" value="${name}" readonly/>
		</form>
	</div>
	</div>
</body>
</HTML>
<script charset="UTF-8">
	$('#btnUpdate').click(function(number1,number2,number3,name,namee,no1) {
		var number=$('input[name=number1]').val()+$('input[name=number2]').val()+$('input[name=number3]').val()
		var name=$('input[name=name]').val()
		var namee=$('input[name=namee]').val()
		var no1=$('input[name=no1]').val()
		var type = "update"
		if(number == "--" && namee == "") {
			alert("값을 확인하세요"); return;
		}
		/*alert(number); 들어온 전화번호 확인용*/
		$.ajax({
			type: "GET",
			url: "/updateTm/",
			headers: {
				"Accept": "application/json",
				"Content-Type": "application/json"
			},
			contentType: "application/json; charset=UTF-8",
			dataType: "json",
			cache: false,
			xhrFields: { withCredentials: true},
			data: {type:type,number:number,name:name,namee:namee,no1:no1},
			beforeSend : function(jqXHR, settings) {

			},
			complete : function() {

			},
			success: function(data){
				if(data!=null) {
					alert("성공적으로 데이터가 수정되었습니다.");
					window.open('','_self').close();
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

			},
			complete : function() {

			},
			success: function(data){
				if(data!=null) {
					alert("성공적으로 데이터가 삭제되었습니다.");
					window.close();

				}
			},
			fail: function(){
				alert("실패하였습니다.");
				window.open('','_self').close();
			},
			error:function(e){	}
		});
	});

	$('#btnIsert').click(function(number1,number2,number3,name,namee,no1) {
		var number=$('input[name=number1]').val()+"-"+$('input[name=number2]').val()+"-"+$('input[name=number3]').val()
		var name=$('input[name=name]').val()
		var namee=$('input[name=namee]').val()
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
			data: {type:type,number:number,name:name,namee:namee,no1:no1,groupname:groupname},
			beforeSend : function(jqXHR, settings) {

			},
			complete : function() {

			},
			success: function(data){
				if(data!=null) {
					alert("데이터를 확인해주세요.");
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

</script>
