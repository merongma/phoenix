<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>

<html lang="ko">
<head>

<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- Favicon icon -->

<!-- Custom Stylesheet -->
<link href="/plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="/css/custom/scroll-top.css">

<!--  ///////////////////////// CSS ////////////////////////// -->
    <style>
    	li{
    		
    		padding : 10px;
    		
    	}
    	
    	.webSearch{
    	
    		color:#f5a142;
    	}
    	.brand-title{
    		
    		color:#f5a142;
    		background-color : white;
    		font-family: 'Ubuntu', sans-serif;
    		font-size:30px;
    		margin-left:15px;
    	}
    	
    	#webTitle{
    	
    		display: inline-block;
    		width: 350px; 
    		white-space: nowrap; 
    		overflow: hidden; 
    		text-overflow: ellipsis;
    		text-decoration:underline; 
    		color:blue; 
    		
    	}
    	
    	#webLink{
    	
    		display: inline-block;
    		width: 350px; 
    		white-space: nowrap; 
    		overflow: hidden; 
    		text-overflow: ellipsis;
    		color:#f5a142; 
    	}
    	
    	#webContent{
    	
    		display: inline-block;
    		white-space: nowrap; 
    		overflow: hidden; 
    		width:600px;
    		text-overflow: ellipsis;
    		
    		white-space: normal; 
    		line-height: 1.5; 
    		text-align: left; 
    		word-wrap: break-word; 
    		display: -webkit-box; 
    		-webkit-line-clamp: 3; 
    		-webkit-box-orient: vertical;
    		color : black;
    		margin-bottom : 10px;
    	}
    
    </style>
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
	
	<script type="text/javascript">

	var checkSessionUser = ${empty sessionScope.user};
	
		$(function(){  //전체검색, 네이버, 다음 체크문제.

			$(".check-all").on("click",function(){
				
				$(".singleCheck").prop("checked",this.checked); //전체선택에 따라서 변경하도록

				if($(".check-all").is(":checked")){ //전체 선택 체크되었을때만! 체크안되면  action안일어남

					var searchTheme = $("#searchTheme").val();

					if(searchTheme==0){
						$("form").attr("method","POST").attr("action","/explore/getUnifiedList").submit();
					}
					if(searchTheme==1){	
						$("form").attr("method","POST").attr("action","/explore/getBlogList").submit();
					}
					if(searchTheme==2){	
						$("form").attr("method","POST").attr("action","/explore/getCafeList").submit();
					}
					if(searchTheme==3){	
						$("form").attr("method","POST").attr("action","/explore/getImageList").submit();
					}
					if(searchTheme==4){	
						$("form").attr("method","POST").attr("action","/explore/getWebsiteList").submit();
					}
									
				}
			});

		});
			
		
	</script>
	
	
	
</head>

<body  data-layout="vertical" data-nav-headerbg="color_1" data-headerbg="color_1" data-sidebar-style="full" data-sibebarbg="color_1"data-container="wide">
	

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <form name ="form" >
    <div id="main-wrapper" class="show">
		
        <!--**********************************
            Nav header start
        ***********************************-->	
     	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/WEB-INF/views/explore/exploreToolbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->
       
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
     	<br/>
            <!-- row -->
            <div class="container-fluid">
           		<div class="card">
           			<div class="card-header">
           			<hr/>
           				<ul class="form-inline">
           					<li></li>
           					<li></li>
           					<li id="uniSearch" value="0" style="cursor:pointer;"><h4 class="uniSearch">통합검색</h4></li>
           					<li></li>
           					<li id="blogSearch" value="1" style="cursor:pointer;"><h4 class="blogSearch">블로그</h4></li>
           					<li></li>
           					<li id="cafeSearch" value="2" style="cursor:pointer;"><h4 class="cafeSearch">카페</h4></li>
           					<li></li>
           					<li id="imageSearch" value="3" style="cursor:pointer;"><h4 class="imageSearch">이미지</h4></li>
           					<li></li>
           					<li id="webSearch" value="4" style="cursor:pointer;"><h4 class="webSearch">웹사이트</h4></li>
           					<li></li>
           					<li></li>
           					<li></li>
           					<li>
           						<select class="form-control" name="orderState" id="orderState">
									<option value="0" ${search.orderState==0 ? "selected" : "" }>관련도순</option>
									<option value="1" ${search.orderState==1 ? "selected" : "" }>최신순</option>
								</select>
           					</li>
           					<li></li>
           					<li>
           						<div class="form-inline">
                                     <div class="form-check form-check-inline">
                                         <label class="form-check-label">
                                             <input type="checkbox" class="form-check-input check-all" name="engineAll" value="true" ${search.engineAll ? "checked" : "" }>전체검색</label>
                                     </div>
                                     <div class="form-check form-check-inline">
                                         <label class="form-check-label">
                                             <input type="checkbox" class="form-check-input singleCheck" name="engineNaver" value="true" ${search.engineNaver ? "checked" : "" }>네이버</label>
                                     </div>
                                     <div class="form-check form-check-inline disabled">
                                         <label class="form-check-label">
                                             <input type="checkbox" class="form-check-input singleCheck" name="engineDaum" value="true" ${search.engineDaum ? "checked" : "" }>다음</label>
                                     </div>
                                 </div>
           					</li>
           				</ul>
           			<hr/>
           			<input type="hidden" name="searchTheme" id="searchTheme" value="4">
           			
           			</div>
           			
           			<div class="col-md-1">
           			</div>
           			
           			<div class="card-body col-md-7" style="margin-left:32px;">
           				<div class="bootstrap-media">
           					
           					<ul class="list-unstyled">
	           				<li style="color:black;"><strong>웹사이트</strong></li>
	           				<c:set var="i" value="0"/>
	           				<c:forEach var="web" items="${webList}">
	           					<c:set var="i" value="${i+1}"/>
	           					<li class="media">
	           						
									<div class="media-body" style="margin-left:50px; margin-top:8px;">
										<div class="form-inline">
											<h6>
												<a href="${web.resultLink}" target="_blank" id="webTitle" >${web.title}</a>
											</h6> &nbsp;&nbsp;&nbsp; 
										</div>
										<a href="${web.resultLink}" id="webLink" target="_blank" >${web.resultLink}</a>
										
										<div class="form-group" id="webContent">${web.contents}</div>
										
										<div class="form-inline">
											<p id="webDateTime">${web.dateTime}</p>
										</div>
										
									</div>           					
	           					</li>
	           				</c:forEach>
	           			
           					</ul>
           				</div>
           			</div>
           			
           			<div>
           				<!-- ToolBar Start /////////////////////////////////////-->
						<c:import url="/WEB-INF/views/common/pageNavigator.jsp">
							<c:param name="subject" value="Web" />
						</c:import>
						<!-- ToolBar End /////////////////////////////////////-->
           			</div>
           			
           		</div>
            </div>
      
            <!-- #/ container -->
           
            
    </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        
        <!--********************************** Footer start ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="https://themeforest.net/user/Phoenix">Phoenix</a></p>
            </div>
        </div>
        <!--**********************************Footer end ***********************************-->
        
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    

           		
   	 </form>
   	 
   	<!-- 검색 엔터용 스크립트같은데 -->
   		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
   	<!-- 검색 공통 스크립트 -->
   		<script src="/js/custom/exploreCommon.js"></script>
   	<!-- 공통 툴바용 스크립트 -->	
		<script src="/js/custom/toolbarScript.js"></script>
	</body>
</html>