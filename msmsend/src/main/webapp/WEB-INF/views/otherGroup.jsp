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
		th {
			padding: 12px;
			position: sticky;
			top:0px;
			font-weight: bold;
			text-align: center;
			vertical-align: top;
			font-weight: bold;
			/*font-weight: normal;*/
			background-color: #cccccc;
			color: #000000;
			font-size: 17px;
			border-right: 1px solid #ccc;
			border-bottom: 1px solid #ccc;
			border-top: 1px solid #ccc;

		}

		table {
			border-collapse: collapse;
			text-align: left;
			line-height: 3px;
			border-top: 1px solid #ccc;
			border-left: 1px solid #ccc;
			 //  margin : 10px 10px;
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
		td {

			padding: 10px;
			vertical-align: top;
			border-right: 1px solid #ccc;
			border-bottom: 1px solid #ccc;
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
			font-family: 'nana';
			src: url("../../font/GowunDodum-Regular.ttf");
		}
		#btnDelete:hover{
			background:#848484;
		}
		@font-face {
			font-family: 'me';
			src: url("../../font/GowunBatang-Bold.ttf");
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

<header  style="z-index: 15858585858585858; font-family: me;">
	기타 그룹 등록
</header>
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


	<form id="otherGroup" name="otherGroup" method="POST">




				<a style="color:#444444; font-family:nana; font-size:20px; right:32.3%; top:6%; font-weight: bold; position:fixed;">기존 수신자</a><br><br>


				<div style="height:700px; overflow-y: auto; top:15%; width:650px; right:0.5%; position:fixed;">
					<table style="font-family:nana;">
						<tr style="height:28px; border-top: 1px solid #ccc;"><th>이름</th><th>부서</th><th>그룹</th><th>번호</th><th></th></tr>
						<c:forEach var="data" items="${basicGroup}" varStatus="status">
							<input type="hidden" tabindex="-1" id="checkGroup" value="${data.groupname}:${data.number}"/>
							<tr id="${data.name}" style="color: #FFFFFF; font-size:17px;">



								<td id="${data.name}" class="item"><input type="button" tabindex="-1" name ="next" class="name" style="border-style:none; background-color: #ffffff; font-family:nana; color:slategray; font-weight: bold; text-align: center;" value="${data.name}" /></td>
								<td><input type="text" tabindex="-1" style="border-style:none; font-family:nana; color:slategray; font-weight: bold; text-align: center;" value="${data.groupname}" /></td>
								<td><input type="text" tabindex="-1" style="border-style:none; font-family:nana; color:slategray; font-weight: bold; text-align: center;" value="&nbsp;&nbsp;${data.othergroup}&nbsp;&nbsp;" /></td>
								<td><input type="text"  name ="next1" tabindex="-1" style="border-style:none; color:slategray; font-family:nana; font-weight: bold; text-align: center;" value="${data.number}" /></td>
								<td><button id="btnDelete" name="${data.number}" onclick="delete_basic(value,${data.name});" value="${data.number}" class="btnDelete" style="color: #FF0000; border-style:none; background-color:#ffffff; font-weight: bold; font-family: nana; " >삭제</button></td>
							</tr>


						</c:forEach>
					</table>
				</div>






				<a style="color:#444444; font-family:nana; font-size:20px; left:0.5%; top:6%; position:fixed; font-weight: bold;">기존 수신자 제외</a><br><br>

				<a style="color:slategray; font-family:nana; top:10.5%; position:fixed; ">전체 체크 </a>
				<input type="checkbox" tabindex="-1" id ="chkAll" name ="chkAll" onclick="chk_All();" style=" top:10.5%; left:4.3%; position:fixed;"/><br><br>


				<div style="height:700px; overflow-y: auto; width:630px; position:fixed; top:15%; left:0.5%;">
					<table style="font-family:nana; ">

						<tr style="height:28px;	border-top: 1px solid #ccc;"><th></th><th>이름</th><th>부서</th><th>그룹</th><th>번호</th></tr>

						<c:forEach var="data" items="${list}" varStatus="status">

							<input type="hidden" tabindex="-1" id="checkGroup" value="${data.groupname}:${data.number}"/>
							<tr id="${data.groupname}" style="color: #FFFFFF; font-size:17px;">

								<td style="text-align: center;"> <input type="checkbox" id ="box" name ="box" onclick="chack(value)" tabindex="-1" style="border-style:none; font-family:nana; color:slategray; font-weight: bold;  text-align: center;" value="${data.number} " /></td>

								<td id="${data.name}" class="item"><input type="button" tabindex="-1" name ="next" class="name" style="border-style:none; background-color: #ffffff; font-family:nana; color:slategray; font-weight: bold; text-align: center;" value="${data.name}" /></td>
								<td><input type="text" tabindex="-1" style="border-style:none; font-family:nana; color:slategray; font-weight: bold; text-align: center;" value="${data.groupname}" /></td>
								<td><input type="text" tabindex="-1" style="border-style:none; font-family:nana; color:slategray; font-weight: bold; text-align: center;" value="&nbsp;&nbsp;${data.othergroup}&nbsp;&nbsp;" /></td>
								<td><input type="text"  name ="next1" tabindex="-1" style="border-style:none; color:slategray; font-family:nana; font-weight: bold; text-align: center;" value="${data.number}" /></td>

							</tr>


						</c:forEach>
					</table>
				</div>



	<button id="btnInsert" class="btnInsert" name=""  onclick="update_basic(value);"  style="background-color:#2F38A5;  left:50%; top:95%; font-family: zeze; color: #FFFFFF; position: fixed;" >기존그룹 등록</button>

	</form>
</div>
</div>
</body>

</HTML>
<script charset="UTF-8">

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
	function delete_basic(value,name) {
	var dd=name[0].id;

		$.ajax({
			type: "POST",
			url: "/delete_basic",
			dataType: "text",
			data: {"phoneNum":value},
			beforeSend : function(xhr,opts) {

			},
			success: function(Result){
				location.reload();
				alert(dd+"님 기존 수신자에서 제외되었습니다.")
			},
			fail: function(){

			},


		});

	}
	function update_basic(value) {
		var result = $('#groupSendBox option:selected').val()
		var phoneNum = arr;
		$.ajax({
			type: "POST",
			url: "/update_basic",
			dataType: "text",
			data: {"phoneNum":arr},
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

	}
</script>
