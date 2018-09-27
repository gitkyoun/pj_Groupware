<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style type="text/css">
.textLabel {
	border-bottom: 1px dotted #dfdfdf;
	padding:5px;
	background: #f7f7f7;
	color: #595959; 
	text-align:center; 
	width: 15%;
}
.tdInput {
	background: #fff; 
	width: 85%;
}
.textInput {
	width: 80%; 
	border: 1px solid #d7d7d7;
}
</style>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url: "<%=cp%>/member/readMember",
			type: "get",
			dataType: "json",
			success: function(data) {
				$("#sendMail").val(data.member.email);
			},
			error: function(jqXHR) {
				console.log(jqXHR.responseText);
			}
		});	
	});

	$(function() {
		$("body").on("change", "input[name=upload]", function() {
			if (! $(this).val()) return;
			
			var isBlink = false;
			$("input[name=upload]").each(function() {
				if (! $(this).val()) {
					isBlink = true;
					return;
				}
			});
			
			if (isBlink) return;
			
			var $tr = $("<tr>");
			var $td = $("<td>", {class:"textLabel", html:"첨부파일"});
			$tr.append($td);
			$td = $("<td>", {class:"tdInput"});
			$input = $("<input>", {type:"file", name:"upload", style:style="background: #fff; color: #333; width: 80%; border: 1px solid #d7d7d7;"});
			$td.append($input);
			$tr.append($td);
			$("#formTable").append($tr);
		});
	});
	
	function send() {
		if ($("#sendMail").val() == undefined || $("#sendMail").val() == "") {
			alert('보내는 사람의 email이 없습니다.');
			return false;
		}

		if ($("#members").val() == "") {
			alert('받는 사람이 없습니다.');
			$(this).focus();
			return false;
		}
		
		if ($("#content").val() == "") {
			alert('내용이 없습니다.');
			$(this).focus();
			return false;
		}
		
		document.mailWriteForm.submit();
	}
	
	
</script>
<div id="mailWrite" style="width:100%; height: 600px;">
	<div style="clear: both; margin: 10px 0px 15px 10px;">
		<span class="glyphicon glyphicon-edit" style="font-size: 28px; margin-left: 10px;" ></span>
		<span style="font-size: 30px;">&nbsp;메일 쓰기</span><br>
		<div style="clear: both; width: 300px; height: 1px; border-bottom: 3px solid black;"></div>
	</div>
	
	<form name="mailWriteForm" method="post" enctype="multipart/form-data" action="<%=cp%>/mail/send" >
		<table style="width:100%; border-top: 2px solid #a1c9e4;" id="formTable">
			<tr>
				<td style="border-bottom: 1px dotted #dfdfdf; padding:5px; background: #f7f7f7; color: #595959; text-align:center; width: 15%;">받는 사람</td>
				<td style="background: #fff; width: 85%;">
					<span><input type="text" id="receiveMail" name="receiveMail" style="background: #fff; color: #333; width: 80%; border: 1px solid #d7d7d7;"></span>
				</td>
			</tr>
			<tr>
				<td class="textLabel">참조</td>
				<td class="tdInput"><input type="text" id="cc" name="cc" class="textInput"></td>
			</tr>
			<tr>
				<td class="textLabel">숨은 참조</td>
				<td class="tdInput"><input type="text" id="bcc" name="bcc" class="textInput"></td>
			</tr>				
			<tr>
				<td class="textLabel">제목</td>
				<td class="tdInput"><input type="text" id="subject" name="subject" class="textInput"></td>
			</tr>
			<tr>
				<td class="textLabel">첨부파일</td>
				<td class="tdInput">
					<span><input type="file" name="upload" style="background: #fff; color: #333; width: 80%; border: 1px solid #d7d7d7;"></span>
				</td>
			</tr>
		</table>
		<table style="width:100%;">
			<tr>
				<td colspan="2"><div style="padding-top: 5px;"><textarea id="content" name="content" rows="15" cols="45" style="width: 83%;"></textarea></div></td>
			</tr>
		</table>
		<input type="hidden" name="sendMail" id="sendMail">
		<span><input type="button" value="&nbsp;전송&nbsp;" onclick="send();"></span>
	</form>
</div>