<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/47a97bc968.js"
	crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.js">
	
</script>
<style>

a:hover {
	text-decoration: none;
}

.title1 {
	justify-content: space-around;
	margin-top: 30px;
	font-size: 17px;
	color: black;
	opacity: 0.9;
	margin-left: 10px;
}

.title2 {
	justify-content: space-around;
	margin-top: 3px;
	font-size: 13px;
	color: dimgrey;
	opacity: 0.8;
	margin-left: 10px;
}


.price div {
	position: relative;
	background-color: black;
	color: white;
	height: 45px;
	width: 40%;
	opacity: 0.6;
	font-size: 20px;
	margin-top : -70px;
}

.nav {
	margin-top: 100px;
}

.tab {
	margin-left: 80px;
}

.nav {
	justify-content: center;
	width: 100%;
	display: flex;
	align-items: center;
	list-style: none;
	margin-top: 110px;
}

.font:hover {
	color: forestgreen;
	font-weight: bolder;
	text-decoration: underline;
}

.font {
	color: black;
	font-size: 16px;
}

.t {
    position: relative;
    overflow: hidden;
    box-sizing: border-box;
	width: 300px;
	height: 250px;
	margin-top: 50px;
	float: left;
	margin-left: 20px;
	background-color : #fff;
	cursor: pointer;
	
}

.t:hover {
    transform: scale(1.01);
	transition-duration : 1s;
	box-shadow : 3px 5px 4px 2px lightgray;
}

 .img2 img {
	 max-width : 100%;
	height : 175px;
	text-align : center;
	display : block;
	margin-left: auto; 
	margin-right: auto;

}

.img2{
	max-width : 100%;
	text-align : center;	
	display : block;
	margin-left: auto; 
	margin-right: auto;
}


@media ( max-width : 1200px) {
	.grow, .title1, .title2, .price{
		width: 200px;
	}
	.img2 img, .b img, .p4{
		width: 195px;
	} 
    .p3:nth-child(2){
        display: none;
    }
    .p3:first-of-type img{
        width: 100%;
    }
}


@media ( max-width : 1000px) {
	.grow, .title1, .title2, .price{
		width: 130px;
	}
	.img2 img, .b img, .p4{
		width: 125px;
	}
}

@media ( max-width : 600px) {
	.grow, .title1, .title2, .price {
		width: 80px;
	}
	.img2 img, .b img, .p4{
		width: 75px;
	}
}
    @media (max-width : 1600px){
        .p3:last-of-type {
            display: none;
        }
    }
    @media (max-width : 1260px){
        .p3:nth-child(3) {
            display: none;
        }
    }

#wrapper {
	float: left;
	width: 100%;
	margin-left: 50px;
}

#plus{
	margin-top : 20px;
}
.back{
	border: 1px solid #ebebeb;
    background-color: #e9e9e9;
	width: 280px;
	height: 175px;
	margin-left : 10px;
	margin-top : 10px;
}
.b {
	background-color : #fff;
	height : 580px;
}
.b img {
	margin-left : 30px;
} 

#p1{
	font-size : 35px;
}
#p2{
	font-size : 15px;
	
}
.p3 {
	float : left;
}

.p4{
	margin-top : -50px;
	font-size : 35px;
	color : #fff;
	font-weight : 2000;
	position: relative;
	margin-left:45px;
	text-align:left;
	
}

#p{
	margin-left : 250px;
}

.b img:hover{
	transform: scale(1.02);
	transition-duration : 1s;
	box-shadow : 3px 5px 4px 2px lightgray;
}


</style>
</head>

<body>
    <c:if test="${lastPage ne null}">
        <script>
            
        </script>
    </c:if>
	<jsp:include page="/WEB-INF/views/headerForMain.jsp"></jsp:include>
	
	<div>
		<ul class="nav">
			<li class="tab"><a
				class="tabbed__tab-control tabbed__active-tab" href="#"
				data-tabbed-selected="true"> <font
					style="vertical-align: inherit;" class="font"> <font
						style="vertical-align: inherit; color:#3baa33; font-size: 20px;">Homepage Gallery</font>
				</font>
			</a></li>
			
		</ul>
	</div>


