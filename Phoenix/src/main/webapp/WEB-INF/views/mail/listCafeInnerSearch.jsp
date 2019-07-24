<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">
<script src="https://kit.fontawesome.com/e589319d43.js"></script>


<style>
#div_menu {
	width: 20%;
	height: 500px;
	float: left;
	background-color: #82FA58;
}

#div_con {
	width: 80%;
}

.cursor {
	cursor: pointer;
}

.cursor:hover {
	text-decoration: underline;
}
</style>

<style>

.postTitle:hover, .boardName:hover {
	cursor : pointer;
	text-decoration: underline;
}

#layerPopup {
	padding: 20px;
	border: 4px solid #ddd;
	position: absolute;
	left: 100px;
	top: 100px;
	background: #fff;
}

#layerPopup button {
	cursor: pointer;
}

.noticeIcon {
	height: 28px;
	margin: 0px;
	padding-top: 0px;
	padding-bottom: 0px;
}

.thisNotice {
	background: #F1795E;
	border-color: #F1795E;
}
</style>

<title>${search.cafeURL}</title>
</head>

<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"	stroke-width="3" stroke-miterlimit="10" />
            </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header">
			<div class="brand-logo">
				<a href="index.html"> <b class="logo-abbr"><img
						src="/images/logo.png" alt=""> </b> <span class="logo-compact"><img
						src="/images/logo-compact.png" alt=""></span> <span
					class="brand-title"> <img src="/images/logo-text.png" alt="">
				</span>
				</a>
			</div>
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
			<div class="header-content clearfix">

				<div class="nav-control">
					<div class="hamburger">
						<span class="toggle-icon"><i class="icon-menu"></i></span>
					</div>
				</div>

				<div class="header-right">
					<ul class="clearfix">
						<li class="icons dropdown"><a href="javascript:void(0)"
							data-toggle="dropdown"> <i class="mdi mdi-email-outline"></i>
								<span class="badge gradient-1 badge-pill badge-primary">3</span>
						</a>
							<div class="drop-down animated fadeIn dropdown-menu">
								<div
									class="dropdown-content-heading d-flex justify-content-between">
									<span class="">3 New Messages</span>

								</div>
								<div class="dropdown-content-body">
									<ul>
										<li class="notification-unread"><a
											href="javascript:void()"> <img
												class="float-left mr-3 avatar-img"
												src="/images/avatar/1.jpg" alt="">
												<div class="notification-content">
													<div class="notification-heading">Saiful Islam</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Hi Teddy, Just wanted
														to let you ...</div>
												</div>
										</a></li>
										<li class="notification-unread"><a
											href="javascript:void()"> <img
												class="float-left mr-3 avatar-img"
												src="/images/avatar/2.jpg" alt="">
												<div class="notification-content">
													<div class="notification-heading">Adam Smith</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Can you do me a
														favour?</div>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <img
												class="float-left mr-3 avatar-img"
												src="/images/avatar/3.jpg" alt="">
												<div class="notification-content">
													<div class="notification-heading">Barak Obama</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Hi Teddy, Just wanted
														to let you ...</div>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <img
												class="float-left mr-3 avatar-img"
												src="/images/avatar/4.jpg" alt="">
												<div class="notification-content">
													<div class="notification-heading">Hilari Clinton</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Hello</div>
												</div>
										</a></li>
									</ul>

								</div>
							</div></li>
						<li class="icons dropdown"><a href="javascript:void(0)"
							data-toggle="dropdown"> <i class="mdi mdi-bell-outline"></i>
								<span class="badge badge-pill gradient-2 badge-primary">3</span>
						</a>
							<div
								class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
								<div
									class="dropdown-content-heading d-flex justify-content-between">
									<span class="">2 New Notifications</span>

								</div>
								<div class="dropdown-content-body">
									<ul>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-success-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Events near you</h6>
													<span class="notification-text">Within next 5 days</span>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-danger-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Event Started</h6>
													<span class="notification-text">One hour ago</span>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-success-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Event Ended
														Successfully</h6>
													<span class="notification-text">One hour ago</span>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-danger-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Events to Join</h6>
													<span class="notification-text">After two days</span>
												</div>
										</a></li>
									</ul>

								</div>
							</div></li>
						<li class="icons dropdown d-none d-md-flex"><a
							href="javascript:void(0)" class="log-user" data-toggle="dropdown">
								<span>English</span> <i class="fa fa-angle-down f-s-14"
								aria-hidden="true"></i>
						</a>
							<div class="drop-down dropdown-language animated fadeIn  dropdown-menu">
								<div class="dropdown-content-body">
									<ul>
										<li><a href="javascript:void()">English</a></li>
										<li><a href="javascript:void()">Dutch</a></li>
									</ul>
								</div>
							</div>
						</li>
						
						<li class="icons dropdown">
							<div class="user-img c-pointer position-relative"
								data-toggle="dropdown">
								<span class="activity active"></span> <img
									src="/images/user/1.png" height="40" width="40" alt="">
							</div>
							<div class="drop-down dropdown-profile   dropdown-menu">
								<div class="dropdown-content-body">
									<ul>
										<li><a href="app-profile.html"><i class="icon-user"></i>
												<span>Profile</span></a></li>
										<li><a href="email-inbox.html"><i
												class="icon-envelope-open"></i> <span>Inbox</span>
												<div class="badge gradient-3 badge-pill badge-primary">3</div></a>
										</li>

										<hr class="my-2">
										<li><a href="page-lock.html"><i class="icon-lock"></i>
												<span>Lock Screen</span></a></li>
										<li><a href="page-login.html"><i class="icon-key"></i>
												<span>Logout</span></a></li>
									</ul>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="nk-sidebar">
			<c:import url="/WEB-INF/views/cafe/menubarCafe.jsp"></c:import>
		</div>
		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="row page-titles mx-0">
