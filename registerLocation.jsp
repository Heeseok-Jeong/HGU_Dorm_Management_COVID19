<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.time.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>HGU Dorm Overnight Stay Management - COVID19</title>

<!-- fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital@0;1&display=swap"
	rel="stylesheet">

<!-- jquery -->
<script src="https://code.jquery.com/jquery-latest.js"></script>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

<style>
p.case {
	font-size: 1.3rem;
	color: rgb(90, 90, 90)
}

body {
	font-family: 'Open Sans', sans-serif;
}
</style>

</head>

<script>
	function getParam(sname) {
	    var params = location.search.substr(location.search.indexOf("?") + 1);
	    var sval = "";
	    params = params.split("&");
	    for (var i = 0; i < params.length; i++) {
	        temp = params[i].split("=");
	        if ([temp[0]] == sname) { sval = temp[1]; }
	    }
	    return sval;
	
	}
	new_ID = getParam('ID');
	
	function goNewIndexPage() {
	    location.href='new_index.jsp?ID='+new_ID;
	}
</script>

<body>
	<!-- Navigation -->
	<nav class="navbar fixed-top navbar-expand-lg fixed-top"
		style="background-color: rgb(245, 240, 245); height: 4.5rem;">
		<div class="container">
			<a class="navbar-brand" href="javascript:goNewIndexPage()"><strong>HGU
					Dorm Overnight Management - COVID19</strong></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="#LogOutModal"
						data-toggle="modal" data-target="#LogOutModal">LogOut</a></li>
					<li class="nav-item"><a class="nav-link" href="mypage.html">MyPage</a>
					</li>
					<!-- <li class="nav-item"><a class="nav-link"
						href="managerpage.html">ManagerPage</a></li> -->

				</ul>
			</div>
		</div>
	</nav>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		String ID = request.getParameter("ID");
		
  	%>
	<br>
	<br>
	<br>

	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width: 50%; height: 30rem; margin: 0 auto"></div>
	<br>
	<div style="width: 10%; margin: auto;">
		<!-- <a class="btn btn-lg btn-secondary btn-block text-center" style="width:10rem; margin: 0 auto;" href="#">Register</a> -->
		
		<button style="width: 10rem; height: 3rem;"
			onclick="registerLoc()" class="btn btn-secondary text-center">Register</button>
	</div>


	<!-- The Modal -->
	<div class="modal" id="LogOutModal" name="LogOutModal">
		<div
			class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
			<div class="modal-content" style="margin-top: 5rem">

				<!-- Modal Header -->
				<div class="modal-header">
					<h1 class="modal-title ">
						Log out
						<button type="button" class="close" data-dismiss="modal"
							style="height: 5rem; margin-left: 18rem; position: fixed;">x</button>
					</h1>


				</div>

				<!-- Modal body -->
				<div class="modal-body">

					<a class="text-left" style="color: gray; font-size: 1.3rem">
						Are you sure to log out? </a>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer text-center">
					<button type="button" onclick="location.href='index.html'"
						class="btn btn-primary" data-dismiss="modal">Sure</button>
				</div>

			</div>
		</div>

		<!-- Footer -->
		<footer class="py-5 bg-dark">
			<div class="container">
				<p class="m-0 text-center text-white">
					Copyright &copy; 2020 <br>Software Engineering Team 2
				</p>
			</div>

			<!-- /.container -->
		</footer>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f2ea91b9172e8c0e3e0c7eca09ad534&libraries=services"></script>

		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 4
			// 지도의 확대 레벨 
			};

			var lat = 0;
			var lng = 0;
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			if (navigator.geolocation) {

				// GeoLocation을 이용해서 접속 위치를 얻어옵니다
				navigator.geolocation.getCurrentPosition(function(position) {

					lat = position.coords.latitude, // 위도
					lng = position.coords.longitude; // 경도

					var locPosition = new kakao.maps.LatLng(lat, lng), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
					message = '<div style="padding:5px;">Your location</div>'; // 인포윈도우에 표시될 내용입니다

					// 마커와 인포윈도우를 표시합니다
					displayMarker(locPosition, message);

				});

			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

				var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

				displayMarker(locPosition, message);
			}

			// 좌표로 주소 얻기 
			function registerLoc() {
				var geocoder = new kakao.maps.services.Geocoder();
				var location = "";

				var coord = new kakao.maps.LatLng(lat,
						lng);
				var callback = function(result, status) {
					if (status === kakao.maps.services.Status.OK) {
						location = String(result[0].address.address_name);
						var new_ID = "<%=ID%>";
						
						<% 
						LocalDate nowDate = LocalDate.now();
						
						Date dt = new Date();
						SimpleDateFormat sdf = 
						     new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

						String new_time = sdf.format(dt);
						String new_dates = nowDate.toString();

						Connection conn = null;
						Statement stmt = null;
						PreparedStatement pstmt = null;

						String sql = "select dates from Overnights where id = ?" 
								+"and dates = ? and accepted = 1";
						ResultSet rs = null;

						try {
							Class.forName("com.mysql.cj.jdbc.Driver");

							String url = "jdbc:mysql://54.180.159.220/SE";

							conn = DriverManager.getConnection(url, "hgu", "handong0");
							System.out.println("연결 성공");

							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, ID);
							rs = pstmt.executeQuery();
							rs.next();
							%>
							alert(rs);
							alert(rs.next());
							
							<%
							
							
							
						} catch (ClassNotFoundException e) {
							System.out.println("드라이버 로딩 실패");
						} catch (SQLException e) {
							System.out.println("에러: " + e);
						} finally {
							try {
								if (conn != null && !conn.isClosed()) {
							conn.close();
								}
							} catch (SQLException e) {
								e.printStackTrace();
							}
						}
						
						
						%>
						
						var form = document.createElement("form");
						form.setAttribute("charset", "UTF-8");
						form.setAttribute("method", "Post"); // Get 또는 Post 입력
						form.setAttribute("action", "manageLocation.jsp");
						
						var hiddenField = document.createElement("input");
						hiddenField.setAttribute("type", "hidden");
						hiddenField.setAttribute("name", "ID");
						hiddenField.setAttribute("value", new_ID);
						form.appendChild(hiddenField);

						 
						hiddenField = document.createElement("input");
						hiddenField.setAttribute("type", "hidden");
						hiddenField.setAttribute("name", "location");
						hiddenField.setAttribute("value", location);
						form.appendChild(hiddenField);
						
						document.body.appendChild(form);
						form.submit();
						
						
						
					}
				};

				geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
				
				
			}
			
			// 지도에 마커와 인포윈도우를 표시하는 함수입니다
			function displayMarker(locPosition, message) {

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					map : map,
					position : locPosition
				});

				var iwContent = message, // 인포윈도우에 표시할 내용
				iwRemoveable = true;

				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					content : iwContent,
					removable : iwRemoveable
				});

				// 인포윈도우를 마커위에 표시합니다 
				infowindow.open(map, marker);

				// 지도 중심좌표를 접속위치로 변경합니다
				map.setCenter(locPosition);
			}
		</script>


		<!-- Bootstrap core JavaScript -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>