<div class="back2">
	<div class="page container">
		<div id="wrapper">
			<div class="div1">
				<c:forEach items="${listT }" var="board" varStatus="i">
					<c:if test="${i.count < 13 }">
						<div class="t">
						<div class="back">
							<a href="/goList.do?boardNo=${board.boardNo }">

								<div class="img2">
									<img src="/resources/upload/${board.files.get(0)}">
								</div>
						
								<div class="price">
									<div>
										<span>${board.price} 만원 </span>
									</div>
								</div>
						
								<div class="title1">
								    <c:set var="title" value="${board.title}" />
									${fn:substring(title,0,20)}
								</div>
								<div class="title2">
									<c:out value="${board.location}" />
								</div>
                            </a>
							
							</div>	
					

						</div>
					</c:if>
					<c:if test="${sessionScope.member.memberId == null}">
						<div class="t">
						<div class="back">
							<a href="/login.do">

								<div class="img2">
									<img src="/resources/upload/${board.files.get(0)}">
								</div>
						
								<div class="price">
									<div>
										<span>${board.price} 만원 </span>
									</div>
								</div>
						
								<div class="title1">
								    <c:set var="title" value="${board.title}" />
									${fn:substring(title,0,20)}
								</div>
								<div class="title2">
									<c:out value="${board.location}" />
								</div>
                            </a>
							
							</div>	
					

						</div>
					</c:if>
	</div>				
			<div class="back2">		
					<c:if test="${i.count >= 13 }">
						<div class="t" style="display: none;" id="div${i.count }">
						<div class="back">
							<a href="/goList.do?boardNo=${board.boardNo }">

								<div class="img2">
									<img src="/resources/upload/${board.files.get(0)}">
								</div>
								
								<div class="price">
									<div>
										<span>${board.price} 만원 </span>
									</div>
								</div>
								
						
								<div class="title1">
									<c:set var="title" value="${board.title}" />
									${fn:substring(title,0,20)}
								</div>
								<div class="title2">
									<c:out value="${board.location}" />
								</div>
                            </a>
								</div>
						</div>
					</c:if>

				</c:forEach>
			</div>
		</div>
		<br><br>
		<div align="center">
			<button id="plus" class="btn btn-success" onclick="plus();">더보기</button>
		</div><br><br><br>
</div>

	</div>
	
	<div class="b">
	<div align="center">
	<br><br>
	<p id="p1">주요 카테고리</p>
	<p id="p2">가장 인기있는 카테고리를 탐색 하십시오.</p>
	
	
	<br>
	<div id="p">
	<div class="p3">
	<a href="goList.do?category=c">
	<img src ="/resources/img/car.png">
	<h1 class="p4">Cars </h1>
	</a>
	</div>
	
	<div class="p3">
	<a href="/goList.do?category=n">
	<img src ="/resources/img/f.jpg">
	<h1 class="p4">Computer </h1>
	</a>
	</div>
	
	<div class="p3">
	<a href="goList.do?category=l">
	<img src ="/resources/img/a.jpg">
	<h1 class="p4">Dress </h1>
	</a>
	</div>
	
	<div class="p3">
	<a href="goList.do?category=e">
	<img src ="/resources/img/b.jpg">
	<h1 class="p4">Others </h1>
	</a>
	</div>
	</div>
	</div>
	</div>
	
	<footer> <jsp:include page="footer.html" /></footer>
	<script>
		$('#categories .dropdown-item')
				.not($(this).eq(0))
				.click(
						function() {
							$('.search-categories button')
									.html(
											$(this).html()
													+ '<span class="fas fa-chevron-down">&nbsp;</span>');
							$('#categories').toggle(300);
						});
		$('#distant .dropdown-item').click(function() {
			$('#km').html($(this).html());
			$('#distant').toggle(300);
		});

		function plus(){
	
			for (i = 13; i < 25; i++) {
				$("#div" + i).css("display", "block");
			}
			$("#plus").attr('onclick', 'location.href="/goList.do"');
		}
		
	
		
 
		
	</script>
</body>
</html>