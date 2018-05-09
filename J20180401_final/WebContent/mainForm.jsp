<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//header class에 상단페이지 붙이기
		$("header").load('headerForm.jsp');
		//footer class에 하단페이지 붙이기
		$("footer").load('footerForm.jsp')
	});
</script>
<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<link href="css/mainStyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style>
<title>JOONGANG INFO MEDICAL CENTER에 오신 것을 환영합니다.</title>
</head>
<body>
	<header></header>
	<section>
	<div align="center">
		<div class="center">
			<!-- 그림 화면 전환 클래스  -->
			<div class="fadeShow">

				<img class="active" src="images/bg__1.jpg" alt="bg1" /> <img
					src="images/bg__2.jpg" alt="bg2" /> <img src="images/bg__3.jpg"
					alt="bg3" />
			</div>
			<script>
				//화면 전환하는 jquery
				var showImg, nextImg;
				function fadeInOut() {
					showImg = $(".fadeShow img:eq(0)");
					nextImg = $(".fadeShow img:eq(1)");
					nextImg.addClass("active");
					nextImg.css("opacity", "0").animate({
						opacity : 1
					}, 4000, function() {
						$(".fadeShow").append(showImg);
						showImg.removeClass("active");
					});
				}
				var timer = setInterval("fadeInOut()", 4000);
				$("div.fadeShow").hover(function() {
					clearInterval(timer)
				}, function() {
					timer = setInterval("fadeInOut()", 4000);
				});

				//마우스 엔터 & 리브 효과
				$(function() {
					$(".appoint div").mouseenter(
							function() {
								$(this).css("border", "5px solid yellow");
								$(".m1", this)
										.css("border", "5px solid yellow");
								$(".centerBtn", this).css("border",
										"5px solid yellow");
								//$(".appoint div input").css("border", "5px solid yellow");
							});
					$(".appoint div").mouseleave(function() {
						$(this).css("border", "5px solid white");
						$(".centerBtn", this).css("border", "0px");
						//$(".appoint div input").css("border", "0px");
					});
				});
			</script>
			<div class="appoint">
				<!-- 센터 이미지 버튼  -->
				<div class="m1">
					<!--  -->
					<img class="centerMenu" src="images/centerMenu1.jpg" />
					<!--  -->
					<a href="deptAction.do"><img class="centerBtn"
						src="images/centerBtn1.jpg" /></a>
				</div>
				<!--  -->
				<div class="m2">
					<img class="centerMenu" src="images/centerMenu2.jpg" />
					<!--  -->
					<a href="docMainAction.do"><img class="centerBtn"
						src="images/centerBtn2.jpg" /></a>
				</div>
				<!--  -->
				<div class="m3">
					<img class="centerMenu" src="images/centerMenu3.jpg" />
					<!--  -->
					<a href="appForm.do"><img class="centerBtn"
						src="images/centerBtn3.jpg" /></a>
				</div>
				<!--  -->
				<div class="m4">
					<img class="centerMenu" src="images/centerMenu_4.jpg" />
					<!--  -->
					<a href="appCheck.do?memNo=${memNo }"><img class="centerBtn"
						src="images/centerBtn4.jpg" /></a>
				</div>
			</div>
			<div class="board">
				<div class="notice">
					<table width="400px" height="200px">
						<caption>

							<a href="allBoardForm.do?boardType=notice"><font size="5pt"
								style="font-family: '휴먼모음T';">공지사항/뉴스/학술행사</font></a>

						</caption>
						<c:forEach var="li" items="${list }" begin="0"
							end="${boardSize - 1 }">
							<!-- 최신 게시물부터 5개 출력하기  -->
							<tr>
								<td><div style="width: 80px;" class="type">
										<font size="3pt">[${li.type }]</font>
									</div></td>
								<td><div class="subject">
										<a
											href="boardForm.do?boardType=notice&boardno=${li.boardno }&type=${li.type}&subject=${li.subject }&content=${li.content }&regdate=${li.regdate }&readcount=${li.readcount }">
											<font size="3pt">${li.subject }</font>
										</a>
									</div></td>
								<td><font size="3pt">${li.regdate }</font></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="guide">
					<h3>
						<p align="center">
							<a href="guideForm.do?pageNum=1"><font size="5pt"
								style="font-family: '휴먼모음T';"> 병원 가이드</font> </a>
						</p>
					</h3>
					<div class="m1">
						<a href="guideForm.do?pageNum=1"><img
							src="images/subMenu1.jpg" /></a>
					</div>
					<!--  -->
					<div class="m2">
						<a href="guideForm.do?pageNum=2"><img
							src="images/subMenu2.jpg" /></a>
					</div>
					<!--  -->
					<div class="m3">
						<a href="guideForm.do?pageNum=3"><img
							src="images/subMenu3.jpg" /></a>
					</div>
					<!--  -->
					<div class="m4">
						<a href="conSelect.do?memNo=${memNo }"><img
							src="images/subMenu4.jpg" /></a>
						<!-- 	<a href="deptAction.do"><img src="images/subMenu4.jpg" /></a> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<footer></footer>
</body>
</html>