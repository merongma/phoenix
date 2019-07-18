<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>채팅메인</title>

<!-- ////////////////////////////// jQuery CDN ////////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
 integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
 crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
 integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
 crossorigin="anonymous"></script>
<!-- ////////////////////////////// bootstrap CDN ////////////////////////////// -->
<link rel="stylesheet"
 href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
 crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
 integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
 crossorigin="anonymous"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(function() {
	
	$("#addCafe").on("click" , function() {
		$(self.location).attr("href","/cafe/addCafeView");
	});

});
</script>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../common/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
</head>

<body>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	
채팅환경설정화면이야

<div class="alert alert-primary d-flex justify-content-start" style='width: 50%;' role="alert">
  A simple primary alert—check it out!
</div>
<div class='d-flex justify-content-end'>
<div class="alert alert-success d-flex justify-content-end" style='width: 50%;' role="alert">
  A simple primary alert—check it out!
</div>
</div>
<div class="alert alert-primary d-flex justify-content-start" style='width: 50%;' role="alert">
  A simple primary alert—check it out!<br/>
  A simple primary alert—check it out!<br/>
  A simple primary alert—check it out!<br/>
  A simple primary alert—check it out!
</div>
<div class="alert alert-primary d-flex justify-content-start" style='width: 50%;' role="alert">
  A simple primary alert—check it out!
</div>


	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->

</body>
</html>