<!-- 				<div class="col p-md-0"> -->
<!-- 					<ol class="breadcrumb"> -->
<!-- 					</ol> -->
<!-- 				</div> -->

				<div class="row">
					<div class="col-md-12">
						<div class="input-group" id="adv-search">
							<input type="text" class="form-control input-default" name="searchKeyword" id="searchKeyword" />
							<div class="input-group-btn">
								<div class="btn-group" role="group">
									<div class="dropdown dropdown-lg">
										<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
											<span class="caret"></span>
										</button>
										<div class="dropdown-menu dropdown-menu-right" role="menu">
											<form class="form-horizontal" role="form" id="searchForm">
												<input type="hidden" name="currentPage">
												<div class="form-group">
													<label for="termStart">기간 시작</label> 
													<input class="form-control" type="text" id="termStart" name="termStart" readonly="readonly">
												</div>

												<div class="form-group">
													<label for="termEnd">시작 끝</label> 
													<input class="form-control" type="text" id="termEnd" name="termEnd" readonly="readonly">
												</div>

												<div class="form-group">
													<label for="boardNo">게시판</label> 
													<select	class="form-control hideOption" name="boardNo">
														<option value="0" class="boardOption">전체</option>
														<c:forEach var="board" items="${boardOption }">
															<option value="${board.boardNo }" class="boardOption">${board.boardName }</option>
														</c:forEach>
													</select>
												</div>

												<div class="form-group">
													<label for="searchCondition">구분</label> <select
														class="form-control hideOption" name="searchCondition">
														<option value="0" class="searchOption">전체</option>
														<option value="1" class="searchOption">호칭</option>
														<option value="2" class="searchOption">제목</option>
														<option value="3" class="searchOption">내용</option>
														<option value="4" class="searchOption">댓글</option>
													</select>
												</div>

												<div class="form-group">
													<label for="searchKeyword">키워드</label> <input type="text"
														class="form-control" name="searchKeyword"
														id="advSearchKeyword">
												</div>

												<button type="submit" class="btn btn-primary"
													style="margin-left: 15px; margin-right: 15px;"
													id="advSubmitButton">
													<span class="searchIcon" aria-hidden="true"></span>
												</button>
											</form>
										</div>
									</div>

									<button type="button" class="btn btn-primary">
										<span class="searchIcon" aria-hidden="true" id="submitButton"></span>
									</button>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div id="container-fluid">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">${search.boardName }</h4>
							<div class="table-responsive">
								<form id="boardPage">
									<input type="hidden" name="currentPage">
								</form>
								<p>총 ${postTotalCount }개 중 ${search.startRowNum} - ${search.endRowNum }</p>
								<table class="table header-border">
									<thead class="thead-light">
										<tr>
											<td>게시판</td>
											<td>제목</td>
											<td>작성자</td>
											<td>작성일</td>
											<td>조회수</td>
											<td>추천수</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${postList }" var="post">
											<tr>
												<input type="hidden" class="postNo" value="${post.postNo }"/>
												<input type="hidden" class="boardNo" value="${post.boardNo }"/>
												<input type="hidden" class="memberNo" value="${post.memberNo }"/>
												<td class="boardName">${post.boardName }</td>
												<td class="postTitle">${post.postTitle }</td>
												<td>${post.memberNickname }</td>
												<td>${post.regDate }</td>
												<td>${post.viewCount }</td>
												<td>${post.likeCount }</td>
											</tr>
										</c:forEach>

										<tr>
											<td colspan="2"></td>
											<td>
												<c:import url="/WEB-INF/views/common/pageNavigator.jsp">
													<c:param name="subject" value="InnerSearch" />
												</c:import>
											</td>
											<td colspan="3"></td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- row -->

		</div>
		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<div class="footer">
			<div class="copyright">
				<p>
					Copyright &copy; Designed & Developed by <a
						href="https://themeforest.net/user/quixlab">Quixlab</a> 2018
				</p>
			</div>
		</div>
		<!--**********************************
            Footer end
        ***********************************-->
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
	<script src="/plugins/common/common.min.js"></script>
	<script src="/js/custom.min.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/gleek.js"></script>
	<script src="/js/styleSwitcher.js"></script>

	<script src="/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script src="/plugins/sweetalert/js/sweetalert.init.js"></script>
	
	<!-- 메뉴바 이용을 위한 스크립트 -->
	<script src="/js/custom/cafeCommon.js"></script>
	<script src="/js/custom/scroll-top.js"></script>
	<script type="text/javascript">
	    	$(function(){
	    		$(".showMyDetail").on("click",function(){
	    			if(${cafeMember.userNo}=='400')//1. 로그인이 안되어있으면
	    			{
	    				alert("로그인하세요! (로그인창 띄우기)");
	    			}
	    			else if(${cafeMember.userNo}=='500')//카페멤버가 아니면
	    			{
	    				alert("카페에 가입하세요!(카페에가입하시겠습니까?띄우기)");
	    			}
	    			else //카페멤버라면
	    			{
// 	    				$(".myDetail").show(); 
	    			}
	    		});
	
	    		$("[name=InnerSearch]").attr("method", "GET").attr("action", "/cafe/${cafeURL}/search");
	    		
	    		$("[name=menubarSubmit]").on("click", function(){
	    			location.href = "/cafe/" + "${cafeURL}" + "/search?searchKeyword=" + $("#menubarSearch").val(); 
	    		});	
	
	    		$("[name=toManage]").on("click", function(){
	    			location.href = "/cafe/${cafeURL}/manage/getCafeStatistics";
	    		});
	    		
	    	});
	
	    	$(function(){//카페탈퇴
	    		document.querySelector(".sweet-withdraw").onclick =
		    		function(){
		    			swal({
		    				title:"카페에서 탈퇴하시겠습니까?",
		    				text:"카페 탈퇴시 작성된 게시글은 자동으로 삭제되지 않습니다.",
		    				type:"warning",
		    				showCancelButton:!0,
		    				confirmButtonColor:"#DD6B55",
		    				confirmButtonText:"예",
		    				cancelButtonText:"아니오",
		    				closeOnConfirm:!1
		    				},
		    				function(){
		    					swal("카페 탈퇴 완료","회원 탈퇴 되었습니다.","success")
		    				})
		    			}
	

				
// 	    		$(".deleteMember").on("click",function(){
// 	    			$( "#dialog" ).dialog("open");
// 	    			});
// 	    		var memberNo = '${cafeMember.memberNo}'
// 	    		$( "#dialog" ).dialog({ 
// 	    			 autoOpen: false, 
// 	    			  width: 400, 
// 	    			  modal: true, 
// 	    			  buttons: [ { 
// 	    				   text: "확인", 
// 	    				   click: function() { 
// 	    					   location.href = "/cafe/" + "${cafeURL}" + "/updateCafeMember?memberNo="+memberNo;
// 	    					  } 
// 	    			  }, 
// 	    			  { 
// 	    				   text: "취소", 
// 	    				    click: function() { 
// 	    					   $( this ).dialog( "close" ); 
// 	    					   } 
// 	    			   } 
// 	    			   ] 
// 	    		   });
	    	});
	    	
	    	$(function(){//프로필수정
	    		var memberNo = '${cafeMember.memberNo}'
	    		$(".updateProfile").on("click",function(){
	    			alert("여기")
	    			window.open("/cafe/" + "${cafeURL}"+ "/updateCafeMemberProfileView?memberNo="+memberNo,"_blank","width=600,height=700");
	    		
	    			});
	    		
	    		});
	
	    	$(function(){//카페가입
	    		$(".addMember").on("click", function(){
	    			 location.href = "/cafe/" + "${cafeURL}" + "addCafeApplicationView";
	    		});
	    		
	    	});
    </script>

	<!-- 이 페이지 전용 script -->
	
	<script>
			var cafeURL = '${search.cafeURL}';

			//세부검색 시작
			$(function(){
				$("#advSubmitButton").on("click", function(){
					$("[name=currentPage]").val(1);
				});
			});

			//세부검색 시작
			$(function(){
				$("#submitButton").on("click", function(){
					location.href = "/cafe/" + "${cafeURL}" + "/search?searchKeyword=" + $("#searchKeyword").val(); 
				});
			});

			//페이지 이동
			function fncGetInnerSearchList(idx){
				$("[name=currentPage]").val(idx);
				$("#searchForm").attr("method","GET").attr("action","/cafe/" + cafeURL + "/search").submit();	
			};

			//datePicker 생성
			$(function(){
				$( "#termStart" ).datepicker({dateFormat:'yy-mm-dd'});
			    $( "#termEnd" ).datepicker({dateFormat:'yy-mm-dd'});
			});
			
			//검색조건 유지
			$(function(){
				$("[name=currentPage]").val(${search.currentPage });
				$( "#termStart" ).val('${search.termStart}');
			    $( "#termEnd" ).val('${search.termEnd}');	
				$("[name=searchKeyword]").val('${search.searchKeyword}');
				
				$(".boardOption").each(function(){
				    if($(this).val()==${search.boardNo}){
				      $(this).attr("selected","selected");
				    }
				});
				
				$(".searchOption").each(function(){
				    if($(this).val()==${empty search.searchCondition? 0 : search.searchCondition}){
				      $(this).attr("selected","selected");
				    }
				});
			});

			//게시글 조회
			$(function(){
				$(".postTitle").on("click", function(){
					location.href = "/cafe/" + cafeURL + "/getPost/" + 	$(this).parent().find(".postNo").val();				
				});			
			});

			//게시판 조회
			$(function(){
				$(".boardName").on("click", function(){
					location.href = "/cafe/" + cafeURL + "/getBoard/" + $(this).parent().find(".boardNo").val();
				});
			});
		</script>

</body>

</html>